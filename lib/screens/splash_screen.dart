import 'dart:async';
import 'package:flutter/material.dart';
import 'package:roadcell/utils/routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _logoController;
  late AnimationController _roadController;

  late Animation<double> _logoScale;
  late Animation<double> _logoOpacity;
  late Animation<double> _textOpacity;
  late Animation<Offset> _roadMove;

  @override
  void initState() {
    super.initState();

    _logoController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 7),
    );

    _roadController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    )..repeat(reverse: true);

    _logoScale = Tween<double>(begin: 0.6, end: 1.0).animate(
      CurvedAnimation(parent: _logoController, curve: Curves.elasticOut),
    );

    _logoOpacity = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _logoController, curve: Curves.easeIn));

    _textOpacity = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _logoController,
        curve: const Interval(0.45, 1.0, curve: Curves.easeIn),
      ),
    );

    _roadMove =
        Tween<Offset>(
          begin: const Offset(0, 0.25),
          end: const Offset(0, -0.15),
        ).animate(
          CurvedAnimation(parent: _roadController, curve: Curves.easeInOut),
        );

    _logoController.forward();

    Timer(const Duration(seconds: 3), () {
      if (mounted) {
        Navigator.pushReplacementNamed(context, MyRoutes.loginRoute);
      }
    });
  }

  @override
  void dispose() {
    _logoController.dispose();
    _roadController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xff173A59),
              Color(0xff0B3030),
              Color(0xff004B36),
              Color(0xff002D1C),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              height: MediaQuery.of(context).size.height * 0.42,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.03),
                ),
              ),
            ),

            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FadeTransition(
                    opacity: _logoOpacity,
                    child: ScaleTransition(
                      scale: _logoScale,
                      child: Container(
                        width: 90,
                        height: 90,
                        decoration: BoxDecoration(
                          color: const Color(0xffF5F7FB),
                          borderRadius: BorderRadius.circular(24),
                          border: Border.all(
                            color: Colors.white.withOpacity(0.85),
                            width: 2,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.35),
                              blurRadius: 28,
                              offset: const Offset(0, 15),
                            ),
                            BoxShadow(
                              color: Colors.white.withOpacity(0.4),
                              blurRadius: 12,
                              offset: const Offset(-4, -4),
                            ),
                          ],
                        ),
                        child: const Icon(
                          Icons.directions_car_filled_rounded,
                          color: Color(0xff2FA34A),
                          size: 48,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 28),

                  FadeTransition(
                    opacity: _textOpacity,
                    child: RichText(
                      text: const TextSpan(
                        children: [
                          TextSpan(
                            text: "ROAD",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 27,
                              fontWeight: FontWeight.w900,
                              letterSpacing: 7,
                            ),
                          ),
                          TextSpan(
                            text: "CELL",
                            style: TextStyle(
                              color: Color(0xff4ADE80),
                              fontSize: 27,
                              fontWeight: FontWeight.w900,
                              letterSpacing: 7,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),

                  FadeTransition(
                    opacity: _textOpacity,
                    child: const Text(
                      "VEHICLE PERMISSION SYSTEM",
                      style: TextStyle(
                        color: Colors.white38,
                        fontSize: 11,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 5,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Positioned(
              bottom: 54,
              left: 0,
              right: 0,
              child: Column(
                children: [
                  SizedBox(
                    height: 95,
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        Positioned(
                          bottom: 20,
                          child: Container(
                            width: 260,
                            height: 4,
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.08),
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 20,
                          child: Container(
                            width: 180,
                            height: 4,
                            decoration: BoxDecoration(
                              color: const Color(0xff22E06D),
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: const Color(
                                    0xff22E06D,
                                  ).withOpacity(0.4),
                                  blurRadius: 12,
                                ),
                              ],
                            ),
                          ),
                        ),
                        SlideTransition(
                          position: _roadMove,
                          child: Container(
                            width: 36,
                            height: 95,
                            decoration: BoxDecoration(
                              color: const Color(0xff24465A).withOpacity(0.75),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [roadLine(), roadLine(), roadLine()],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 4),

                  const Text(
                    "Road Dept. India",
                    style: TextStyle(
                      color: Colors.white24,
                      fontSize: 10,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 1.8,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget roadLine() {
    return Container(
      width: 4,
      height: 18,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.45),
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
