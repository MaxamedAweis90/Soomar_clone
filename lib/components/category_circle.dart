// lib/components/category/category_circle.dart
import 'package:flutter/material.dart';
import '../../utils/colors.dart';

class CategoryCircle extends StatelessWidget {
  final String label;
  final String imageUrl; // Network image URL
  final VoidCallback onTap;

  const CategoryCircle({
    super.key,
    required this.label,
    required this.imageUrl,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.accentColor,
              border: Border.all(width: 0.8, color: Colors.black26),
            ),
            child: ClipOval(
              child: Image.asset(
                imageUrl,
                width: 40,
                height: 40,
                fit: BoxFit.cover,
                errorBuilder:
                    (context, error, stackTrace) =>
                        const Icon(Icons.image_not_supported),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
