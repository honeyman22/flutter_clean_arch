import 'package:clean_arch/common/bloc/button/button_state.dart';
import 'package:clean_arch/common/bloc/button/button_state_cubit.dart';
import 'package:clean_arch/common/widgets/custom_textfield.dart';
import 'package:clean_arch/common/widgets/primary_button.dart';
import 'package:clean_arch/data/models/signup_req_params.dart';
import 'package:clean_arch/domain/usecases/signup.dart';
import 'package:clean_arch/service_locator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _agreeToTerms = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: BlocProvider(
          create: (context) => ButtonStateCubit(),
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.only(
                  bottom: 20, right: 20, left: 20, top: 80),
              child: Column(
                spacing: 20,
                children: [
                  Column(
                    children: [
                      Text(
                        "Create Account",
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 50),
                        child: Text(
                          "Fill your information below or register with your social media",
                          style: Theme.of(context).textTheme.bodySmall,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  CustomTextField(
                    hintText: "John Doe",
                    label: "Name",
                    keyboardType: TextInputType.text,
                    controller: _nameController,
                  ),
                  CustomTextField(
                    hintText: "example@gmail.com",
                    label: "Email",
                    keyboardType: TextInputType.emailAddress,
                    controller: _emailController,
                  ),
                  CustomTextField(
                    hintText: "*********",
                    label: "Password",
                    keyboardType: TextInputType.text,
                    controller: _passwordController,
                    icon: Icons.lock,
                    obscureText: true,
                  ),
                  Row(
                    children: [
                      Checkbox(
                        value: _agreeToTerms,
                        onChanged: (value) {
                          setState(() {
                            _agreeToTerms = value!;
                          });
                        },
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "Agree with ",
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            TextSpan(
                              text: "Terms and Conditions",
                              recognizer: TapGestureRecognizer()..onTap = () {},
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                                color: Theme.of(context).colorScheme.primary,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  BlocBuilder<ButtonStateCubit, ButtonState>(
                      builder: (context, state) {
                    if (state is ButtonStateLoading) {
                      return PrimaryButton(
                          text: "Sign Up", isLoading: true, onPressed: () {});
                    }

                    if (state is ButtonStateError) {
                      return PrimaryButton(
                          text: "hello Error", onPressed: () {});
                    }
                    return PrimaryButton(
                        text: "Sign Up",
                        onPressed: () {
                          context.read<ButtonStateCubit>().excute(
                              usecase: sl<SignupUseCase>(),
                              params: SignupReqParams(
                                email: "email",
                                password: "password",
                                name: "name",
                              ));
                        });
                  }),
                  RichText(
                    text: TextSpan(
                      text: "Already have an account? ",
                      style: Theme.of(context).textTheme.bodyMedium,
                      children: [
                        TextSpan(
                          text: "Sign In",
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            decorationColor:
                                Theme.of(context).colorScheme.primary,
                            color: Theme.of(context).colorScheme.primary,
                            fontWeight: FontWeight.bold,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.pushNamed(context, "/login");
                            },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
