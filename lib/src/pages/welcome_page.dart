import 'package:chat_app/src/core/styles.dart';
import 'package:chat_app/src/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key key}) : super(key: key);

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
              'iChat',
              style: Styles.authTitle,
            ),
            Image.asset(
              'assets/images/vector.png',
            ),
            SizedBox(height: 100),
            CustomButton(
              label: 'Registrarme',
              onTap: () {
                Navigator.pushNamed(context, 'sign_up_page');
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
