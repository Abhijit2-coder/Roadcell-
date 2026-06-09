import 'package:flutter/material.dart';
import 'package:roadcell/utils/routes.dart';

class GivePermissionRequestScreen extends StatelessWidget {
  const GivePermissionRequestScreen({super.key});

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
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 18),
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
      height: 49,
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

  Widget mainCard(context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(14, 28, 14, 14),
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
            "Permission request",
            style: TextStyle(
              color: deep,
              fontSize: 16,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 4),
          const Text(
            "Suresh Sharma wants to give you\npermission to use their vehicle",
            textAlign: TextAlign.center,
            style: TextStyle(color: grey, fontSize: 12, height: 1.4),
          ),
          const SizedBox(height: 14),

          detailsBox(),
          const SizedBox(height: 12),

          passDetailsBox(),
          const SizedBox(height: 12),

          acceptButton(context),
          const SizedBox(height: 8),
          rejectButton(),
          const SizedBox(height: 8),

          const Text(
            "Request expires in 30:00 minutes",
            style: TextStyle(color: Color(0xffb3c0ce), fontSize: 9),
          ),
        ],
      ),
    );
  }

  Widget detailsBox() {
    return Container(
      padding: const EdgeInsets.all(11),
      decoration: BoxDecoration(
        color: const Color(0xfff3f6f8),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          detailRow("Vehicle", "MH 02 AB 4521"),
          detailRow("Model", "Honda Activa 6G"),
          detailRow("Owner", "Suresh Sharma"),
          detailRow("Purpose", "Personal use"),
          detailRow("Time", "10:00 AM → 11:59 PM"),
          detailRow("Fee (you pay)", "₹10 only", greenText: true),
        ],
      ),
    );
  }

  Widget passDetailsBox() {
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
                "YOUR DETAILS ON PASS",
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
                  backgroundColor: Color(0xffeaf8ee),
                  fontSize: 12,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 2,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          detailRow("Name", "Rahul Sharma"),
          detailRow("DL number", "MH02-2019-0043812", greenText: true),
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

  Widget acceptButton(context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushReplacementNamed(context, MyRoutes.givePerm5Route);
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
            "✓ ACCEPT — TAKE SELFIE & PAY",
            style: TextStyle(
              color: Colors.white,
              fontSize: 13,
              fontWeight: FontWeight.w900,
              letterSpacing: 2.4,
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
