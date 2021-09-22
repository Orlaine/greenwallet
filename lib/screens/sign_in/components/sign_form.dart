/* //import 'package:flutter_easyloading/flutter_easyloading.dart';
//import 'package:green_wallet/screens/forgot_password/forgot_password_screen.dart';
//import 'package:green_wallet/screens/login_success/login_success_screen.dart';
//import 'package:green_wallet/screens/sign_up/sign_up_screen.dart';
//import 'package:green_wallet/helper/keyboard.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:green_wallet/components/custom_surfix_icon.dart';
import 'package:green_wallet/components/form_error.dart';
import 'package:green_wallet/components/no_account_text.dart';
import 'package:green_wallet/screens/home/home_screen.dart';
import 'package:green_wallet/screens/splash/splash_screen.dart';

import '../../../components/default_button.dart';
import '../../../constants.dart';
import '../../../size_config.dart';

//final FirebaseAuth _auth = FirebaseAuth.instance;
final FirebaseFirestore _firestore = FirebaseFirestore.instance;

class SignForm extends StatefulWidget {
  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final _formKey = GlobalKey<FormState>();
  final _formKeyOTP = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  final TextEditingController numberController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();
  final TextEditingController otpController = new TextEditingController();

  var isLoading = false;
  var isResend = false;
  var isLoginScreen = true;
  var isOTPScreen = false;
  var verificationCode = '';
  bool remember = false;
  final List<String> errors = [];

  void addError({String error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  void removeError({String error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }

  //Form controllers
  @override
  void initState() {
    /* await Firebase.initializeApp();
    FirebaseAuth _auth = FirebaseAuth.instance;
    if (_auth.currentUser != null) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => HomeScreen(),
        ),
        (route) => false,
      );
    } */
    super.initState();
    print("completed");
    Firebase.initializeApp().whenComplete(() {
      print("completed");
      setState(() {});
    });
  }

  @override
  void dispose() {
    // Clean up the controller when the Widget is disposed
    numberController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void init() async {
    await Firebase.initializeApp();
  }

  @override
  Widget build(BuildContext context) {
    init();
    FirebaseAuth _auth = FirebaseAuth.instance;
    if (_auth.currentUser != null) {
      /* Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => HomeScreen(),
        ),
        (route) => false, );*/
      return HomeScreen();
    } else {
      //return EasyLoading.show(status: 'loading...');
      return isOTPScreen ? returnOTPScreen() : returnLoginScreen();
    }
  }

  Widget returnLoginScreen() {
    return Scaffold(
        key: _scaffoldKey,
        appBar: new AppBar(
          title: Text('Connexion'),
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pushNamed(context, SplashScreen.routeName);
                },
              );
            },
          ),
        ),
        body: ListView(children: [
          new Column(
            children: [
              SizedBox(height: SizeConfig.screenHeight * 0.04),
              Text(
                "Bon retour!",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: getProportionateScreenWidth(28),
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Connectez-vous avec votre numero de téléphone",
                textAlign: TextAlign.center,
              ),
              SizedBox(height: SizeConfig.screenHeight * 0.08),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    buildPhoneNumberFormField(),
                    SizedBox(height: getProportionateScreenHeight(30)),
                    //buildPasswordFormField(),
                    //SizedBox(height: getProportionateScreenHeight(30)),
                    Row(
                      children: [
                        Checkbox(
                          value: remember,
                          activeColor: kPrimaryColor,
                          onChanged: (value) {
                            setState(() {
                              remember = value;
                            });
                          },
                        ),
                        Text("Remember me"),
                        Spacer(),
                      ],
                    ),
                    FormError(errors: errors),
                    SizedBox(height: getProportionateScreenHeight(20)),
                    /* Container(
            child: !isLoading
            ? new  */
                    DefaultButton(
                      text: "Continuer",
                      press: () async {
                        if (!isLoading) {
                          if (_formKey.currentState.validate()) {
                            //displaySnackBar('Please wait...');
                            await login();
                            /*_formKey.currentState.save();
                // if all are valid then go to success screen
                KeyboardUtil.hideKeyboard(context);
                Navigator.pushNamed(context, LoginSuccessScreen.routeName); */
                          }
                        }
                      },
                    )
                    //),
                  ],
                ),
              ),
              SizedBox(height: SizeConfig.screenHeight * 0.08),
              /*  Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SocalCard(
                      icon: "assets/icons/google-icon.svg",
                      press: () {},
                    ),
                    SocalCard(
                      icon: "assets/icons/facebook-2.svg",
                      press: () {},
                    ),
                    SocalCard(
                      icon: "assets/icons/twitter.svg",
                      press: () {},
                    ),
                  ],
                ), */
              SizedBox(height: getProportionateScreenHeight(20)),
              NoAccountText(),
            ],
          )
        ]));
  }

  /* TextFormField buildPasswordFormField() {
    return TextFormField(
      enabled: !isLoading,
      controller: passwordController,
      keyboardType: TextInputType.phone,
      obscureText: true,
      //onSaved: (newValue) => password = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        } else if (value.length >= 4) {
          removeError(error: kShortPassError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kPassNullError);
          return "Entrez s'il vous plait votre mot de passe";
        } else if (value.length < 4) {
          addError(error: kShortPassError);
          return "Le mot de passe est trop court";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Code Pin",
        hintText: "Entrez le code pin",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
      ),
    );
  } */

  TextFormField buildPhoneNumberFormField() {
    return TextFormField(
      enabled: !isLoading,
      controller: numberController,
      keyboardType: TextInputType.phone,
      //onSaved: (newValue) => phoneNumber = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPhoneNumberNullError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kPhoneNumberNullError);
          return "Entrez s'il vous plait votre numéro de téléphone";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Numero de Téléphone",
        hintText: "Entrez votre numéro",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Phone.svg"),
      ),
    );
  }

  TextFormField buildOTPFormField() {
    return TextFormField(
      enabled: !isLoading,
      controller: otpController,
      keyboardType: TextInputType.phone,
      //onSaved: (newValue) => phoneNumber = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPhoneNumberNullError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kPhoneNumberNullError);
          return "Entrez s'il vous plait le code que vous avez reçu par téléphone";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Code OTP",
        hintText: "Entrez le code OTP",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Phone.svg"),
      ),
    );
  }

  Widget returnOTPScreen() {
    return Scaffold(
      key: _scaffoldKey,
      appBar: new AppBar(
        title: Text('Verification du Téléphone'),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pushNamed(context, SplashScreen.routeName);
              },
            );
          },
        ),
      ),
      body: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: SingleChildScrollView(
          child: Column(children: [
            SizedBox(height: SizeConfig.screenHeight * 0.05),
            Text(
              "Verification du Numéro",
              style: TextStyle(
                fontSize: getProportionateScreenWidth(25),
                fontWeight: FontWeight.bold,
                color: Colors.black,
                height: 1.5,
              ),
            ),
            Text("Nous vous avons envoyé un code par sms "),
            //buildTimer(),
            Form(
              key: _formKeyOTP,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 10.0),
                          child: Text(
                              !isLoading ? " " : "Envoie du code par SMS",
                              textAlign: TextAlign.center))),
                  !isLoading
                      ? Container(
                          child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 10.0),
                          child: buildOTPFormField(),
                          /* TextFormField(
                          enabled: !isLoading,
                          controller: otpController,
                          keyboardType: TextInputType.number,
                          /* inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly
                          ], */
                          initialValue: null,
                          autofocus: true,
                          decoration: InputDecoration(
                              labelText: 'OTP',
                              labelStyle: TextStyle(color: Colors.black)),
                          // ignore: missing_return
                          validator: (value) {
                            if (value.isEmpty) {
                              return "Entrez le code s'il vous plait";
                            }
                          },
                        ), */
                        ))
