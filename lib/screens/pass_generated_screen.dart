import 'package:flutter/material.dart';
import 'package:roadcell/utils/routes.dart';

class PassGeneratedScreen extends StatelessWidget {
  const PassGeneratedScreen({super.key});

  static const navy = Color(0xff1f4566);
  static const deep = Color(0xff0b2d4a);
  static const bg = Color(0xfff6f8fb);
  static const green = Color(0xff2fa84f);
  static const grey = Color(0xff91a4b8);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bg,
      body: SafeArea(
        child: Column(
          children: [
            topBar(context),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(10, 12, 10, 18),
                child: Column(
                  children: [
                    passCard(),
                    const SizedBox(height: 10),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacementNamed(
                          context,
                          MyRoutes.passPdfPreviewRoute,
                        );
                      },
                      child: button("DOWNLOAD PDF", green, Colors.white),
                    ),
                    const SizedBox(height: 8),
                    button("SHARE PASS", Colors.white, grey, border: true),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget topBar(context) {
    return Container(
      height: 53,
      color: navy,
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: Row(
        children: [
          getbck(context),
          SizedBox(width: 12),
          Text(
            "Pass generated",
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

  Widget getbck(context) {
    return GestureDetector(
      onTap: () => Navigator.pushReplacementNamed(context, MyRoutes.homeRoute),
      child: Container(
        height: 35,
        width: 35,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(.06),
          borderRadius: BorderRadius.circular(6),
        ),
        child: const Icon(Icons.arrow_back, color: Color(0xffb8c7d6), size: 18),
      ),
    );
  }

  Widget passCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: deep,
        borderRadius: BorderRadius.circular(14),
        gradient: const LinearGradient(
          colors: [Color(0xff1f4566), Color(0xff062c18)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        children: [
          Container(
            width: 28,
            height: 28,
            decoration: BoxDecoration(
              color: Colors.greenAccent,
              borderRadius: BorderRadius.circular(3),
            ),
            child: const Icon(Icons.check, color: Colors.white, size: 24),
          ),
          const SizedBox(height: 9),
          const Text(
            "Pass generated",
            style: TextStyle(
              color: Color(0xff59e987),
              fontSize: 16,
              fontWeight: FontWeight.w900,
              letterSpacing: 3,
            ),
          ),
          const Text(
            "ROADCELL · ROAD DEPT · INDIA",
            style: TextStyle(
              color: Color(0xff6f879b),
              fontSize: 11,
              letterSpacing: 3,
            ),
          ),
          const SizedBox(height: 10),
          Divider(color: Colors.white.withOpacity(.08)),
          const SizedBox(height: 8),
          const Text(
            "MH 02 AB 4521",
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.w900,
              letterSpacing: 4,
            ),
          ),
          const Text(
            "Honda Activa 6G · 2021 · Maharashtra",
            style: TextStyle(color: Color(0xff8fa1b6), fontSize: 11),
          ),
          const SizedBox(height: 12),

          Row(
            children: [
              Expanded(
                child: personBox(
                  "OWNER",
                  "Suresh Sharma",
                  "+91 98765 XXXXX",
                  "MH02-1998-0012345",
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: personBox(
                  "BORROWER",
                  "Rahul Sharma",
                  "+91 87654 XXXXX",
                  "MH02-2019-0043812",
                ),
              ),
            ],
          ),

          const SizedBox(height: 10),
          Row(
            children: [
              miniBox("Valid from", "10:00 AM", Colors.white),
              const SizedBox(width: 6),
              miniBox("Valid until", "11:59 PM", Colors.amber),
              const SizedBox(width: 6),
              miniBox("Purpose", "Personal", Colors.white),
            ],
          ),

          const SizedBox(height: 10),
          Divider(color: Colors.white.withOpacity(.08)),

          detailRow("Transaction ID", "RC2026031800124"),
          detailRow("Date", "18 Mar 2026"),
          detailRow("Amount paid", "₹10 ✓ by Rahul Sharma", greenText: true),

          const SizedBox(height: 14),
          qrBox(),
          const SizedBox(height: 10),
          const Text(
            "Valid: 18 Mar 2026 · 10:00 AM – 11:59 PM only",
            style: TextStyle(color: Color(0xff7890a6), fontSize: 12),
          ),
        ],
      ),
    );
  }

  Widget personBox(String label, String name, String phone, String dl) {
    return Container(
      padding: const EdgeInsets.all(9),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(.06),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.white.withOpacity(.08)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              color: Color(0xff6f879b),
              fontSize: 11,
              letterSpacing: 3,
            ),
          ),
          const SizedBox(height: 8),
          const CircleAvatar(
            radius: 20,
            backgroundColor: Color(0xff385873),
            child: Icon(Icons.person, color: Colors.deepPurple, size: 30),
          ),
          const SizedBox(height: 6),
          Text(
            name,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.w900,
            ),
          ),
          Text(
            phone,
            style: const TextStyle(color: Color(0xff8fa1b6), fontSize: 12),
          ),
          const Text(
            "DL number",
            style: TextStyle(color: Color(0xff8fa1b6), fontSize: 12),
          ),
          Text(
            dl,
            style: const TextStyle(color: Color(0xff59e987), fontSize: 12),
          ),
        ],
      ),
    );
  }

  Widget miniBox(String label, String value, Color color) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(.06),
          borderRadius: BorderRadius.circular(7),
        ),
        child: Column(
          children: [
            Text(
              label,
              style: const TextStyle(color: Color(0xff8fa1b6), fontSize: 13),
            ),
            Text(
              value,
              style: TextStyle(
                color: color,
                fontSize: 12,
                fontWeight: FontWeight.w900,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget detailRow(String left, String right, {bool greenText = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        children: [
          Text(
            left,
            style: const TextStyle(color: Color(0xff8fa1b6), fontSize: 13),
          ),
          const Spacer(),
          Text(
            right,
            style: TextStyle(
              color: greenText ? const Color(0xff59e987) : Colors.white70,
              fontSize: 13,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }

  Widget qrBox() {
    return Container(
      width: double.infinity,
      height: 105,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.qr_code_2, size: 72, color: deep),
          Text(
            "SCAN TO VERIFY · POLICE USE ONLY",
            style: TextStyle(
              color: grey,
              fontSize: 12,
              letterSpacing: 3,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }

  Widget button(String text, Color bg, Color color, {bool border = false}) {
    return Container(
      height: 45,
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(9),
        border: border ? Border.all(color: const Color(0xffd8e0e8)) : null,
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            color: color,
            fontSize: 13,
            fontWeight: FontWeight.w900,
            letterSpacing: 3,
          ),
        ),
      ),
    );
  }
}
