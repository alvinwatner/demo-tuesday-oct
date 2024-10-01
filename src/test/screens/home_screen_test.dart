
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:com.example.simple_app/screens/home_screen.dart';

class MockAuthCubit extends MockCubit<void> implements AuthCubit {}

void main() {
	group('HomeScreen Widget Tests', () {
		testWidgets('should display a logout button', (WidgetTester tester) async {
			await tester.pumpWidget(
				MaterialApp(
					home: HomeScreen(),
				),
			);

			expect(find.byType(LogoutButton), findsOneWidget);
		});
	});

	group('LogoutButton Widget Tests', () {
		testWidgets('should display text "Logout"', (WidgetTester tester) async {
			await tester.pumpWidget(
				MaterialApp(
					home: Scaffold(
						body: LogoutButton(),
					),
				),
			);

			expect(find.text('Logout'), findsOneWidget);
		});
	});

	group('HomeScreen Cubit Tests', () {
		late MockAuthCubit mockAuthCubit;

		setUp(() {
			mockAuthCubit = MockAuthCubit();
		});

		blocTest<MockAuthCubit, void>(
			'calls logout when logout button is pressed',
			build: () => mockAuthCubit,
			act: (cubit) {
				// This line is simulating the press of the logout button
				final homeScreen = HomeScreen();
				final logoutButton = LogoutButton();
				logoutButton.onPressed?.call();
			},
			verify: (_) {
				verify(() => mockAuthCubit.logout()).called(1);
			},
		);
	});
}
