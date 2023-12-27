import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import '../../../../../core/constants/app/color_strings.dart';
import '../../../../../core/constants/app/text_strings.dart';
import '../login/login_screen.dart';

class OTPScreen extends StatelessWidget {
  const OTPScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.kLine,
      appBar: AppBar(
        backgroundColor: AppColor.kLine,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 50.0,
            vertical: 120.0,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                TextStrings.otpTitle,
                style: const TextStyle(
                    fontSize: 80.0, fontWeight: FontWeight.bold),
              ),
              Text(
                TextStrings.otpSubTitle.toUpperCase(),
                style: Theme.of(context).textTheme.labelMedium,
              ),
              const SizedBox(
                height: 60.0,
              ),
              Text(
                TextStrings.otpMessage,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(
                height: 60.0,
              ),
              OtpTextField(
                numberOfFields: 6,
                keyboardType: TextInputType.number,
                filled: true,
                fillColor: AppColor.kPrimary,
                onSubmit: (code) {},
              ),
              const SizedBox(
                height: 60.0,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginScreen(),
                      ),
                    );
                  },
                  child: Text(
                    "Next".toUpperCase(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
