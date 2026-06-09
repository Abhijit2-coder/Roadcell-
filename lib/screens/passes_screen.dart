import 'package:flutter/material.dart';
import 'package:roadcell/utils/routes.dart'; // Add this if not already present
import 'package:roadcell/widgets/bottom_nav_bar.dart'; // Add this for the shared widget

class MyPassesScreen extends StatelessWidget {
  const MyPassesScreen({super.key});

  static const navy = Color(0xff1f4566);
  static const deep = Color(0xff0b2d4a);
  static const bg = Color(0xfff4f7fa);
  static const green = Color(0xff1fb45b);
  static const red = Color(0xffff3b4f);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bg,
      bottomNavigationBar: bottomBar(context),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            topBar(context), // 👈 pass context
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(11, 12, 11, 85),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    sectionTitle("ACTIVE"),
                    const SizedBox(height: 10),
                    passCard(
                      number: "MH 02 AB 4521",
                      owner: "Suresh Sharma",
                      status: "● Live",
                      statusColor: green,
                      leftLabel: "Valid until",
                      leftValue: "11:59 PM",
                      rightLabel: "Purpose",
                      rightValue: "Personal",
                      showQr: true,
                    ),
                    const SizedBox(height: 18),
                    sectionTitle("HISTORY"),
                    const SizedBox(height: 10),
                    passCard(
                      number: "MH 04 XY 7712",
                      owner: "Rajesh Kumar",
                      status: "Expired",
                      statusColor: red,
                      leftLabel: "Date",
                      leftValue: "17 Mar 2026",
                      rightLabel: "Purpose",
                      rightValue: "Office",
                    ),
                    const SizedBox(height: 12),
                    passCard(
                      number: "MH 02 AB 4521",
                      owner: "Suresh Sharma",
                      status: "Expired",
                      statusColor: red,
                      leftLabel: "Date",
                      leftValue: "15 Mar 2026",
                      rightLabel: "Purpose",
                      rightValue: "Emergency",
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ✅ ONLY THIS FUNCTION UPDATED
  Widget topBar(BuildContext context) {
    return Container(
      height: 48,
      color: navy,
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context); // 🔙 back action
            },
            child: const Icon(
              Icons.arrow_back,
              color: Color(0xffb8c7d6),
              size: 18,
            ),
          ),
          const SizedBox(width: 12),
          const Text(
            "My passes",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w900,
            ),
          ),
        ],
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
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget passCard({
    required String number,
    required String owner,
    required String status,
    required Color statusColor,
    required String leftLabel,
    required String leftValue,
    required String rightLabel,
    required String rightValue,
    bool showQr = false,
  }) {
    return Container(
      padding: const EdgeInsets.fromLTRB(14, 13, 14, 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(13),
        border: Border.all(color: const Color(0xffd8e0e8)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: .05),
            blurRadius: 14,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text(
                "TEMPORARY OWNERSHIP",
                style: TextStyle(
                  color: Color(0xffa4b4c5),
                  fontSize: 11,
                  letterSpacing: 4,
                  fontWeight: FontWeight.w900,
                ),
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: statusColor),
                  color: statusColor.withOpacity(.06),
                ),
                child: Text(
                  status,
                  style: TextStyle(
                    color: statusColor,
                    fontSize: 13,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),
          Text(
            number,
            style: const TextStyle(
              color: deep,
              fontSize: 19,
              fontWeight: FontWeight.w900,
              letterSpacing: 2,
            ),
          ),
          const SizedBox(height: 3),
          Text(
            "Owner: $owner",
            style: const TextStyle(color: Color(0xff8fa0b2), fontSize: 16),
          ),
          const SizedBox(height: 10),
          const Divider(height: 1, color: Color(0xffedf1f5)),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: info(
                  leftLabel,
                  leftValue,
                  leftValue.contains("PM") ? const Color(0xffffb000) : deep,
                ),
              ),
              Expanded(child: info(rightLabel, rightValue, deep)),
              if (showQr)
                const SizedBox(
                  width: 34,
                  child: Center(
                    child: Icon(
                      Icons.qr_code_2,
                      size: 45,
                      color: Colors.black87,
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }

  Widget info(String label, String value, Color valueColor) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(color: Color(0xff93a4b7), fontSize: 15),
        ),
        Text(
          value,
          style: TextStyle(
            color: valueColor,
            fontSize: 13,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }

  Widget bottomBar(BuildContext context) {
    // Add context parameter
    return BottomNavBar(
      selectedIndex: 1, // Passes tab is active
      onTap: (index) => _navigateToTab(context, index),
    );
  }

  void _navigateToTab(BuildContext context, int index) {
    switch (index) {
      case 0:
        Navigator.pushReplacementNamed(context, MyRoutes.homeRoute,); // Assuming 'homeRoute' is defined
        break;
      case 1:
        // Already on Passes screen, do nothing
        break;
      case 2:
        Navigator.pushReplacementNamed(context, MyRoutes.documentsRoute);
        break;
      case 3:
        Navigator.pushReplacementNamed(context, MyRoutes.reportRoute);
        break;
      case 4:
        Navigator.pushReplacementNamed(context, MyRoutes.profileRoute);
        break;
    }
  }
}
