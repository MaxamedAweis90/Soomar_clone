import 'package:flutter/material.dart';
import '../../utils/colors.dart';
import 'package:soomar_clone/components/buttons/custom_cricle_button.dart';
import 'package:soomar_clone/Pages/screens/cart_page.dart';
import 'package:soomar_clone/Pages/screens/notifications_page.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.accentColor,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: Material(
            elevation: 5,
            shadowColor: Colors.black45,
            child: Container(
              decoration: const BoxDecoration(
                color: AppColors.accentColor,
                border: Border(
                  bottom: BorderSide(
                    color: Color.fromARGB(255, 255, 255, 255),
                    width: 0,
                  ),
                ),
              ),
              child: AppBar(
                title: const Text('Search'),
                backgroundColor: Colors.transparent,
                foregroundColor: Colors.black,
                elevation: 0,
              ),
            ),
          ),
        ),
        body: CustomScrollView(
          slivers: [
            // 🔹 Static content as sliver
            SliverToBoxAdapter(
              child: Container(
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
            ),

            // 🔹 Product Grid inside a sliver
            SliverPadding(
              padding: const EdgeInsets.all(10),
              sliver: SliverGrid(
                delegate: SliverChildBuilderDelegate(
                  (context, index) => Container(
                    decoration: BoxDecoration(
                      color: AppColors.secondaryColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.image, size: 50, color: AppColors.mainColor),
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
                  childCount: 40,
                ),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 1,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
