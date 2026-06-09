import 'package:flutter/material.dart';

class RoadCellApp extends StatelessWidget {
  const RoadCellApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WrongLaneScreen(),
    );
  }
}

class WrongLaneScreen extends StatelessWidget {
  const WrongLaneScreen({super.key});

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
      height: 57,
      color: red,
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: const Row(
        children: [
          Icon(Icons.arrow_back, color: Colors.white70, size: 18),
          SizedBox(width: 12),
          Text(
            "Wrong lane",
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
      child: const Row(
        children: [
          Icon(Icons.not_interested, color: red, size: 40),
          SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Wrong lane",
                  style: TextStyle(
                    color: red,
                    fontSize: 16,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                Text(
                  "One-way / wrong side driving",
                  style: TextStyle(color: grey, fontSize: 10),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "₹500",
                style: TextStyle(
                  color: red,
                  fontSize: 15,
                  fontWeight: FontWeight.w900,
                ),
              ),
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
          const Text(
            "Show vehicle going wrong way",
            style: TextStyle(color: grey, fontSize: 11),
          ),
          const SizedBox(height: 16),

          label("PHOTO / VIDEO PROOF"),
          uploadedBox(),
          const SizedBox(height: 12),

          label("VEHICLE NUMBER"),
          greenInput(Icons.directions_car, "MH 05 CD 9981", check: true),
          const SizedBox(height: 12),

          label("ROAD / LOCATION"),
          greenInput(Icons.location_on, "Andheri West, SV Road", auto: true),
          const SizedBox(height: 12),

          label("DATE & TIME"),
          greenInput(Icons.access_time, "18 Mar 2026 · 10:45 AM", auto: true),
          const SizedBox(height: 12),

          label("ADDITIONAL NOTE (OPTIONAL)"),
          noteBox(),
          const SizedBox(height: 10),

          readyBox(),
          const SizedBox(height: 12),

          submitButton(),
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

  Widget uploadedBox() {
    return Container(
      height: 86,
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xfffbfffc),
        borderRadius: BorderRadius.circular(9),
        border: Border.all(color: const Color(0xffbfe9c9)),
      ),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.photo_camera, color: Colors.deepPurple, size: 22),
          SizedBox(height: 5),
          Text(
            "2 photos uploaded ✓",
            style: TextStyle(
              color: green,
              fontSize: 11,
              fontWeight: FontWeight.w900,
            ),
          ),
          SizedBox(height: 2),
          Text(
            "GPS: Andheri West · 10:45 AM",
            style: TextStyle(
              color: Colors.orange,
              fontSize: 9,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget greenInput(
    IconData icon,
    String text, {
    bool check = false,
    bool auto = false,
  }) {
    return Container(
      height: 40,
      padding: const EdgeInsets.symmetric(horizontal: 13),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(9),
        border: Border.all(color: green),
      ),
      child: Row(
        children: [
          Icon(icon, size: 16, color: const Color(0xffffcbd3)),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                color: Color(0xff2c3e50),
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          if (check) const Icon(Icons.check, size: 16, color: green),
          if (auto)
            const Text(
              "AUTO",
              style: TextStyle(
                color: green,
                fontSize: 9,
                fontWeight: FontWeight.w900,
              ),
            ),
        ],
      ),
    );
  }

  Widget noteBox() {
    return Container(
      height: 40,
      padding: const EdgeInsets.symmetric(horizontal: 13),
      decoration: BoxDecoration(
        color: const Color(0xfff4f6f8),
        borderRadius: BorderRadius.circular(9),
        border: Border.all(color: const Color(0xffd8e0e8)),
      ),
      child: const Row(
        children: [
          Icon(Icons.edit_note, size: 17, color: Color(0xffffcbd3)),
          SizedBox(width: 10),
          Text(
            "Describe the violation...",
            style: TextStyle(
              color: Color(0xffb9c4d0),
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget readyBox() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 10),
      decoration: BoxDecoration(
        color: const Color(0xfff0fbf3),
        borderRadius: BorderRadius.circular(9),
        border: Border.all(color: const Color(0xffccefd5)),
      ),
      child: const Row(
        children: [
          Icon(Icons.circle, color: green, size: 7),
          SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Ready to submit",
                style: TextStyle(
                  color: green,
                  fontSize: 11,
                  fontWeight: FontWeight.w900,
                ),
              ),
              Text(
                "2 photos + location verified",
                style: TextStyle(color: grey, fontSize: 10),
              ),
            ],
          ),
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
}