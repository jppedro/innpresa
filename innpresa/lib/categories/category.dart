import 'package:flutter/material.dart';

class Category {
  final int categoryId;
  final String name;
  final IconData icon;

  Category({this.categoryId, this.name, this.icon});
}

final allCategory = Category(
  categoryId: 0,
  name: "Todos",
  icon: Icons.event_note_rounded,
);

final userCategory = Category(
  categoryId: 1,
  name: "Seus \nEventos",
  icon: Icons.person_sharp,
);

final categories = [allCategory, userCategory];
