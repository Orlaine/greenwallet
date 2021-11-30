import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:green_wallet/components/default_button.dart';
import 'package:green_wallet/size_config.dart';
import 'package:green_wallet/screens/login_success/login_success_screen.dart';
import '../../../constants.dart';
import 'package:dio/dio.dart';

//FirebaseApp secondaryApp = Firebase.app('SecondaryApp');
//FirebaseAuth auth = FirebaseAuth.instanceFor(app: secondaryApp);
//FirebaseAuth auth = FirebaseAuth.instance;
final FirebaseFirestore firestore = FirebaseFirestore.instance;

class OtpForm extends StatefulWidget {
  const OtpForm(
      {Key key,
      @required this.phoneNumber,
      @required this.password,
      @required this.name})
      : super(key: key);

  final String phoneNumber;
  final String password;
  final String name;
  final String verificationId = null;

  @override
  _OtpFormState createState() => _OtpFormState();
}

class _OtpFormState extends State<OtpForm> {
  final _formKeyOTP = GlobalKey<FormState>();
  var _text1 = TextEditingController();
  var _text2 = TextEditingController();
  var _text3 = TextEditingController();
  var _text4 = TextEditingController();
  var _text5 = TextEditingController();
  var _text6 = TextEditingController();
  var verificationCode = '';

  //await Firebase.initializeApp();
  //FirebaseAuth auth = FirebaseAuth.instanceFor(app: secondaryApp);
//FirebaseAuth auth = FirebaseAuth.instance;
  //final FirebaseFirestore firestore = FirebaseFirestore.instance;
  //var smsCode = '';

  //_OtpFormState()

  FocusNode pin2FocusNode;
  FocusNode pin3FocusNode;
  FocusNode pin4FocusNode;
  FocusNode pin5FocusNode;
  FocusNode pin6FocusNode;

