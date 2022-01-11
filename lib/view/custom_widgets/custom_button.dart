import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final dynamic onPress;
  final String buttonName;

  const CustomButton(
      {Key? key, required this.onPress, required this.buttonName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPress,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.15, vertical: 17),
        child: Text(buttonName, style: Theme.of(context).textTheme.button),
      ),
    );
  }
}
