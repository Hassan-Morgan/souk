import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:soukapp/app/controller/auth_controller.dart';
import 'package:soukapp/app/resources_manager/icon_manager.dart';
import 'package:soukapp/view/custom_widgets/custom_button.dart';
import 'package:soukapp/view/custom_widgets/custom_text_form_feild.dart';

class ResetPassword extends StatelessWidget {
  ResetPassword({Key? key}) : super(key: key);

  final TextEditingController codeController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
        init: AuthController(),
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(),
            body: Form(
              key: formKey,
              child: Center(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomTextFormField(
                        labelText: 'code',
                        isSecure: false,
                        validation: (value) {
                          if (value.isEmpty) {
                            return 'you should enter the code sent to your email';
                          }
                          return null;
                        },
                        prefixIcon: IconManger.codeIcon,
                        keyType: TextInputType.number,
                        textController: codeController,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomTextFormField(
                        labelText: 'New Password',
                        isSecure: true,
                        validation: (value) {
                          if (value.isEmpty) {
                            return 'password can\'t be empty';
                          } else if (value.length < 8) {
                            return 'password can\'t be less than 8 characters';
                          }
                          return null;
                        },
                        prefixIcon: IconManger.loginPasswordFieldIcon,
                        keyType: TextInputType.visiblePassword,
                        textController: newPasswordController,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      CustomButton(
                        onPress: () {},
                        buttonName: 'Send Code',
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
