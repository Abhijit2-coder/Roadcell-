import 'package:flutter/material.dart';
import 'package:roadcell/utils/routes.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:roadcell/providers/user_provider.dart';

class AppColors {
  static const topBg = Color(0xff173A59);
  static const midBg = Color(0xff08212E);
  static const bottomBg = Color(0xff062412);

  static const green = Color(0xff2FA34A);
  static const lightGreen = Color(0xff4ADE80);
  static const darkBlue = Color(0xff173A59);
  static const textGrey = Color(0xff8A9BB0);
  static const fieldBg = Color(0xffF5F7FB);
}

class AppText {
  static const appName1 = "ROAD";
  static const appName2 = "CELL";
  static const subTitle = "ROAD DEPT. INDIA";
  static const welcome = "Welcome back";
  static const loginSubTitle = "Login with your mobile number";
  static const footer = "Road Department · Government of India";
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool hidePassword = true;

  final phoneController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    phoneController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  String? _validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return 'Phone number is required';
    }
    final phoneRegex = RegExp(r'^\d{10}$');
    if (!phoneRegex.hasMatch(value)) {
      return 'Phone number must be 10 digits';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }

  Future<void> _handleLogin() async {
    String mobile = phoneController.text.trim();
    String password = passwordController.text.trim();

    if (mobile.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please enter mobile and password")),
      );
      return;
    }

    try {
      var url = Uri.parse("http://10.0.2.2/roadcell-api/users/login.php");

      print('Login: Sending request to $url'); // Debug log

      var response = await http
          .post(url, body: {"mobile": mobile, "password": password})
          .timeout(
            const Duration(seconds: 10),
            onTimeout: () => throw Exception('Request timeout'),
          );

      print('Login: Response status - ${response.statusCode}'); // Debug log
      print('Login: Response body - ${response.body}'); // Debug log

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);

        if (data["status"] == true) {
          // Extract user data from the correct API response structure
          Map<String, dynamic> userData = {
            'full_name': data['data']['full_name'] ?? 'User',
            'mobile': data['data']['mobile'] ?? mobile,
            'email': '', // Not provided by API
            'dob': data['data']['dob'] ?? '',
            'aadhaar': data['data']['aadhaar'] ?? '',
            'licence_number': data['data']['licence_number'] ?? '',
          };

          print('Login: User data extracted - $userData'); // Debug log

          // Store data in UserProvider
          if (mounted) {
            context.read<UserProvider>().setUserData(userData);
            print('Login: Data stored in provider'); // Debug log
          }

          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(data["message"])));

          if (mounted) {
            Navigator.pushNamedAndRemoveUntil(
              context,
              MyRoutes.homeRoute,
              (route) => false,
            );
          }
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(data["message"] ?? "Login failed")),
          );
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Server error: ${response.statusCode}")),
        );
      }
    } catch (e) {
      print('Login: Error - $e'); // Debug log
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Error: $e")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundWrapper(
        child: SafeArea(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 24),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  const AppHeader(),
                  const SizedBox(height: 45),
                  LoginCard(
                    hidePassword: hidePassword,
                    phoneController: phoneController,
                    passwordController: passwordController,
                    onTogglePassword: () {
                      setState(() {
                        hidePassword = !hidePassword;
                      });
                    },
                    onValidatePhone: _validatePhone,
                    onValidatePassword: _validatePassword,
                    onLogin: _handleLogin,
                  ),
                  const SizedBox(height: 30),
                  const FooterText(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class BackgroundWrapper extends StatelessWidget {
  final Widget child;

  const BackgroundWrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.maxFinite,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColors.topBg, AppColors.midBg, AppColors.bottomBg],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: child,
    );
  }
}

