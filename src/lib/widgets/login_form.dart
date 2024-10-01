
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubits/auth_cubit.dart';

class LoginForm extends StatefulWidget {
	@override
	_LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
	final _emailController = TextEditingController();
	final _passwordController = TextEditingController();

	@override
	void dispose() {
		_emailController.dispose();
		_passwordController.dispose();
		super.dispose();
	}

	@override
	Widget build(BuildContext context) {
		return Padding(
			padding: const EdgeInsets.all(16.0),
			child: Column(
				mainAxisAlignment: MainAxisAlignment.center,
				children: [
					TextField(
						controller: _emailController,
						decoration: InputDecoration(labelText: 'Email'),
						keyboardType: TextInputType.emailAddress,
					),
					const SizedBox(height: 16.0),
					TextField(
						controller: _passwordController,
						decoration: InputDecoration(labelText: 'Password'),
						obscureText: true,
					),
					const SizedBox(height: 16.0),
					ElevatedButton(
						onPressed: () {
							final email = _emailController.text;
							final password = _passwordController.text;
							context.read<AuthCubit>().login(email, password);
						},
						child: Text('Login'),
					),
				],
			),
		);
	}
}
