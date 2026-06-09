import 'package:flutter/material.dart';
import 'package:roadcell/screens/login_screen.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:roadcell/utils/routes.dart';

class SetPasswordScreen extends StatefulWidget {
  final String mobile;
  final String name; // Add name parameter
  const SetPasswordScreen({
    super.key,
    required this.mobile,
    required this.name,
  });

  @override
  State<SetPasswordScreen> createState() => _SetPasswordScreenState();
}

class _SetPasswordScreenState extends State<SetPasswordScreen> {
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;

  @override
  void initState() {
    super.initState();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Mask the mobile number for display (show first 5 digits + XXXXX)
    String maskedMobile = "+91 " + widget.mobile.substring(0, 5) + " XXXXX";

    return Scaffold(
      backgroundColor: const Color(0xFF081522),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF163A5C), Color(0xFF0C1E30), Color(0xFF082619)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Center(
            child: Container(
              margin: const EdgeInsets.all(18),
              padding: const EdgeInsets.fromLTRB(16, 38, 16, 10),
              decoration: BoxDecoration(
                color: const Color(0xFFF7F8F8),
                borderRadius: BorderRadius.circular(38),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.35),
                    blurRadius: 28,
                    offset: const Offset(0, 14),
                  ),
                ],
              ),
              child: Column(
                children: [
                  const SizedBox(height: 24),

                  Row(
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: const Color(0xFFD9DEE4)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.10),
                              blurRadius: 8,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: LogoBox(size: 30),
                      ),
                      const SizedBox(width: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                            text: const TextSpan(
                              children: [
                                TextSpan(
                                  text: "ROAD",
                                  style: TextStyle(
                                    color: Color(0xFF173253),
                                    fontSize: 20,
                                    fontWeight: FontWeight.w900,
                                    letterSpacing: 3,
                                  ),
                                ),
                                TextSpan(
                                  text: "CELL",
                                  style: TextStyle(
                                    color: Color(0xFF2EA043),
                                    fontSize: 17,
                                    fontWeight: FontWeight.w900,
                                    letterSpacing: 3,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 3),
                          const Text(
                            "ROAD DEPT. INDIA",
                            style: TextStyle(
                              color: Color(0xFF9CA8B5),
                              fontSize: 11,
                              letterSpacing: 2.5,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  const SizedBox(height: 18),

                  Expanded(
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF7F8F8),
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(color: const Color(0xFFD8DEE5)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.08),
                            blurRadius: 18,
                            offset: const Offset(0, 8),
                          ),
                        ],
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                stepLine(true),
                                stepLine(true),
                                stepLine(true),
                              ],
                            ),

                            const SizedBox(height: 5),

                            const Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                "Step 3 of 3 — Set password",
                                style: TextStyle(
                                  color: Color(0xFF8A9AAF),
                                  fontSize: 11,
                                ),
                              ),
                            ),

                            const SizedBox(height: 14),

                            const Text(
                              "Set password",
                              style: TextStyle(
                                color: Color(0xFF173253),
                                fontSize: 22,
                                fontWeight: FontWeight.w900,
                              ),
                            ),

                            const SizedBox(height: 3),

                            const Text(
                              "Create a secure password",
                              style: TextStyle(
                                color: Color(0xFF8A9AAF),
                                fontSize: 13,
                              ),
                            ),

                            const SizedBox(height: 16),

                            Container(
                              width: double.infinity,
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: const Color(0xFFEFFAF2),
                                borderRadius: BorderRadius.circular(9),
                                border: Border.all(
                                  color: const Color(0xFFC1E8CC),
                                ),
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.verified,
                                    size: 25,
                                    color: Color(0xFF2EA043),
                                  ),
                                  SizedBox(width: 7),
                                  Expanded(
                                    child: Text(
                                      "OTP verified ✓\n${widget.name} - $maskedMobile",
                                      style: const TextStyle(
                                        color: Color(0xFF617589),
                                        fontSize: 13,
                                        height: 1.45,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            const SizedBox(height: 14),

                            fieldTitle("FULL NAME"),
                            verifiedField(Icons.person, widget.name),

                            const SizedBox(height: 12),

                            fieldTitle("MOBILE"),
                            verifiedField(Icons.phone_android, maskedMobile),

                            const SizedBox(height: 12),

                            fieldTitle("NEW PASSWORD"),
                            passwordField(
                              "Min 8 · 1 number · 1 uppercase",
                              passwordController,
                            ),

                            const SizedBox(height: 12),

                            fieldTitle("CONFIRM PASSWORD"),
                            passwordField(
                              "Re-enter password",
                              confirmPasswordController,
                            ),

                            const SizedBox(height: 10),

                            Container(
                              width: double.infinity,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 10,
                              ),
                              decoration: BoxDecoration(
                                color: const Color(0xFFF0F2F3),
                                borderRadius: BorderRadius.circular(9),
                                border: Border.all(
                                  color: const Color(0xFFD3D9DF),
                                ),
                              ),
                              child: const Text(
                                "Minimum 8 characters · At least 1 number · At least 1 uppercase",
                                style: TextStyle(
                                  color: Color(0xFF8A9AAF),
                                  fontSize: 12,
                                ),
                              ),
                            ),

                            const SizedBox(height: 11),

                            SizedBox(
                              width: double.infinity,
                              height: 47,
                              child: ElevatedButton(
                                onPressed: () async {
                                  String password = passwordController.text
                                      .trim();
                                  String confirmPassword =
                                      confirmPasswordController.text.trim();

                                  // VALIDATION
                                  if (password.isEmpty ||
                                      confirmPassword.isEmpty) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text("Please enter password"),
                                      ),
                                    );

                                    return;
                                  }

                                  if (password.length < 6) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text(
                                          "Password must be at least 6 characters",
                                        ),
                                      ),
                                    );

                                    return;
                                  }

