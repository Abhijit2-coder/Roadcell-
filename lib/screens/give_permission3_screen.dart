import 'package:flutter/material.dart';
import 'package:roadcell/utils/routes.dart';

class BorrowerDetailsScreen extends StatelessWidget {
  const BorrowerDetailsScreen({super.key});

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
                padding: const EdgeInsets.fromLTRB(11, 12, 11, 18),
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
      height: 47,
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
              bar(navy),
              const SizedBox(width: 4),
              bar(const Color(0xffd8e0e8)),
            ],
          ),
          const SizedBox(height: 5),
          const Text(
            "Step 3 of 4 — Borrower details",
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
          successBox(),
          const SizedBox(height: 15),
          const Text(
            "Who are you giving to?",
            style: TextStyle(
              color: deep,
              fontSize: 18,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 3),
          const Text(
            "Enter borrower's mobile number",
            style: TextStyle(color: grey, fontSize: 12),
          ),
          const SizedBox(height: 16),

          label("BORROWER'S MOBILE NUMBER"),
          mobileInput(),
          const SizedBox(height: 12),

          userFoundBox(),
          const SizedBox(height: 12),

          previewBox(),
          const SizedBox(height: 14),

          submitButton(context),
          const SizedBox(height: 8),
          backButton(),
        ],
      ),
    );
  }

  Widget successBox() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 10),
      decoration: BoxDecoration(
        color: const Color(0xfff0fbf3),
        borderRadius: BorderRadius.circular(9),
        border: Border.all(color: const Color(0xffccefd5)),
      ),
      child: const Row(
        children: [
          Icon(Icons.circle, color: green, size: 20),
          SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Your selfie submitted ✓",
                style: TextStyle(
                  color: green,
                  fontSize: 15,
                  fontWeight: FontWeight.w900,
                ),
              ),
              SizedBox(height: 2),
              Text(
                "GPS + timestamp verified",
                style: TextStyle(color: grey, fontSize: 13),
              ),
            ],
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
          fontSize: 12,
          letterSpacing: 3,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }

  Widget mobileInput() {
    return Container(
      height: 40,
      padding: const EdgeInsets.symmetric(horizontal: 13),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(9),
        border: Border.all(color: deep),
      ),
      child: const Row(
        children: [
          Icon(Icons.phone_android, size: 25, color: Color(0xffb9c4d0)),
          SizedBox(width: 10),
          Text(
            "+91",
            style: TextStyle(
              color: deep,
              fontSize: 15,
              fontWeight: FontWeight.w900,
            ),
          ),
          SizedBox(width: 12),
          VerticalDivider(color: Color(0xffd8e0e8)),
          SizedBox(width: 8),
          Text(
            "Borrower's number",
            style: TextStyle(
              color: Color(0xffb9c4d0),
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget userFoundBox() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 10),
      decoration: BoxDecoration(
        color: const Color(0xfff0fbf3),
        borderRadius: BorderRadius.circular(9),
        border: Border.all(color: const Color(0xffccefd5)),
      ),
      child: const Row(
        children: [
          Icon(Icons.circle, color: green, size: 20),
          SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "User found ✓",
                style: TextStyle(
                  color: green,
                  fontSize: 15,
                  fontWeight: FontWeight.w900,
                ),
              ),
              SizedBox(height: 2),
              Text(
                "Rahul Sharma · ROADCELL verified user",
                style: TextStyle(color: grey, fontSize: 13),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget previewBox() {
    return Container(
      padding: const EdgeInsets.fromLTRB(13, 11, 13, 10),
      decoration: BoxDecoration(
        color: const Color(0xfff7f9fb),
        borderRadius: BorderRadius.circular(9),
        border: Border.all(color: const Color(0xffd8e0e8)),
      ),
      child: Column(
        children: [
          const Row(
            children: [
              Text(
                "BORROWER PREVIEW",
                style: TextStyle(
                  color: deep,
                  fontSize: 12,
                  letterSpacing: 3,
                  fontWeight: FontWeight.w900,
                ),
              ),
              Spacer(),
              Text(
                "FROM ACCOUNT",
                style: TextStyle(
                  color: deep,
                  backgroundColor: Color(0xffe8eef4),
                  fontSize: 11,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 2,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          detailRow("Name", "Rahul Sharma"),
          detailRow("Mobile", "+91 87654 XXXXX"),
          detailRow("DL number", "MH02-2019-0043812", greenText: true),
          const Divider(color: Color(0xffe1e7ee)),
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Will appear on pass after borrower confirms",
              style: TextStyle(color: grey, fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }

  static Widget detailRow(String left, String right, {bool greenText = false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Row(
        children: [
          Expanded(
            child: Text(
              left,
              style: const TextStyle(
                color: grey,
                fontSize: 13,
                fontWeight: FontWeight.w700,
              ),
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

  Widget submitButton(context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushReplacementNamed(context, MyRoutes.givePerm4Route);
      },
      child: Container(
        height: 45,
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
            "SUBMIT — NOTIFY BORROWER",
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
