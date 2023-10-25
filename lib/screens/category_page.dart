import 'package:flutter/material.dart';
import 'package:store_app/services/all_categories_service.dart';
int selectedIndex = 0;
List  categories = [
  "electronics",
  "jewelery",
  "men's clothing",
  "women's clothing"
];

class Category extends StatefulWidget {
  const Category({Key? key}) : super(key: key);
  static String id = 'Category';

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  //int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: AllCategroiesService().getAllCategroies(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
             categories = snapshot.data!;
            return Padding(
              padding: const EdgeInsets.only(
                  right: 20, left: 20, bottom: 10),
              child: SizedBox(
                height: 50,
                child: ListView.separated(
                  itemCount: categories.length,
                  clipBehavior: Clip.none,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10 , vertical: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              categories[index],
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: selectedIndex == index
                                      ? Colors.black
                                      : Colors.grey[600]),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 5),
                              height: 2,
                              width: 55,
                              color: selectedIndex == index
                                  ? Colors.black
                                  : Colors.transparent,
                            )
                          ],
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) =>
                      const SizedBox(
                    width: 20,
                  ),
                ),
              ),
            );
          } else {
            return const Padding(
              padding: EdgeInsets.all(8.0),
              child: Center(
                  child: CircularProgressIndicator(
                color: Colors.black26,
              )),
            );
          }
        });
    Container(
      height: 2,
      width: 30,
      color: Colors.black,
    );
  }
}
