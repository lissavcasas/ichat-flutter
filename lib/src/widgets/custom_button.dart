import 'package:chat_app/src/core/styles.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final Function onTap;

  const CustomButton({
    Key key,
    this.label,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: Styles.btnRadius,
      // splashColor: Colors.orange,
      child: Ink(
        width: 250.0,
        height: 50.0,
        decoration: Styles.btnDecoration,
        child: Center(
          child: Text(
            label,
            style: Styles.btnText,
          ),
        ),
      ),
    );
  }
}
