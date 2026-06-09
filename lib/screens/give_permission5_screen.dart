import 'package:flutter/material.dart';
import 'package:roadcell/utils/routes.dart';

class GivePermissionPaymentScreen extends StatelessWidget {
  const GivePermissionPaymentScreen({super.key});

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
      height: 55,
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
              bar(navy),
            ],
          ),
          const SizedBox(height: 5),
          const Text(
            "Step 4 of 4 — Selfie + payment",
            style: TextStyle(color: grey, fontSize: 9),
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
          const SizedBox(height: 14),

          label("YOUR LIVE SELFIE"),
          selfieBox(),
          const SizedBox(height: 12),

          feeBox(),
          const SizedBox(height: 12),

          paymentOption(
            Icons.phone_android,
            "UPI",
            "GPay, PhonePe, Paytm",
            true,
          ),
          paymentOption(Icons.qr_code_2, "Scan QR code", "Any UPI app", false),
          paymentOption(
            Icons.credit_card,
            "Debit / credit card",
            "Visa, Mastercard, RuPay",
            false,
          ),
          paymentOption(
            Icons.account_balance,
            "Net banking",
            "All major banks",
            false,
          ),

          const SizedBox(height: 14),
          payButton(context),
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
                "Request accepted ✓",
                style: TextStyle(
                  color: green,
                  fontSize: 15,
                  fontWeight: FontWeight.w900,
                ),
              ),
              SizedBox(height: 2),
              Text(
                "Now take selfie and pay ₹10",
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
            "GPS + timestamp auto-added · No gallery",
            style: TextStyle(
              color: Colors.orange,
              fontSize: 11,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }

  Widget feeBox() {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xfff0fbf3),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color(0xffbfe9c9)),
      ),
      child: const Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Processing fee",
                  style: TextStyle(color: grey, fontSize: 13),
                ),
                Text(
                  "₹10",
                  style: TextStyle(
                    color: green,
                    fontSize: 24,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                Text(
                  "— Road Department, Govt. of India",
                  style: TextStyle(color: grey, fontSize: 12),
                ),
              ],
            ),
          ),
          Icon(Icons.account_balance, color: Colors.deepPurple, size: 30),
        ],
      ),
    );
  }

  Widget paymentOption(
    IconData icon,
    String title,
    String subtitle,
    bool selected,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 13),
      decoration: BoxDecoration(
        color: const Color(0xfff7f9fb),
        borderRadius: BorderRadius.circular(9),
        border: Border.all(color: selected ? deep : const Color(0xffd8e0e8)),
      ),
      child: Row(
        children: [
          Icon(icon, color: selected ? Colors.deepPurple : grey, size: 30),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Color(0xff1f2933),
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  subtitle,
                  style: const TextStyle(color: grey, fontSize: 12),
                ),
              ],
            ),
          ),
          Icon(
            selected ? Icons.radio_button_checked : Icons.radio_button_off,
            color: selected ? deep : const Color(0xffcfd8e3),
          ),
        ],
      ),
    );
  }

  Widget payButton(context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushReplacementNamed(context, MyRoutes.generatePassRoute);
      },
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
            "PAY ₹10 & GENERATE PASS",
            style: TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.w900,
              letterSpacing: 2.2,
            ),
          ),
        ),
      ),
    );
  }
}
