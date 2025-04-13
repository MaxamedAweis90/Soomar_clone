import 'package:flutter/material.dart';
import 'package:soomar_clone/colors.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.accentColor,
        appBar: AppBar(
          title: const Text('Search'),
          backgroundColor: AppColors.accentColor,
        ),
        body: Column(
          children: [
            Container(
              color: AppColors.secondaryColor,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    IconButton(
                      icon: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.accentColor,
                        ),
                        padding: const EdgeInsets.all(15.0),
                        child: Icon(
                          Icons.qr_code,
                          color: AppColors.secondaryColor,
                        ),
                      ),
                      onPressed: () {
                        // Add QR code action
                      },
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: TextField(
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 20,
                          ),
                          filled: true,
                          fillColor: AppColors.accentColor,
                          hintText: 'SEARCH PRODUCTS',
                          hintStyle: TextStyle(
                            color: AppColors.secondaryColor,
                            fontSize: 16,
                            shadows: [], // Removed text dropshadow
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    IconButton(
                      icon: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.accentColor,
                        ),
                        padding: const EdgeInsets.all(15.0),
                        child: const Icon(
                          Icons.shopping_cart,
                          color: AppColors.secondaryColor,
                        ),
                      ),
                      onPressed: () {
                        // Add shopping cart action
                      },
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.all(10.0),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: 40, // Example product count
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      // Add product click action
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.secondaryColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.image,
                            size: 50,
                            color: AppColors.mainColor,
                          ),
                          const SizedBox(height: 5),
                          Text(
                            'Product ${index + 1}',
                            style: TextStyle(
                              color: AppColors.mainColor,
                              fontSize: 14,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
