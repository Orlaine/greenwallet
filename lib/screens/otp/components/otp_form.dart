import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:green_wallet/components/default_button.dart';
import 'package:green_wallet/size_config.dart';
import 'package:green_wallet/screens/login_success/login_success_screen.dart';
//import 'package:green_wallet/screens/sign_up/sign_up_screen.dart';
//import 'package:firebase_auth/firebase_auth.dart';
import '../../../constants.dart';

//FirebaseApp secondaryApp = Firebase.app('SecondaryApp');
//FirebaseAuth auth = FirebaseAuth.instanceFor(app: secondaryApp);
//FirebaseAuth auth = FirebaseAuth.instance;
//final FirebaseFirestore firestore = FirebaseFirestore.instance;

class OtpForm extends StatefulWidget {
  const OtpForm({Key key, @required this.phoneNumber, @required this.password})
      : super(key: key);
  //const OtpForm({Key key}) : super(key: key);

  final String phoneNumber;
  final String password;
  //final String number = null;
  final String verificationId = null;
  //OtpScreen({this.number, this.verificationId});

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

  /* Future<void> phoneCredential(
    BuildContext context,
    String otp,
  ) async {
    FirebaseAuth _auth = FirebaseAuth.instance;
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: widget.verificationId, smsCode: otp);
      final User user = (await _auth.signInWithCredential(credential)).user;

      if (user != null) {
        Navigator.restorablePushNamed(context, LoginSuccessScreen.routeName);
        print('test');
      } else {
        print('Login Failed');
      }
    } catch (e) {
      print(e.toString());
    }
  } */

  FocusNode pin2FocusNode;
  FocusNode pin3FocusNode;
  FocusNode pin4FocusNode;
  FocusNode pin5FocusNode;
  FocusNode pin6FocusNode;

  void authentication(arguments) async {
    //final arguments = ModalRoute.of(context).settings.arguments as Map;

    print("****************** Je suis dans authentification *****************");

    //auth = FirebaseAuth.instanceFor(app: secondaryApp);
    await Firebase.initializeApp();
    FirebaseAuth auth = FirebaseAuth.instance;

    await auth.verifyPhoneNumber(
      phoneNumber: '+237${arguments["phoneNumber"]}',
      //phoneNumber: '+237699439489',
      verificationCompleted: (PhoneAuthCredential credential) async {
        print(
            "****************** Je suis dans verificationCompleted *****************");
        //await auth.signInWithCredential(credential);
        print("********A**********");
        //auto code complete (not manually)
        /* await auth.signInWithCredential(credential).then((user) async => {
                  // if (user != null) {
                  //store registration details in firestore database
                  await firestore
                      .collection('users')
                      .doc(auth.currentUser.uid)
                      .set({
                    //'name': nameController.text.trim(),
                    'cellnumber': arguments["phoneNumber"].text.trim()
                    //'cellnumber': '+237656646406'
                  }, SetOptions(merge: true)).then((value) => {
                            //then move to authorised area
                            // setState(() {
                            //   isLoading = false;
                            //   isRegister = false;
                            //   isOTPScreen = false;

                            //navigate to is
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    LoginSuccessScreen(),
                              ),
                              (route) => false,
                            ),
                            //})
                          })
                  /* .catchError((onError) => {
                            debugPrint(
                                'Error saving user to db.' + onError.toString())
                          }) */
                }
            //}
            ); */

        // Sign the user in (or link) with the auto-generated credential
        /* await auth.signInWithCredential(credential);
        print("********A**********"); */
      },
      verificationFailed: (FirebaseAuthException e) {
        //print(e.toString());
        if (e.code == 'invalid-phone-number') {
          print('The provided phone number is not valid.');
        }
        print("********B**********");
      },

