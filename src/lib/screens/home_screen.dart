
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:com.example.simple_app/widgets/logout_button.dart';
import 'package:com.example.simple_app/widgets/stock_metrics.dart';
import 'package:com.example.simple_app/cubits/auth_cubit.dart';
import 'package:com.example.simple_app/cubits/stock_cubit.dart';

class HomeScreen extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
				title: Text('Home'),
			),
			body: Column(
				children: [
					BlocProvider(
						create: (context) => StockCubit()..fetchStockData(),
						child: StockMetrics(),
					),
					Center(
						child: LogoutButton(),
					),
				],
			),
		);
	}
}

class LogoutButton extends StatelessWidget {
	final void Function()? onPressed;

	LogoutButton({Key? key, this.onPressed}) : super(key: key);

	@override
	Widget build(BuildContext context) {
		return ElevatedButton(
			onPressed: () {
				context.read<AuthCubit>().logout();
				if (onPressed != null) {
					onPressed!();
				}
			},
			child: Text('Logout'),
		);
	}
}
