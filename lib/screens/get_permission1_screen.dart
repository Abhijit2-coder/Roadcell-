import 'package:flutter/material.dart';
import 'package:roadcell/utils/routes.dart';

class GetPermissionScreen extends StatelessWidget {
  const GetPermissionScreen({super.key});

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
                child: formCard(context),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget topBar() {
    return Container(
      height: 43,
      color: navy,
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: const Row(
        children: [
          Icon(Icons.arrow_back, color: Color(0xffb8c7d6), size: 18),
          SizedBox(width: 12),
          Text(
            "Get permission",
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
    return Container(
      color: bg,
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            children: [
              bar(navy),
              const SizedBox(width: 4),
              bar(const Color(0xffd8e0e8)),
              const SizedBox(width: 4),
              bar(const Color(0xffd8e0e8)),
              const SizedBox(width: 4),
              bar(const Color(0xffd8e0e8)),
            ],
          ),
          const SizedBox(height: 4),
          const Text(
            "Step 1 of 4 — Vehicle details",
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

  Widget formCard(BuildContext context) {
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
            "Vehicle details",
            style: TextStyle(
              color: deep,
              fontSize: 18,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 3),
          const Text(
            "Enter vehicle you want to borrow",
            style: TextStyle(color: grey, fontSize: 11),
          ),
          const SizedBox(height: 16),

          label("VEHICLE RC NUMBER"),
          input(Icons.directions_car, "e.g. MH 02 AB 4521", active: true),
          const SizedBox(height: 12),

          label("OWNER'S MOBILE NUMBER"),
          mobileInput(),
          const SizedBox(height: 12),

          ownerFound(),
          const SizedBox(height: 12),

          label("PURPOSE OF USE"),
          input(Icons.edit_note, "Personal / Emergency / Office"),
          const SizedBox(height: 12),

          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    label("START TIME"),
                    input(Icons.alarm, "10:00 AM"),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [label("END TIME"), input(Icons.alarm, "11:59 PM")],
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),
          label("PICKUP LOCATION"),
          input(Icons.location_on, "Tap to detect GPS"),
          const SizedBox(height: 18),

          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, MyRoutes.getPerm2Route);
            },
            child: sendButton(),
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

  Widget input(IconData icon, String hint, {bool active = false}) {
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
          Icon(icon, size: 16, color: const Color(0xffffcbd3)),
          const SizedBox(width: 10),
          Text(
            hint,
            style: const TextStyle(
              color: Color(0xffb9c4d0),
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget mobileInput() {
    return Container(
      height: 40,
      padding: const EdgeInsets.symmetric(horizontal: 13),
      decoration: BoxDecoration(
        color: const Color(0xfff3f6f8),
        borderRadius: BorderRadius.circular(9),
        border: Border.all(color: const Color(0xffd8e0e8)),
      ),
      child: const Row(
        children: [
          Icon(Icons.phone_android, size: 16, color: Color(0xffb9c4d0)),
          SizedBox(width: 10),
          Text(
            "+91",
            style: TextStyle(
              color: deep,
              fontSize: 12,
              fontWeight: FontWeight.w900,
            ),
          ),
          SizedBox(width: 12),
          VerticalDivider(color: Color(0xffd8e0e8)),
          SizedBox(width: 8),
          Text(
            "Owner's number",
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

  Widget ownerFound() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 10),
      decoration: BoxDecoration(
        color: const Color(0xfff0fbf3),
        borderRadius: BorderRadius.circular(9),
        border: Border.all(color: const Color(0xffccefd5)),
      ),
      child: const Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.circle, color: green, size: 7),
          SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Owner found ✓",
                  style: TextStyle(
                    color: green,
                    fontSize: 11,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                SizedBox(height: 2),
                Text(
                  "Suresh Sharma · MH 02 AB 4521 · Honda Activa",
                  style: TextStyle(color: grey, fontSize: 9),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget sendButton() {
    return Container(
      height: 47,
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
          "SEND REQUEST →",
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
