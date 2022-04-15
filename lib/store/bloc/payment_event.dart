part of 'payment_bloc.dart';

@immutable
abstract class PaymentEvent {}

class PaymentGetUrlEvent extends PaymentEvent {}
