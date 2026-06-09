import 'package:flutter/material.dart';

class PassPdfPreviewScreen extends StatelessWidget {
  const PassPdfPreviewScreen({super.key});

  static const navy = Color(0xff1f4566);
  static const deep = Color(0xff0b2d4a);
  static const bg = Color(0xfff6f8fb);
  static const green = Color(0xff2fa84f);
  static const grey = Color(0xff91a4b8);
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
                padding: const EdgeInsets.fromLTRB(11, 12, 11, 18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    pdfCard(),
                    const SizedBox(height: 18),
                    sectionTitle("DOWNLOAD OPTIONS"),
                    const SizedBox(height: 8),
                    option(Icons.description, "Download as PDF",
                        "Save to your phone storage", true),
                    option(Icons.ios_share, "Share pass",
                        "WhatsApp, Email, etc.", false),
                    option(Icons.print, "Print", "Print physical copy", false),
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
      height: 42,
      color: navy,
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: Row(
        children: [
          const Icon(Icons.arrow_back, color: Color(0xffb8c7d6), size: 18),
          const SizedBox(width: 25),
          const Text(
            "Pass — PDF preview",
            style: TextStyle(
              color: Colors.white,
              fontSize: 17,
              fontWeight: FontWeight.w900,
            ),
          ),
          const Spacer(),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 5),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(.18),
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: Colors.white.withOpacity(.3)),
            ),
            child: const Row(
              children: [
                Icon(Icons.download, color: Colors.white, size: 13),
                SizedBox(width: 3),
                Text(
                  "Download",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget pdfCard() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: const Color(0xffd8e0e8)),
      ),
      child: Column(
        children: [
          Container(
            height: 39,
            padding: const EdgeInsets.symmetric(horizontal: 13),
            decoration: const BoxDecoration(
              color: navy,
              borderRadius: BorderRadius.vertical(top: Radius.circular(6)),
            ),
            child: const Row(
              children: [
                Text(
                  "ROAD",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 3,
                    fontSize: 13,
                  ),
                ),
                Text(
                  "CELL",
                  style: TextStyle(
                    color: Color(0xff59e987),
                    fontWeight: FontWeight.w900,
                    letterSpacing: 2,
                    fontSize: 13,
                  ),
                ),
                Spacer(),
                Text(
                  "PASS ID : RC2026031800124",
                  style: TextStyle(
                    color: Color(0xff8fa1b6),
                    fontSize: 8,
                    letterSpacing: 1.3,
                  ),
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(13),
            child: Column(
              children: [
                statusRow(),
                const SizedBox(height: 12),
                const Text(
                  "MH 02 AB 4521",
                  style: TextStyle(
                    color: deep,
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 4,
                  ),
                ),
                const Text(
                  "Honda Activa 6G · 2021 · Maharashtra",
                  style: TextStyle(color: grey, fontSize: 9),
                ),
                const SizedBox(height: 9),
                const Divider(color: Color(0xffd8e0e8)),
                const SizedBox(height: 7),

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
                    const SizedBox(width: 7),
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

                const SizedBox(height: 9),
                Row(
                  children: [
                    smallBox("From", "10:00 AM", deep),
                    const SizedBox(width: 6),
                    smallBox("Until", "11:59 PM", Colors.orange),
                    const SizedBox(width: 6),
                    smallBox("Purpose", "Personal", deep),
                  ],
                ),

                const SizedBox(height: 10),
                detailBox(),
                const SizedBox(height: 10),
                qrSection(),
              ],
            ),
          ),

          Container(
            height: 25,
            padding: const EdgeInsets.symmetric(horizontal: 13),
            color: const Color(0xfff3f6f8),
            child: const Row(
              children: [
                Text(
                  "ROADCELL · Road Dept. India",
                  style: TextStyle(color: grey, fontSize: 8),
                ),
                Spacer(),
                Text(
                  "Expires: 11:59 PM today",
                  style: TextStyle(
                    color: red,
                    fontSize: 8,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget statusRow() {
    return Container(
      height: 25,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: const Color(0xfff0fbf3),
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: const Color(0xffccefd5)),
      ),
      child: const Row(
        children: [
          Icon(Icons.circle, color: green, size: 7),
          SizedBox(width: 7),
          Text(
            "Valid pass — Active",
            style: TextStyle(
              color: green,
              fontSize: 10,
              fontWeight: FontWeight.w900,
            ),
          ),
          Spacer(),
          Text("18 Mar 2026", style: TextStyle(color: grey, fontSize: 8)),
        ],
      ),
    );
  }

  Widget personBox(String label, String name, String phone, String dl) {
    return Container(
      padding: const EdgeInsets.all(9),
      decoration: BoxDecoration(
        color: const Color(0xfff8fafc),
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: const Color(0xffd8e0e8)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label,
              style: const TextStyle(
                  color: grey, fontSize: 8, letterSpacing: 3)),
          const SizedBox(height: 7),
          const CircleAvatar(
            radius: 16,
            backgroundColor: Color(0xffe4e9ef),
            child: Icon(Icons.person, color: Colors.deepPurple, size: 20),
          ),
          const SizedBox(height: 5),
          Text(name,
              style: const TextStyle(
                  color: deep, fontSize: 11, fontWeight: FontWeight.w900)),
          Text(phone, style: const TextStyle(color: grey, fontSize: 8)),
          const Text("Driving Licence",
              style: TextStyle(color: grey, fontSize: 8)),
          Text(dl,
              style: const TextStyle(
                  color: green, fontSize: 8, fontWeight: FontWeight.w700)),
        ],
      ),
    );
  }

  Widget smallBox(String label, String value, Color color) {
    return Expanded(
      child: Container(
        height: 42,
        decoration: BoxDecoration(
          color: const Color(0xfff3f6f8),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(label, style: const TextStyle(color: grey, fontSize: 8)),
            Text(value,
                style: TextStyle(
                    color: color, fontSize: 10, fontWeight: FontWeight.w900)),
          ],
        ),
      ),
    );
  }

  Widget detailBox() {
    return Container(
      padding: const EdgeInsets.all(9),
      decoration: BoxDecoration(
        color: const Color(0xfff3f6f8),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        children: [
          detailRow("Transaction ID", "RC2026031800124"),
          detailRow("Date", "18 Mar 2026"),
          detailRow("Amount paid", "₹10 ✓ by Rahul Sharma", greenText: true),
          detailRow("Location", "Andheri West, Mumbai"),
        ],
      ),
    );
  }

  Widget detailRow(String left, String right, {bool greenText = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 1.5),
      child: Row(
        children: [
          Text(left, style: const TextStyle(color: grey, fontSize: 8)),
          const Spacer(),
          Text(
            right,
            style: TextStyle(
              color: greenText ? green : deep,
              fontSize: 8,
              fontWeight: FontWeight.w800,
            ),
          ),
        ],
      ),
    );
  }

  Widget qrSection() {
    return Row(
      children: [
        const Icon(Icons.qr_code_2, size: 75, color: deep),
        const SizedBox(width: 10),
        Expanded(
          child: RichText(
            text: const TextSpan(
              children: [
                TextSpan(
                  text: "Police verification QR\n",
                  style: TextStyle(
                    color: deep,
                    fontSize: 11,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                TextSpan(
                  text:
                      "Scan to instantly verify pass details, owner & borrower identity",
                  style: TextStyle(color: grey, fontSize: 9, height: 1.4),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget sectionTitle(String text) {
    return Text(
      text,
      style: const TextStyle(
        color: grey,
        fontSize: 9,
        letterSpacing: 5,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  Widget option(IconData icon, String title, String sub, bool active) {
    return Container(
      height: 52,
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.symmetric(horizontal: 14),
      decoration: BoxDecoration(
        color: active ? deep : Colors.white,
        borderRadius: BorderRadius.circular(9),
        border: Border.all(color: active ? deep : const Color(0xffd8e0e8)),
      ),
      child: Row(
        children: [
          Icon(icon, color: active ? Colors.white70 : Colors.deepPurple),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: active ? Colors.white : deep,
                    fontSize: 12,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                Text(
                  sub,
                  style: TextStyle(
                    color: active ? Colors.white54 : grey,
                    fontSize: 9,
                  ),
                ),
              ],
            ),
          ),
          Icon(
            active ? Icons.download : Icons.chevron_right,
            color: active ? const Color(0xff59e987) : deep,
            size: 18,
          ),
        ],
      ),
    );
  }
}