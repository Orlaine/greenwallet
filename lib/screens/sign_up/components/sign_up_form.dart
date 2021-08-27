import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:green_wallet/components/custom_surfix_icon.dart';
import 'package:green_wallet/components/default_button.dart';
import 'package:green_wallet/components/form_error.dart';
import 'package:green_wallet/screens/otp/otp_screen.dart';
//import 'package:green_wallet/screens/home/home_screen.dart';
//import 'package:green_wallet/screens/otp/components/otp_form.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

final _phoneController = TextEditingController();
final _codeController = TextEditingController();

final FirebaseAuth _auth = FirebaseAuth.instance;
final FirebaseFirestore _firestore = FirebaseFirestore.instance;

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  String phoneNumber;
  String password;
  String confirm_password;
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

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildPhoneNumberFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPasswordFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildConformPassFormField(),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(40)),
          DefaultButton(
              text: "Continuer",
              press: () {
                if (_formKey.currentState.validate()) {
                  _formKey.currentState.save();
                  Navigator.pushNamed(context, OtpScreen.routeName, arguments: {
                    'phoneNumber': phoneNumber,
                    'password': password
                  });
                }
              }),
        ],
      ),
    );
  }

  TextFormField buildConformPassFormField() {
    return TextFormField(
      keyboardType: TextInputType.phone,
      obscureText: true,
      onSaved: (newValue) => confirm_password = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        } else if (value.isNotEmpty && password == confirm_password) {
          removeError(error: kMatchPassError);
        }
        confirm_password = value;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kPassNullError);
          return "";
        } else if ((password != value)) {
          addError(error: kMatchPassError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Confirmer le code pin",
        hintText: "Re-entrer votre code pin",
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      keyboardType: TextInputType.phone,
      obscureText: true,
      onSaved: (newValue) => password = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        } else if (value.length >= 4) {
          removeError(error: kShortPassError);
        }
        password = value;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kPassNullError);
          return "";
        } else if (value.length < 4) {
          addError(error: kShortPassError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Code Pin",
        hintText: "Entrer le Code Pin",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
      ),
      controller: _codeController,
    );
  }

  TextFormField buildPhoneNumberFormField() {
    return TextFormField(
      keyboardType: TextInputType.phone,
      onSaved: (newValue) => phoneNumber = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPhoneNumberNullError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kPhoneNumberNullError);
          return "";
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
      controller: _phoneController,
    );
  }

/*   Future signUp() async {
/*   setState(() {
    isLoading = true;
  }); */

    var _phoneNumber = '+237' + _phoneController.text.trim();
    var verifyPhonenumber = _auth.verifyPhoneNumber(
        phoneNumber: _phoneNumber,
        verificationCompleted: (phoneAuthCredential) {
          _auth.signInWithCredential(phoneAuthCredential).then((user) async => {
                if (user != null)
                  {
                    //logged in
                    await _firestore
                        .collection('users')
                        .doc(_auth.currentUser.uid)
                        .set({
                          //'name': _nameController.text.trim(),
                          'code': _codeController.text.trim(),
                          'cellnumber': _phoneController.text.trim()
                        }, SetOptions(merge: true))
                        .then((value) => {
                              setState(() {
                                /* isLoading = false;
                  isRegister = false;
                  isOTPScreen = false; */

                                Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => HomeScreen()),
                                    (route) => false);
                              })
                            })
                        .catchError((onError) => {
                              debugPrint(
                                  'Error saving user' + onError.toString())
                            })
                  }
              });
        },
        verificationFailed: (FirebaseAuthException error) {
          debugPrint('Error logging in: ' + error.message);
          /*setState(() {
            isLoading = false;
          });*/
        },
        codeSent: (verificationId, [foreResendingToken]) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => OtpScreen()));
          /* setState(() {
            //isLoading = false;
            verificationCode = verificationId;
          }); */
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          // setState(() {
          //   isLoading = false;
          //   verificationCode = verificationId;
          // });
        });
  } */
}
