import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:soukapp/app/controller/auth_controller.dart';
import 'package:soukapp/app/resources_manager/assets_manager.dart';
import 'package:soukapp/app/resources_manager/color_manager.dart';
import 'package:soukapp/app/resources_manager/strings_manager.dart';
import 'package:soukapp/view/custom_widgets/default_loading_page.dart';
import 'package:soukapp/view/user_auth/signup_page/shared_parts/signup_fields.dart';

class LargeSignUpPage extends StatelessWidget {
  const LargeSignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GetBuilder<AuthController>(
          init: AuthController(),
          builder: (controller) => Stack(
            children: [
              Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.3,
                    height: MediaQuery.of(context).size.height,
                    padding: const EdgeInsets.all(30),
                    color: ColorManager.primaryColor,
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Image.asset(
                            AssetsManager.whiteAppIcon,
                            width: 300,
                            height: 150,
                          ),
                          const SizedBox(height: 20),
                          Text(
                            StringsManager.loginWithSocial,
                            style: Theme.of(context).textTheme.headline3,
                          ),
                          const SizedBox(height: 40),
                          socialMediaButton(
                              context: context,
                              color: ColorManager.blueFacebookColor,
                              logo: AssetsManager.facebookLogo,
                              text: StringsManager.facebookLogin),
                          const SizedBox(height: 20),
                          socialMediaButton(
                              context: context,
                              color: ColorManager.blueTwitterColor,
                              logo: AssetsManager.twitterLogo,
                              text: StringsManager.twitterLogin),
                          const SizedBox(height: 20),
                          socialMediaButton(
                              context: context,
                              color: ColorManager.redGoogleColor,
                              logo: AssetsManager.googleLogo,
                              text: StringsManager.googleLogin),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.7,
                    height: MediaQuery.of(context).size.height,
                    padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.1),
                    child: Center(
                      child: SingleChildScrollView(
                        child: SignupPart(),
                      ),
                    ),
                  ),
                ],
              ),
              if (controller.loading)
               const LoadingPage(),
            ],
          ),
        ),
      ),
    );
  }
}

Widget socialMediaButton(
    {required context, required color, required logo, required text}) {
  return MaterialButton(
    color: color,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
    onPressed: () {},
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Image.asset(
          logo,
          width: 50,
          height: 50,
        ),
        Expanded(
          child: Center(
            child: Text(
              text,
              maxLines: 1,
              overflow: TextOverflow.clip,
              style: Theme.of(context).textTheme.button,
            ),
          ),
        ),
      ],
    ),
  );
}
