import 'package:flutter/material.dart';

class DecoratedCard extends StatelessWidget {
  final Color cardColor;
  final double radius;
  final EdgeInsets padding;
  final Widget child;
  final VoidCallback? onTap;
  final BoxBorder? border;

  const DecoratedCard({super.key, required this.cardColor, required this.radius, required this.padding, required this.child, this.onTap, this.border});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: border, borderRadius: BorderRadius.circular(radius)),
      child: Material(
        color: cardColor,
        borderRadius: BorderRadius.circular(radius),
        child: InkWell(
          borderRadius: BorderRadius.circular(radius),
          onTap: onTap,
          child: Padding(
            padding: padding,
            child: child,
          ),
        ),
      ),
    );
  }
}
