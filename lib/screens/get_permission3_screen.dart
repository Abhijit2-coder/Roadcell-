import 'package:flutter/material.dart';
import 'package:roadcell/utils/routes.dart';

class PermissionRequestScreen extends StatelessWidget {
  const PermissionRequestScreen({super.key});

  static const navy = Color(0xff1f4566);
  static const deep = Color(0xff143a5b);
  static const bg = Color(0xfff6f8fb);
  static const grey = Color(0xff91a4b8);
  static const green = Color(0xff2fa84f);
  static const red = Color(0xffdf3044);

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
                child: card(context),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget topBar() {
    return Container(
      height: 52,
      color: navy,
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: const Row(
        children: [
          Icon(Icons.arrow_back, color: Color(0xffb8c7d6), size: 18),
          SizedBox(width: 12),
          Text(
            "Permission request",
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

  Widget card(context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(14, 24, 14, 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(13),
        border: Border.all(color: const Color(0xffd8e0e8)),
      ),
      child: Column(
        children: [
          const Icon(Icons.directions_car, size: 38, color: Colors.deepPurple),
          const SizedBox(height: 12),
          const Text(
            "Vehicle borrow request",
            style: TextStyle(
              color: deep,
              fontSize: 16,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 4),
          const Text(
            "Rahul Sharma wants to borrow\nyour vehicle",
            textAlign: TextAlign.center,
            style: TextStyle(color: grey, fontSize: 11, height: 1.4),
          ),
          const SizedBox(height: 14),

          requestDetails(),
          const SizedBox(height: 14),

          label("CONFIRM RC NUMBER"),
          inputBox(),
          const SizedBox(height: 12),

          label("YOUR LIVE SELFIE"),
          selfieBox(),
          const SizedBox(height: 12),

          acceptButton(context),
          const SizedBox(height: 8),
          rejectButton(),
          const SizedBox(height: 8),

          const Text(
            "Expires in 28:45 minutes",
            style: TextStyle(color: Color(0xffb3c0ce), fontSize: 9),
          ),
        ],
      ),
    );
  }

  Widget requestDetails() {
    return Container(
      padding: const EdgeInsets.all(11),
      decoration: BoxDecoration(
        color: const Color(0xfff3f6f8),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          detailRow("Borrower", "Rahul Sharma"),
          detailRow("Mobile", "+91 987654 XXXXX"),
          detailRow("Purpose", "Personal use"),
          detailRow("Time", "10:00 AM → 11:59 PM"),
        ],
      ),
    );
  }

  Widget detailRow(String left, String right) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        children: [
          Expanded(
            child: Text(
              left,
              style: const TextStyle(color: grey, fontSize: 14),
            ),
          ),
          Text(
            right,
            style: const TextStyle(
              color: Color(0xff1f2933),
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget label(String text) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 6),
        child: Text(
          text,
          style: const TextStyle(
            color: grey,
            fontSize: 12,
            letterSpacing: 3,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }

  Widget inputBox() {
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
          Icon(Icons.directions_car, size: 30, color: Color(0xffffcbd3)),
          SizedBox(width: 10),
          Expanded(
            child: Text(
              "MH 02 AB 4521",
              style: TextStyle(
                color: Color(0xff2c3e50),
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Icon(Icons.check, size: 16, color: green),
        ],
      ),
    );
  }

  Widget selfieBox() {
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
          Icon(Icons.camera_alt, color: Colors.deepPurple, size: 30),
          SizedBox(height: 5),
          Text(
            "Take selfie via ROADCELL camera",
            style: TextStyle(color: grey, fontSize: 14),
          ),
          SizedBox(height: 2),
          Text(
            "GPS + timestamp auto-added · No gallery",
            style: TextStyle(
              color: Colors.orange,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget acceptButton(context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, MyRoutes.getPerm4Route);
      },
      child: Container(
        height: 45,
        decoration: BoxDecoration(
          color: green,
          borderRadius: BorderRadius.circular(9),
        ),
        child: const Center(
          child: Text(
            "✓ ACCEPT & SUBMIT",
            style: TextStyle(
              color: Colors.white,
              fontSize: 13,
              fontWeight: FontWeight.w900,
              letterSpacing: 3,
            ),
          ),
        ),
      ),
    );
  }

  Widget rejectButton() {
    return Container(
      height: 42,
      decoration: BoxDecoration(
        color: const Color(0xfffff7f8),
        borderRadius: BorderRadius.circular(9),
        border: Border.all(color: const Color(0xffffb8c2)),
      ),
      child: const Center(
        child: Text(
          "X REJECT",
          style: TextStyle(
            color: red,
            fontSize: 13,
            fontWeight: FontWeight.w900,
            letterSpacing: 3,
          ),
        ),
      ),
    );
  }
}
