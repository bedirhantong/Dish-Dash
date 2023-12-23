import 'package:dish_dash/core/constants/app/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'main_bottom_nav.dart';

class FoodAppHome extends StatelessWidget {
  const FoodAppHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Dish Dash".toUpperCase(),
          style: kMainHead.copyWith(
            color: Colors.deepPurple,
            fontWeight: kBoldFontWeight,
            fontSize: 24,
          ),
        ),
        centerTitle: true,
        elevation: 20,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin:
                const EdgeInsets.only(bottom: 20, top: 10, right: 10, left: 10),
            decoration: BoxDecoration(
                color: Colors.blueGrey.shade100,
                borderRadius: BorderRadius.circular(kFullRadius)),
            child: Center(
              child: TextFormField(
                autofocus: false,
                cursorHeight: 15,
                cursorColor: Colors.white,
                decoration: const InputDecoration(
                  prefixIcon: Icon(
                    Icons.search,
                    color: Color(0xff4338CA),
                  ),
                  filled: true,
                  fillColor: Colors.white38,
                  contentPadding: EdgeInsets.all(15),
                  hintText: 'Search',
                  hintStyle: TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(15.0),
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white, width: 1.0),
                    borderRadius: BorderRadius.all(
                      Radius.circular(15.0),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white, width: 2.0),
                    borderRadius: BorderRadius.all(
                      Radius.circular(15.0),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: GridView.custom(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              gridDelegate: SliverWovenGridDelegate.count(
                crossAxisCount: 2,
                mainAxisSpacing: 1,
                crossAxisSpacing: 2,
                pattern: [
                  const WovenGridTile(1),
                  const WovenGridTile(5 / 7,
                      crossAxisRatio: 0.9,
                      alignment: AlignmentDirectional.centerEnd),
                ],
              ),
              childrenDelegate: SliverChildBuilderDelegate(
                  (context, index) => CategoryCard(
                        categoryMain: citiesList[index],
                      ),
                  childCount: citiesList.length),
            ),
          ),
          const CustomWaveShape()
        ],
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final Categories categoryMain;
  const CategoryCard({
    Key? key,
    required this.categoryMain,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Hero(
        tag: categoryMain.imagePath,
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                categoryMain.imagePath,
              ),
              fit: BoxFit.scaleDown,
            ),
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Stack(
            children: [
              Positioned(
                left: 5,
                bottom: 10,
                child: Text(
                  categoryMain.categoryName,
                  style: kCityStyle.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 14),
                ),
              ),
              Positioned(
                right: 5,
                bottom: 5,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.deepPurple,
                  ),
                  height: 40,
                  width: 40,
                  child: Center(
                    child: IconButton(
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BottomNavMain(
                              initIndex: categoryMain.index,
                            ),
                          ),
                          (route) => false,
                        );
                      },
                      icon: const Icon(
                        Icons.chevron_right_outlined,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Categories {
  String categoryName;
  String imagePath;
  int index;
  Categories({
    required this.index,
    required this.categoryName,
    required this.imagePath,
  });
}

Categories meal = Categories(
  categoryName: 'Meal',
  imagePath: ImageStrings.mealCategory,
  index: 5,
);
Categories clothes = Categories(
  categoryName: 'Clothes',
  imagePath: ImageStrings.marketCategory,
  index: 1,
);

Categories tech = Categories(
  categoryName: 'Technology',
  imagePath: ImageStrings.techCategory,
  index: 2,
);
Categories education = Categories(
  categoryName: 'Education',
  imagePath: ImageStrings.educationCategory,
  index: 3,
);

List<Categories> citiesList = [meal, clothes, tech, education];

TextStyle get kLargeTextStyle => const TextStyle(fontSize: 55);
TextStyle get kLTextStyle => const TextStyle(fontSize: 24);
TextStyle get kExtraVerySmallTextStyle => const TextStyle(fontSize: 6);
TextStyle get kInputStyle => const TextStyle(fontSize: 17);
TextStyle get kCityStyle => const TextStyle(fontSize: 20);
TextStyle get kPrizeStyleDevice => const TextStyle(fontSize: 15);
TextStyle get kTicketHead => const TextStyle(fontSize: 40);
TextStyle get kMainHead => const TextStyle(fontSize: 30);

const FontWeight kBoldFontWeight = FontWeight.bold;
const FontWeight kRegularFontWeight = FontWeight.normal;
const FontWeight kLightFontWeight = FontWeight.w400;
const FontWeight kThinFontWeight = FontWeight.w100;

List<BoxShadow> boxShadow = [
  BoxShadow(
    color: Colors.grey.withOpacity(0.3),
    spreadRadius: 2,
    blurRadius: 3,
    offset: const Offset(1, 3),
  )
];

class CustomWaveShape extends StatelessWidget {
  const CustomWaveShape({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(MediaQuery.sizeOf(context).width, 200),
      painter: CurvedPainter(),
    );
  }
}

class CurvedPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.deepPurple.shade50
      ..strokeWidth = 15;

    var path = Path();

    path.moveTo(0, size.height * 0.7);
    path.quadraticBezierTo(size.width * 0.25, size.height * 0.7,
        size.width * 0.5, size.height * 0.8);
    path.quadraticBezierTo(size.width * 0.75, size.height * 0.9,
        size.width * 1.0, size.height * 0.8);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

Color kWhiteBackground =
    const Color.fromARGB(255, 211, 208, 208).withOpacity(0.1);
const Color kWhitePrimary = Color(0xFFFFFFFF);
Color kWhiteOpacity = Colors.white.withOpacity(0.8);
const Color kBlack = Color.fromARGB(255, 3, 3, 3);
Color kGreyOutlined = Colors.grey.withOpacity(0.2);

const Color kGreyTextField = Color(0XFF7b7b7b);
const Color kGreyBackground = Color.fromARGB(255, 175, 173, 173);
const Color kPinkColor = Color(0XFFfb6e63);
const Color kRedColor = Colors.red;

double kContainerRadius = 24;
double kFullRadius = 20;
double kButtonRadius = 7;
double kSignoutButRadius = 10;
double kRadius = 40;
