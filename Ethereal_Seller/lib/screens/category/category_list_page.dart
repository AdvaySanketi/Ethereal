import 'package:ethereal_seller/app_properties.dart';
import 'package:ethereal_seller/models/category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'components/staggered_category_card.dart';

class CategoryListPage extends StatefulWidget {
  @override
  _CategoryListPageState createState() => _CategoryListPageState();
}

class _CategoryListPageState extends State<CategoryListPage> {
  List<Category> categories = [
    Category(
      Color(0xffFCE183),
      Color(0xffF68D7F),
      'Best Selling \nProduct',
      'assets/basket.png',
    ),
    Category(
      Color(0xff36E892),
      Color(0xff33B2B9),
      'Total Money \nEarned',
      'assets/basket.png',
    ),
    Category(
      Color(0xff00E9DA),
      Color(0xff5189EA),
      'Highest Profit \nProduct',
      'assets/basket.png',
    ),
    Category(
      Color(0xffF123C4),
      Color(0xff668CEA),
      'Highest Rated \nProduct',
      'assets/basket.png',
    ),
    Category(
      Color(0xffF749A2),
      Color(0xffFF7375),
      'Highest Profit \nMonth',
      'assets/basket.png',
    ),
    Category(
      Color(0xffAF2D68),
      Color(0xff632376),
      'Views',
      'assets/basket.png',
    ),
  ];

  List<Category> searchResults = [];
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    searchResults = categories;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Color(0xffF9F9F9),
      child: Container(
        margin: const EdgeInsets.only(top: kToolbarHeight),
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Align(
              alignment: Alignment(-1, 0),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 10.0),
                child: Text(
                  'Analytics',
                  style: TextStyle(
                    color: darkGrey,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Flexible(
              child: ListView.builder(
                itemCount: searchResults.length,
                itemBuilder: (_, index) => Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 16.0,
                  ),
                  child: StaggeredCardCard(
                    begin: searchResults[index].begin,
                    end: searchResults[index].end,
                    categoryName: searchResults[index].category,
                    assetPath: searchResults[index].image,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
