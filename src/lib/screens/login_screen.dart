
import 'package:flutter/material.dart';
import 'package:com.example.simple_app/widgets/login_form.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:com.example.simple_app/cubits/auth_cubit.dart';
import 'package:com.example.simple_app/screens/home_screen.dart';

class LoginScreen extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
				title: Text('Login'),
			),
			body: Padding(
				padding: const EdgeInsets.all(16.0),
				child: Column(
					children: [
						Text(
							'Login',
							style: TextStyle(fontSize: 24),
						),
						SizedBox(height: 16),
						LoginForm(),
						SizedBox(height: 16),
						ElevatedButton(
							onPressed: () {
								// Normally, you would collect the email and password from the LoginForm
								// For simplicity, we'll use hardcoded values here
								String email = 'user@example.com';
								String password = 'password';

								context.read<AuthCubit>().login(email, password);
							},
							child: Text('Login'),
						)
					],
				),
			),
		);
	}
}
