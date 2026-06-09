import 'package:flutter/material.dart';
import 'package:roadcell/screens/no_helmet_screen.dart';
import 'package:roadcell/screens/phone_driving_screen.dart';
import 'package:roadcell/screens/signal_jump_screen.dart';
import 'package:roadcell/screens/wrong_lane_screen.dart';
import 'package:roadcell/utils/routes.dart';
import 'package:roadcell/widgets/bottom_nav_bar.dart'; // Add this for the shared widget

class ReportViolationScreen extends StatelessWidget {
  const ReportViolationScreen({super.key});

  static const navy = Color(0xff1f4566);
  static const deep = Color(0xff0b2d4a);
  static const bg = Color(0xfff5f8fb);
  static const grey = Color(0xff8fa1b6);
  static const red = Color(0xffff3b4f);

  void _showUnderReviewPopup(BuildContext context) {
    showDialog(
      context: context,
      barrierColor: Colors.black.withOpacity(0.45),
      builder: (context) => Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(18),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // ── Header ──────────────────────────────────────────
              Container(
                padding: const EdgeInsets.fromLTRB(18, 16, 14, 16),
                decoration: BoxDecoration(
                  color: navy,
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(18),
                  ),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 36,
                      height: 36,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.12),
                        borderRadius: BorderRadius.circular(9),
                      ),
                      child: const Icon(
                        Icons.traffic,
                        color: Color(0xffff9500),
                        size: 20,
                      ),
                    ),
                    const SizedBox(width: 10),
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Signal jump",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          Text(
                            "Report #RC-2026-00412",
                            style: TextStyle(
                              color: Color(0xffb8cfe6),
                              fontSize: 10,
                            ),
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        width: 28,
                        height: 28,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.13),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Icon(
                          Icons.close,
                          color: Colors.white,
                          size: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // ── Status tracker ───────────────────────────────────
              Padding(
                padding: const EdgeInsets.fromLTRB(18, 20, 18, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "REPORT STATUS",
                      style: TextStyle(
                        color: grey,
                        fontSize: 9,
                        letterSpacing: 4,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 16),
                    _statusStep(
                      icon: Icons.check_circle,
                      label: "Report submitted",
                      sub: "29 Apr 2026 · 6:15 PM",
                      done: true,
                      isLast: false,
                    ),
                    _statusStep(
                      icon: Icons.find_in_page,
                      label: "Evidence verified",
                      sub: "Video reviewed by system",
                      done: true,
                      isLast: false,
                    ),
                    _statusStep(
                      icon: Icons.manage_search,
                      label: "Under review",
                      sub: "Traffic authority reviewing",
                      done: false,
                      isActive: true,
                      isLast: false,
                    ),
                    _statusStep(
                      icon: Icons.gavel,
                      label: "Challan decision",
                      sub: "Pending",
                      done: false,
                      isLast: true,
                    ),
                  ],
                ),
              ),

              // ── Info grid ────────────────────────────────────────
              Padding(
                padding: const EdgeInsets.fromLTRB(18, 18, 18, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "REPORT DETAILS",
                      style: TextStyle(
                        color: grey,
                        fontSize: 9,
                        letterSpacing: 4,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Container(
                      decoration: BoxDecoration(
                        color: const Color(0xfff5f8fb),
                        borderRadius: BorderRadius.circular(11),
                        border: Border.all(color: const Color(0xffd8e0e8)),
                      ),
                      child: Column(
                        children: [
                          _infoRow(
                            Icons.directions_car,
                            "Vehicle",
                            "MH 04 PQ 3301",
                            isFirst: true,
                          ),
                          _divider(),
                          _infoRow(
                            Icons.location_on,
                            "Location",
                            "Kurla Junction, Mumbai",
                          ),
                          _divider(),
                          _infoRow(
                            Icons.videocam,
                            "Evidence",
                            "12 sec video attached",
                          ),
                          _divider(),
                          _infoRow(
                            Icons.calendar_today,
                            "Date & time",
                            "29 Apr 2026 · 6:15 PM",
                          ),
                          _divider(),
                          _infoRow(
                            Icons.person_outline,
                            "Reported by",
                            "Rahul Sharma",
                            isLast: true,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // ── Expected resolution ──────────────────────────────
              Padding(
                padding: const EdgeInsets.fromLTRB(18, 14, 18, 0),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 11,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xfffff8ec),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: const Color(0xffffdc85)),
                  ),
                  child: const Row(
                    children: [
                      Icon(
                        Icons.access_time,
                        color: Color(0xffcc8800),
                        size: 16,
                      ),
                      SizedBox(width: 9),
                      Expanded(
                        child: Text(
                          "Expected resolution in 2–3 working days",
                          style: TextStyle(
                            color: Color(0xff8a5c00),
                            fontSize: 11,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // ── Action buttons ───────────────────────────────────
              Padding(
                padding: const EdgeInsets.fromLTRB(18, 14, 18, 20),
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Container(
                          height: 44,
                          decoration: BoxDecoration(
                            color: const Color(0xfff0f4f8),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Center(
                            child: Text(
                              "Close",
                              style: TextStyle(
                                color: deep,
                                fontSize: 13,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: const Text("Report withdrawn"),
                              backgroundColor: red,
                              behavior: SnackBarBehavior.floating,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              duration: const Duration(seconds: 2),
                            ),
                          );
                        },
                        child: Container(
                          height: 44,
                          decoration: BoxDecoration(
                            color: red.withOpacity(0.08),
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: red.withOpacity(0.4)),
                          ),
                          child: const Center(
                            child: Text(
                              "Withdraw",
                              style: TextStyle(
                                color: red,
                                fontSize: 13,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  static Widget _statusStep({
    required IconData icon,
    required String label,
    required String sub,
    required bool done,
    bool isActive = false,
    required bool isLast,
  }) {
    final Color iconColor = done
        ? const Color(0xff20a84a)
        : isActive
        ? const Color(0xff1f4566)
        : const Color(0xffd8e0e8);
    final Color lineColor = done
        ? const Color(0xff20a84a)
        : const Color(0xffe2eaf2);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Icon + vertical line
        Column(
          children: [
            Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                color: done
                    ? const Color(0xffecfbf2)
                    : isActive
                    ? const Color(0xffe8f0f8)
                    : const Color(0xfff5f8fb),
                shape: BoxShape.circle,
                border: Border.all(color: iconColor, width: isActive ? 2 : 1),
              ),
              child: Icon(icon, size: 15, color: iconColor),
            ),
            if (!isLast) Container(width: 2, height: 28, color: lineColor),
          ],
        ),
        const SizedBox(width: 12),
        Padding(
          padding: const EdgeInsets.only(top: 6),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(
                  color: done || isActive ? deep : grey,
                  fontSize: 12,
                  fontWeight: FontWeight.w800,
                ),
              ),
              Text(sub, style: const TextStyle(color: grey, fontSize: 10)),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ],
    );
  }

  static Widget _infoRow(
    IconData icon,
    String label,
    String value, {
    bool isFirst = false,
    bool isLast = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      child: Row(
        children: [
          Icon(icon, size: 15, color: const Color(0xff8fa1b6)),
          const SizedBox(width: 9),
          Text(label, style: const TextStyle(color: grey, fontSize: 11)),
          const Spacer(),
          Text(
            value,
            style: const TextStyle(
              color: deep,
              fontSize: 11,
              fontWeight: FontWeight.w800,
            ),
          ),
        ],
      ),
    );
  }

  static Widget _divider() =>
      Divider(height: 1, thickness: 0.5, color: Colors.black.withOpacity(0.07));

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
                    sectionTitle("SELECT VIOLATION TYPE"),
                    const SizedBox(height: 12),

                    GridView.count(
                      crossAxisCount: 2,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                      childAspectRatio: 1.75,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const NoHelmetReportScreen(),
                              ),
                            );
                          },
                          child: violationCard(
                            Icons.sports_motorsports,
                            "No helmet",
                            "2-wheeler rider",
                            const Color(0xffff3b4f),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SignalJumpScreen(),
                              ),
                            );
                          },
                          child: violationCard(
                            Icons.traffic,
                            "Signal jump",
                            "Red light cross",
                            const Color(0xffff9500),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const PhoneDrivingScreen(),
                              ),
                            );
                          },
                          child: violationCard(
                            Icons.phone_android,
                            "Phone driving",
                            "While driving",
                            const Color(0xff7c3aed),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const WrongLaneScreen(),
                              ),
                            );
                          },
                          child: violationCard(
                            Icons.not_interested,
                            "Wrong lane",
                            "One-way violation",
                            const Color(0xff0891b2),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 12),
                    sectionTitle("MY REPORTS"),
                    const SizedBox(height: 12),

                    reportCard(
                      icon: Icons.sports_motorsports,
                      iconColor: const Color(0xffff3b4f),
                      title: "No helmet",
                      vehicle: "MH 02 XY 7712 · Today 8:32 AM",
                      mediaIcon: Icons.photo_camera,
                      mediaText: "3 photos · Andheri West · Verified ✓",
                      status: "Challan sent",
                      statusColor: red,
                      onTap: null,
                    ),

                    const SizedBox(height: 10),

                    reportCard(
                      icon: Icons.traffic,
                      iconColor: const Color(0xffff9500),
                      title: "Signal jump",
                      vehicle: "MH 04 PQ 3301 · Yesterday 6:15 PM",
                      mediaIcon: Icons.videocam,
                      mediaText: "12 sec video · Kurla Junction",
                      status: "Under review",
                      statusColor: navy,
                      onTap: () => _showUnderReviewPopup(context),
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
            "Reports",
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
        fontWeight: FontWeight.w600,
      ),
    );
  }

  Widget violationCard(
    IconData icon,
    String title,
    String subtitle,
    Color iconColor,
  ) {
    return Container(
      padding: const EdgeInsets.fromLTRB(4, 1, 4, 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color(0xffd8e0e8)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.035),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Stack(
        children: [
          Positioned(
            top: -1,
            left: 0,
            right: 0,
            child: Container(height: 5, color: iconColor),
          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),
              Icon(icon, color: iconColor, size: 32),
              const Spacer(),
              Text(
                title,
                style: const TextStyle(
                  color: deep,
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                ),
              ),
              Text(
                subtitle,
                style: const TextStyle(
                  color: grey,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget reportCard({
    required IconData icon,
    required Color iconColor,
    required String title,
    required String vehicle,
    required IconData mediaIcon,
    required String mediaText,
    required String status,
    required Color statusColor,
    required VoidCallback? onTap,
  }) {
    final bool isUnderReview = onTap != null;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.fromLTRB(14, 13, 14, 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(11),
          border: Border.all(
            color: isUnderReview
                ? const Color(0xff1f4566).withOpacity(0.35)
                : const Color(0xffd8e0e8),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.035),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          children: [
            Row(
              children: [
                Icon(icon, color: iconColor, size: 30),
                const SizedBox(width: 7),
                Expanded(
                  child: Text(
                    title,
                    style: const TextStyle(
                      color: deep,
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 9,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: statusColor),
                    color: statusColor.withOpacity(.06),
                  ),
                  child: Text(
                    status,
                    style: TextStyle(
                      color: statusColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                if (isUnderReview) ...[
                  const SizedBox(width: 6),
                  const Icon(
                    Icons.chevron_right,
                    size: 16,
                    color: Color(0xff8fa1b6),
                  ),
                ],
              ],
            ),
            const SizedBox(height: 6),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                vehicle,
                style: const TextStyle(
                  color: grey,
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Container(
                  width: 45,
                  height: 45,
                  decoration: BoxDecoration(
                    color: const Color(0xfff3f6f9),
                    borderRadius: BorderRadius.circular(7),
                    border: Border.all(color: const Color(0xffd8e0e8)),
                  ),
                  child: Icon(mediaIcon, color: Colors.deepPurple, size: 28),
                ),
                const SizedBox(width: 9),
                Expanded(
                  child: Text(
                    mediaText,
                    style: const TextStyle(color: grey, fontSize: 14),
                  ),
                ),
              ],
            ),
            if (isUnderReview) ...[
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 7,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xffe8f0f8),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Row(
                  children: [
                    Icon(
                      Icons.info_outline,
                      size: 15,
                      color: Color(0xff1f4566),
                    ),
                    SizedBox(width: 6),
                    Text(
                      "Tap to view full status & details",
                      style: TextStyle(
                        color: Color(0xff1f4566),
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget bottomBar(BuildContext context) {
    // Add context parameter
    return BottomNavBar(
      selectedIndex: 3,
      onTap: (index) => _navigateToTab(context, index),
    );
  }

  void _navigateToTab(BuildContext context, int index) {
    switch (index) {
      case 0:
        Navigator.pushReplacementNamed(
          context,
          MyRoutes.homeRoute,
        ); // Assuming 'homeRoute' is defined
        break;
      case 1:
        Navigator.pushReplacementNamed(context, MyRoutes.passesRoute);
        break;
      case 2:
        Navigator.pushReplacementNamed(context, MyRoutes.documentsRoute);
        break;
      case 3:
        break;
      case 4:
        Navigator.pushReplacementNamed(context, MyRoutes.profileRoute);
        break;
    }
  }
}
