import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:soukapp/app/controller/auth_controller.dart';
import 'package:soukapp/app/resources_manager/assets_manager.dart';
import 'package:soukapp/app/resources_manager/color_manager.dart';
import 'package:soukapp/app/resources_manager/strings_manager.dart';

class SocialMediaLoginPart extends StatelessWidget {
  const SocialMediaLoginPart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
      init: AuthController(),
      builder: (controller) => Container(
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
                text: StringsManager.facebookLogin,
                onPress: () {
                  controller.webLoginWithFacebook();
                },
              ),
              const SizedBox(height: 20),
              socialMediaButton(
                context: context,
                color: ColorManager.redGoogleColor,
                logo: AssetsManager.googleLogo,
                text: StringsManager.googleLogin,
                onPress: () {
                  controller.webLoginWithGoogle();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget socialMediaButton(
    {required context,
    required color,
    required logo,
    required text,
    required onPress}) {
  return MaterialButton(
    color: color,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
    onPressed: onPress,
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
