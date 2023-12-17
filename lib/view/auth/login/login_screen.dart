import 'package:dish_dash/core/model/service_model/user/user_service.dart';
import 'package:dish_dash/core/viewmodel/user_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../core/base/state/base_state.dart';
import '../../../core/base/view/base_view.dart';
import '../../../core/constants/app/color_strings.dart';
import '../../../core/constants/app/image_strings.dart';
import '../../../core/model/service_model/user/user_model.dart';
import '../../main/main_bottom_nav.dart';
import '../forgot_password/components/forgot_password_model_bottom_sheet.dart';
import '../signup/signup_screen.dart';
import 'components/login_header_widget.dart';
import 'components/text_field_common.dart';
import 'components/wave_card.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends BaseState<LoginScreen> {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late dynamic size;
  late dynamic sizeHeight;
  late dynamic sizeWidth;
  bool _isPasswordVisible = false;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  Widget _buildSuffixIcon() {
    return IconButton(
      onPressed: () {
        setState(() {
          _isPasswordVisible = !_isPasswordVisible;
        });
      },
      icon: _isPasswordVisible
          ? const Icon(Icons.visibility)
          : const Icon(Icons.visibility_off),
      color: Colors.black,
    );
  }

  final UserService userService = UserService();

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return BaseView(
      viewModel: "",
      onPageBuilder: (context, value) {
        return scaffoldBody;
      },
      onModelReady: (model) {},
    );
  }

  Widget get scaffoldBody => Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              imageCard,
              // headArea,
              SizedBox(
                height: dynamicHeight(0.42),
                child: Column(
                  children: [
                    emailTextField,
                    passwordTextField,
                    forgetButton,
                    loginButton,
                    googleLoginButton,
                  ],
                ),
              ),
              registerArea
            ],
          ),
        ),
      );

  Widget get imageCard {
    sizeHeight = MediaQuery.of(context).size.height;
    sizeWidth = MediaQuery.of(context).size.width;
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        WaveCard(
          height: sizeHeight * 0.47,
          color: AppColor.kLine,
        ),
        SizedBox(
          width: sizeWidth * 0.5,
          height: sizeHeight * 0.40,
          child: Image.asset(ImageStrings.logoGoogle),
        ),
      ],
    );
  }

  Widget get headArea => Padding(
        padding: const EdgeInsets.only(top: 40.0, bottom: 50),
        child: LoginHeaderWidget(
          size: size,
          showText: true,
        ),
      );
  Widget get emailTextField => TextFieldCommon(
        controller: emailController,
        iconData: Icons.email_outlined,
        labelText: 'E-mail',
        obscureText: false,
      );
  Widget get passwordTextField => TextFieldCommon(
        controller: passwordController,
        iconData: Icons.fingerprint,
        labelText: "Şifre",
        obscureText: !_isPasswordVisible,
        suffixIcon: _buildSuffixIcon(),
      );
  Widget get forgetButton => Container(
        width: dynamicWidth(1),
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 16),
        child: TextButton(
          onPressed: () {
            ForgotPasswordScreen.buildShowModalBottomSheet(context);
          },
          child: const Text(
            "Şifremi unuttum",
            style: TextStyle(
              color: Color(0xFF273C66),
            ),
          ),
        ),
      );
  Widget get loginButton => SizedBox(
        width: double.maxFinite,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: _buildLoginButton(),
        ),
      );

  CupertinoButton _buildLoginButton() {
    return CupertinoButton(
      color: AppColor.appBarColor,
      onPressed: () {
        login(emailController.text.toString(),
            passwordController.text.toString());
      },
      child: const Text("Giriş Yap"),
    );
  }

  void login(String email, String password) async {
    bool isContains = false;
    for (var element in UserViewModel.users) {
      if (element.email == email) {
        UserViewModel.currentUser = element;
        isContains = true;
        break;
      }
    }
    if (isContains) {
      navigateToBottomNavMain();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
              "Girilen bilgilerde ait bir kullanıcı bulunamadı, lütfen kayıt olunuz."),
          backgroundColor: AppColor.appBarColor,
        ),
      );
    }
  }

  void navigateToBottomNavMain() {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => const BottomNavMain(),
      ),
      (route) => false,
    );
  }

  Widget get googleLoginButton => SizedBox(
      height: 68,
      width: double.maxFinite,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: CupertinoButton(
            onPressed: () {},
            color: const Color(0xFF273C66),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 40,
                  height: 40,
                  child: Image.asset(
                    ImageStrings.logoGoogle,
                  ),
                ),
                const Text("   Google ile Giriş Yap"),
              ],
            )),
      ));
  Widget get registerArea => SizedBox(
        width: double.maxFinite,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Bir hesabın yok mu? "),
            TextButton(
                child: const Text(
                  "Kaydol",
                  style: TextStyle(
                    color: Color(0xFF273C66),
                  ),
                ),
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SignupScreen(),
                      ),
                      (route) => false);
                }),
          ],
        ),
      );
}
