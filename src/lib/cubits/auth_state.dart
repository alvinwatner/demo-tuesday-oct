
import 'package:equatable/equatable.dart';
import '../models/stock_model.dart';

abstract class AuthState extends Equatable {
	const AuthState();
	
	@override
	List<Object> get props => [];
}

class AuthInitial extends AuthState {
	const AuthInitial();
	
	@override
	List<Object> get props => [];
}

class Authenticated extends AuthState {
	final List<Stock> stocks;

	const Authenticated(this.stocks);

	@override
	List<Object> get props => [stocks];
}

class Unauthenticated extends AuthState {
	const Unauthenticated();
	
	@override
	List<Object> get props => [];
}
