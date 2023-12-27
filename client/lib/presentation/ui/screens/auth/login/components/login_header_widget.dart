import 'package:flutter/material.dart';

class LoginHeaderWidget extends StatelessWidget {
  const LoginHeaderWidget({
    super.key,
    required this.size,
    required this.showText,
  });
  final Size size;
  final bool showText;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image(
          image: const AssetImage(
            'assets/images/logo/akdeniz_logo.png',
          ),
          height: size.height * 0.3,
        ),
        showText
            ? Padding(
                padding: const EdgeInsets.only(top: 12.0),
                child: Text(
                  'Sadece iyilik sağlık topluluğu tarafından yapılmıştır',
                  style: Theme.of(context).textTheme.labelLarge,
                ),
              )
            : const Text(''),
      ],
    );
  }
}
