import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onTap;

  const BottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 88,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: Colors.black.withOpacity(.07))),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _navItem(Icons.home, "Home", selectedIndex == 0, 0),
          _navItem(Icons.confirmation_number, "Passes", selectedIndex == 1, 1),
          _navItem(Icons.folder, "Docs", selectedIndex == 2, 2),
          _navItem(Icons.warning, "Report", selectedIndex == 3, 3),
          _navItem(Icons.person, "Profile", selectedIndex == 4, 4),
        ],
      ),
    );
  }

  Widget _navItem(IconData icon, String text, bool active, int index) {
    return GestureDetector(
      onTap: () => onTap(index),
      behavior: HitTestBehavior.opaque,
      child: BottomItem(icon, text, active),
    );
  }
}

class BottomItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final bool active;

  const BottomItem(this.icon, this.text, this.active, {super.key});

  static const deep = Color(0xff0b2d4a);

  @override
  Widget build(BuildContext context) {
    final color = active ? deep : const Color(0xffa9b6c5);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, size: 30, color: color),
        const SizedBox(height: 8),
        Text(
          text,
          style: TextStyle(
            fontSize: 13,
            color: color,
            fontWeight: active ? FontWeight.w800 : FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
