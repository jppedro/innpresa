import 'package:flutter/material.dart';
import 'package:innpresa/categories/category.dart';
import 'package:innpresa/style/styleguide.dart';
import 'package:provider/provider.dart';

import '../app_state.dart';

class CategoryWidget extends StatefulWidget {
  final Category category;

  const CategoryWidget({Key key, this.category}) : super(key: key);
  @override
  _CategoryWidgetState createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> {
  @override
  Widget build(BuildContext context) {
    //final appState = Provider.of<AppState>(context);
    var isSelected = false;

    return GestureDetector(
      onTap: () {
        setState(() {
          isSelected = true;
        });
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8),
        width: 95,
        height: 95,
        decoration: BoxDecoration(
          border: Border.all(
              color: isSelected ? Colors.white : Color(0x99FFFFFF), width: 3),
          borderRadius: BorderRadius.all(Radius.circular(16)),
          color: isSelected ? Colors.white : Colors.transparent,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              this.widget.category.icon,
              color: isSelected ? Theme.of(context).primaryColor : Colors.white,
              size: 40,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              this.widget.category.name,
              style: isSelected ? selectedCategoryTextStyle : categoryTextStyle,
            )
          ],
        ),
      ),
    );
  }
}
