import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:soukapp/app/controller/auth_controller.dart';
import 'package:soukapp/app/resources_manager/color_manager.dart';
import 'package:soukapp/app/resources_manager/icon_manager.dart';
import 'package:soukapp/view/custom_widgets/custom_button.dart';
import 'package:soukapp/view/custom_widgets/custom_text_form_feild.dart';
import 'package:soukapp/view/custom_widgets/default_loading_page.dart';

class SendEmail extends StatelessWidget {
  SendEmail({Key? key}) : super(key: key);

  final TextEditingController emailController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
        init: AuthController(),
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(),
            body: Stack(
              children: [
                Form(
                  key: formKey,
                  child: Center(
                    child: Container(
                      margin: EdgeInsets.all(MediaQuery.of(context).size.width*0.1),
                      padding: const EdgeInsets.all(30),
                      decoration: BoxDecoration(
                        border: Border.all(color: ColorManager.blackColor),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomTextFormField(
                            labelText: 'E-mail',
                            isSecure: false,
                            validation: (value) {
                              if (value.isEmpty) {
                                return 'E-mail can\'t be empty';
                              }
                              return null;
                            },
                            prefixIcon: IconManger.loginEmailFieldIcon,
                            keyType: TextInputType.emailAddress,
                            textController: emailController,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          CustomButton(
                            onPress: () {
                              if (formKey.currentState!.validate()) {
                                controller.sendResetPasswordCode(
                                    email: emailController.text);
                              }
                            },
                            buttonName: 'Send Code',
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                if (controller.loading)
                  const LoadingPage(),
              ],
            ),
          );
        });
  }
}
