import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:soukapp/app/controller/auth_controller.dart';
import 'package:soukapp/app/resources_manager/icon_manager.dart';
import 'package:soukapp/app/resources_manager/strings_manager.dart';
import 'package:soukapp/view/custom_widgets/custom_button.dart';
import 'package:soukapp/view/custom_widgets/custom_text_form_feild.dart';

class SignupPart extends StatelessWidget {
  SignupPart({Key? key}) : super(key: key);

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
      init: AuthController(),
      builder: (controller) => Column(
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
            textController: userNameController,
            labelText: StringsManager.signupUserNameField,
            isSecure: false,
            validation: (value) {},
            prefixIcon: IconManger.signupUserNameFieldIcon,
            keyType: TextInputType.name,
          ),
          const SizedBox(
            height: 20,
          ),
          CustomTextFormField(
            textController: phoneController,
            labelText: StringsManager.signupPhoneField,
            isSecure: false,
            validation: (value) {},
            prefixIcon: IconManger.signupPhoneFieldIcon,
            keyType: TextInputType.phone,
          ),
          const SizedBox(
            height: 20,
          ),
          CustomTextFormField(
            textController: emailController,
            labelText: StringsManager.loginEmailField,
            isSecure: false,
            validation: (value) {},
            prefixIcon: IconManger.loginEmailFieldIcon,
            keyType: TextInputType.emailAddress,
          ),
          const SizedBox(
            height: 20,
          ),
          CustomTextFormField(
            textController: passwordController,
            labelText: StringsManager.loginPasswordField,
            isSecure: true,
            validation: (value) {},
            prefixIcon: IconManger.loginPasswordFieldIcon,
            keyType: TextInputType.visiblePassword,
          ),
          const SizedBox(
            height: 30,
          ),
          CustomButton(
              onPress: () {}, buttonName: StringsManager.signupButtonName),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
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
    );
  }
}