      codeSent: (String verificationId, int resendToken) async {
        verificationCode = verificationId;
        print("******************Je suis dans codeSent *****************");
        /* void sendCode() async {
          // Update the UI - wait for the user to enter the SMS code
          verificationCode = verificationId;
          print("******************test code sent *****************");
          String smsCode = smscode;
          print("******************Je suis dans codeSent *****************");
          print("******************test $verificationCode *****************");
          print("******************test $smscode *****************");
          // Create a PhoneAuthCredential with the code
          PhoneAuthCredential credential = PhoneAuthProvider.credential(
              verificationId: verificationCode, smsCode: smsCode);

          // Sign the user in (or link) with the credential
          await auth.signInWithCredential(credential);
        } */
        /*   // Update the UI - wait for the user to enter the SMS code
        verificationCode = verificationId;
        print("******************test code sent *****************");
        String smsCode = smscode;
        print("******************Je suis dans codeSent *****************");
        print("******************test $verificationCode *****************");
        print("******************test $smscode *****************");
        // Create a PhoneAuthCredential with the code
        PhoneAuthCredential credential = PhoneAuthProvider.credential(
            verificationId: verificationCode, smsCode: smsCode);

        // Sign the user in (or link) with the credential
        await auth.signInWithCredential(credential); */
      },
      timeout: const Duration(seconds: 60),
      codeAutoRetrievalTimeout: (String verificationId) {
        // Auto-resolution timed out...
      },
    );
  }

  void sendCode(smscode) async {
    // Update the UI - wait for the user to enter the SMS code
    print("******************test code sent *****************");
    print("******************Je suis dans sendCode *****************");
    print("******************test $verificationCode *****************");
    print("******************test $smscode *****************");

    print("******************Avant PhoneAuthCredential *****************");

    FirebaseAuth auth = FirebaseAuth.instance;

    // Create a PhoneAuthCredential with the code
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationCode, smsCode: smscode);

    print("******************Avant signInWithCredential *****************");
    // Sign the user in (or link) with the credential

    await auth.signInWithCredential(credential);
    print("******************test signInWithCredential *****************");
  }

  @override
  void initState() {
    print('****************Test dinitiolisation****************');
    super.initState();
    print("********4**********");
    //authentication();
    print("********5**********");
    print("Bonjour odc");
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
    print("Test1");

    final arguments = ModalRoute.of(context).settings.arguments as Map;
    final mmscode = _text1.text.toString() +
        _text2.text.toString() +
        _text3.text.toString() +
        _text4.text.toString() +
        _text5.text.toString() +
        _text6.text.toString();
    print("******mmscode que j'ai entré 1*********$mmscode ************");
    authentication(arguments);
    //authentication(arguments);
    //String phoneNum = arguments["phoneNumber"];
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
                  onChanged: (value) {
                    print(
                        "******smscode que j'ai entré*********$mmscode ************");
                    //sendCode();
                  },
                ),
              ),
              //verificationId = null;
            ],
          ),
          SizedBox(height: SizeConfig.screenHeight * 0.15),
          DefaultButton(
            //text: "Continuer",
            text: "Continuer ${arguments["phoneNumber"]}",
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
                            sendCode(_text1.text.toString() +
                                _text2.text.toString() +
                                _text3.text.toString() +
                                _text4.text.toString() +
                                _text5.text.toString() +
                                _text6.text.toString()),
                            //sign in was success
                            if (user != null)
                              {
                                //store registration details in firestore database
                                await firestore
                                    .collection('users')
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
              /* sendCode(_text1.text.toString() +
                  _text2.text.toString() +
                  _text3.text.toString() +
                  _text4.text.toString() +
                  _text5.text.toString() +
                  _text6.text.toString()); */
              if (_formKeyOTP.currentState.validate()) {
                sendCode(_text1.text.toString() +
                    _text2.text.toString() +
                    _text3.text.toString() +
                    _text4.text.toString() +
                    _text5.text.toString() +
                    _text6.text.toString());
                //  _formKeyOTP.currentState.save();
                // if all are valid then go to success screen
                Navigator.pushNamed(context, LoginSuccessScreen.routeName);
              }
              //authentication(arguments);
            },
          )
        ],
      ),
    );
  }
}
