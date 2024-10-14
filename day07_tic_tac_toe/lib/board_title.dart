import 'package:flutter/material.dart';

class BroadTitle extends StatelessWidget {
  final double dimension;

  const BroadTitle({super.key, required this.dimension});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: dimension,
      width: dimension,
      child: TextButton(
        onPressed: () {},
        style: const ButtonStyle(
          shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(borderRadius: BorderRadius.zero)
          )
        ),

        child: Image.asset(
          'assets/images/o.png',
        ),
      ),
    );
  }
}
