
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:com.example.simple_app/widgets/logout_button.dart';
import 'package:com.example.simple_app/cubits/auth_cubit.dart';
import 'package:com.example.simple_app/cubits/auth_state.dart';

class MockAuthCubit extends MockCubit<AuthState> implements AuthCubit {}

void main() {
	group('LogoutButton Widget Tests', () {
		testWidgets('should find LogoutButton and its text', (WidgetTester tester) async {
			// Arrange
			final mockAuthCubit = MockAuthCubit();

			// Act
			await tester.pumpWidget(
				MaterialApp(
					home: Scaffold(
						body: BlocProvider<AuthCubit>.value(
							value: mockAuthCubit,
							child: LogoutButton(),
						),
					),
				),
			);

			// Assert
			expect(find.byType(LogoutButton), findsOneWidget);
			expect(find.text('Logout'), findsOneWidget);
		});

		testWidgets('should call logout when button is pressed', (WidgetTester tester) async {
			// Arrange
			final mockAuthCubit = MockAuthCubit();

			when(() => mockAuthCubit.logout()).thenReturn(null);

			// Act
			await tester.pumpWidget(
				MaterialApp(
					home: Scaffold(
						body: BlocProvider<AuthCubit>.value(
							value: mockAuthCubit,
							child: LogoutButton(),
						),
					),
				),
			);
			await tester.tap(find.byType(LogoutButton));
			await tester.pump();

			// Assert
			verify(() => mockAuthCubit.logout()).called(1);
		});
	});
}
