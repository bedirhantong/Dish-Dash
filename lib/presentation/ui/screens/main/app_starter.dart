import 'package:dish_dash/core/constants/app/image_strings.dart';
import 'package:flutter/material.dart';

import 'main_bottom_nav.dart';

class FoodAppHome extends StatelessWidget {
  const FoodAppHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Dish Dash".toUpperCase(),
          style: const TextStyle(
            color: Colors.deepPurple,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        actions: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.black12,
              borderRadius:
                  BorderRadius.circular(10.0), // Adjust the radius as needed
            ),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.notifications_none_outlined,
              ),
            ),
          ),
          const SizedBox(
            width: 5,
          )
        ],
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(5),
            bottomLeft: Radius.circular(5),
          ),
        ),
        centerTitle: true,
        elevation: 20,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          carouselArea(),
          Padding(
            padding: const EdgeInsets.only(
                right: 16.0, left: 16.0, bottom: 20, top: 5),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: const Icon(
                  Icons.search,
                  color: Color(0xff4338CA),
                ),
                filled: true,
                fillColor: Colors.white38,
                contentPadding: const EdgeInsets.all(15),
                hintText: 'Search',
                hintStyle: const TextStyle(color: Colors.grey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.only(right: 20, left: 20, bottom: 20),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemCount: categoriesList.length,
              itemBuilder: (context, index) => CategoryCard(
                categoryMain: categoriesList[index],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget carouselArea() {
    return SizedBox(
      width: double.maxFinite,
      height: 200,
      child: PageView.builder(
        pageSnapping: true,
        itemCount: 4,
        allowImplicitScrolling: true,
        itemBuilder: (context, index) {
          return carouselCard(categoriesList[index].imagePath,
              "${index + 1}/${categoriesList.length}");
        },
      ),
    );
  }

  Widget carouselCard(String image, String w) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [],
        ),
        child: InkWell(
          onTap: () {},
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey,
                width: 2.5,
              ),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Stack(
              children: [
                Center(
                  child: Image.network(
                    image,
                    fit: BoxFit.cover,
                    alignment: Alignment.center,
                  ),
                ),
                Positioned(
                  bottom: 5,
                  right: 5,
                  child: Container(
                    width: 35,
                    height: 30,
                    decoration: BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.circular(
                        5.0,
                      ), // Adjust the radius as needed
                    ),
                    child: Center(
                      child: Text(w),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
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
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
            image: NetworkImage(categoryMain.imagePath),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.black.withOpacity(0.2),
          ),
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
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
                style: ElevatedButton.styleFrom(
                  primary: Colors.black38,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  fixedSize: const Size(180, 50),
                ),
                child: Text(
                  categoryMain.categoryName,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
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
  final String categoryName;
  final String imagePath;
  final int index;

  const Categories({
    required this.index,
    required this.categoryName,
    required this.imagePath,
  });
}

List<Categories> categoriesList = [
  Categories(
      index: 5, categoryName: 'Meal', imagePath: ImageStrings.mealCategory),
  Categories(
      index: 1,
      categoryName: 'Clothes',
      imagePath: ImageStrings.clotheCategory),
  Categories(
      index: 2,
      categoryName: 'Technology',
      imagePath: ImageStrings.techCategory),
  Categories(
      index: 3,
      categoryName: 'Education',
      imagePath: ImageStrings.educationCategory),
];