/******************************************* Un test *******************************************************/
                      //  : Container(),
                      : CircularProgressIndicator(),
                  !isLoading
                      ? Container(
                          margin: EdgeInsets.only(top: 40, bottom: 5),
                          child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: new DefaultButton(
                                text: "Continuer",
                                press: () async {
                                  if (_formKeyOTP.currentState.validate()) {
                                    FirebaseAuth _auth = FirebaseAuth.instance;
                                    await _auth
                                        .signInWithCredential(
                                            PhoneAuthProvider.credential(
                                                verificationId:
                                                    verificationCode,
                                                smsCode: otpController.text
                                                    .toString()))
                                        .then((user) async => {
                                              //sign in was success
                                              if (user != null)
                                                print(
                                                    "L'utilisateur n'est pas null"),
                                              {
                                                Navigator.pushAndRemoveUntil(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (BuildContext
                                                            context) =>
                                                        HomeScreen(),
                                                  ),
                                                  (route) => false,
                                                )
                                              }
                                            });
                                  }
                                },
                              )))
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  CircularProgressIndicator(
                                    backgroundColor:
                                        Theme.of(context).primaryColor,
                                  )
                                ].where((c) => c != null).toList(),
                              )
                            ]),
                  isResend
                      ? Container(
                          margin: EdgeInsets.only(top: 40, bottom: 5),
                          child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: new ElevatedButton(
                                onPressed: () async {
                                  setState(() {
                                    isResend = false;
                                    isLoading = true;
                                  });
                                  await login();
                                },
                                child: new Container(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 15.0,
                                    horizontal: 15.0,
                                  ),
                                  child: new Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      new Expanded(
                                        child: Text(
                                          "Envoyer un nouveau code",
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )))
/******************************************* Un test *******************************************************/
                      // : Column()
                      : CircularProgressIndicator(),
                ],
              ),
            ),
            SizedBox(height: SizeConfig.screenHeight * 0.1),
            GestureDetector(
              onTap: () {
                // code resend
              },
              child: Text(
                "Envoyer un nouveau code",
                style: TextStyle(decoration: TextDecoration.underline),
              ),
            )
          ]),
        ),
      ),
    );
  }

  displaySnackBar(text) {
    final snackBar = SnackBar(content: Text(text));
    // ignore: deprecated_member_use
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }

  Future login() async {
    await Firebase.initializeApp();
    final FirebaseAuth _auth = FirebaseAuth.instance;
    setState(() {
      isLoading = true;
    });

    var phoneNumber = '+237' + numberController.text.trim();
    //var phoneNumber = numberController.text.trim();

    //first we will check if a user with this cell number exists
    var isValidUser = false;
    var number = numberController.text.trim();

    await _firestore
        .collection('clients')
        .where('telephone', isEqualTo: number)
        .get()
        .then((result) {
      if (result.docs.length > 0) {
        isValidUser = true;
      }
    });

    if (isValidUser) {
      //ok, we have a valid user, now lets do otp verification
      print("**********L'utilisateur est valide!***********");
      var verifyPhoneNumber = _auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (phoneAuthCredential) {
          //auto code complete (not manually)
          _auth.signInWithCredential(phoneAuthCredential).then((user) async => {
                if (user != null)
                  {
                    //redirect
                    setState(() {
                      isLoading = false;
                      isOTPScreen = false;
                    }),
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => HomeScreen(),
                      ),
                      (route) => false,
                    )
                  }
              });
        },
        verificationFailed: (FirebaseAuthException error) {
          displaySnackBar(
              'Erreur de validation. Veuillez rééssayer plutard s\'il vous plait');
          setState(() {
            isLoading = false;
          });
        },
        codeSent: (verificationId, [forceResendingToken]) {
          print("**********Le code a été envoyé!***********");
          setState(() {
            isLoading = false;
            verificationCode = verificationId;
            isOTPScreen = true;
          });
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          setState(() {
            isLoading = false;
            verificationCode = verificationId;
          });
        },
        timeout: Duration(seconds: 60),
      );
      await verifyPhoneNumber;
    } else {
      //non valid user
      setState(() {
        isLoading = false;
      });
      displaySnackBar(
          'Nous n\'avons pas trouvé votre numéro, veuillez vous inscrire d\'abord');
    }
  }
}

