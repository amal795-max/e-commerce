import 'package:flutter_bloc/flutter_bloc.dart';

class CartState {
  final int quantity;

  const CartState({this.quantity = 1});
}

class CartCounter extends Cubit<CartState> {
  CartCounter() : super(const CartState());

  void plus() {
    emit(CartState(quantity: state.quantity + 1));
  }

  void minus() {
    if (state.quantity > 1) {
      emit(CartState(quantity: state.quantity - 1));
    }
  }

  void f() {
    emit(CartState(quantity: 1));
  }
}
