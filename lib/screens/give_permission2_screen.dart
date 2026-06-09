import 'package:flutter/material.dart';
import 'package:roadcell/utils/routes.dart';

class GivePermissionSelfieScreen extends StatelessWidget {
  const GivePermissionSelfieScreen({super.key});

  static const navy = Color(0xff1f4566);
  static const deep = Color(0xff143a5b);
  static const bg = Color(0xfff6f8fb);
  static const grey = Color(0xff91a4b8);
  static const green = Color(0xff2fa84f);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bg,
      body: SafeArea(
        child: Column(
          children: [
            topBar(),
            progress(),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(10, 12, 10, 18),
                child: mainCard(context),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget topBar() {
    return Container(
      height: 54,
      color: navy,
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: const Row(
        children: [
          Icon(Icons.arrow_back, color: Color(0xffb8c7d6), size: 18),
          SizedBox(width: 12),
          Text(
            "Give permission",
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

  Widget progress() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            children: [
              bar(navy),
              const SizedBox(width: 4),
              bar(navy),
              const SizedBox(width: 4),
              bar(const Color(0xffd8e0e8)),
              const SizedBox(width: 4),
              bar(const Color(0xffd8e0e8)),
            ],
          ),
          const SizedBox(height: 5),
          const Text(
            "Step 2 of 4 — Your selfie",
            style: TextStyle(color: grey, fontSize: 11),
          ),
        ],
      ),
    );
  }

  Widget bar(Color color) {
    return Expanded(
      child: Container(
        height: 3,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }

  Widget mainCard(context) {
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
            "Your details + selfie",
            style: TextStyle(
              color: deep,
              fontSize: 18,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 3),
          const Text(
            "Auto-fetched from your account",
            style: TextStyle(color: grey, fontSize: 12),
          ),
          const SizedBox(height: 16),

          detailsBox(),
          const SizedBox(height: 14),

          label("YOUR LIVE SELFIE"),
          selfieBox(),
          const SizedBox(height: 10),

          whyRequiredBox(),
          const SizedBox(height: 10),

          nextButton(context),
          const SizedBox(height: 8),
          backButton(),
        ],
      ),
    );
  }

  Widget detailsBox() {
    return Container(
      padding: const EdgeInsets.fromLTRB(13, 11, 13, 10),
      decoration: BoxDecoration(
        color: const Color(0xfff7f9fb),
        borderRadius: BorderRadius.circular(9),
        border: Border.all(color: const Color(0xffd8e0e8)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Text(
                "YOUR DETAILS",
                style: TextStyle(
                  color: deep,
                  fontSize: 12,
                  letterSpacing: 3,
                  fontWeight: FontWeight.w900,
                ),
              ),
              Spacer(),
              Text(
                "AUTO",
                style: TextStyle(
                  color: green,
                  fontSize: 12,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 2,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          detailRow("Full name", "Suresh Sharma"),
          detailRow("Mobile", "+91 98765 XXXXX"),
          detailRow("DL number", "MH02-1998-0012345", greenText: true),
          const Divider(color: Color(0xffe1e7ee)),
          const Text(
            "These details will appear on the pass",
            style: TextStyle(color: grey, fontSize: 12),
          ),
        ],
      ),
    );
  }

  Widget detailRow(String left, String right, {bool greenText = false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Row(
        children: [
          Expanded(
            child: Text(
              left,
              style: const TextStyle(color: grey, fontSize: 13),
            ),
          ),
          Text(
            right,
            style: TextStyle(
              color: greenText ? green : const Color(0xff1f2933),
              fontSize: 13,
              fontWeight: FontWeight.w700,
            ),
          ),
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
          Icon(Icons.camera_alt, color: Colors.deepPurple, size: 24),
          SizedBox(height: 5),
          Text(
            "Take selfie via ROADCELL camera only",
            style: TextStyle(color: grey, fontSize: 13),
          ),
          SizedBox(height: 2),
          Text(
            "GPS + timestamp · No gallery uploads",
            style: TextStyle(
              color: Colors.orange,
              fontSize: 12,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }

  Widget whyRequiredBox() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(11),
      decoration: BoxDecoration(
        color: const Color(0xfff7f9fb),
        borderRadius: BorderRadius.circular(9),
        border: Border.all(color: const Color(0xffe1e7ee)),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "WHY REQUIRED",
            style: TextStyle(
              color: deep,
              fontSize: 13,
              letterSpacing: 3,
              fontWeight: FontWeight.w900,
            ),
          ),
          SizedBox(height: 7),
          Text(
            "Legal proof you gave permission · Police verification · Protects",
            style: TextStyle(color: grey, fontSize: 12),
          ),
          SizedBox(height: 3),
          Text(
            "you from false claims",
            style: TextStyle(color: grey, fontSize: 12),
          ),
        ],
      ),
    );
  }

  Widget nextButton(context) {
    return GestureDetector(
      onTap: () =>
          Navigator.pushReplacementNamed(context, MyRoutes.givePerm3Route),
      child: Container(
        height: 46,
        decoration: BoxDecoration(
          color: green,
          borderRadius: BorderRadius.circular(9),
          boxShadow: [
            BoxShadow(
              color: green.withOpacity(.25),
              blurRadius: 14,
              offset: const Offset(0, 7),
            ),
          ],
        ),
        child: const Center(
          child: Text(
            "NEXT — BORROWER DETAILS →",
            style: TextStyle(
              color: Colors.white,
              fontSize: 13,
              fontWeight: FontWeight.w900,
              letterSpacing: 2.5,
            ),
          ),
        ),
      ),
    );
  }

  Widget backButton() {
    return Container(
      height: 41,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(9),
        border: Border.all(color: const Color(0xffd8e0e8)),
      ),
      child: const Center(
        child: Text(
          "← BACK",
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
