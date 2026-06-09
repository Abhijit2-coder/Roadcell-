import 'package:flutter/material.dart';
import 'package:roadcell/screens/password_screen.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class OtpScreen extends StatefulWidget {
  final String mobile;
  final String name; // Add name parameter
  const OtpScreen({super.key, required this.mobile, required this.name});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen>
    with CodeAutoFill, SingleTickerProviderStateMixin {
  final List<TextEditingController> controllers = List.generate(
    6,
    (_) => TextEditingController(),
  );

  final List<FocusNode> focusNodes = List.generate(6, (_) => FocusNode());

  late AnimationController glowController;
  late Animation<double> glowAnimation;

  int seconds = 30;
  bool canResend = false;

  get code => null;

  @override
  void initState() {
    super.initState();

    listenForCode();
    startTimer();

    glowController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    )..repeat(reverse: true);

    glowAnimation = Tween<double>(begin: 3, end: 13).animate(glowController);
  }

  void codeUpdated() {
    if (code != null && code!.length >= 6) {
      final otp = code!.substring(0, 6);

      for (int i = 0; i < 6; i++) {
        controllers[i].text = otp[i];
      }

      FocusScope.of(context).unfocus();
      setState(() {});
    }
  }

  void startTimer() {
    canResend = false;
    seconds = 30;

    Future.doWhile(() async {
      await Future.delayed(const Duration(seconds: 1));

      if (!mounted) return false;

      if (seconds == 0) {
        setState(() {
          canResend = true;
        });
        return false;
      }

      setState(() {
        seconds--;
      });

      return true;
    });
  }

  String getOtp() {
    return controllers.map((e) => e.text).join();
  }

  void resendOtp() {
    for (var controller in controllers) {
      controller.clear();
    }

    FocusScope.of(context).requestFocus(focusNodes[0]);
    listenForCode();
    startTimer();

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text("OTP resent successfully")));
  }

  @override
  void dispose() {
    cancel();

    for (var controller in controllers) {
      controller.dispose();
    }

    for (var focusNode in focusNodes) {
      focusNode.dispose();
    }

    glowController.dispose();
    super.dispose();
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
          child: Column(
            children: [
              const SizedBox(height: 24),

              Container(
                height: 76,
                width: 76,
                decoration: BoxDecoration(
                  color: const Color(0xFF1E3854),
                  borderRadius: BorderRadius.circular(22),
                  border: Border.all(
                    color: const Color(0xFF34A853),
                    width: 1.4,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF34A853).withOpacity(0.25),
                      blurRadius: 18,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.directions_car,
                  color: Colors.white70,
                  size: 34,
                ),
              ),

              const SizedBox(height: 16),

              RichText(
                text: const TextSpan(
                  children: [
                    TextSpan(
                      text: "ROAD",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w900,
                        letterSpacing: 4,
                      ),
                    ),
                    TextSpan(
                      text: "CELL",
                      style: TextStyle(
                        color: Color(0xFF34A853),
                        fontSize: 24,
                        fontWeight: FontWeight.w900,
                        letterSpacing: 4,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 8),

              const Text(
                "VEHICLE PERMISSION SYSTEM",
                style: TextStyle(
                  color: Color(0xFF77899C),
                  fontSize: 10,
                  letterSpacing: 4,
                  fontWeight: FontWeight.w600,
                ),
              ),

              const SizedBox(height: 28),

              Expanded(
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 14),
                  padding: const EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF7F8F8),
                    borderRadius: BorderRadius.circular(28),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.35),
                        blurRadius: 25,
                        offset: const Offset(0, 12),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          stepLine(true),
                          stepLine(true),
                          stepLine(false),
                        ],
                      ),

                      const SizedBox(height: 6),

                      const Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          "Step 2 of 3 — OTP verify",
                          style: TextStyle(
                            color: Color(0xFF8A9AAF),
                            fontSize: 10,
                          ),
                        ),
                      ),

                      const SizedBox(height: 16),

                      const Text(
                        "Verify OTP",
                        style: TextStyle(
                          color: Color(0xFF173253),
                          fontSize: 24,
                          fontWeight: FontWeight.w900,
                        ),
                      ),

                      const SizedBox(height: 5),

                      const Text(
                        "Sent to your Email",
                        style: TextStyle(
                          color: Color(0xFF97A5B5),
                          fontSize: 13,
                        ),
                      ),

                      const SizedBox(height: 16),

                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(13),
                        decoration: BoxDecoration(
                          color: const Color(0xFFEFFAF2),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: const Color(0xFFC1E8CC)),
                        ),
                        child: const Row(
                          children: [
                            Icon(
                              Icons.verified,
                              color: Color(0xFF34A853),
                              size: 18,
                            ),
                            SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                "Aadhaar + DL verified ✓\nRahul Sharma - Maharashtra",
                                style: TextStyle(
                                  color: Color(0xFF617589),
                                  fontSize: 12,
                                  height: 1.5,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 18),

                      const Text(
                        "ENTER 6-DIGIT OTP",
                        style: TextStyle(
                          color: Color(0xFF8A9AAF),
                          fontSize: 11,
                          letterSpacing: 2.2,
                          fontWeight: FontWeight.w600,
                        ),
                      ),

                      const SizedBox(height: 10),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: List.generate(6, (index) => otpBox(index)),
                      ),

                      const SizedBox(height: 8),

                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: canResend ? resendOtp : null,
                          child: Text(
                            canResend
                                ? "Resend OTP"
                                : "Resend OTP in ${seconds}s",
                            style: TextStyle(
                              color: canResend
                                  ? const Color(0xFF173253)
                                  : Colors.grey,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 6),

                      SizedBox(
                        width: double.infinity,
                        height: 54,
                        child: ElevatedButton(
                          onPressed: () async {
                            final otp = getOtp();

                            // CHECK OTP LENGTH
                            if (otp.length != 6) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("Please enter 6 digit OTP"),
                                ),
                              );

                              return;
                            }

                            try {
                              var url = Uri.parse(
                                "http://10.0.2.2/roadcell-api/users/verify_otp.php",
                              );

                              var response = await http.post(
                                url,
                                body: {"mobile": widget.mobile, "otp": otp},
                              );

                              print(response.body);

                              var data = jsonDecode(response.body);

                              if (data["status"] == true) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text(data["message"])),
                                );

                                // Fixed navigation: Use pushReplacement for proper screen transition
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SetPasswordScreen(
                                      mobile: widget.mobile,
                                      name: widget
                                          .name, // Pass name to password screen
                                    ),
                                  ),
                                );
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text(data["message"])),
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
                              borderRadius: BorderRadius.circular(13),
                            ),
                          ),
                          child: const Text(
                            "VERIFY OTP",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w900,
                              letterSpacing: 3,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 12),

                      SizedBox(
                        width: double.infinity,
                        height: 48,
                        child: OutlinedButton(
                          onPressed: () {},
                          style: OutlinedButton.styleFrom(
                            foregroundColor: const Color(0xFF8A9AAF),
                            side: const BorderSide(color: Color(0xFFD7DDE4)),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: const Text(
                            "← CHANGE DETAILS",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w900,
                              letterSpacing: 2.5,
                            ),
                          ),
                        ),
                      ),

                      const Spacer(),

                      const Center(
                        child: Text(
                          "SIGN UP — STEP 2",
                          style: TextStyle(
                            color: Color(0xFFE0E5EA),
                            fontSize: 10,
                            fontWeight: FontWeight.w800,
                            letterSpacing: 3,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 18),
            ],
          ),
        ),
      ),
    );
  }

  Widget otpBox(int index) {
    return AnimatedBuilder(
      animation: glowAnimation,
      builder: (context, child) {
        final isFocused = focusNodes[index].hasFocus;
        final hasValue = controllers[index].text.isNotEmpty;

        return AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          height: 54,
          width: 46,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: hasValue ? const Color(0xFFF3FFF6) : const Color(0xFFF2F4F5),
            borderRadius: BorderRadius.circular(9),
            border: Border.all(
              color: isFocused
                  ? const Color(0xFF173253)
                  : hasValue
                  ? const Color(0xFF2EA043)
                  : const Color(0xFFD6DCE2),
              width: isFocused ? 1.7 : 1.2,
            ),
            boxShadow: isFocused
                ? [
                    BoxShadow(
                      color: const Color(0xFF2EA043).withOpacity(0.35),
                      blurRadius: glowAnimation.value,
                      spreadRadius: 1,
                    ),
                  ]
                : [],
          ),
          child: TextField(
            controller: controllers[index],
            focusNode: focusNodes[index],
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            maxLength: 1,
            cursorColor: const Color(0xFF2EA043),
            style: TextStyle(
              color: hasValue
                  ? const Color(0xFF2EA043)
                  : const Color(0xFF173253),
              fontSize: 22,
              fontWeight: FontWeight.w900,
            ),
            decoration: const InputDecoration(
              counterText: "",
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(bottom: 4),
            ),
            onTap: () {
              setState(() {});
            },
            onChanged: (value) {
              if (value.isNotEmpty) {
                if (index < 5) {
                  FocusScope.of(context).requestFocus(focusNodes[index + 1]);
                } else {
                  FocusScope.of(context).unfocus();
                }
              } else {
                if (index > 0) {
                  FocusScope.of(context).requestFocus(focusNodes[index - 1]);
                }
              }

              setState(() {});
            },
          ),
        );
      },
    );
  }

  Widget stepLine(bool active) {
    return Expanded(
      child: Container(
        height: 4,
        margin: const EdgeInsets.symmetric(horizontal: 3),
        decoration: BoxDecoration(
          color: active ? const Color(0xFF173253) : const Color(0xFFD8DEE5),
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }

  void cancel() {}

  void listenForCode() {}
}

mixin CodeAutoFill {}