Row buildTimer() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text("Ce code expire dans "),
      TweenAnimationBuilder(
        tween: Tween(begin: 30.0, end: 0.0),
        duration: Duration(seconds: 60),
        builder: (_, value, child) => Text(
          "00:${value.toInt()}",
          style: TextStyle(color: kPrimaryColor),
        ),
      ),
    ],
  );
}
 */

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:green_wallet/components/custom_surfix_icon.dart';
import 'package:green_wallet/components/form_error.dart';
import 'package:green_wallet/components/no_account_text.dart';
import 'package:green_wallet/helper/keyboard.dart';
import 'package:green_wallet/screens/home/home_screen.dart';
//import 'package:green_wallet/screens/forgot_password/forgot_password_screen.dart';
import 'package:green_wallet/screens/login_success/login_success_screen.dart';
import 'package:green_wallet/screens/sign_up/sign_up_screen.dart';
import 'package:green_wallet/screens/splash/splash_screen.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../../components/default_button.dart';
import '../../../constants.dart';
import '../../../size_config.dart';

//final FirebaseAuth _auth = FirebaseAuth.instance;
final FirebaseFirestore _firestore = FirebaseFirestore.instance;

class SignForm extends StatefulWidget {
  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final _formKey = GlobalKey<FormState>();
  final _formKeyOTP = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  final TextEditingController numberController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();
  final TextEditingController otpController = new TextEditingController();

