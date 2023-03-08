import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
	const LoginScreen({super.key});

	@override
	State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

	TextEditingController emailController = TextEditingController();
	TextEditingController passwordController = TextEditingController();

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
        title: TextAW.heading3(
					text: 'Sign In',
					style: heading3Style.copyWith(
						color: ColorName.mainTextColor
					),
				),
				backgroundColor: ColorName.backgroundColor,
        elevation: 0,
      ),
			body: SafeArea(
				minimum: const EdgeInsets.all(16),
				child: Column(
					crossAxisAlignment: CrossAxisAlignment.start,
					children: [
						const TextAW.heading1(
							text: "Welcome to",
							textAlign: TextAlign.left,
							textDirection: TextDirection.ltr,
						),
						const SizedBox(height: 10,),
						const TextAW.body(text: "Enter Your email address for sign in."),
						const SizedBox(height: 32,),
						TextFormFieldMW(
							controller: emailController, 
							keyboardType: TextInputType.emailAddress,
							isHasLabel: true,
							labelText: "EMAIL ADDRESS",
							onChanged: (value) {
								// print(value);
							},
						),
						const SizedBox(height: 18,),
						TextFormFieldMW(
							controller: passwordController, 
							keyboardType: TextInputType.none,
							isHasLabel: true,
							labelText: "PASSWORD",
							obscureText: true,
							obscuringCharacter: "*",
							onChanged: (value) {
								// print(value);
							},
						),
						const SizedBox(height: 18,),
						const Center(
							child: TextAW.body(text: 'Forget Password?'),
						),
						const SizedBox(height: 18,),
						ButtonAW(
							title: "SIGN IN",
							width: double.infinity,
							height: 60,
							onTap: () {	
								// print("on tap");
							},
						),
					],
				),
			),
		);
	}
}

