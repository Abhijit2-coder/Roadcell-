import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:roadcell/utils/routes.dart';
import 'package:roadcell/widgets/bottom_nav_bar.dart';
import 'package:roadcell/providers/user_provider.dart';

class RoadCellHome extends StatefulWidget {
  const RoadCellHome({super.key});

  @override
  State<RoadCellHome> createState() => _RoadCellHomeState();
}

class _RoadCellHomeState extends State<RoadCellHome> {
  static const navy = Color(0xff1f4566);
  static const deep = Color(0xff0b2d4a);
  static const green = Color(0xff1fb45b);
  static const bg = Color(0xfff4f7fa);

  void _showNotifications(BuildContext context) {
    showDialog(
      context: context,
      barrierColor: Colors.black.withOpacity(0.45),
      builder: (context) => Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 80,
        ), // Increased padding
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20), // Slightly larger radius
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Header
              Container(
                padding: const EdgeInsets.fromLTRB(
                  24,
                  20,
                  16,
                  18,
                ), // Increased padding
                decoration: BoxDecoration(
                  color: deep,
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(20),
                  ),
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.notifications,
                      color: Colors.amber,
                      size: 22,
                    ), // Larger icon
                    const SizedBox(width: 10),
                    const Text(
                      "Notifications",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18, // Larger font
                        fontWeight: FontWeight.w800,
                        letterSpacing: 0.3,
                      ),
                    ),
                    const Spacer(),
                    // Red dot badge
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 4,
                      ), // Larger padding
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: const Text(
                        "3 new",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 11,
                          fontWeight: FontWeight.w700,
                        ), // Slightly larger
                      ),
                    ),
                    const SizedBox(width: 10),
                    GestureDetector(
                      onTap: () => Navigator.of(context).pop(),
                      child: Container(
                        width: 32, // Larger
                        height: 32,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.15),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Icon(
                          Icons.close,
                          color: Colors.white,
                          size: 18,
                        ), // Larger
                      ),
                    ),
                  ],
                ),
              ),

              // Notifications list
              Flexible(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Column(
                    children: [
                      _notifTile(
                        icon: Icons.vpn_key,
                        iconColor: Colors.amber,
                        iconBg: Colors.amber.withOpacity(0.12),
                        title: "Permission Granted",
                        body:
                            "Suresh Sharma approved your request to borrow MH 02 AB 4521.",
                        time: "2 min ago",
                        isNew: true,
                      ),
                      _divider(),
                      _notifTile(
                        icon: Icons.warning_amber_rounded,
                        iconColor: Colors.orange,
                        iconBg: Colors.orange.withOpacity(0.12),
                        title: "Violation Alert",
                        body:
                            "A traffic violation report was filed for MH 02 CD 8834 on 29 Apr.",
                        time: "1 hr ago",
                        isNew: true,
                      ),
                      _divider(),
                      _notifTile(
                        icon: Icons.folder_copy,
                        iconColor: navy,
                        iconBg: navy.withOpacity(0.10),
                        title: "Document Expiring Soon",
                        body:
                            "Your Driving Licence expires in 7 days. Please renew it.",
                        time: "3 hr ago",
                        isNew: true,
                      ),
                      _divider(),
                      _notifTile(
                        icon: Icons.confirmation_number,
                        iconColor: green,
                        iconBg: green.withOpacity(0.10),
                        title: "Pass Expired",
                        body: "Your daily pass for MH 02 CD 8834 has expired.",
                        time: "Yesterday",
                        isNew: false,
                      ),
                      _divider(),
                      _notifTile(
                        icon: Icons.verified_user,
                        iconColor: Colors.blueAccent,
                        iconBg: Colors.blueAccent.withOpacity(0.10),
                        title: "Account Verified",
                        body:
                            "Your RoadCell account has been successfully verified.",
                        time: "2 days ago",
                        isNew: false,
                      ),
                    ],
                  ),
                ),
              ),

              // Footer
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  vertical: 16,
                ), // Larger padding
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(color: Colors.black.withOpacity(0.07)),
                  ),
                  borderRadius: const BorderRadius.vertical(
                    bottom: Radius.circular(20),
                  ),
                ),
                child: TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text(
                    "Mark all as read",
                    style: TextStyle(
                      color: navy,
                      fontSize: 14, // Larger font
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.5,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _notifTile({
    required IconData icon,
    required Color iconColor,
    required Color iconBg,
    required String title,
    required String body,
    required String time,
    required bool isNew,
  }) {
    return Container(
      color: isNew ? const Color(0xfff0f7ff) : Colors.white,
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 16,
      ), // Larger padding
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 42, // Larger
            height: 42,
            decoration: BoxDecoration(
              color: iconBg,
              borderRadius: BorderRadius.circular(12), // Larger radius
            ),
            child: Icon(icon, size: 22, color: iconColor), // Larger icon
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        style: const TextStyle(
                          color: Color(0xff0b2d4a),
                          fontSize: 14, // Larger font
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                    if (isNew)
                      Container(
                        width: 9, // Larger
                        height: 9,
                        margin: const EdgeInsets.only(left: 8, top: 3),
                        decoration: const BoxDecoration(
                          color: Colors.blue,
                          shape: BoxShape.circle,
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  body,
                  style: const TextStyle(
                    color: Color(0xff6b7f94),
                    fontSize: 12,
                    height: 1.4,
                  ), // Larger font
                ),
                const SizedBox(height: 6),
                Text(
                  time,
                  style: const TextStyle(
                    color: Color(0xffb0bec5),
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                  ), // Slightly larger
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _divider() => Divider(
    height: 1,
    thickness: 0.7,
    color: Colors.black.withOpacity(0.07),
  ); // Slightly thicker

  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.of(context).viewPadding.bottom;
    return Scaffold(
      backgroundColor: bg,
      bottomNavigationBar: SafeArea(top: false, child: _bottomBar()),
      body: SafeArea(
        child: Stack(
          children: [
            Container(height: 260, color: navy),
            SingleChildScrollView(
              padding: EdgeInsets.only(bottom: 120 + bottomInset),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _header(context),
                  const SizedBox(height: 34),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _activePass(),
                        const SizedBox(height: 20),
                        _title("QUICK ACTIONS"),
                        const SizedBox(height: 16),
                        _quickGrid(),
                        const SizedBox(height: 20),
                        _title("MY VEHICLES"),
                        const SizedBox(height: 16),
                        _vehicle(
                          Icons.two_wheeler,
                          "MH 02 AB 4521",
                          "Honda Activa",
                        ),
                        const SizedBox(height: 16),
                        _vehicle(
                          Icons.directions_car,
                          "MH 02 CD 8834",
                          "Maruti Swift",
                        ),
                        const SizedBox(height: 22),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _header(BuildContext context) {
    return Consumer<UserProvider>(
      builder: (context, userProvider, child) {
        String displayName = userProvider.fullName;
        String displayMobile = userProvider.mobile;

        // Mask mobile for display
        String maskedMobile = displayMobile.length > 5
            ? "+91 " + displayMobile.substring(0, 5) + " XXXXX"
            : "+91 XXXXX XXXXX";

        return Padding(
          padding: const EdgeInsets.fromLTRB(22, 22, 22, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: "ROAD",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 34,
                            fontWeight: FontWeight.w900,
                            letterSpacing: 3,
                          ),
                        ),
                        TextSpan(
                          text: "CELL",
                          style: TextStyle(
                            color: Color(0xff66e38e),
                            fontSize: 34,
                            fontWeight: FontWeight.w900,
                            letterSpacing: 1,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () => _showNotifications(context),
                    child: Stack(
                      children: [
                        Container(
                          width: 48,
                          height: 48,
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(.16),
                            borderRadius: BorderRadius.circular(14),
                          ),
                          child: const Icon(
                            Icons.notifications,
                            color: Colors.amber,
                            size: 28,
                          ),
                        ),
                        Positioned(
                          top: 10,
                          right: 10,
                          child: Container(
                            width: 10,
                            height: 10,
                            decoration: const BoxDecoration(
                              color: Colors.red,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 42),
              const Text(
                "Good morning,",
                style: TextStyle(color: Color(0xFFCCE6FF), fontSize: 15),
              ),
              Text(
                displayName,
                style: const TextStyle(
                  color: Color.fromARGB(255, 238, 241, 243),
                  fontSize: 24,
                  fontWeight: FontWeight.w900,
                ),
              ),
              Text(
                "$maskedMobile · Verified ✓",
                style: const TextStyle(color: Color(0xFFCCE6FF), fontSize: 14),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _activePass() {
    return Consumer<UserProvider>(
      builder: (context, userProvider, child) {
        String displayName = userProvider.fullName;

        return Container(
          padding: const EdgeInsets.fromLTRB(24, 24, 24, 20),
          decoration: BoxDecoration(
            color: deep,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(.16),
                blurRadius: 26,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Text(
                    "ACTIVE PASS",
                    style: TextStyle(
                      color: Color(0xff55d887),
                      fontSize: 13,
                      letterSpacing: 3,
                    ),
                  ),
                  const Spacer(),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 5,
                    ),
                    decoration: BoxDecoration(
                      color: green.withOpacity(.18),
                      borderRadius: BorderRadius.circular(26),
                      border: Border.all(color: green),
                    ),
                    child: const Text(
                      "● Live",
                      style: TextStyle(color: green, fontSize: 12),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  const Text(
                    "MH 02 AB 4521",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 2,
                    ),
                  ),
                  const Spacer(),
                  Container(
                    width: 52,
                    height: 52,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: const Icon(
                      Icons.qr_code_2,
                      size: 30,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Text(
                "Owner: Suresh Sharma",
                style: TextStyle(
                  color: Colors.white.withOpacity(.60),
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 22),
              Divider(color: Colors.white.withOpacity(.12), height: 1),
              const SizedBox(height: 18),
              Row(
                children: [
                  _info("Borrower", displayName, Colors.white),
                  _info("Valid until", "11:59 PM", const Color(0xffffc542)),
                  _info("Purpose", "Personal", Colors.white),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _info(String label, String value, Color color) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              color: Colors.white.withOpacity(.55),
              fontSize: 12,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              color: color,
              fontSize: 14,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }

  Widget _title(String text) {
    return Text(
      text,
      style: const TextStyle(
        color: Color(0xff98a9bc),
        fontSize: 12,
        letterSpacing: 5,
        fontWeight: FontWeight.w700,
      ),
    );
  }

  Widget _quickGrid() {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      childAspectRatio: 1.55,
      children: [
        _quick(
          Icons.vpn_key,
          "Get permission",
          "Borrow vehicle",
          navy,
          Colors.amber,
        ),
        _quick(
          Icons.move_to_inbox,
          "Give permission",
          "RC holder",
          green,
          Colors.pink,
        ),
        _quick(
          Icons.folder,
          "My documents",
          "RC, DL, passes",
          navy,
          Colors.amber,
        ),
        _quick(
          Icons.warning,
          "Report violation",
          "Traffic rules",
          Colors.red,
          Colors.orange,
        ),
      ],
    );
  }

  Widget _quick(
    IconData icon,
    String title,
    String sub,
    Color line,
    Color iconColor,
  ) {
    return GestureDetector(
      onTap: () {
        if (title == "Get permission") {
          Navigator.pushNamed(context, MyRoutes.getPerm1Route);
        } else if (title == "Give permission") {
          Navigator.pushNamed(context, MyRoutes.givePerm1Route);
        } else if (title == "My documents") {
          Navigator.pushNamed(context, MyRoutes.documentsRoute);
        } else if (title == "Report violation") {
          Navigator.pushNamed(context, MyRoutes.reportRoute);
        }
      },
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: const Color(0xffd8e0e8)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: .05),
              blurRadius: 14,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Stack(
          children: [
            Container(
              height: 6,
              decoration: BoxDecoration(
                color: line,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(20),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 16, 18, 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(icon, color: iconColor, size: 32),
                  const Spacer(),
                  Text(
                    title,
                    style: const TextStyle(
                      color: deep,
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    sub,
                    style: const TextStyle(
                      color: Color(0xff8e9db2),
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _vehicle(IconData icon, String number, String name) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xffd8e0e8)),
      ),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: const Color(0xfff8fafc),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: const Color(0xffd8e0e8)),
            ),
            child: Icon(icon, size: 26, color: Colors.redAccent),
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                number,
                style: const TextStyle(
                  color: deep,
                  fontSize: 15,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 1.4,
                ),
              ),
              Text(
                name,
                style: const TextStyle(color: Color(0xff94a3b8), fontSize: 13),
              ),
            ],
          ),
          const Spacer(),
          const Icon(Icons.chevron_right, size: 22, color: Color(0xffa5b1bf)),
        ],
      ),
    );
  }

  void _navigateToTab(int index) {
    switch (index) {
      case 0:
        // Already on Home
        break;
      case 1:
        Navigator.pushNamed(context, MyRoutes.passesRoute);
        break;
      case 2:
        Navigator.pushNamed(context, MyRoutes.documentsRoute);
        break;
      case 3:
        Navigator.pushNamed(context, MyRoutes.reportRoute);
        break;
      case 4:
        Navigator.pushNamed(context, MyRoutes.profileRoute);
        break;
    }
  }

  Widget _bottomBar() {
    return BottomNavBar(selectedIndex: 0, onTap: _navigateToTab);
  }
}
