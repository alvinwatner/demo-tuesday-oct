
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubits/auth_cubit.dart';
import 'cubits/stock_cubit.dart';
import 'screens/login_screen.dart';
import 'screens/home_screen.dart';

void main() {
	runApp(MainApp());
}

class MainApp extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return MultiBlocProvider(
			providers: [
				BlocProvider(create: (_) => AuthCubit()),
				BlocProvider(create: (_) => StockCubit()..fetchStockData())
			],
			child: MaterialApp(
				title: 'Simple App',
				home: BlocBuilder<AuthCubit, AuthState>(
					builder: (context, state) {
						if (state is Authenticated) {
							return HomeScreen();
						} else {
							return LoginScreen();
						}
					},
				),
			),
		);
	}
}
