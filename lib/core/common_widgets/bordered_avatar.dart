import 'package:flutter/material.dart';

class BorderedAvatar extends StatelessWidget {
  final String imageUrl;
  final double radius;
  final double borderWidth;

  const BorderedAvatar({
    super.key,
    required this.imageUrl,
    this.radius = 24,
    this.borderWidth = 3,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(borderWidth),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.grey.shade300, // outer border color
      ),
      child: CircleAvatar(
        radius: radius,
        backgroundImage: NetworkImage(imageUrl),
      ),
    );
  }
}
