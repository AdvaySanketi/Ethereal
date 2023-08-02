import 'package:ethereal_seller/app_properties.dart';
import 'package:ethereal_seller/models/product.dart';
import 'package:ethereal_seller/screens/product/components/color_list.dart';
import 'package:ethereal_seller/screens/product/components/shop_product.dart';
import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

class ShopItemList extends StatefulWidget {
  final Product product;
  final VoidCallback onRemove;

  ShopItemList(this.product, {required this.onRemove});

  @override
  _ShopItemListState createState() => _ShopItemListState();
}

class _ShopItemListState extends State<ShopItemList> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      height: 130,
      child: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment(0, 0.8),
            child: Container(
              height: 100,
              margin: EdgeInsets.symmetric(horizontal: 16.0),
              decoration: BoxDecoration(
                color: Colors.transparent,
                boxShadow: shadow,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(top: 12.0, right: 2.0, left: 20.0),
                    width: 200,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          widget.product.name,
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                            color: Colors.black,
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                            width: 160,
                            padding: const EdgeInsets.only(
                              left: 50.0,
                              top: 8.0,
                              bottom: 8.0,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                ColorOption(Colors.transparent),
                                Text(
                                  '\₹${widget.product.price}',
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    color: darkGrey,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Theme(
                    data: ThemeData(
                      textTheme: TextTheme(
                        titleLarge: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 14,
                            color: Colors.transparent,
                            fontWeight: FontWeight.bold),
                        bodyLarge: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 12,
                          color: Colors.grey[400],
                        ),
                      ),
                      colorScheme: ColorScheme.fromSwatch()
                          .copyWith(secondary: Colors.white),
                    ),
                    child: NumberPicker(
                      value: quantity,
                      minValue: 1,
                      maxValue: 10,
                      onChanged: (value) {
                        setState(() {
                          quantity = value;
                        });
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
          Positioned(
            top: 5,
            child: ShopProductDisplay(
              widget.product,
              onPressed: widget.onRemove,
            ),
          ),
        ],
      ),
    );
  }
}
