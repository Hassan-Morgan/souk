import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:soukapp/view/home_page/shared_parts/home_body.dart';
import 'package:soukapp/view/home_page/shared_parts/home_header.dart';

class SmallHomePage extends StatelessWidget {
  const SmallHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0.0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            HomeHeader(),
            HomeBody(),
          ],
        ),
      ),
    );
  }
}
