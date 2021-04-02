import 'package:chat_app/src/core/styles.dart';
import 'package:chat_app/src/widgets/custom_button.dart';
import 'package:chat_app/src/widgets/custom_textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
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
              'Registro',
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
              label: 'Registrarme',
              onTap: () async {
                try {
                  final newUser = await _auth.createUserWithEmailAndPassword(
                    email: email,
                    password: password,
                  );
                  if (newUser != null) {
                    Navigator.pushNamed(context, 'chat_page');
                  }
                } catch (e) {
                  print(e);
                }
              },
            ),
            SizedBox(height: 30),
            Text(
              '¿Ya tienes una cuenta?',
              style: Styles.greyText,
            ),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, 'sign_in_page');
              },
              child: Text(
                'Iniciar sesión',
                style: Styles.linkText,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
