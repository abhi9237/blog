import 'dart:developer';

import 'package:blog/core/extension/app_extension.dart';
import 'package:flutter/material.dart';

class UploadBlogCategoriesWidget extends StatelessWidget {
  final Function(String)? onTap;
  final List categories;
  final List selectedCategories;
  const UploadBlogCategoriesWidget({
    super.key,
    required this.categories,
    required this.selectedCategories,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    log('selectedCategories${selectedCategories.length}');
    return Wrap(
      spacing: 8.0,
      runSpacing: 10.0,
      children: categories.map((category) {
        return InkWell(
          onTap: () {
            onTap != null ? onTap!(category) : null;
          },
          borderRadius: BorderRadius.circular(20),
          child: _buildCategoryChip(category,isSelected: selectedCategories.contains(category)),
        );
      }).toList(),
    );
  }
}

Widget _buildCategoryChip(String label, {bool isSelected = false}) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    decoration: BoxDecoration(
      color: isSelected ? Colors.blue : Colors.grey[200],
      borderRadius: BorderRadius.circular(20),
      border: Border.all(color: isSelected ? Colors.blue : Colors.grey[400]!),
    ),
    child: Text(
      label.capitalizeFirstLetter(),
      style: TextStyle(
        color: isSelected ? Colors.white : Colors.black87,
        fontWeight: FontWeight.w500,
      ),
    ),
  );
}
