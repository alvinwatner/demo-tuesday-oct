
import 'package:flutter_test/flutter_test.dart';
import 'package:your_package_name/models/user_model.dart';

void main() {
	group('User Model Tests', () {
		test('User model should correctly serialize from JSON', () {
			final json = {
				'id': '123',
				'email': 'test@example.com',
			};

			final user = User.fromJson(json);

			expect(user.id, '123');
			expect(user.email, 'test@example.com');
		});

		test('User model should correctly serialize to JSON', () {
			final user = User(id: '123', email: 'test@example.com');

			final json = user.toJson();

			expect(json['id'], '123');
			expect(json['email'], 'test@example.com');
		});
	});
}
