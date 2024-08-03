import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    on<CartEvent>((event, emit) {});

    on<OnNavCartTOFav>((event, emit) => emit(CartToFavoritesNavigationState()));
    on<OnNavCartTOHome>(
      (event, emit) => emit(CartToHomeNavigationState()),
    );
  }
}
