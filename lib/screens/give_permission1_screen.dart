import 'package:flutter/material.dart';
import 'package:roadcell/utils/routes.dart';

class GivePermissionScreen extends StatelessWidget {
  const GivePermissionScreen({super.key});

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
      height: 52,
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
              bar(const Color(0xffd8e0e8)),
              const SizedBox(width: 4),
              bar(const Color(0xffd8e0e8)),
              const SizedBox(width: 4),
              bar(const Color(0xffd8e0e8)),
            ],
          ),
          const SizedBox(height: 5),
          const Text(
            "Step 1 of 4 — Select vehicle",
            style: TextStyle(color: grey, fontSize: 9),
          ),
        ],
      ),
    );
  }

  Widget bar(Color color) {
    return Expanded(child: Container(height: 3, color: color));
  }

  Widget formCard(context) {
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
            "Select vehicle",
            style: TextStyle(
              color: deep,
              fontSize: 20,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 4),
          const Text(
            "Choose from list or enter manually",
            style: TextStyle(color: grey, fontSize: 14),
          ),
          const SizedBox(height: 7),
          tabs(),
          const SizedBox(height: 18),
          vehicleCard(
            Icons.two_wheeler,
            "MH 02 AB 4521",
            "Honda Activa 6G",
            true,
          ),
          const SizedBox(height: 8),
          vehicleCard(
            Icons.directions_car,
            "MH 02 CD 8834",
            "Maruti Swift",
            false,
          ),
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
          label("LOCATION"),
          input(Icons.location_on, "Tap to detect GPS"),
          const SizedBox(height: 18),
          button(context),
        ],
      ),
    );
  }

  Widget tabs() {
    return Container(
      height: 40,
      padding: const EdgeInsets.all(3),
      decoration: BoxDecoration(
        color: const Color(0xfff1f4f7),
        borderRadius: BorderRadius.circular(9),
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(7),
              ),
              child: const Center(
                child: Text(
                  "My vehicles",
                  style: TextStyle(
                    color: deep,
                    fontSize: 14,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 2,
                  ),
                ),
              ),
            ),
          ),
          const Expanded(
            child: Center(
              child: Text(
                "Enter manually",
                style: TextStyle(
                  color: grey,
                  fontSize: 14,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 1,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget vehicleCard(IconData icon, String number, String name, bool selected) {
    return Container(
      height: 56,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(9),
        border: Border.all(color: selected ? deep : const Color(0xffd8e0e8)),
      ),
      child: Row(
        children: [
          Container(
            width: 38,
            height: 38,
            decoration: BoxDecoration(
              color: const Color(0xfff3f6f8),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: const Color(0xffd8e0e8)),
            ),
            child: Icon(icon, size: 25, color: Colors.redAccent),
          ),
          const SizedBox(width: 11),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  number,
                  style: const TextStyle(
                    color: deep,
                    fontSize: 14,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 1.5,
                  ),
                ),
                Text(
                  name,
                  style: const TextStyle(color: Colors.blueGrey, fontSize: 12),
                ),
              ],
            ),
          ),
          if (selected)
            const CircleAvatar(
              radius: 9,
              backgroundColor: deep,
              child: Icon(Icons.check, size: 12, color: Colors.white),
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

  Widget input(IconData icon, String hint) {
    return Container(
      height: 45,
      padding: const EdgeInsets.symmetric(horizontal: 13),
      decoration: BoxDecoration(
        color: const Color(0xfff3f6f8),
        borderRadius: BorderRadius.circular(9),
        border: Border.all(color: const Color(0xffd8e0e8)),
      ),
      child: Row(
        children: [
          Icon(icon, size: 25, color: const Color(0xffffcbd3)),
          const SizedBox(width: 10),
          Text(
            hint,
            style: const TextStyle(
              color: Color(0xffb9c4d0),
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget button(context) {
    return GestureDetector(
      onTap: () =>
          Navigator.pushReplacementNamed(context, MyRoutes.givePerm2Route),
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
            "NEXT — YOUR SELFIE →",
            style: TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.w900,
              letterSpacing: 3,
            ),
          ),
        ),
      ),
    );
  }
}
