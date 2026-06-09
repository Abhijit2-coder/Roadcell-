import 'package:flutter/material.dart';
import 'package:roadcell/utils/routes.dart';

class RequestSentScreen extends StatefulWidget {
  const RequestSentScreen({super.key});

  static const navy = Color(0xff1f4566);
  static const deep = Color(0xff143a5b);
  static const bg = Color(0xfff6f8fb);
  static const grey = Color(0xff91a4b8);
  static const red = Color(0xffdf3044);

  @override
  State<RequestSentScreen> createState() => _RequestSentScreenState();
}

class _RequestSentScreenState extends State<RequestSentScreen> {

  @override
  initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushReplacementNamed(context, MyRoutes.getPerm3Route);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: RequestSentScreen.bg,
      body: SafeArea(
        child: Column(
          children: [
            topBar(),
            progress(),
            Expanded(
              child: Padding(padding: const EdgeInsets.all(10), child: card()),
            ),
          ],
        ),
      ),
    );
  }

  Widget topBar() {
    return Container(
      height: 45,
      color: RequestSentScreen.navy,
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
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            children: [
              bar(RequestSentScreen.navy),
              const SizedBox(width: 4),
              bar(RequestSentScreen.navy),
              const SizedBox(width: 4),
              bar(const Color(0xffd8e0e8)),
              const SizedBox(width: 4),
              bar(const Color(0xffd8e0e8)),
            ],
          ),
          const SizedBox(height: 4),
          const Text(
            "Step 2 of 4 — Waiting for owner",
            style: TextStyle(color: RequestSentScreen.grey, fontSize: 13),
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

  Widget card() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xffd8e0e8)),
      ),
      child: Column(
        children: [
          const SizedBox(height: 10),
          const Icon(Icons.hourglass_top, size: 48, color: Colors.orange),
          const SizedBox(height: 12),
          const Text(
            "Request sent!",
            style: TextStyle(
              color: RequestSentScreen.deep,
              fontSize: 20,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 6),
          const Text(
            "Notification sent to Suresh Sharma.\nWaiting for owner to respond.",
            textAlign: TextAlign.center,
            style: TextStyle(color: RequestSentScreen.grey, fontSize: 13),
          ),
          const SizedBox(height: 16),

          details(),

          const SizedBox(height: 12),

          notifyBox(),
        ],
      ),
    );
  }

  Widget details() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xfff3f6f8),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          row("Vehicle", "MH 02 AB 4521"),
          row("Owner", "Suresh Sharma"),
          row("Purpose", "Personal"),
          row("Time", "10:00 AM — 11:59 PM"),
          row("Expires in", "28:45", highlight: true),
        ],
      ),
    );
  }

  Widget row(String label, String value, {bool highlight = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Row(
        children: [
          Expanded(
            child: Text(
              label,
              style: const TextStyle(
                color: RequestSentScreen.grey,
                fontSize: 13,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Text(
            value,
            style: TextStyle(
              color: highlight ? RequestSentScreen.red : RequestSentScreen.deep,
              fontSize: 13,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }

  Widget notifyBox() {
    return Container(
      height: 70,
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xfff7f9fb),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color(0xffe1e7ee)),
      ),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.notifications, color: Colors.orange, size: 35),
          SizedBox(height: 5),
          Text(
            "You'll be notified when owner responds",
            style: TextStyle(color: RequestSentScreen.grey, fontSize: 13),
          ),
        ],
      ),
    );
  }
}
