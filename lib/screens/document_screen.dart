import 'package:flutter/material.dart';
import 'package:roadcell/utils/routes.dart';
import 'package:roadcell/widgets/bottom_nav_bar.dart';

class MyDocumentsScreen extends StatelessWidget {
  const MyDocumentsScreen({super.key});

  static const navy = Color(0xff1f4566);
  static const deep = Color(0xff153a5b);
  static const bg = Color(0xfff5f8fb);
  static const green = Color(0xff20a84a);
  static const orange = Color(0xffffa800);
  static const greyText = Color(0xff91a4b8);

  void _showAddDocumentSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        padding: const EdgeInsets.fromLTRB(20, 14, 20, 32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Handle bar
            Center(
              child: Container(
                width: 38,
                height: 4,
                decoration: BoxDecoration(
                  color: const Color(0xffd8e0e8),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 18),

            // Title
            const Text(
              "Add document",
              style: TextStyle(
                color: deep,
                fontSize: 16,
                fontWeight: FontWeight.w900,
              ),
            ),
            const SizedBox(height: 4),
            const Text(
              "Choose how you want to upload your document",
              style: TextStyle(color: greyText, fontSize: 11),
            ),
            const SizedBox(height: 20),

            // Options row
            Row(
              children: [
                Expanded(
                  child: _uploadOption(
                    context,
                    icon: Icons.camera_alt_rounded,
                    iconColor: Colors.white,
                    iconBg: navy,
                    label: "Camera",
                    sub: "Take a photo",
                    onTap: () {
                      Navigator.pop(context);
                      _showConfirmSnack(context, "Camera opened");
                    },
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _uploadOption(
                    context,
                    icon: Icons.photo_library_rounded,
                    iconColor: Colors.white,
                    iconBg: const Color(0xff7c3aed),
                    label: "Photos",
                    sub: "Choose from gallery",
                    onTap: () {
                      Navigator.pop(context);
                      _showConfirmSnack(context, "Gallery opened");
                    },
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _uploadOption(
                    context,
                    icon: Icons.upload_file_rounded,
                    iconColor: Colors.white,
                    iconBg: const Color(0xff0891b2),
                    label: "Files",
                    sub: "Upload from device",
                    onTap: () {
                      Navigator.pop(context);
                      _showConfirmSnack(context, "File picker opened");
                    },
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),
            Divider(color: Colors.black.withOpacity(0.07), height: 1),
            const SizedBox(height: 16),

            // Document type chips
            const Text(
              "SELECT DOCUMENT TYPE",
              style: TextStyle(
                color: greyText,
                fontSize: 9,
                letterSpacing: 4,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                _docChip(Icons.badge, "Driving Licence"),
                _docChip(Icons.description, "RC"),
                _docChip(Icons.shield, "Insurance"),
                _docChip(Icons.credit_card, "Aadhaar"),
                _docChip(Icons.article, "PAN card"),
                _docChip(Icons.more_horiz, "Other"),
              ],
            ),

            const SizedBox(height: 20),

            // Cancel button
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Container(
                width: double.infinity,
                height: 46,
                decoration: BoxDecoration(
                  color: const Color(0xfff0f4f8),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Center(
                  child: Text(
                    "Cancel",
                    style: TextStyle(
                      color: deep,
                      fontSize: 13,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _uploadOption(
    BuildContext context, {
    required IconData icon,
    required Color iconColor,
    required Color iconBg,
    required String label,
    required String sub,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 10),
        decoration: BoxDecoration(
          color: const Color(0xfff5f8fb),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: const Color(0xffd8e0e8)),
        ),
        child: Column(
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: iconBg,
                borderRadius: BorderRadius.circular(13),
              ),
              child: Icon(icon, color: iconColor, size: 24),
            ),
            const SizedBox(height: 10),
            Text(
              label,
              style: const TextStyle(
                color: deep,
                fontSize: 12,
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(height: 3),
            Text(
              sub,
              textAlign: TextAlign.center,
              style: const TextStyle(color: greyText, fontSize: 9),
            ),
          ],
        ),
      ),
    );
  }

  Widget _docChip(IconData icon, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: const Color(0xffeef3f8),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xffd8e0e8)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 13, color: navy),
          const SizedBox(width: 5),
          Text(
            label,
            style: const TextStyle(
              color: deep,
              fontSize: 11,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }

  void _showConfirmSnack(BuildContext context, String msg) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(msg),
        duration: const Duration(seconds: 2),
        backgroundColor: navy,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bg,
      bottomNavigationBar: bottomBar(context),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            topBar(context),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(12, 12, 12, 85),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    sectionTitle("IDENTITY DOCUMENTS"),
                    const SizedBox(height: 12),
                    docCard(
                      icon: Icons.badge,
                      iconBg: const Color(0xffeef3f8),
                      iconColor: Colors.blue,
                      title: "Driving licence",
                      sub1: "MH02-2019-0043812",
                      sub2: "Valid till 2039 ✓",
                      sub2Color: green,
                    ),
                    docCard(
                      icon: Icons.description,
                      iconBg: const Color(0xfffff3e8),
                      iconColor: Colors.orange,
                      title: "RC — MH 02 AB 4521",
                      sub1: "Honda Activa 6G · 2021",
                      sub2: "Valid ✓",
                      sub2Color: green,
                    ),
                    docCard(
                      icon: Icons.shield,
                      iconBg: const Color(0xfffff7e8),
                      iconColor: Colors.blue,
                      title: "Insurance",
                      sub1: "New India Assurance",
                      sub2: "Exp: 30 Jun 2026",
                      sub2Color: orange,
                    ),
                    docCard(
                      icon: Icons.article,
                      iconBg: const Color(0xfff1edf8),
                      iconColor: Colors.deepPurple.shade200,
                      title: "Aadhaar card",
                      sub1: "XXXX-XXXX-1234",
                      sub2: "Verified ✓",
                      sub2Color: green,
                    ),
                    const SizedBox(height: 12),
                    sectionTitle("TEMPORARY PASSES"),
                    const SizedBox(height: 12),
                    passCard(
                      active: true,
                      title: "Active pass — today",
                      sub1: "MH 02 AB 4521 · Till 11:59 PM",
                      sub2: "Live ▪",
                    ),
                    passCard(
                      active: false,
                      title: "Pass — 17 Mar 2026",
                      sub1: "MH 04 XY 7712 · Expired",
                      sub2: "Expired",
                    ),
                    SizedBox(height: 30),
                    addMoreButton(context),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

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
            "My documents",
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

  Widget docCard({
    required IconData icon,
    required Color iconBg,
    required Color iconColor,
    required String title,
    required String sub1,
    required String sub2,
    required Color sub2Color,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(13),
      decoration: cardDecoration(),
      child: Row(
        children: [
          iconBox(icon, iconBg, iconColor),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: titleStyle()),
                Text(sub1, style: subStyle()),
                Text(
                  sub2,
                  style: TextStyle(
                    color: sub2Color,
                    fontSize: 13,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),
          ),
          const Icon(Icons.chevron_right, size: 18, color: Color(0xff9fb0c1)),
        ],
      ),
    );
  }

  Widget passCard({
    required bool active,
    required String title,
    required String sub1,
    required String sub2,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(13),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(11),
        border: Border.all(
          color: active ? const Color(0xff9ee6b1) : const Color(0xffd8e0e8),
        ),
      ),
      child: Row(
        children: [
          iconBox(
            Icons.vpn_key,
            active ? const Color(0xffeaf8ee) : const Color(0xffeef3f8),
            Colors.orange,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: active ? green : deep,
                    fontSize: 16,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                Text(sub1, style: subStyle()),
                Text(
                  sub2,
                  style: TextStyle(
                    color: active ? green : Colors.redAccent,
                    fontSize: 13,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),
          ),
          const Icon(Icons.chevron_right, size: 18, color: Color(0xff9fb0c1)),
        ],
      ),
    );
  }

  // Updated: accepts BuildContext
  Widget addMoreButton(BuildContext context) {
    return GestureDetector(
      onTap: () => _showAddDocumentSheet(context),
      child: Container(
        height: 50,
        margin: const EdgeInsets.only(top: 2),
        decoration: BoxDecoration(
          color: const Color(0xffeef3f8),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: const Color(0xffb8c9d9)),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.add, size: 20, color: deep),
              SizedBox(width: 12),
              Text(
                "Add more documents",
                style: TextStyle(
                  color: deep,
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  BoxDecoration cardDecoration() {
    return BoxDecoration(
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
    );
  }

  Widget iconBox(IconData icon, Color bg, Color color) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(9),
      ),
      child: Icon(icon, color: color, size: 25),
    );
  }

  TextStyle titleStyle() {
    return const TextStyle(
      color: deep,
      fontSize: 16,
      fontWeight: FontWeight.w900,
    );
  }

  TextStyle subStyle() {
    return const TextStyle(
      color: greyText,
      fontSize: 13,
      fontWeight: FontWeight.w500,
    );
  }

  Widget bottomBar(BuildContext context) {
    // Add context parameter
    return BottomNavBar(
      selectedIndex: 2,
      onTap: (index) => _navigateToTab(context, index),
    );
  }

  void _navigateToTab(BuildContext context, int index) {
    switch (index) {
      case 0:
        Navigator.pushReplacementNamed(context, MyRoutes.homeRoute); //
        break;
      case 1:
        Navigator.pushReplacementNamed(context, MyRoutes.passesRoute); //
        break;
      case 2:
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

class BottomItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final bool active;

  const BottomItem(this.icon, this.text, this.active, {super.key});

  @override
  Widget build(BuildContext context) {
    final color = active ? const Color(0xff0b2d4a) : const Color(0xffa9b6c5);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, size: 20, color: color),
        const SizedBox(height: 4),
        Text(
          text,
          style: TextStyle(
            fontSize: 9,
            color: color,
            fontWeight: active ? FontWeight.w800 : FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
