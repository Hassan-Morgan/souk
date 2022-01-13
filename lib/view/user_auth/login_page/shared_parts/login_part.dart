import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:soukapp/app/controller/auth_controller.dart';
import 'package:soukapp/app/resources_manager/icon_manager.dart';
import 'package:soukapp/app/resources_manager/strings_manager.dart';
import 'package:soukapp/view/custom_widgets/custom_button.dart';
import 'package:soukapp/view/custom_widgets/custom_text_form_feild.dart';

class LoginPart extends StatelessWidget {
  LoginPart({Key? key}) : super(key: key);


 final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
      init: AuthController(),
      builder: (controller) => Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              StringsManager.loginWelcome,
              style: Theme.of(context).textTheme.headline1,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              StringsManager.loginPlease,
              style: Theme.of(context).textTheme.headline2,
            ),
            const SizedBox(
              height: 25,
            ),
            CustomTextFormField(
              textController: controller.emailController,
              labelText: StringsManager.loginEmailField,
              isSecure: false,
              validation: (value) {
                if (value.isEmpty) {
                  return 'E-mail can\'t be empty';
                }
                return null;
              },
              prefixIcon: IconManger.loginEmailFieldIcon,
              keyType: TextInputType.emailAddress,
            ),
            const SizedBox(
              height: 20,
            ),
            CustomTextFormField(
              textController: controller.passwordController,
              labelText: StringsManager.loginPasswordField,
              isSecure: true,
              validation: (value) {
                if (value.isEmpty) {
                  return 'password can\'t be empty';
                }
                return null;
              },
              prefixIcon: IconManger.loginPasswordFieldIcon,
              keyType: TextInputType.visiblePassword,
            ),
            Align(
              alignment: Alignment.topRight,
              child: TextButton(
                  onPressed: () {
                    controller.navigateToResetPassword();
                  },
                  child: const Text(StringsManager.loginForgotPassword)),
            ),
            const SizedBox(
              height: 10,
            ),
            CustomButton(
                onPress: () {
                  if (formKey.currentState!.validate()) {
                    controller.loginWithEmailAndPassword();
                  }
                },
                buttonName: StringsManager.loginButtonName),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  StringsManager.loginNoAccount,
                  overflow: TextOverflow.fade,
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                TextButton(
                    onPressed: () {
                      controller.navigateToSignup();
                    },
                    child: const Text(StringsManager.loginSignupNow))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
