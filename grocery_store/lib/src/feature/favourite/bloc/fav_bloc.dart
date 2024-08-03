import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'fav_event.dart';
part 'fav_state.dart';

class FavBloc extends Bloc<FavEvent, FavState> {
  FavBloc() : super(FavInitial()) {
    on<FavEvent>((event, emit) {});

    on<OnNavigatingFavTOCart>(
      (event, emit) => emit(FavToCartNavigatingState()),
    );

    on<OnNavigatingFavTOHome>(
      (event, emit) => emit(FavToHomeNavigatingState()),
    );
  }
}
