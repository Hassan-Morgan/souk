import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:soukapp/app/controller/auth_controller.dart';
import 'package:soukapp/app/resources_manager/icon_manager.dart';
import 'package:soukapp/app/resources_manager/strings_manager.dart';
import 'package:soukapp/view/custom_widgets/custom_button.dart';
import 'package:soukapp/view/custom_widgets/custom_text_form_feild.dart';

class SignupPart extends StatelessWidget {
  SignupPart({Key? key}) : super(key: key);

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
      init: AuthController(),
      builder: (controller) => Form(
        key: formKey,
        child: Stack(
          children: [
            Column(
              children: [
                Text(
                  StringsManager.loginWelcome,
                  style: Theme.of(context).textTheme.headline1,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  StringsManager.signupWelcome,
                  style: Theme.of(context).textTheme.headline2,
                ),
                const SizedBox(
                  height: 25,
                ),
                CustomTextFormField(
                  textController: controller.userNameController,
                  labelText: StringsManager.signupUserNameField,
                  isSecure: false,
                  validation: (value) {
                    if (value.isEmpty) {
                      return StringsManager.emptyEmailField;
                    }
                    return null;
                  },
                  prefixIcon: IconManger.signupUserNameFieldIcon,
                  keyType: TextInputType.name,
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextFormField(
                  textController: controller.phoneController,
                  labelText: StringsManager.signupPhoneField,
                  isSecure: false,
                  validation: (value) {
                    if (value.isEmpty) {
                      return StringsManager.emptyPhoneField;
                    }
                    return null;
                  },
                  prefixIcon: IconManger.signupPhoneFieldIcon,
                  keyType: TextInputType.phone,
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextFormField(
                  textController: controller.emailController,
                  labelText: StringsManager.loginEmailField,
                  isSecure: false,
                  validation: (value) {
                    if (value.isEmpty) {
                      return StringsManager.emptyEmailField;
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
                    if (value.isEmpty || value.length < 8) {
                      return StringsManager.emptyPasswordField;
                    }
                    return null;
                  },
                  prefixIcon: IconManger.loginPasswordFieldIcon,
                  keyType: TextInputType.visiblePassword,
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomButton(
                  onPress: () {
                    if (formKey.currentState!.validate()) {
                      controller.signupWithUserNameAndPassword();
                    }
                  },
                  buttonName: StringsManager.signupButtonName,
                ),
                const SizedBox(
                  height: 20,
                ),
                Wrap(
                  alignment: WrapAlignment.center,
                  children: [
                    Text(
                      StringsManager.signupHaveAccount,
                      overflow: TextOverflow.fade,
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                    TextButton(
                        onPressed: () {
                          controller.navigateToLogin();
                        },
                        child: const Text(StringsManager.signupLoginNow))
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
