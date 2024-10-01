
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:com.example.simple_app/main.dart';

class MockAuthCubit extends MockCubit<AuthState> implements AuthCubit {}

void main() {
	group('MainApp', () {
		testWidgets('should display LoginScreen initially', (WidgetTester tester) async {
			await tester.pumpWidget(MainApp());

			expect(find.byType(LoginScreen), findsOneWidget);
		});

		testWidgets('should navigate to HomeScreen on Authenticated state', (WidgetTester tester) async {
			final mockAuthCubit = MockAuthCubit();

			whenListen(
				mockAuthCubit,
				Stream.fromIterable([Authenticated()]),
				initialState: AuthInitial(),
			);

			await tester.pumpWidget(
				BlocProvider<AuthCubit>(
					create: (_) => mockAuthCubit,
					child: MainApp(),
				),
			);

			await tester.pumpAndSettle();

			expect(find.byType(HomeScreen), findsOneWidget);
		});

		testWidgets('should navigate back to LoginScreen on Unauthenticated state', (WidgetTester tester) async {
			final mockAuthCubit = MockAuthCubit();

			whenListen(
				mockAuthCubit,
				Stream.fromIterable([Authenticated(), Unauthenticated()]),
				initialState: AuthInitial(),
			);

			await tester.pumpWidget(
				BlocProvider<AuthCubit>(
					create: (_) => mockAuthCubit,
					child: MainApp(),
				),
			);

			await tester.pumpAndSettle();
			await tester.pumpAndSettle();

			expect(find.byType(LoginScreen), findsOneWidget);
		});
	});
}
