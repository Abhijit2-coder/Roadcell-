import 'package:flutter/material.dart';
import 'package:roadcell/utils/routes.dart';

class NoHelmetReportScreen extends StatefulWidget {
  const NoHelmetReportScreen({super.key});

  @override
  State<NoHelmetReportScreen> createState() => _NoHelmetReportScreenState();
}

class _NoHelmetReportScreenState extends State<NoHelmetReportScreen> {
  static const red = Color(0xffdf3044);
  static const darkRed = Color(0xffc51f34);
  static const deep = Color(0xff143a5b);
  static const bg = Color(0xfff6f8fb);
  static const grey = Color(0xff91a4b8);
  static const green = Color(0xff23a847);

  final TextEditingController _vehicleController = TextEditingController();
  String? _proofFileName;
  bool _isSubmitting = false;

  @override
  void dispose() {
    _vehicleController.dispose();
    super.dispose();
  }

  void _pickProof() {
    // Simulate picking a file (replace with real file picker in production)
    setState(() {
      _proofFileName = "photo_${DateTime.now().millisecondsSinceEpoch}.jpg";
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Photo captured! GPS & timestamp added."),
        backgroundColor: Colors.deepPurple,
        duration: Duration(seconds: 2),
      ),
    );
  }

  void _removeProof() {
    setState(() {
      _proofFileName = null;
    });
  }

