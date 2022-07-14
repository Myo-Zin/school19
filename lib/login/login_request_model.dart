import 'package:equatable/equatable.dart';

class LoginRequest extends Equatable{
  final String? phoneNumber;
  final String? password;

  const LoginRequest(this.phoneNumber, this.password);

  @override
  List<Object?> get props => [phoneNumber,password];
}