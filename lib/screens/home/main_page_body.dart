import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:food_delivery/widgets/icon_and_text_widget.dart';
import 'package:food_delivery/widgets/rating_and_details.dart';
import 'package:food_delivery/widgets/small_text.dart';

//Packages
import 'package:dots_indicator/dots_indicator.dart';

class MainPageBody extends StatefulWidget {
  const MainPageBody({Key? key}) : super(key: key);

  @override
  _MainPageBodyState createState() => _MainPageBodyState();
}

class _MainPageBodyState extends State<MainPageBody> {
  final PageController _pageController = PageController(viewportFraction: 0.85);
  var _currPage = 0.0;
  final double _scaleFactor = 0.8;
  final double _height = Dimensions.pageViewController;
  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _currPage = _pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //SLIDER SECTION
        Container(
          // color: Colors.red,
          height: Dimensions.pageView,
          child: PageView.builder(
            controller: _pageController,
            itemBuilder: (context, index) {
              return _buildPageItem(index);
            },
          ),
        ),
        //INDICATOR SECTION
        DotsIndicator(
          dotsCount: 5,
          position: _currPage,
          decorator: DotsDecorator(
            size: const Size.square(9.0),
            activeSize: const Size(18.0, 9.0),
            activeColor: AppColors.mainColor,
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)),
          ),
        ),
        //  POPULAR  FOOD TEXT
        SizedBox(
          height: Dimensions.height30,
        ),
        Container(
          margin: EdgeInsets.only(left: Dimensions.width30),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              BigText(text: "Popular"),
              SizedBox(
                width: Dimensions.width10,
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 3),
                child: BigText(
                  text: ".",
                  color: Colors.black26,
                ),
              ),
              SizedBox(width: Dimensions.width10),
              Container(
                margin: const EdgeInsets.only(bottom: 2),
                child: SmallText(text: "Food pairing"),
              )
            ],
          ),
        ),
        //  LIST OF FOODS
        //TODO: Remove Container and set shrinkwrap to true
        Container(
          height: 700,
          child: ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            // shrinkWrap: true,
            itemBuilder: (context, index) {
              return _foodImageCard(index);
            },
          ),
        )
      ],
    );
  }

//  Separate Card for items
  Widget _buildPageItem(int index) {
    //Handling Zooming-In/Out
    Matrix4 matrix = new Matrix4.identity();
    if (index == _currPage.floor()) {
      var currScale = 1 - (_currPage - index) * (1 - _scaleFactor);
      var currTranslation = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTranslation, 0);
    } else if (index == _currPage.floor() + 1) {
      var currScale =
          _scaleFactor + (_currPage - index + 1) * (1 - _scaleFactor);
      var currTranslation = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTranslation, 0);
    } else if (index == _currPage.floor() - 1) {
      var currScale = 1 - (_currPage - index) * (1 - _scaleFactor);
      var currTranslation = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTranslation, 0);
    } else {
      var currScale = 0.8;
      var currTranslation = _height * (1 - _scaleFactor) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTranslation, 0);
    }
    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          Container(
            height: Dimensions.pageViewController,
            margin: EdgeInsets.only(
                left: Dimensions.width10, right: Dimensions.width10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius30),
                color: index.isEven ? Color(0xFF69c5df) : Color(0xFF9294cc),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/image/food0.png"))),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: Dimensions.pageViewTextController,
              margin: EdgeInsets.only(
                  left: Dimensions.width30,
                  right: Dimensions.width30,
                  bottom: Dimensions.height30),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius20),
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                        color: Color(0xFFe8e8e8),
                        blurRadius: 5.0,
                        offset: Offset(0, 5)),
                    BoxShadow(color: Colors.white, offset: Offset(-5, 0)),
                    BoxShadow(color: Colors.white, offset: Offset(5, 0)),
                  ]),
              child: Container(
                padding: EdgeInsets.only(
                    left: Dimensions.width15,
                    right: Dimensions.width15,
                    top: Dimensions.height15),
                child: RatingAndDetails(name: "Food Title"),
              ),
            ),
          )
        ],
      ),
    );
  }
}

//FOOD LIST CARD
Widget _foodImageCard(int index) {
  return Container(
    margin:
        EdgeInsets.only(left: Dimensions.width20, right: Dimensions.width20),
    child: Row(
      children: [
        Container(
          width: 120,
          height: 120,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.radius20),
              color: Colors.white38,
              image:
                  DecorationImage(image: AssetImage("assets/image/food0.png"))),
        ),
        Expanded(
          child: Container(
            height: Dimensions.listViewTextContSize,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(Dimensions.radius20),
                    bottomRight: Radius.circular(Dimensions.radius20)),
                color: Colors.white),
            child: Padding(
              padding: EdgeInsets.only(
                  left: Dimensions.width10, right: Dimensions.width10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BigText(text: "Nutritious fruit meal in India"),
                  SizedBox(height: Dimensions.height10),
                  SmallText(text: "With Indian Characteristics"),
                  SizedBox(height: Dimensions.height10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconAndTextWidget(
                          icon: Icons.circle,
                          text: "Normal",
                          iconColor: AppColors.iconColor1),
                      IconAndTextWidget(
                          icon: Icons.location_on,
                          text: "2.3km",
                          iconColor: AppColors.mainColor),
                      IconAndTextWidget(
                          icon: Icons.access_time_rounded,
                          text: "30min",
                          iconColor: AppColors.iconColor2)
                    ],
                  )
                ],
              ),
            ),
          ),
        )
      ],
    ),
  );
}
