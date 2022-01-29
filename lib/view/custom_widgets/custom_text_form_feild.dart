import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:soukapp/app/controller/text_form_field_controller.dart';

class CustomTextFormField extends StatelessWidget {
  final String labelText;
  final bool isSecure;
  final dynamic validation;
  final Icon prefixIcon;
  final TextInputType keyType;
  final TextEditingController textController;
  final int? maxLines;
  final bool? isNumber;

  const CustomTextFormField({
    Key? key,
    this.isNumber,
    this.maxLines,
    required this.labelText,
    required this.isSecure,
    required this.validation,
    required this.prefixIcon,
    required this.keyType,
    required this.textController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TextFormFieldController>(
      init: TextFormFieldController(),
      builder: (controller) => TextFormField(
        inputFormatters: isNumber == true
            ? [
                FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
              ]
            : null,
        controller: textController,
        keyboardType: keyType,
        validator: validation,
        maxLines: maxLines ?? 1,
        obscureText: isSecure ? controller.isVisible : isSecure,
        decoration: InputDecoration(
          labelText: labelText,
          prefixIcon: prefixIcon,
          suffixIcon: isSecure
              ? IconButton(
                  onPressed: () {
                    controller.changeTextVisibility();
                  },
                  icon: controller.isVisible
                      ? const Icon(Icons.visibility_outlined)
                      : const Icon(Icons.visibility_off_outlined),
                )
              : null,
        ),
      ),
    );
  }
}
