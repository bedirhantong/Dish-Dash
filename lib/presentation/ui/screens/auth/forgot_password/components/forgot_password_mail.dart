import 'package:flutter/material.dart';
import '../../../../../../core/constants/app/color_strings.dart';
import '../../../../../../core/constants/app/image_strings.dart';
import '../../../../../../core/constants/app/text_strings.dart';
import '../../../../common_widgets/form_widgets/form_header_widget.dart';
import '../../otp/otp_screen.dart';

class ForgotPasswordMailScreen extends StatelessWidget {
  const ForgotPasswordMailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.kLine,
      appBar: AppBar(
        backgroundColor: AppColor.kLine,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              FormHeaderWidget(
                image: ImageStrings.logoGoogle,
                subtitle: TextStrings.forgotMailSubTitle,
                imageHeight: 0.35,
              ),
              const SizedBox(
                height: 50.0,
              ),
              Form(
                child: Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                        label: Text("Email"),
                        hintText: 'Email',
                        prefixIcon: Icon(Icons.email_outlined),
                      ),
                    ),
                    const SizedBox(
                      height: 50.0,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const OTPScreen(),
                            ),
                          );
                        },
                        child: const Text('Next'),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
