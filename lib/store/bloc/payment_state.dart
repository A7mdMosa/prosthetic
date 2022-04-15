part of 'payment_bloc.dart';

@immutable
abstract class PaymentState {
  final String url;
  const PaymentState(this.url);
}

class PaymentInitial extends PaymentState {
  const PaymentInitial(String url) : super(url);
}

class PaymentLoadingState extends PaymentState {
  const PaymentLoadingState(String url) : super(url);
}

class PaymentLoadedState extends PaymentState {
  const PaymentLoadedState(String url) : super(url);
}
