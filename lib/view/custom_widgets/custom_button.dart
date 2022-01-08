import 'package:flutter/material.dart';
import 'package:soukapp/app/resources_manager/color_manager.dart';

class CustomButton extends StatelessWidget {
  final dynamic onPress;
  final String buttonName;

  const CustomButton(
      {Key? key, required this.onPress, required this.buttonName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 50,vertical: 10),
      decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: ColorManager.blackColor,
                spreadRadius: 1,
                offset: Offset(2, 2))
          ],
          borderRadius: BorderRadius.all(Radius.circular(5)),
          gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [ColorManager.primaryColor, ColorManager.greyColor])),
      child: MaterialButton(
        onPressed: onPress,
        child: Text(buttonName, style: Theme.of(context).textTheme.button),
      ),
    );
  }
}
