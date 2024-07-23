import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeEvent>((event, emit) {});

    on<OnClickCart>((event, emit) {
      print('on cart clicked');
    });
    on<OnClickFav>((event, emit) {
      print('on fav clicked');
    });
    on<OnNavigateCart>((event, emit) {
      print('navigating to cart');
    });
    on<OnNavigateFav>((event, emit) {
      print('navigating to fav');
    });
  }
}