                                  if (password != confirmPassword) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text("Passwords do not match"),
                                      ),
                                    );

                                    return;
                                  }

                                  try {
                                    var url = Uri.parse(
                                      "http://192.168.56.1/roadcell-api/users/set_password.php", // Updated URL for emulator
                                    );

                                    var response = await http
                                        .post(
                                          url,
                                          body: {
                                            "mobile": widget.mobile,
                                            "password": password,
                                          },
                                        )
                                        .timeout(
                                          const Duration(seconds: 10),
                                          onTimeout: () => throw Exception(
                                            'Request timeout',
                                          ),
                                        );

                                    if (response.statusCode == 200) {
                                      var data = jsonDecode(response.body);

                                      if (data["status"] == true) {
                                        ScaffoldMessenger.of(
                                          context,
                                        ).showSnackBar(
                                          SnackBar(
                                            content: Text(data["message"]),
                                          ),
                                        );

                                        if (mounted) {
                                          // Check if widget is still mounted
                                          Navigator.pushNamedAndRemoveUntil(
                                            context,
                                            MyRoutes.loginRoute,
                                            (route) => false,
                                          );
                                        }
                                      } else {
                                        ScaffoldMessenger.of(
                                          context,
                                        ).showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              data["message"] ??
                                                  "Failed to set password",
                                            ),
                                          ),
                                        );
                                      }
                                    } else {
                                      ScaffoldMessenger.of(
                                        context,
                                      ).showSnackBar(
                                        const SnackBar(
                                          content: Text("Server error"),
                                        ),
                                      );
                                    }
                                  } catch (e) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(content: Text("Error: $e")),
                                    );
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFF2EA043),
                                  foregroundColor: Colors.white,
                                  elevation: 8,
                                  shadowColor: const Color(
                                    0xFF2EA043,
                                  ).withOpacity(0.35),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(11),
                                  ),
                                ),
                                child: const Text(
                                  "CREATE ACCOUNT",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w900,
                                    letterSpacing: 3,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 5),

                  const Text(
                    "SIGN UP — STEP 3",
                    style: TextStyle(
                      color: Color(0xFF1B2F3C),
                      fontSize: 10,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 3,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  static Widget dot() {
    return Container(
      width: 4,
      height: 4,
      decoration: const BoxDecoration(
        color: Colors.grey,
        shape: BoxShape.circle,
      ),
    );
  }

  static Widget stepLine(bool active) {
    return Expanded(
      child: Container(
        height: 3,
        margin: const EdgeInsets.symmetric(horizontal: 3),
        decoration: BoxDecoration(
          color: active ? const Color(0xFF173253) : const Color(0xFFD8DEE5),
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }

  static Widget fieldTitle(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Text(
        text,
        style: const TextStyle(
          color: Color(0xFF8A9AAF),
          fontSize: 12,
          letterSpacing: 2.2,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }

  static Widget verifiedField(IconData icon, String hint) {
    return SizedBox(
      height: 40,
      child: TextField(
        enabled: false,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          prefixIcon: Icon(icon, size: 25, color: const Color(0xFFC5ADC7)),
          suffixIcon: const Icon(
            Icons.check,
            size: 25,
            color: Color(0xFF2EA043),
          ),
          hintText: hint,
          hintStyle: const TextStyle(
            color: Color(0xFF173253),
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
          contentPadding: EdgeInsets.zero,
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(11),
            borderSide: const BorderSide(color: Color(0xFF2EA043), width: 1.2),
          ),
        ),
      ),
    );
  }

  static Widget passwordField(String hint, TextEditingController controller) {
    return SizedBox(
      height: 40,
      child: TextField(
        controller: controller, // Attach the controller
        obscureText: true,
        decoration: InputDecoration(
          filled: true,
          fillColor: const Color(0xFFF0F2F3),
          prefixIcon: const Icon(
            Icons.lock,
            size: 25,
            color: Color(0xFFE5C37D),
          ),
          suffixIcon: const Icon(
            Icons.visibility,
            size: 25,
            color: Color(0xFFB6C0CB),
          ),
          hintText: hint,
          hintStyle: const TextStyle(color: Color(0xFFB6C0CB), fontSize: 14),
          contentPadding: EdgeInsets.zero,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(11),
            borderSide: const BorderSide(color: Color(0xFFD3D9DF)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(11),
            borderSide: const BorderSide(color: Color(0xFF2EA043), width: 1.3),
          ),
        ),
      ),
    );
  }
}
