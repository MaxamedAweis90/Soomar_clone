import 'package:flutter/material.dart';
import 'package:soomar_clone/Pages/screens/search.dart';
import 'package:soomar_clone/colors.dart';
import 'package:card_swiper/card_swiper.dart';

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
              // Section 1: QR button, search bar, and shopping cart icon
              Container(
                color: AppColors.secondaryColor, // Set background color
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
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
                              readOnly:
                                  true, // Makes the TextField non-editable
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SearchPage(),
                                  ),
                                );
                              },
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
                      SizedBox(height: 5),
                      Text(
                        'Welcome to Soomar!',
                        style: const TextStyle(
                          color: AppColors.accentColor,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 15),

              // Section 2: Sliding cards with Swiper
              SizedBox(
                height: 200,
                child: Swiper(
                  itemCount: 5,
                  autoplay: true,
                  autoplayDelay: 2000,
                  loop: true,
                  scale: 0.9,
                  viewportFraction: 0.8,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 1),
                      decoration: BoxDecoration(
                        color: AppColors.secondaryColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          'Card ${index + 1}',
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    );
                  },
                ),
              ),

              // Section 3: Categories (3x3 grid)
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemCount: 9,
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        color: AppColors.secondaryColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          'Category ${index + 1}',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),

        bottomNavigationBar: BottomNavigationBar(
          currentIndex: 0, // Home is active
          onTap: (index) {
            // Handle navigation
          },
          type: BottomNavigationBarType.fixed, // Ensures all items fit
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
              icon: Icon(Icons.history),
              label: 'History',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.support),
              label: 'Support',
            ),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          ],
        ),
      ),
    );
  }
}
