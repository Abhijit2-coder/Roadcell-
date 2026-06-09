import 'package:flutter/material.dart';

void main() => runApp(const RoadCellApp());

class RoadCellApp extends StatelessWidget {
  const RoadCellApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PhoneDrivingScreen(),
    );
  }
}

class PhoneDrivingScreen extends StatelessWidget {
  const PhoneDrivingScreen({super.key});

  static const red = Color(0xffdf3044);
  static const darkRed = Color(0xffc51f34);
  static const deep = Color(0xff143a5b);
  static const bg = Color(0xfff6f8fb);
  static const grey = Color(0xff91a4b8);
  static const green = Color(0xff23a847);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bg,
      body: SafeArea(
        child: Column(
          children: [
            topBar(),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(10, 12, 10, 18),
                child: Column(
                  children: [
                    violationCard(),
                    const SizedBox(height: 12),
                    formCard(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget topBar() {
    return Container(
      height: 47,
      color: red,
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: const Row(
        children: [
          Icon(Icons.arrow_back, color: Colors.white70, size: 18),
          SizedBox(width: 12),
          Text(
            "Phone driving",
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

  Widget violationCard() {
    return Container(
      padding: const EdgeInsets.all(13),
      decoration: BoxDecoration(
        color: const Color(0xfffff1f3),
        borderRadius: BorderRadius.circular(9),
        border: Border.all(color: const Color(0xffffcbd3)),
      ),
      child: Row(
        children: [
          Container(
            width: 42,
            height: 42,
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.phone_android, color: Colors.deepPurple, size: 27),
          ),
          const SizedBox(width: 14),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Phone driving",
                  style: TextStyle(
                    color: red,
                    fontSize: 16,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                SizedBox(height: 2),
                Text(
                  "Using phone while driving",
                  style: TextStyle(color: grey, fontSize: 10),
                ),
              ],
            ),
          ),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "₹1,500",
                style: TextStyle(
                  color: red,
                  fontSize: 15,
                  fontWeight: FontWeight.w900,
                ),
              ),
              SizedBox(height: 2),
              Text(
                "Fine amount",
                style: TextStyle(color: grey, fontSize: 10),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget formCard() {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(13),
        border: Border.all(color: const Color(0xffd8e0e8)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.05),
            blurRadius: 12,
            offset: const Offset(0, 4),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Upload proof",
            style: TextStyle(
              color: deep,
              fontSize: 18,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 3),
          const Text(
            "Clear photo showing phone usage",
            style: TextStyle(color: grey, fontSize: 11),
          ),
          const SizedBox(height: 16),

          label("PHOTO PROOF"),
          proofBox(
            icon: Icons.photo_camera,
            title: "Take clear photo of violation",
            sub: "In-app only · GPS + timestamp",
          ),
          const SizedBox(height: 12),

          label("VIDEO PROOF (OPTIONAL)"),
          proofBox(
            icon: Icons.videocam,
            title: "Record short video (max 30 sec)",
            sub: "In-app only · No gallery uploads",
          ),
          const SizedBox(height: 12),

          label("VEHICLE NUMBER"),
          inputBox(Icons.directions_car, "e.g. MH 02 AB 4521", active: true),
          const SizedBox(height: 12),

          label("LOCATION"),
          inputBox(Icons.location_on, "Auto-detected"),
          const SizedBox(height: 12),

          label("DATE & TIME"),
          dateBox(),
          const SizedBox(height: 12),

          submitButton(),
          const SizedBox(height: 8),
          cancelButton(),
        ],
      ),
    );
  }

  Widget label(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Text(
        text,
        style: const TextStyle(
          color: grey,
          fontSize: 9,
          letterSpacing: 3,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }

  Widget proofBox({
    required IconData icon,
    required String title,
    required String sub,
  }) {
    return Container(
      height: 86,
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xfffffbfc),
        borderRadius: BorderRadius.circular(9),
        border: Border.all(color: const Color(0xffffcbd3)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.deepPurple, size: 23),
          const SizedBox(height: 5),
          Text(title, style: const TextStyle(color: grey, fontSize: 11)),
          const SizedBox(height: 2),
          Text(
            sub,
            style: const TextStyle(
              color: Colors.orange,
              fontSize: 9,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget inputBox(IconData icon, String hint, {bool active = false}) {
    return Container(
      height: 40,
      padding: const EdgeInsets.symmetric(horizontal: 13),
      decoration: BoxDecoration(
        color: active ? Colors.white : const Color(0xfff3f6f8),
        borderRadius: BorderRadius.circular(9),
        border: Border.all(color: active ? deep : const Color(0xffd8e0e8)),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            size: 16,
            color: active ? const Color(0xffd4dce5) : const Color(0xffffcbd3),
          ),
          const SizedBox(width: 10),
          Text(
            hint,
            style: TextStyle(
              color: active ? const Color(0xffb3c0ce) : const Color(0xffbec8d4),
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          )
        ],
      ),
    );
  }

  Widget dateBox() {
    return Container(
      height: 40,
      padding: const EdgeInsets.symmetric(horizontal: 13),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(9),
        border: Border.all(color: green),
      ),
      child: const Row(
        children: [
          Icon(Icons.access_time, size: 17, color: Color(0xffc2ccd6)),
          SizedBox(width: 10),
          Expanded(
            child: Text(
              "18 Mar 2026 · 09:14 AM",
              style: TextStyle(
                color: Color(0xff2c3e50),
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Text(
            "AUTO",
            style: TextStyle(
              color: green,
              fontSize: 9,
              fontWeight: FontWeight.w900,
            ),
          )
        ],
      ),
    );
  }

  Widget submitButton() {
    return Container(
      height: 46,
      decoration: BoxDecoration(
        color: darkRed,
        borderRadius: BorderRadius.circular(9),
        boxShadow: [
          BoxShadow(
            color: darkRed.withOpacity(.22),
            blurRadius: 12,
            offset: const Offset(0, 6),
          )
        ],
      ),
      child: const Center(
        child: Text(
          "SUBMIT REPORT",
          style: TextStyle(
            color: Colors.white,
            fontSize: 13,
            fontWeight: FontWeight.w900,
            letterSpacing: 3,
          ),
        ),
      ),
    );
  }

  Widget cancelButton() {
    return Container(
      height: 41,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(9),
        border: Border.all(color: const Color(0xffd8e0e8)),
      ),
      child: const Center(
        child: Text(
          "← CANCEL",
          style: TextStyle(
            color: grey,
            fontSize: 12,
            fontWeight: FontWeight.w900,
            letterSpacing: 3,
          ),
        ),
      ),
    );
  }
}
