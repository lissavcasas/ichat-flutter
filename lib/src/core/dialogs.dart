import 'package:flutter/material.dart';

class Dialogs {
  static Future<void> loader(BuildContext context) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        content: Row(children: [
          SizedBox(
            width: 30,
            height: 30,
            child: CircularProgressIndicator(
              strokeWidth: 1,
              valueColor: AlwaysStoppedAnimation(Colors.black),
            ),
          ),
          SizedBox(width: 10),
          Text('Cargando ... '),
        ]),
      ),
    );
  }
}
