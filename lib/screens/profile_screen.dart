import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:roadcell/providers/user_provider.dart';
import 'package:roadcell/utils/routes.dart';
import 'package:roadcell/widgets/bottom_nav_bar.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  static const navy = Color(0xff1f4566);
  static const deep = Color(0xff0b2d4a);
  static const bg = Color(0xfff5f8fb);
  static const grey = Color(0xff91a4b8);
  static const green = Color(0xff20a84a);
  static const red = Color(0xffdf3044);

  @override
  Widget build(BuildContext context) {
    return Consumer<UserProvider>(
      builder: (context, userProvider, child) {
        return Scaffold(
          backgroundColor: bg,
          bottomNavigationBar: bottomBar(context),
          body: SafeArea(
            bottom: false,
            child: Column(
              children: [
                header(userProvider),
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.fromLTRB(10, 12, 10, 85),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        sectionTitle("PERSONAL INFO"),
                        const SizedBox(height: 8),
                        infoCard([
                          row(
                            Icons.phone_android,
                            "MOBILE",
                            _getMaskedMobile(userProvider.mobile),
                          ),
                          row(
                            Icons.badge,
                            "DRIVING LICENCE",
                            userProvider.licenceNumber,
                          ),
                          row(
                            Icons.calendar_month,
                            "DATE OF BIRTH",
                            userProvider.dob,
                          ),
                          row(Icons.location_on, "STATE", "Maharashtra"),
                        ]),
                        const SizedBox(height: 12),
                        sectionTitle("MY STATS"),
                        const SizedBox(height: 8),
                        infoCard([
                          row(
                            Icons.confirmation_number,
                            "TOTAL PASSES",
                            "8 passes generated",
                          ),
                          row(
                            Icons.warning,
                            "VIOLATIONS REPORTED",
                            "2 reports",
                          ),
                          row(
                            Icons.directions_car,
                            "VEHICLES LINKED",
                            "2 vehicles",
                          ),
                        ]),
                        const SizedBox(height: 12),
                        sectionTitle("SETTINGS"),
                        const SizedBox(height: 8),
                        infoCard([
                          row(Icons.notifications, "NOTIFICATIONS", "Enabled"),
                          row(
                            Icons.lock,
                            "CHANGE PASSWORD",
                            "Last changed 30 days ago",
                          ),
                        ]),
                        const SizedBox(height: 25),
                        logoutButton(context, userProvider),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  String _getMaskedMobile(String mobile) {
    if (mobile.length > 5) {
      return "+91 " + mobile.substring(0, 5) + " XXXXX";
    }
    return "+91 XXXXX XXXXX";
  }

  Widget header(UserProvider userProvider) {
    String maskedMobile = _getMaskedMobile(userProvider.mobile);

    return Container(
      height: 200,
      width: double.infinity,
      color: navy,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 67,
              height: 67,
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: .12),
                shape: BoxShape.circle,
                border: Border.all(color: green, width: 2),
              ),
              child: const Icon(Icons.person, color: Colors.blueGrey, size: 36),
            ),
            const SizedBox(height: 10),
            Text(
              userProvider.fullName,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.w900,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              maskedMobile,
              style: const TextStyle(color: Color(0xff89a0b7), fontSize: 14),
            ),
            const SizedBox(height: 6),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 4),
              decoration: BoxDecoration(
                color: green.withOpacity(.15),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: green),
              ),
              child: const Text(
                "✓ Verified",
                style: TextStyle(
                  color: green,
                  fontSize: 14,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 1,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget sectionTitle(String text) {
    return Text(
      text,
      style: const TextStyle(
        color: Color(0xff98a9bc),
        fontSize: 16,
        letterSpacing: 4,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  Widget infoCard(List<Widget> children) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(11),
        border: Border.all(color: const Color(0xffd8e0e8)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.035),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(children: children),
    );
  }

  Widget row(IconData icon, String label, String value) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 11),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Color(0xffedf1f5), width: 1)),
      ),
      child: Row(
        children: [
          Icon(icon, size: 25, color: Colors.orangeAccent),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: const TextStyle(
                    color: grey,
                    fontSize: 13,
                    letterSpacing: 2,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  value,
                  style: const TextStyle(
                    color: Color(0xff1f2933),
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          const Icon(Icons.chevron_right, size: 17, color: Color(0xffb2bfcc)),
        ],
      ),
    );
  }

  Widget logoutButton(BuildContext context, UserProvider userProvider) {
    return GestureDetector(
      onTap: () {
        // Clear user data
        userProvider.clearUserData();
        // Navigate to login
        Navigator.pushNamedAndRemoveUntil(
          context,
          MyRoutes.loginRoute,
          (route) => false,
        );
      },
      child: Container(
        height: 45,
        decoration: BoxDecoration(
          color: const Color(0xfffff1f3),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: const Color(0xffffb8c2)),
        ),
        child: const Center(
          child: Text(
            "LOGOUT",
            style: TextStyle(
              color: red,
              fontSize: 18,
              fontWeight: FontWeight.w900,
              letterSpacing: 3,
            ),
          ),
        ),
      ),
    );
  }

  Widget bottomBar(BuildContext context) {
    return BottomNavBar(
      selectedIndex: 4, // Profile tab is active
      onTap: (index) => _navigateToTab(context, index),
    );
  }

  void _navigateToTab(BuildContext context, int index) {
    switch (index) {
      case 0:
        Navigator.pushReplacementNamed(context, MyRoutes.homeRoute);
        break;
      case 1:
        Navigator.pushReplacementNamed(context, MyRoutes.passesRoute);
        break;
      case 2:
        Navigator.pushReplacementNamed(context, MyRoutes.documentsRoute);
        break;
      case 3:
        Navigator.pushReplacementNamed(context, MyRoutes.reportRoute);
        break;
      case 4:
        break; // Already on profile
    }
  }
}
