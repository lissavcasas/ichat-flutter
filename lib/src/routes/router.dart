import 'package:chat_app/src/pages/chat_page.dart';
import 'package:chat_app/src/pages/sign_in_page.dart';
import 'package:chat_app/src/pages/sign_up_page.dart';
import 'package:chat_app/src/pages/splash_page.dart';
import 'package:chat_app/src/pages/welcome_page.dart';
import 'package:flutter/material.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    'splash_page': (context) => SplashPage(),
    'welcome_page': (context) => WelcomePage(),
    'sign_up_page': (context) => SignUpPage(),
    'sign_in_page': (context) => SignInPage(),
    'chat_page': (context) => ChatPage(),
  };
}
