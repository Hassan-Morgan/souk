import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:soukapp/view/seller_screens/add_product/large_add_product.dart';
import 'package:soukapp/view/seller_screens/add_product/small_add_product.dart';

class AddProduct extends StatelessWidget {
  const AddProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if(kIsWeb){
      return const LargeAddProduct();
    }else{
      return  const SmallAddProduct();
    }
  }
}
