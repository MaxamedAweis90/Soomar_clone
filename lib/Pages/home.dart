import 'package:flutter/material.dart';
import 'package:soomar_clone/Pages/screens/search.dart';
import '../../utils/colors.dart';
import 'package:soomar_clone/components/buttons/custom_cricle_button.dart';
import 'package:soomar_clone/Pages/screens/cart_page.dart';
import 'package:soomar_clone/Pages/screens/notifications_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.accentColor,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top Bar: Logo, Title and Action Buttons
              Container(
                color: AppColors.secondaryColor,
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 10,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Top Row: Logo and Icons
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            // Logo Image (safe load)
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

                            const SizedBox(width: 8),
                          ],
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

                    // Search Bar Row
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
                          border: Border.all(
                            color: Colors.white24,
                          ), // Optional border for visibility
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
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

              // Categories Section
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      'Categories',
                      style: TextStyle(
                        color: AppColors.accentColor,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'View All',
                      style: TextStyle(
                        color: AppColors.accentColor,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: GridView.count(
                  crossAxisCount: 4,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  children: List.generate(8, (index) {
                    return Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.secondaryColor,
                          ),
                          padding: const EdgeInsets.all(12),
                          child: Icon(
                            Icons.category,
                            color: AppColors.accentColor,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Cat ${index + 1}',
                          style: const TextStyle(color: AppColors.accentColor),
                        ),
                      ],
                    );
                  }),
                ),
              ),

              const SizedBox(height: 20),

              // Hot Deals Section
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      'Hot Deals',
                      style: TextStyle(
                        color: AppColors.accentColor,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'View All',
                      style: TextStyle(
                        color: AppColors.accentColor,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
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
