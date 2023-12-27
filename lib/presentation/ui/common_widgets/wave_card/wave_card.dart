import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/app/color_strings.dart';

class WaveCard extends StatelessWidget {
  final double? height;
  final Color? color;
  const WaveCard({super.key, this.height, this.color});

  @override
  Widget build(BuildContext context) {
    dynamic sizeHeight = MediaQuery.of(context).size.height;

    return Container(
      height: height ?? sizeHeight * 0.49,
      width: double.infinity,
      color: color ?? AppColor.kPrimary,
      child: CustomPaint(
        painter: WavePainter(
          color: AppColor.kWhite,
        ),
      ),
    );
  }
}

class WavePainter extends CustomPainter {
  final Color color;

  WavePainter({required this.color});
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final path = Path();
    path.moveTo(size.width, size.height);
    path.lineTo(
      size.width,
      size.height * 0.75,
    );
    path.quadraticBezierTo(
      size.width * 0.85,
      size.height * 0.625,
      size.width * 0.5,
      size.height * 0.75,
    );
    path.quadraticBezierTo(
      size.width * 0.25,
      size.height * 0.875,
      0,
      size.height * 0.75,
    );
    path.lineTo(0, size.height);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class OnboardingCard extends StatelessWidget {
  const OnboardingCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FadeInDown(
          duration: const Duration(milliseconds: 500),
          child: const Text(
            "hahahaha",
            style: TextStyle(
                fontSize: 27, fontWeight: FontWeight.bold, color: Colors.black),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(height: 10),
        FadeInUp(
          duration: const Duration(milliseconds: 500),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              "fdsad",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }
}
