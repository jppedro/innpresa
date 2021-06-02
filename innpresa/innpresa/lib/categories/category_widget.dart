import 'package:flutter/material.dart';
import 'package:innpresa/categories/category.dart';
import 'package:innpresa/style/styleguide.dart';

class CategoryWidget extends StatefulWidget {
  final Category category;
  final bool isSelected;

  const CategoryWidget({Key key, this.category, this.isSelected})
      : super(key: key);
  @override
  _CategoryWidgetState createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8),
      width: 95,
      height: 95,
      decoration: BoxDecoration(
        border: Border.all(
            color: widget.isSelected ? Colors.white : Color(0x99FFFFFF),
            width: 3),
        borderRadius: BorderRadius.all(Radius.circular(16)),
        color: widget.isSelected ? Colors.white : Colors.transparent,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            this.widget.category.icon,
            color: widget.isSelected
                ? Color.fromRGBO(143, 148, 251, 1)
                : Colors.white,
            size: 40,
          ),
          SizedBox(
            height: 10,
          ),
          Center(
            child: Text(
              this.widget.category.name,
              style: widget.isSelected
                  ? selectedCategoryTextStyle
                  : categoryTextStyle,
            ),
          )
        ],
      ),
    );
  }
}
