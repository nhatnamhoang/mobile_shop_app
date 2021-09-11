import 'package:flutter/material.dart';
import 'package:mobile_shop_app/@share/widget/stateful/product_item.dart';

class GridProduct extends StatefulWidget {
  GridProduct({Key? key}) : super(key: key);

  @override
  _GridProductState createState() => _GridProductState();
}

class _GridProductState extends State<GridProduct> {
  @override
  Widget build(BuildContext context) {
    var _crossAxisSpacing = 8;
    var _screenWidth = MediaQuery.of(context).size.width;
    var _crossAxisCount = 2;
    var _width = (_screenWidth - ((_crossAxisCount - 1) * _crossAxisSpacing)) /
        _crossAxisCount;
    var cellHeight = 300;
    var _aspectRatio = _width / cellHeight;
    return Container(
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisSpacing: 15.0,
            mainAxisSpacing: 15.0,
            crossAxisCount: _crossAxisCount,
            childAspectRatio: _aspectRatio),
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: 6,
        itemBuilder: (context, index) => ProductItem(),
      ),
    );
  }
}
