
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:equatable/equatable.dart';
import 'package:your_package_name/cubits/auth_state.dart';

// Mocking the AuthState using Mocktail
class MockAuthState extends Mock implements AuthState {}

void main() {
	group('AuthState tests', () {
		test('AuthState should be Equatable', () {
			expect(AuthState(), isA<Equatable>());
		});
		
		group('AuthInitial', () {
			test('AuthInitial should be Equatable', () {
				expect(AuthInitial(), isA<Equatable>());
			});
		});
		
		group('Authenticated', () {
			final state = Authenticated();
			
			test('Authenticated should be Equatable', () {
				expect(state, isA<Equatable>());
			});
			
			test('Authenticated props should contain correct values', () {
				expect(state.props, []);
			});
		});
		
		group('Unauthenticated', () {
			final state = Unauthenticated();
			
			test('Unauthenticated should be Equatable', () {
				expect(state, isA<Equatable>());
			});
			
			test('Unauthenticated props should contain correct values', () {
				expect(state.props, []);
			});
		});
	});
}
