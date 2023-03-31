import 'package:flutter/material.dart';
import 'package:health1/yoga/intro.dart';

class CategoryCard extends StatelessWidget {
  final icon;
  final String categoryName;

  CategoryCard({
    required this.icon,
    required this.categoryName,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0),
      child: InkWell(
        child: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Color.fromARGB(34, 152, 152, 250),
          ),
          child: Row(
            children: [
              Image.asset(
                icon,
                height: 60,
              ),
              SizedBox(
                width: 12,
              ),
              Text(categoryName),
            ],
          ),
        ),
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => const Yoga()));
        },
      ),
    );
  }
}
