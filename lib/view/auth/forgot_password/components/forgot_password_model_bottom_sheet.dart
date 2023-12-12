import 'package:flutter/material.dart';

import '../../../../core/constants/app/text_strings.dart';
import 'forgot_password_btn_widget.dart';
import 'forgot_password_mail.dart';

class ForgotPasswordScreen {
  static Future<dynamic> buildShowModalBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      enableDrag: true,
      builder: (context) => Container(
        height: 360,
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              TextStrings.forgotPasswordTitle,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            Text(
              TextStrings.forgotPasswordSubTitle,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(
              height: 20,
            ),
            ForgotPasswordBtnWidget(
              btnIcon: Icons.mail_outline_rounded,
              title: "E-mail",
              subtitle: TextStrings.resetViaEmail,
              onTap: () {
                Navigator.pop(context); //bottom sheetten öncekine döneriz
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ForgotPasswordMailScreen(),
                  ),
                );
              },
            ),
            const SizedBox(
              height: 20,
            ),
            ForgotPasswordBtnWidget(
              btnIcon: Icons.phone_android_outlined,
              title: "Phone",
              subtitle: TextStrings.resetViaPhone,
              onTap: () {
                Navigator.pop(context); //bottom sheetten öncekine döneriz
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ForgotPasswordMailScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