class AppHeader extends StatelessWidget {
  const AppHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        LogoBox(size: 65),
        const SizedBox(width: 14),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: const TextSpan(
                children: [
                  TextSpan(
                    text: AppText.appName1,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 3,
                    ),
                  ),
                  TextSpan(
                    text: AppText.appName2,
                    style: TextStyle(
                      color: AppColors.lightGreen,
                      fontSize: 40,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 3,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 4),
            const Text(
              AppText.subTitle,
              style: TextStyle(
                color: Colors.white38,
                fontSize: 14,
                fontWeight: FontWeight.w700,
                letterSpacing: 2.4,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class LogoBox extends StatelessWidget {
  final double size;

  const LogoBox({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.white.withValues(alpha: 0.8)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.18),
            blurRadius: 18,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: const Icon(
        Icons.directions_car_filled_rounded,
        color: AppColors.green,
        size: 34,
      ),
    );
  }
}

class LoginCard extends StatefulWidget {
  final bool hidePassword;
  final TextEditingController phoneController;
  final TextEditingController passwordController;
  final VoidCallback onTogglePassword;
  final String? Function(String?)? onValidatePhone;
  final String? Function(String?)? onValidatePassword;
  final VoidCallback? onLogin;

  const LoginCard({
    super.key,
    required this.hidePassword,
    required this.phoneController,
    required this.passwordController,
    required this.onTogglePassword,
    this.onValidatePhone,
    this.onValidatePassword,
    this.onLogin,
  });

  @override
  State<LoginCard> createState() => _LoginCardState();
}

class _LoginCardState extends State<LoginCard> {
  bool _isFormValid = false;

  @override
  void initState() {
    super.initState();
    widget.phoneController.addListener(_checkFormValidity);
    widget.passwordController.addListener(_checkFormValidity);
  }

  @override
  void dispose() {
    widget.phoneController.removeListener(_checkFormValidity);
    widget.passwordController.removeListener(_checkFormValidity);
    super.dispose();
  }

  void _checkFormValidity() {
    final phoneError = widget.onValidatePhone?.call(
      widget.phoneController.text,
    );
    final passwordError = widget.onValidatePassword?.call(
      widget.passwordController.text,
    );
    setState(() {
      _isFormValid = phoneError == null && passwordError == null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 510,
      padding: const EdgeInsets.fromLTRB(20, 22, 20, 18),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.96),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.white.withValues(alpha: 0.7)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.28),
            blurRadius: 35,
            offset: const Offset(0, 18),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            AppText.welcome,
            style: TextStyle(
              color: AppColors.darkBlue,
              fontSize: 28,
              fontWeight: FontWeight.w900,
            ),
          ),
          const Text(
            AppText.loginSubTitle,
            style: TextStyle(
              color: AppColors.textGrey,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 26),
          const FieldLabel("MOBILE NUMBER"),
          const SizedBox(height: 8),
          CustomInputField(
            controller: widget.phoneController,
            hintText: "98765 43210",
            keyboardType: TextInputType.phone,
            prefixIcon: Icons.phone_android_rounded,
            prefixText: "+91   ",
            validator: widget.onValidatePhone,
          ),
          const SizedBox(height: 18),
          const FieldLabel("PASSWORD"),
          const SizedBox(height: 8),
          CustomInputField(
            controller: widget.passwordController,
            hintText: "Enter password",
            prefixIcon: Icons.lock_outline_rounded,
            obscureText: widget.hidePassword,
            suffixIcon: widget.hidePassword
                ? Icons.visibility_off_outlined
                : Icons.visibility,
            onSuffixTap: widget.onTogglePassword,
            validator: widget.onValidatePassword,
          ),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {},
              child: const Text(
                "Forgot password?",
                style: TextStyle(
                  color: AppColors.darkBlue,
                  fontSize: 13,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ),
          const SizedBox(height: 6),
          SizedBox(
            width: double.infinity,
            height: 54,
            child: ElevatedButton(
              onPressed: _isFormValid ? widget.onLogin : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: _isFormValid ? AppColors.green : Colors.grey,
                foregroundColor: Colors.white,
                elevation: _isFormValid ? 10 : 0,
                shadowColor: AppColors.green.withValues(
                  alpha: _isFormValid ? 0.5 : 0,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
              child: const Text(
                "LOGIN",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 4,
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Don't have account? ",
                style: TextStyle(color: AppColors.textGrey, fontSize: 14),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, MyRoutes.registerRoute);
                },
                child: const Text(
                  "Sign up",
                  style: TextStyle(
                    color: AppColors.darkBlue,
                    fontSize: 14,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CustomInputField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final IconData prefixIcon;
  final TextInputType keyboardType;
  final bool obscureText;
  final String? prefixText;
  final IconData? suffixIcon;
  final VoidCallback? onSuffixTap;
  final String? Function(String?)? validator;

  const CustomInputField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.prefixIcon,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.prefixText,
    this.suffixIcon,
    this.onSuffixTap,
    this.validator,
  });

  @override
  State<CustomInputField> createState() => _CustomInputFieldState();
}

class _CustomInputFieldState extends State<CustomInputField> {
  String? _errorText;
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    widget.controller.addListener(_validateInput);
  }

  @override
  void dispose() {
    _focusNode.dispose();
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
        TextField(
          controller: widget.controller,
          focusNode: _focusNode,
          keyboardType: widget.keyboardType,
          obscureText: widget.obscureText,
          style: const TextStyle(
            color: AppColors.darkBlue,
            fontSize: 17,
            fontWeight: FontWeight.w600,
          ),
          decoration: InputDecoration(
            hintText: widget.hintText,
            hintStyle: const TextStyle(
              color: Color(0xffB8C4D3),
              fontSize: 17,
              fontWeight: FontWeight.w500,
            ),
            prefixIcon: Icon(
              widget.prefixIcon,
              color: AppColors.textGrey,
              size: 26,
            ),
            prefixText: widget.prefixText,
            prefixStyle: const TextStyle(
              color: AppColors.darkBlue,
              fontWeight: FontWeight.w800,
              fontSize: 17,
            ),
            suffixIcon: widget.suffixIcon == null
                ? null
                : GestureDetector(
                    onTap: widget.onSuffixTap,
                    child: Icon(
                      widget.suffixIcon,
                      color: const Color(0xffB8C4D3),
                      size: 26,
                    ),
                  ),
            filled: true,
            fillColor: AppColors.fieldBg,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 14,
              vertical: 16,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: _errorText != null
                    ? Colors.red
                    : const Color(0xffDDE6EF),
                width: 1,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: _errorText != null ? Colors.red : AppColors.green,
                width: 1.5,
              ),
            ),
          ),
        ),
        if (_errorText != null)
          Padding(
            padding: const EdgeInsets.only(top: 6),
            child: Text(
              _errorText!,
              style: const TextStyle(
                color: Colors.red,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
      ],
    );
  }
}

class FieldLabel extends StatelessWidget {
  final String text;

  const FieldLabel(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        color: AppColors.textGrey,
        fontSize: 12,
        fontWeight: FontWeight.w800,
        letterSpacing: 3,
      ),
    );
  }
}

class FooterText extends StatelessWidget {
  const FooterText({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      AppText.footer,
      style: TextStyle(
        color: Colors.white30,
        fontSize: 12,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