  var isLoading = false;
  var isResend = false;
  var isLoginScreen = true;
  var isOTPScreen = false;
  var verificationCode = '';
  bool remember = false;
  final List<String> errors = [];

  void addError({String error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  void removeError({String error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }

  //Form controllers
  @override
  void initState() {
    /* await Firebase.initializeApp();
    FirebaseAuth _auth = FirebaseAuth.instance;
    if (_auth.currentUser != null) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => HomeScreen(),
        ),
        (route) => false,
      );
    } */
    super.initState();
    print("completed");
    Firebase.initializeApp().whenComplete(() {
      print("completed");
      setState(() {});
    });
  }

  @override
  void dispose() {
    // Clean up the controller when the Widget is disposed
    numberController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void init() async {
    await Firebase.initializeApp();
  }

  @override
  Widget build(BuildContext context) {
    init();
    FirebaseAuth _auth = FirebaseAuth.instance;
    if (_auth.currentUser != null) {
      /* Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => HomeScreen(),
        ),
        (route) => false, );*/
      return HomeScreen();
    } else {
      //return EasyLoading.show(status: 'loading...');
      return isOTPScreen ? returnOTPScreen() : returnLoginScreen();
    }
  }

  Widget returnLoginScreen() {
    return Scaffold(
        key: _scaffoldKey,
        appBar: new AppBar(
          title: Text('Connexion'),
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pushNamed(context, SplashScreen.routeName);
                },
              );
            },
          ),
        ),
        body: ListView(children: [
          new Column(
            children: [
              SizedBox(height: SizeConfig.screenHeight * 0.04),
              Text(
                "Bon retour!",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: getProportionateScreenWidth(28),
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Connectez-vous avec votre numero de téléphone",
                textAlign: TextAlign.center,
              ),
              SizedBox(height: SizeConfig.screenHeight * 0.08),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    buildPhoneNumberFormField(),
                    SizedBox(height: getProportionateScreenHeight(30)),
                    buildPasswordFormField(),
                    SizedBox(height: getProportionateScreenHeight(30)),
                    Row(
                      children: [
                        Checkbox(
                          value: remember,
                          activeColor: kPrimaryColor,
                          onChanged: (value) {
                            setState(() {
                              remember = value;
                            });
                          },
                        ),
                        Text("Remember me"),
                        Spacer(),
                      ],
                    ),
                    FormError(errors: errors),
                    SizedBox(height: getProportionateScreenHeight(20)),
                    /* Container(
            child: !isLoading
            ? new  */
                    DefaultButton(
                      text: "Continuer",
                      press: () async {
                        if (!isLoading) {
                          if (_formKey.currentState.validate()) {
                            //displaySnackBar('Please wait...');
                            await login();
                            /*_formKey.currentState.save();
                // if all are valid then go to success screen
                KeyboardUtil.hideKeyboard(context);
                Navigator.pushNamed(context, LoginSuccessScreen.routeName); */
                          }
                        }
                      },
                    )
                    //),
                  ],
                ),
              ),
              SizedBox(height: SizeConfig.screenHeight * 0.08),
              /*  Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SocalCard(
                      icon: "assets/icons/google-icon.svg",
                      press: () {},
                    ),
                    SocalCard(
                      icon: "assets/icons/facebook-2.svg",
                      press: () {},
                    ),
                    SocalCard(
                      icon: "assets/icons/twitter.svg",
                      press: () {},
                    ),
                  ],
                ), */
              SizedBox(height: getProportionateScreenHeight(20)),
              NoAccountText(),
            ],
          )
        ]));
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      enabled: !isLoading,
      controller: passwordController,
      keyboardType: TextInputType.phone,
      obscureText: true,
      //onSaved: (newValue) => password = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        } else if (value.length >= 4) {
          removeError(error: kShortPassError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kPassNullError);
          return "Entrez s'il vous plait votre mot de passe";
        } else if (value.length < 4) {
          addError(error: kShortPassError);
          return "Le mot de passe est trop court";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Code Pin",
        hintText: "Entrez le code pin",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
      ),
    );
  }

  TextFormField buildPhoneNumberFormField() {
    return TextFormField(
      enabled: !isLoading,
      controller: numberController,
      keyboardType: TextInputType.phone,
      //onSaved: (newValue) => phoneNumber = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPhoneNumberNullError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kPhoneNumberNullError);
          return "Entrez s'il vous plait votre numéro de téléphone";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Numero de Téléphone",
        hintText: "Entrez votre numéro",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Phone.svg"),
      ),
    );
  }

  TextFormField buildOTPFormField() {
    return TextFormField(
      enabled: !isLoading,
      controller: otpController,
      keyboardType: TextInputType.phone,
      //onSaved: (newValue) => phoneNumber = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPhoneNumberNullError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kPhoneNumberNullError);
          return "Entrez s'il vous plait le code que vous avez reçu par téléphone";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Code OTP",
        hintText: "Entrez le code OTP",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Phone.svg"),
      ),
    );
  }

  Widget returnOTPScreen() {
    return Scaffold(
      key: _scaffoldKey,
      appBar: new AppBar(
        title: Text('Verification du Téléphone'),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pushNamed(context, SplashScreen.routeName);
              },
            );
          },
        ),
      ),
      body: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: SingleChildScrollView(
          child: Column(children: [
            SizedBox(height: SizeConfig.screenHeight * 0.05),
            Text(
              "Verification du Numéro",
              style: TextStyle(
                fontSize: getProportionateScreenWidth(25),
                fontWeight: FontWeight.bold,
                color: Colors.black,
                height: 1.5,
              ),
            ),
            Text("Nous vous avons envoyé un code par sms "),
            buildTimer(),
            Form(
              key: _formKeyOTP,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 10.0),
                          child: Text(
                              !isLoading ? " " : "Envoie du code par SMS",
                              textAlign: TextAlign.center))),
                  !isLoading
                      ? Container(
                          child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 10.0),
                          child: buildOTPFormField(),
                          /* TextFormField(
                          enabled: !isLoading,
                          controller: otpController,
                          keyboardType: TextInputType.number,
                          /* inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly
                          ], */
                          initialValue: null,
                          autofocus: true,
                          decoration: InputDecoration(
                              labelText: 'OTP',
                              labelStyle: TextStyle(color: Colors.black)),
                          // ignore: missing_return
                          validator: (value) {
                            if (value.isEmpty) {
                              return "Entrez le code s'il vous plait";
                            }
                          },
                        ), */
                        ))
                      : Container(),
                  !isLoading
                      ? Container(
                          margin: EdgeInsets.only(top: 40, bottom: 5),
                          child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: new DefaultButton(
                                text: "Continuer",
                                press: () async {
                                  if (_formKeyOTP.currentState.validate()) {
                                    FirebaseAuth _auth = FirebaseAuth.instance;
                                    await _auth
                                        .signInWithCredential(
                                            PhoneAuthProvider.credential(
                                                verificationId:
                                                    verificationCode,
                                                smsCode: otpController.text
                                                    .toString()))
                                        .then((user) async => {
                                              //sign in was success
                                              if (user != null)
                                                print(
                                                    "L'utilisateur n'est pas null"),
                                              {
                                                Navigator.pushAndRemoveUntil(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (BuildContext
                                                            context) =>
                                                        HomeScreen(),
                                                  ),
                                                  (route) => false,
                                                )
                                              }
                                            });
                                  }
                                },
                              )))
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  CircularProgressIndicator(
                                    backgroundColor:
                                        Theme.of(context).primaryColor,
                                  )
                                ].where((c) => c != null).toList(),
                              )
                            ]),
                  isResend
                      ? Container(
                          margin: EdgeInsets.only(top: 40, bottom: 5),
                          child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: new ElevatedButton(
                                onPressed: () async {
                                  setState(() {
                                    isResend = false;
                                    isLoading = true;
                                  });
                                  await login();
                                },
                                child: new Container(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 15.0,
                                    horizontal: 15.0,
                                  ),
                                  child: new Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      new Expanded(
                                        child: Text(
                                          "Resend Code",
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )))
                      : Column()
                ],
              ),
            ),
            SizedBox(height: SizeConfig.screenHeight * 0.1),
            GestureDetector(
              onTap: () {
                // code resend
              },
              child: Text(
                "Envoyer un nouveau code",
                style: TextStyle(decoration: TextDecoration.underline),
              ),
            )
          ]),
        ),
      ),
    );
  }

  displaySnackBar(text) {
    final snackBar = SnackBar(content: Text(text));
    // ignore: deprecated_member_use
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }

  Future login() async {
    await Firebase.initializeApp();
    final FirebaseAuth _auth = FirebaseAuth.instance;
    setState(() {
      isLoading = true;
    });

    var phoneNumber = '+237' + numberController.text.trim();

    //first we will check if a user with this cell number exists
    var isValidUser = false;
    var number = numberController.text.trim();

    await _firestore
        .collection('clients')
        .where('telephone', isEqualTo: phoneNumber)
        .get()
        .then((result) {
      print(
          "**********************>>>>>>>>>>>${result.docs}<<<<<<<<<<<<<<<<************************");
      if (result.docs.length > 0) {
        isValidUser = true;
      }
    });

    if (isValidUser) {
      //ok, we have a valid user, now lets do otp verification
      print("**********L'utilisateur est valide!***********");
      var verifyPhoneNumber = _auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (phoneAuthCredential) {
          //auto code complete (not manually)
          _auth.signInWithCredential(phoneAuthCredential).then((user) async => {
                if (user != null)
                  {
                    //redirect
                    setState(() {
                      isLoading = false;
                      isOTPScreen = false;
                    }),
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => HomeScreen(),
                      ),
                      (route) => false,
                    )
                  }
              });
        },
        verificationFailed: (FirebaseAuthException error) {
          displaySnackBar(
              'Erreur de validation. Veuillez rééssayer plutard s\'il vous plait');
          setState(() {
            isLoading = false;
          });
        },
        codeSent: (verificationId, [forceResendingToken]) {
          print("**********Le code a été envoyé!***********");
          setState(() {
            isLoading = false;
            verificationCode = verificationId;
            isOTPScreen = true;
          });
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          setState(() {
            isLoading = false;
            verificationCode = verificationId;
          });
        },
        timeout: Duration(seconds: 60),
      );
      await verifyPhoneNumber;
    } else {
      //non valid user
      setState(() {
        isLoading = false;
      });
      displaySnackBar(
          'Nous n\'avons pas trouvé votre numéro, veuillez vous inscrire d\'abord');
    }
  }
}

Row buildTimer() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text("Ce code expire dans "),
      TweenAnimationBuilder(
        tween: Tween(begin: 30.0, end: 0.0),
        duration: Duration(seconds: 60),
        builder: (_, value, child) => Text(
          "00:${value.toInt()}",
          style: TextStyle(color: kPrimaryColor),
        ),
      ),
    ],
  );
}
