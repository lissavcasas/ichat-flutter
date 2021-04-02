import 'package:chat_app/src/core/styles.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    _loadApp();
  }

  _loadApp() async {
    await Future.delayed(Duration(seconds: 3));
    Navigator.pushReplacementNamed(context, 'welcome_page');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.primary,
      body: Center(
        child: Text(
          'iChat',
          style: Styles.splashTitle,
        ),
      ),
    );
  }
}
