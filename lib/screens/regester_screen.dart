import 'package:flutter/material.dart';
import 'package:roadcell/screens/login_screen.dart';
import 'package:roadcell/screens/otp_screen.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() {
  runApp(const RoadCellApp());
}

class RoadCellApp extends StatelessWidget {
  const RoadCellApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CreateAccountScreen(),
    );
  }
}

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  late TextEditingController nameController;
  late TextEditingController dobController;
  late TextEditingController mobileController;
  late TextEditingController aadhaarController;
  late TextEditingController dlController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    dobController = TextEditingController();
    mobileController = TextEditingController();
    aadhaarController = TextEditingController();
    dlController = TextEditingController();
  }

  @override
  void dispose() {
    nameController.dispose();
    dobController.dispose();
    mobileController.dispose();
    aadhaarController.dispose();
    dlController.dispose();
    super.dispose();
  }

  String? _validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Full name is required';
    }
    if (value.length < 3) {
      return 'Name must be at least 3 characters';
    }
    if (!RegExp(r'^[a-zA-Z\s]+$').hasMatch(value)) {
      return 'Name can only contain letters';
    }
    return null;
  }

  String? _validateDOB(String? value) {
    if (value == null || value.isEmpty) {
      return 'Date of birth is required';
    }
    final dobRegex = RegExp(
      r'^(0[1-9]|[12][0-9]|3[01])/(0[1-9]|1[012])/\d{4}$',
    );
    if (!dobRegex.hasMatch(value)) {
      return 'Date format must be DD/MM/YYYY';
    }

    try {
      final parts = value.split('/');
      final day = int.parse(parts[0]);
      final month = int.parse(parts[1]);
      final year = int.parse(parts[2]);

      final dob = DateTime(year, month, day);
      final today = DateTime.now();
      final age =
          today.year -
          dob.year -
          (today.month > month || (today.month == month && today.day >= day)
              ? 0
              : 1);

      if (age < 18) {
        return 'Must be 18 years or above';
      }
    } catch (e) {
      return 'Invalid date';
    }

    return null;
  }

  String? _validateMobile(String? value) {
    if (value == null || value.isEmpty) {
      return 'Mobile number is required';
    }
    final phoneRegex = RegExp(r'^\d{10}$');
    if (!phoneRegex.hasMatch(value)) {
      return 'Mobile number must be 10 digits';
    }
    return null;
  }

  String? _validateAadhaar(String? value) {
    if (value == null || value.isEmpty) {
      return 'Aadhaar number is required';
    }
    final aadhaarRegex = RegExp(r'^\d{12}$');
    if (!aadhaarRegex.hasMatch(value)) {
      return 'Aadhaar must be 12 digits';
    }
    return null;
  }

  String? _validateDL(String? value) {
    if (value == null || value.isEmpty) {
      return 'Driving License number is required';
    }
    if (value.length < 8) {
      return 'DL number must be at least 8 characters';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
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
              margin: const EdgeInsets.all(10),
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
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: const Color(0xFFD9DEE4)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.10),
                              blurRadius: 8,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: LogoBox(size: 20),
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
                                    fontSize: 32,
                                    fontWeight: FontWeight.w900,
                                    letterSpacing: 3,
                                  ),
                                ),
                                TextSpan(
                                  text: "CELL",
                                  style: TextStyle(
                                    color: Color(0xFF2EA043),
                                    fontSize: 30,
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
                                stepLine(false),
                                stepLine(false),
                              ],
                            ),
                            const SizedBox(height: 5),
                            const Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                "Step 1 of 3 — Your details",
                                style: TextStyle(
                                  color: Color(0xFF8A9AAF),
                                  fontSize: 12,
                                ),
                              ),
                            ),
                            const SizedBox(height: 14),
                            const Text(
                              "Create account",
                              style: TextStyle(
                                color: Color(0xFF173253),
                                fontSize: 25,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            const Text(
                              "As per government records",
                              style: TextStyle(
                                color: Color(0xFF8A9AAF),
                                fontSize: 12,
                              ),
                            ),
                            const SizedBox(height: 16),
                            fieldTitle("FULL NAME (AS PER AADHAAR)"),
                            validatedInputBox(
                              Icons.person,
                              "Rahul Sharma",
                              nameController,
                              _validateName,
                            ),
                            const SizedBox(height: 11),
                            fieldTitle("DATE OF BIRTH"),
                            validatedInputBox(
                              Icons.calendar_month,
                              "DD/MM/YYYY",
                              dobController,
                              _validateDOB,
                            ),
                            const SizedBox(height: 5),
                            const Text(
                              "Must be 18 years or above",
                              style: TextStyle(
                                color: Color(0xFFE64A4A),
                                fontSize: 11,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 9),
                            fieldTitle("MOBILE NUMBER"),
                            validatedMobileBox(
                              mobileController,
                              _validateMobile,
                            ),
                            const SizedBox(height: 11),
                            fieldTitle("AADHAAR NUMBER"),
                            validatedInputBox(
                              Icons.credit_card,
                              "12-digit Aadhaar",
                              aadhaarController,
                              _validateAadhaar,
                            ),
                            const SizedBox(height: 11),
                            fieldTitle("DRIVING LICENCE NUMBER"),
                            validatedInputBox(
                              Icons.local_shipping,
                              "MH02-2019-0043812",
                              dlController,
                              _validateDL,
                            ),
                            const SizedBox(height: 30),
                            Center(
                              child: SizedBox(
                                width: 280,
                                height: 52,
                                child: ElevatedButton(
                                  onPressed: () async {
                                    // VALIDATION
                                    if (_validateName(nameController.text) !=
                                            null ||
                                        _validateDOB(dobController.text) !=
                                            null ||
                                        _validateMobile(
                                              mobileController.text,
                                            ) !=
                                            null ||
                                        _validateAadhaar(
                                              aadhaarController.text,
                                            ) !=
                                            null ||
                                        _validateDL(dlController.text) !=
                                            null) {
                                      ScaffoldMessenger.of(
                                        context,
                                      ).showSnackBar(
                                        const SnackBar(
                                          content: Text(
                                            "Please enter valid details",
                                          ),
                                        ),
                                      );

                                      return;
                                    }

                                    try {
                                      var url = Uri.parse(
                                        "http://10.0.2.2/roadcell-api/users/register.php",
                                      );

                                      var response = await http
                                          .post(
                                            url,
                                            body: {
                                              "full_name": nameController.text
                                                  .trim(),
                                              "dob": dobController.text.trim(),
                                              "mobile": mobileController.text
                                                  .trim(),
                                              "aadhaar": aadhaarController.text
                                                  .trim(),
                                              "licence_number": dlController
                                                  .text
                                                  .trim(),
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
                                          if (mounted) {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => OtpScreen(
                                                  mobile: mobileController.text
                                                      .trim(),
                                                  name: nameController.text
                                                      .trim(),
                                                ),
                                              ),
                                            );
                                          }
                                        } else {
                                          ScaffoldMessenger.of(
                                            context,
                                          ).showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                data["message"] ??
                                                    "Registration failed",
                                              ),
                                            ),
                                          );
                                        }
                                      }
                                    } catch (e) {
                                      ScaffoldMessenger.of(
                                        context,
                                      ).showSnackBar(
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
                                    ).withValues(alpha: 0.35),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(13),
                                    ),
                                  ),
                                  child: const Text(
                                    "SEND OTP",
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w900,
                                      letterSpacing: 3,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            Center(
                              child: RichText(
                                text: const TextSpan(
                                  children: [
                                    TextSpan(
                                      text: "Already have account? ",
                                      style: TextStyle(
                                        color: Color(0xFF8A9AAF),
                                        fontSize: 14,
                                      ),
                                    ),
                                    TextSpan(
                                      text: "Login",
                                      style: TextStyle(
                                        color: Color(0xFF173253),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 20),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    "SIGN UP — STEP 1",
                    style: TextStyle(
                      color: Color(0xFF1B2F3C),
                      fontSize: 14,
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
          fontSize: 14,
          letterSpacing: 2.2,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }

  Widget validatedInputBox(
    IconData icon,
    String hint,
    TextEditingController controller,
    String? Function(String?)? validator,
  ) {
    return ValidatedInputField(
      icon: icon,
      hint: hint,
      controller: controller,
      validator: validator,
    );
  }

  Widget validatedMobileBox(
    TextEditingController controller,
    String? Function(String?)? validator,
  ) {
    return ValidatedMobileField(controller: controller, validator: validator);
  }
}

class ValidatedInputField extends StatefulWidget {
  final IconData icon;
  final String hint;
  final TextEditingController controller;
  final String? Function(String?)? validator;

  const ValidatedInputField({
    super.key,
    required this.icon,
    required this.hint,
    required this.controller,
    this.validator,
  });

  @override
  State<ValidatedInputField> createState() => _ValidatedInputFieldState();
}

class _ValidatedInputFieldState extends State<ValidatedInputField> {
  String? _errorText;

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_validateInput);
  }

  @override
  void dispose() {
    widget.controller.removeListener(_validateInput);
    super.dispose();
  }

  void _validateInput() {
    if (widget.validator != null) {
      final error = widget.validator!(widget.controller.text);
      setState(() {
        _errorText = error;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 53,
          child: TextField(
            controller: widget.controller,
            decoration: InputDecoration(
              filled: true,
              fillColor: const Color(0xFFF0F2F3),
              prefixIcon: Icon(
                widget.icon,
                size: 30,
                color: const Color(0xFFC5ADC7),
              ),
              hintText: widget.hint,
              hintStyle: const TextStyle(
                color: Color(0xFFB6C0CB),
                fontSize: 18,
              ),
              contentPadding: EdgeInsets.zero,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(11),
                borderSide: BorderSide(
                  color: _errorText != null
                      ? Colors.red
                      : const Color(0xFFD3D9DF),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(11),
                borderSide: BorderSide(
                  color: _errorText != null
                      ? Colors.red
                      : const Color(0xFF2EA043),
                  width: 1.3,
                ),
              ),
            ),
          ),
        ),
        if (_errorText != null)
          Padding(
            padding: const EdgeInsets.only(top: 0),
            child: Text(
              _errorText!,
              style: const TextStyle(
                color: Colors.red,
                fontSize: 11,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
      ],
    );
  }
}

class ValidatedMobileField extends StatefulWidget {
  final TextEditingController controller;
  final String? Function(String?)? validator;

  const ValidatedMobileField({
    super.key,
    required this.controller,
    this.validator,
  });

  @override
  State<ValidatedMobileField> createState() => _ValidatedMobileFieldState();
}

class _ValidatedMobileFieldState extends State<ValidatedMobileField> {
  String? _errorText;

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_validateInput);
  }

  @override
  void dispose() {
    widget.controller.removeListener(_validateInput);
    super.dispose();
  }

  void _validateInput() {
    if (widget.validator != null) {
      final error = widget.validator!(widget.controller.text);
      setState(() {
        _errorText = error;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 53,
          child: TextField(
            controller: widget.controller,
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
              filled: true,
              fillColor: const Color(0xFFF0F2F3),
              prefixIcon: const Icon(
                Icons.phone_android,
                size: 30,
                color: Color(0xFFC5ADC7),
              ),
              prefix: const Padding(
                padding: EdgeInsets.only(right: 8),
                child: Text(
                  "+91",
                  style: TextStyle(
                    color: Color(0xFF173253),
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              hintText: "8888777722",
              hintStyle: const TextStyle(
                color: Color(0xFFB6C0CB),
                fontSize: 18,
              ),
              contentPadding: EdgeInsets.zero,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(11),
                borderSide: BorderSide(
                  color: _errorText != null
                      ? Colors.red
                      : const Color(0xFFD3D9DF),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(11),
                borderSide: BorderSide(
                  color: _errorText != null
                      ? Colors.red
                      : const Color(0xFF2EA043),
                  width: 1.3,
                ),
              ),
            ),
          ),
        ),
        if (_errorText != null)
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Text(
              _errorText!,
              style: const TextStyle(
                color: Colors.red,
                fontSize: 11,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
      ],
    );
  }
}
