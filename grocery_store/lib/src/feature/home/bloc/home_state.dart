part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeSuccess extends HomeState {}

class HomeError extends HomeState {}

class HomeActionState extends HomeState {}

class HomeToFavState extends HomeState {}

class HomeToCartState extends HomeState {}
