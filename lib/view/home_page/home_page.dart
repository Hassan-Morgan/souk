import 'package:flutter/cupertino.dart';
import 'package:soukapp/view/app_layout/small_app_layout.dart';
import 'package:soukapp/view/home_page/large_home_page.dart';
import 'package:soukapp/view/home_page/small_home_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constrains) {
      return constrains.maxWidth < 500
          ? const AppLayout()
          : const LargeHomePage();
    });
  }
}
