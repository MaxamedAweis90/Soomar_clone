import 'package:flutter/material.dart';
import 'package:soomar_clone/Pages/screens/search.dart';
import 'package:soomar_clone/Pages/screens/cart_page.dart';
import 'package:soomar_clone/Pages/screens/notifications_page.dart';
import 'package:soomar_clone/utils/colors.dart';
import 'package:soomar_clone/components/buttons/custom_cricle_button.dart';
import 'package:soomar_clone/components/category_circle.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Categories with network image URLs
    final List<Map<String, String>> categories = [
      {'label': 'Internet', 'image': 'assets/images/wifi.png'},
      {'label': 'Electronic', 'image': 'assets/images/watch.png'},
      {'label': 'Home kitchen', 'image': 'assets/images/Kitchen.png'},
      {
        'label': 'Cosmatics',
        'image': 'https://cdn-icons-png.flaticon.com/512/3075/3075977.png',
      },
      {
        'label': 'Fashion',
        'image': 'https://cdn-icons-png.flaticon.com/512/135/135701.png',
      },
      {
        'label': 'Jirdhis',
        'image': 'https://cdn-icons-png.flaticon.com/512/1046/1046753.png',
      },
      {
        'label': 'Caruur',
        'image': 'https://cdn-icons-png.flaticon.com/512/947/947978.png',
      },
      {
        'label': 'Supplements',
        'image': 'https://cdn-icons-png.flaticon.com/512/1828/1828919.png',
      },
    ];

    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.accentColor,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top Bar
              Container(
                color: AppColors.secondaryColor,
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 10,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Logo and Icons
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          'assets/images/soomarlogo.png',
                          width: 150,
                          height: 70,
                          color: AppColors.accentColor,
                          errorBuilder: (context, error, stackTrace) {
                            return const Icon(
                              Icons.image_not_supported,
                              color: AppColors.accentColor,
                            );
                          },
                        ),
                        Row(
                          children: [
                            CustomCircularIconButton(
                              icon: Icons.notifications,
                              iconColor: AppColors.mainColor,
                              backgroundColor: Colors.white,
                              context: context,
                              navigateTo: const NotificationsPage(),
                            ),
                            const SizedBox(width: 8),
                            CustomCircularIconButton(
                              icon: Icons.shopping_cart,
                              iconColor: AppColors.mainColor,
                              backgroundColor: Colors.white,
                              context: context,
                              navigateTo: const CartPage(),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),

                    // Search Bar
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SearchPage(),
                          ),
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 12,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.accentColor,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.white24),
                        ),
                        child: Row(
                          children: const [
                            Icon(Icons.search, color: Colors.black45),
                            SizedBox(width: 8),
                            Text(
                              'Search Product here',
                              style: TextStyle(
                                color: Colors.black45,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // Categories Title
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      'Categories',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'View All',
                      style: TextStyle(
                        color: AppColors.secondaryColor,
                        fontSize: 20,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),

              // Categories Grid
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: GridView.count(
                  crossAxisCount: 4,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  children:
                      categories.map((category) {
                        return CategoryCircle(
                          label: category['label']!,
                          imageUrl: category['image']!,
                          onTap: () {
                            debugPrint('Tapped on ${category['label']}');
                          },
                        );
                      }).toList(),
                ),
              ),

              const SizedBox(height: 20),

              // Hot Deals Title
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      'Hot Deals',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'View All',
                      style: TextStyle(
                        color: AppColors.secondaryColor,
                        decoration: TextDecoration.underline,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),

              // Hot Deal Images
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(2, (index) {
                    return Expanded(
                      child: Container(
                        margin: EdgeInsets.only(
                          right: index == 0 ? 8 : 0,
                          left: index == 1 ? 8 : 0,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.secondaryColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            'https://via.placeholder.com/150',
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                color: Colors.grey,
                                alignment: Alignment.center,
                                child: const Icon(
                                  Icons.broken_image,
                                  color: Colors.white,
                                  size: 40,
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