  void authentication(arguments) async {
    print("****************** Je suis dans authentification *****************");

    //auth = FirebaseAuth.instanceFor(app: secondaryApp);
    await Firebase.initializeApp();
    FirebaseAuth auth = FirebaseAuth.instance;
    //FirebaseFirestore firestore = FirebaseFirestore.instance;

    await auth.verifyPhoneNumber(
      phoneNumber: '+237${arguments["phoneNumber"]}',
      verificationCompleted: (PhoneAuthCredential credential) async {
        print(
            "****************** Je suis dans verificationCompleted *****************");
        //await auth.signInWithCredential(credential);
        print("********A**********");
        //auto code complete (not manually)
        await auth.signInWithCredential(credential).then((user) async {
          print('test1');
          print(user);
          /*  try {
            Response response;
            var dio = Dio();
            // Optionally the request above could also be done as
            response = await dio.post(
                'https://us-central1-mygreen-1d50a.cloudfunctions.net/clients/${auth.currentUser.uid}',
                data: {
                  'username': '${arguments["name"]}',
                  'code': "${arguments["password"]}"
                });
            print('test2');
            print(
                "************vOICI  CE QUE JE PASSE EN PARAMETRE1 ${auth.currentUser.uid}***************");
            print(response.data.toString());
          } catch (e) {
            print(e);
          }  */

          if (user != null) {
            //store registration details in firestore database
            await firestore
                .collection('clients')
                .doc(auth.currentUser.uid)
                .set({
              /* 'name': "anne",
                    'cellnumber': "phoneNumber" */
              'name': "${arguments["name"]}",
              'code': "${arguments["password"]}",
              'phonenumber': "${arguments["phoneNumber"]}",
              'wallet': 0
            }, SetOptions(merge: true));
          }
        });
      },
      verificationFailed: (FirebaseAuthException e) {
        //print(e.toString());
        if (e.code == 'invalid-phone-number') {
          print('Le numéro que vous avez entré est invalide');
        } else {
          print(e);
        }
        print(
            "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++");
        print(e);
        print("********B**********");
      },

      codeSent: (String verificationId, int resendToken) async {
        verificationCode = verificationId;
        print("******************Je suis dans codeSent *****************");
      },
      // Auto-resolution timed out...
      timeout: const Duration(seconds: 60),
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  void sendCode(smscode, arguments) async {
    // Update the UI - wait for the user to enter the SMS code
    print("******************test code sent *****************");
    print("******************Je suis dans sendCode *****************");
    print(
        "******************code de vérification $verificationCode *****************");
    print(
        "******************smscode que j'ai entré $smscode *****************");

    print("******************Avant PhoneAuthCredential *****************");

    FirebaseAuth auth = FirebaseAuth.instance;

    // Create a PhoneAuthCredential with the code
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationCode, smsCode: smscode);

    print("******************Avant signInWithCredential *****************");
    // Sign the user in (or link) with the credential

    /*************************************************************************************************************************/

    await auth.signInWithCredential(credential).then((user) async {
      try {
        Response response;
        var dio = Dio();
        // Optionally the request above could also be done as
        response = await dio.post(
            'https://us-central1-mygreen-1d50a.cloudfunctions.net/clients/${auth.currentUser.uid}',
            data: {
              'username': '${arguments["name"]}',
              'code': "${arguments["password"]}"
            });
        print(
            "************vOICI  CE QUE JE PASSE EN PARAMETRE2 ${auth.currentUser.uid}***************");
        print(response.data.toString());
      } catch (e) {
        print(e);
      }
    });
    /* await auth.signInWithCredential(credential).then((user) async => {
          //sign in was success
          if (user != null)
            {
              //store registration details in firestore database
              await firestore
                  .collection('clients')
                  .doc(auth.currentUser.uid)
                  .set({
                /* 'name': "anne",
                'cellnumber': "phoneNumber" */
                'name': "${arguments["name"]}",
                'code': "${arguments["password"]}",
                'phonenumber': "${arguments["phoneNumber"]}"
              }, SetOptions(merge: true))
            }
        }); */
    print("******************test signInWithCredential *****************");
  }

  @override
  void initState() {
    super.initState();
    //authentication();
    pin2FocusNode = FocusNode();
    pin3FocusNode = FocusNode();
    pin4FocusNode = FocusNode();
    pin5FocusNode = FocusNode();
    pin6FocusNode = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    pin2FocusNode.dispose();
    pin3FocusNode.dispose();
    pin4FocusNode.dispose();
    pin5FocusNode.dispose();
    pin6FocusNode.dispose();
  }

  void nextField(String value, FocusNode focusNode) {
    if (value.length == 1) {
      focusNode.requestFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context).settings.arguments as Map;
    authentication(arguments);
    return Form(
      key: _formKeyOTP,
      child: Column(
        children: [
          SizedBox(height: SizeConfig.screenHeight * 0.15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: getProportionateScreenWidth(50),
                child: TextFormField(
                  controller: _text1,
                  autofocus: true,
                  obscureText: true,
                  style: TextStyle(fontSize: 24),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: otpInputDecoration,
                  onChanged: (value) {
                    nextField(value, pin2FocusNode);
                  },
                ),
              ),
              SizedBox(
                width: getProportionateScreenWidth(50),
                child: TextFormField(
                  controller: _text2,
                  focusNode: pin2FocusNode,
                  obscureText: true,
                  style: TextStyle(fontSize: 24),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: otpInputDecoration,
                  onChanged: (value) => nextField(value, pin3FocusNode),
                ),
              ),
              SizedBox(
                width: getProportionateScreenWidth(50),
                child: TextFormField(
                  controller: _text3,
                  focusNode: pin3FocusNode,
                  obscureText: true,
                  style: TextStyle(fontSize: 24),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: otpInputDecoration,
                  onChanged: (value) => nextField(value, pin4FocusNode),
                ),
              ),
              SizedBox(
                width: getProportionateScreenWidth(50),
                child: TextFormField(
                  controller: _text4,
                  focusNode: pin4FocusNode,
                  obscureText: true,
                  style: TextStyle(fontSize: 24),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: otpInputDecoration,
                  onChanged: (value) => nextField(value, pin5FocusNode),
                ),
              ),
              SizedBox(
                width: getProportionateScreenWidth(50),
                child: TextFormField(
                  controller: _text5,
                  focusNode: pin5FocusNode,
                  obscureText: true,
                  style: TextStyle(fontSize: 24),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: otpInputDecoration,
                  onChanged: (value) => nextField(value, pin6FocusNode),
                ),
              ),
              SizedBox(
                width: getProportionateScreenWidth(50),
                child: TextFormField(
                  controller: _text6,
                  focusNode: pin6FocusNode,
                  obscureText: true,
                  style: TextStyle(fontSize: 24),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: otpInputDecoration,
                  onChanged: (value) {},
                ),
              ),
            ],
          ),
          SizedBox(height: SizeConfig.screenHeight * 0.15),
          DefaultButton(
            text: "Continuer",
            /* press: () async {
              if (_formKeyOTP.currentState.validate()) {
                // If the form is valid, we want to show a loading Snackbar
                // If the form is valid, we want to do firebase signup...
                try {
                  await auth
                      .signInWithCredential(PhoneAuthProvider.credential(
                          verificationId: verificationCode,
                          smsCode: _text1.text.toString() +
                              _text2.text.toString() +
                              _text3.text.toString() +
                              _text4.text.toString() +
                              _text5.text.toString() +
                              _text6.text.toString()))
                      .then((user) async => {
                            //sign in was success
                            if (user != null)
                              {
                                //store registration details in firestore database
                                await firestore
                                    .collection('clients')
                                    .doc(auth.currentUser.uid)
                                    .set({
                                  /* 'name': nameController
                                                            .text
                                                            .trim(), */
                                  'cellnumber':
                                      arguments["phoneNumber"].text.trim(),
                                }, SetOptions(merge: true)).then((value) => {
                                          //then move to authorised area
                                          /* setState(() {
                                                                  isLoading =
                                                                      false;
                                                                  isResend =
                                                                      false;
                                                                }) */
                                        }),

                                /* setState(() {
                                                    isLoading = false;
                                                    isResend = false;
                                                  }), */
                                Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        LoginSuccessScreen(),
                                  ),
                                  (route) => false,
                                )
                              }
                          })
                      .catchError((error) => {});
                } catch (e) {}
              }
            }, */

            press: () async {
              FirebaseAuth _auth = FirebaseAuth.instance;
              if (_formKeyOTP.currentState.validate()) {
                sendCode(
                    _text1.text.toString() +
                        _text2.text.toString() +
                        _text3.text.toString() +
                        _text4.text.toString() +
                        _text5.text.toString() +
                        _text6.text.toString(),
                    arguments);
                //  _formKeyOTP.currentState.save();
                // if all are valid then go to success screen
                if (_auth.currentUser != null) {
                  Navigator.pushNamed(context, LoginSuccessScreen.routeName);
                  print(_auth.currentUser.uid);
                }
              }
              //authentication(arguments);
            },
          )
        ],
      ),
    );
  }
}