  void _submitReport() async {
    final vehicle = _vehicleController.text.trim();

    if (_proofFileName == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Please upload a photo or video proof."),
          backgroundColor: Colors.orange,
        ),
      );
      return;
    }

    if (vehicle.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Please enter the vehicle number."),
          backgroundColor: Colors.orange,
        ),
      );
      return;
    }

    setState(() => _isSubmitting = true);

    // Simulate network delay
    await Future.delayed(const Duration(seconds: 2));

    setState(() => _isSubmitting = false);

    if (!mounted) return;

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        title: const Row(
          children: [
            Icon(Icons.check_circle, color: green, size: 26),
            SizedBox(width: 8),
            Text(
              "Report Submitted",
              style: TextStyle(color: deep, fontSize: 17),
            ),
          ],
        ),
        content: Text(
          "Your report for vehicle $vehicle has been submitted. "
          "The traffic department will review it shortly.",
          style: const TextStyle(color: grey, fontSize: 13),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              _vehicleController.clear();
              setState(() => _proofFileName = null);
            },
            child: const Text(
              "OK",
              style: TextStyle(color: darkRed, fontWeight: FontWeight.w900),
            ),
          ),
        ],
      ),
    );
  }

  void _cancel() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        title: const Text("Cancel Report?", style: TextStyle(color: deep)),
        content: const Text(
          "Are you sure you want to cancel? Your progress will be lost.",
          style: TextStyle(color: grey, fontSize: 13),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("No", style: TextStyle(color: grey)),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              _vehicleController.clear();
              setState(() => _proofFileName = null);
            },
            child: GestureDetector(
              onTap: () =>
                  Navigator.pushReplacementNamed(context, MyRoutes.homeRoute),
              child: Text(
                "Yes, Cancel",
                style: TextStyle(color: darkRed, fontWeight: FontWeight.w900),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bg,
      body: SafeArea(
        child: Column(
          children: [
            _topBar(),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(11, 12, 11, 18),
                child: Column(
                  children: [
                    _violationHeader(),
                    const SizedBox(height: 12),
                    _formCard(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _topBar() {
    return Container(
      height: 78,
      color: red,
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: Row(
        children: [
          GestureDetector(
            onTap: _cancel,
            child: const Icon(
              Icons.arrow_back,
              color: Colors.white70,
              size: 18,
            ),
          ),
          const SizedBox(width: 12),
          const Text(
            "No helmet",
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

  Widget _violationHeader() {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xfffff1f3),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color(0xffffcbd3)),
      ),
      child: Row(
        children: [
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
            ),
            child: const Icon(Icons.sports_motorsports, color: red, size: 28),
          ),
          const SizedBox(width: 14),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "No helmet",
                  style: TextStyle(
                    color: red,
                    fontSize: 16,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                SizedBox(height: 2),
                Text(
                  "2-wheeler rider without helmet",
                  style: TextStyle(color: grey, fontSize: 10),
                ),
              ],
            ),
          ),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "₹1,000",
                style: TextStyle(
                  color: red,
                  fontSize: 15,
                  fontWeight: FontWeight.w900,
                ),
              ),
              SizedBox(height: 2),
              Text("Fine amount", style: TextStyle(color: grey, fontSize: 10)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _formCard() {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(13),
        border: Border.all(color: const Color(0xffd8e0e8)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.05),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Upload proof",
            style: TextStyle(
              color: deep,
              fontSize: 18,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 3),
          const Text(
            "Photo or video required",
            style: TextStyle(color: grey, fontSize: 11),
          ),
          const SizedBox(height: 18),

          _label("PHOTO / VIDEO PROOF"),
          _uploadBox(),
          const SizedBox(height: 12),

          _label("VEHICLE NUMBER"),
          _vehicleInputBox(),
          const SizedBox(height: 12),

          _label("LOCATION"),
          _staticInputBox(Icons.location_on, "Auto-detected"),
          const SizedBox(height: 12),

          _label("DATE & TIME"),
          _dateBox(),
          const SizedBox(height: 12),

          _howItWorks(),
          const SizedBox(height: 12),

          _submitButton(),
          const SizedBox(height: 8),
          _cancelButton(),
        ],
      ),
    );
  }

  Widget _label(String text) {
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

  Widget _uploadBox() {
    return GestureDetector(
      onTap: _pickProof,
      child: Container(
        height: 86,
        width: double.infinity,
        decoration: BoxDecoration(
          color: _proofFileName != null
              ? const Color(0xfff0fff4)
              : const Color(0xfffffbfc),
          borderRadius: BorderRadius.circular(9),
          border: Border.all(
            color: _proofFileName != null ? green : const Color(0xffffcbd3),
          ),
        ),
        child: _proofFileName != null
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.check_circle, color: green, size: 20),
                  const SizedBox(width: 8),
                  Flexible(
                    child: Text(
                      _proofFileName!,
                      style: const TextStyle(
                        color: green,
                        fontSize: 11,
                        fontWeight: FontWeight.w700,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(width: 8),
                  GestureDetector(
                    onTap: _removeProof,
                    child: const Icon(Icons.close, color: grey, size: 16),
                  ),
                ],
              )
            : const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.photo_camera, color: Colors.deepPurple, size: 22),
                  SizedBox(height: 5),
                  Text(
                    "Take photo / record video",
                    style: TextStyle(color: grey, fontSize: 11),
                  ),
                  SizedBox(height: 2),
                  Text(
                    "In-app only • GPS + timestamp auto-added",
                    style: TextStyle(
                      color: Colors.orange,
                      fontSize: 9,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
      ),
    );
  }

  Widget _vehicleInputBox() {
    return SizedBox(
      height: 40,
      child: TextField(
        controller: _vehicleController,
        textCapitalization: TextCapitalization.characters,
        style: const TextStyle(
          color: deep,
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 13,
            vertical: 10,
          ),
          hintText: "e.g. MH 02 AB 4521",
          hintStyle: const TextStyle(
            color: Color(0xffb3c0ce),
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
          prefixIcon: const Icon(
            Icons.directions_car,
            size: 16,
            color: Color(0xffd4dce5),
          ),
          prefixIconConstraints: const BoxConstraints(minWidth: 38),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(9),
            borderSide: const BorderSide(color: deep),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(9),
            borderSide: const BorderSide(color: red, width: 1.5),
          ),
          filled: true,
          fillColor: Colors.white,
        ),
      ),
    );
  }

  Widget _staticInputBox(IconData icon, String hint) {
    return Container(
      height: 40,
      padding: const EdgeInsets.symmetric(horizontal: 13),
      decoration: BoxDecoration(
        color: const Color(0xfff3f6f8),
        borderRadius: BorderRadius.circular(9),
        border: Border.all(color: const Color(0xffd8e0e8)),
      ),
      child: Row(
        children: [
          Icon(icon, size: 16, color: const Color(0xffffcbd3)),
          const SizedBox(width: 10),
          Text(
            hint,
            style: const TextStyle(
              color: Color(0xffbec8d4),
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _dateBox() {
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
          Icon(Icons.access_time, size: 17, color: Color(0xffc2ccd6)),
          SizedBox(width: 10),
          Expanded(
            child: Text(
              "18 Mar 2026 · 08:32 AM",
              style: TextStyle(
                color: Color(0xff2c3e50),
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Text(
            "AUTO",
            style: TextStyle(
              color: green,
              fontSize: 9,
              fontWeight: FontWeight.w900,
            ),
          ),
        ],
      ),
    );
  }

  Widget _howItWorks() {
    return Container(
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
            "HOW IT WORKS",
            style: TextStyle(
              color: deep,
              fontSize: 9,
              letterSpacing: 3,
              fontWeight: FontWeight.w900,
            ),
          ),
          SizedBox(height: 7),
          Text(
            "Traffic dept reviews your proof · Challan sent to vehicle owner ·",
            style: TextStyle(color: grey, fontSize: 9),
          ),
          SizedBox(height: 3),
          Text(
            "Your identity stays protected",
            style: TextStyle(color: grey, fontSize: 9),
          ),
        ],
      ),
    );
  }

  Widget _submitButton() {
    return GestureDetector(
      onTap: _isSubmitting ? null : _submitReport,
      child: Container(
        height: 46,
        decoration: BoxDecoration(
          color: _isSubmitting ? darkRed.withOpacity(0.6) : darkRed,
          borderRadius: BorderRadius.circular(9),
          boxShadow: [
            BoxShadow(
              color: darkRed.withOpacity(.22),
              blurRadius: 12,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Center(
          child: _isSubmitting
              ? const SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(
                    color: Colors.white,
                    strokeWidth: 2,
                  ),
                )
              : const Text(
                  "SUBMIT REPORT",
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

  Widget _cancelButton() {
    return GestureDetector(
      onTap: _cancel,
      child: Container(
        height: 41,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(9),
          border: Border.all(color: const Color(0xffd8e0e8)),
        ),
        child: const Center(
          child: Text(
            "← CANCEL",
            style: TextStyle(
              color: grey,
              fontSize: 12,
              fontWeight: FontWeight.w900,
              letterSpacing: 3,
            ),
          ),
        ),
      ),
    );
  }
}
