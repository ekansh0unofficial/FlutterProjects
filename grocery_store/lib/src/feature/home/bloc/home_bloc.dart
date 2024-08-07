import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';
import 'package:meta/meta.dart';

import '../../../data/models /product.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<FetchHome>((event, emit) async {
      emit(HomeLoading());

      await Future.delayed(Duration(seconds: 3));

      final jsonString =
          await rootBundle.loadString('lib/assets/products.json');
      final Map<String, dynamic> jsonData = json.decode(jsonString);
      List<Product> productlist = jsonData['products']
          .map<Product>((item) => Product.fromJson(item))
          .toList();

      emit(HomeLoadSuccess(products: productlist));
    });
    on<HomeEvent>((event, emit) {});

    on<OnClickCart>((event, emit) {});
    on<OnClickFav>((event, emit) {});
    on<OnNavigateHomeTOCart>((event, emit) {
      emit(HomeToCartState());
    });
    on<OnNavigateHomeTOFav>((event, emit) {
      emit(HomeToFavState());
    });
  }
}
