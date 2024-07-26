part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoadSuccess extends HomeState {
  final List<Product> products;
  HomeLoadSuccess({required this.products});
}

class HomeError extends HomeState {}

class HomeActionState extends HomeState {}

class HomeToFavState extends HomeActionState {}

class HomeToCartState extends HomeActionState {}
