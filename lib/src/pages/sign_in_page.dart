import 'package:chat_app/src/core/dialogs.dart';
import 'package:chat_app/src/core/styles.dart';
import 'package:chat_app/src/widgets/custom_button.dart';
import 'package:chat_app/src/widgets/custom_textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String email;
  String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: Styles.bodyPadding,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Inicio de sesión',
              style: Styles.authTitle,
            ),
            Image.asset(
              'assets/images/logo.png',
              height: 150,
            ),
            SizedBox(height: 50),
            CustomTextField(
              hintText: 'Ingresa tu correo',
              onChanged: (value) {
                email = value;
              },
            ),
            SizedBox(height: 10),
            CustomTextField(
              hintText: 'Ingresa tu contraseña',
              onChanged: (value) {
                password = value;
              },
            ),
            SizedBox(height: 25),
            CustomButton(
              label: 'Ingresar',
              onTap: () async {
                if (email != null && password != null) {
                  Dialogs.loader(context);
                  try {
                    final user = await _auth.signInWithEmailAndPassword(
                      email: email,
                      password: password,
                    );
                    Navigator.pop(context);
                    if (user != null) {
                      // Navigator.pushNamed(context, 'chat_page');
                      Navigator.of(context).pushNamedAndRemoveUntil(
                        'chat_page',
                        (route) => false,
                      );
                    }
                  } catch (e) {
                    print(e);
                  }
                }
                return;
              },
            ),
            SizedBox(height: 30),
            Text(
              '¿Todavía no tienes una cuenta?',
              style: Styles.greyText,
            ),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, 'sign_up_page');
              },
              child: Text(
                'Regístrate',
                style: Styles.linkText,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
