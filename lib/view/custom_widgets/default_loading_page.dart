import 'package:flutter/material.dart';
import 'package:soukapp/app/resources_manager/assets_manager.dart';
import 'package:soukapp/app/resources_manager/color_manager.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorManager.primaryColor.withOpacity(0.8),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child:  Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:  [
            const CircularProgressIndicator(
              color: ColorManager.whiteColor,
            ),
            const SizedBox(height: 20,),
            Image.asset(AssetsManager.whiteAppIcon,width: 200,),
          ],
        ),
      ),
    );
  }
}
