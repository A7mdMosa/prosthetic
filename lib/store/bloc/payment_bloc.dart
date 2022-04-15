import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:prosthetic/store/data/repository/payment_repository.dart';

part 'payment_event.dart';
part 'payment_state.dart';

class PaymentBloc extends Bloc<PaymentEvent, PaymentState> {
  PaymentRepository _paymentRepository;
  PaymentBloc(this._paymentRepository) : super(const PaymentInitial('')) {
    on<PaymentEvent>((event, emit) {});
    on<PaymentGetUrlEvent>((event, emit) async {
      String token = await _paymentRepository.paymentKeyRequest();
      String url =
          'https://accept.paymob.com/api/acceptance/iframes/366634?payment_token=$token';
      print(url);
      emit(PaymentLoadedState(url));
    });
  }
}
