import 'package:flutter/material.dart';
import '../../utils/colors.dart'; // adjust the relative path if needed

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.accentColor,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: Material(
            elevation: 3,
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
                title: const Text('Notification'),
                backgroundColor: Colors.transparent,
                foregroundColor: Colors.black,
                elevation: 0,
              ),
            ),
          ),
        ),

        body: Center(
          child: Text('No notifications yet', style: TextStyle(fontSize: 18)),
        ),
      ),
    );
  }
}
