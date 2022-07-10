import 'package:flutter/material.dart';
import 'package:food_delivery/screens/home/main_page_body.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:food_delivery/widgets/small_text.dart';

import '../../utils/colors.dart';

class MainHomePage extends StatefulWidget {
  const MainHomePage({Key? key}) : super(key: key);

  @override
  _MainHomePageState createState() => _MainHomePageState();
}

class _MainHomePageState extends State<MainHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            child: Container(
              padding: EdgeInsets.only(left: Dimensions.width20,right: Dimensions.width20),
              margin:  EdgeInsets.only(top: Dimensions.height45,bottom: Dimensions.height15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BigText(text: "India",color: AppColors.mainColor,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SmallText(text: "Ujjain",color: Colors.black54,),
                          Icon(Icons.arrow_drop_down_rounded)
                        ],
                      )
                    ],
                  ),
                  Container(
                    width: 45,
                    height: 45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: AppColors.mainColor,
                    ),
                    child:  Icon(Icons.search,color: Colors.white,size: Dimensions.icon24),
                  )
                ],
              ),
            ),
          ),
          Expanded(child: SingleChildScrollView(
            child: MainPageBody(),
          )),
        ],
      ),
    );
  }
}
