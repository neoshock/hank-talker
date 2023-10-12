import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hank_talker_mobile/core/auth/providers/auth_provider.dart';
import 'package:hank_talker_mobile/widgets/buttons.dart';
import 'package:hank_talker_mobile/widgets/inputs.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formGlobalKey = GlobalKey<FormState>();

  void login() {
    print('entro');
    if (formGlobalKey.currentState!.validate()) {
      context
          .read<AuthProvider>()
          .login(emailController.text, passwordController.text);
    }
  }

  // validateEmail

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: EdgeInsets.all(15),
            child: Center(
                child: Form(
                    key: formGlobalKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomTextImputWithLabel(
                          'Email',
                          emailController,
                          TextInputType.emailAddress,
                          context,
                          const Icon(PhosphorIcons.envelope),
                          (value) {
                            if (value == null || value == '') {
                              return 'Email is required';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 15),
                        CustomImputPassword(
                            passwordController,
                            TextInputType.visiblePassword,
                            context,
                            const Icon(PhosphorIcons.lock),
                            'Password', (value) {
                          if (value == null || value == '') {
                            return 'Password is required';
                          }
                          return null;
                        }, false),
                        const SizedBox(height: 15),
                        CusttomButtonRounded(context, login, 'Login'),
                      ],
                    )))));
  }
}
