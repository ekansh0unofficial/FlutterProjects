part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class onClickFav extends HomeEvent {}

class onClickCart extends HomeEvent {}

class onNavigateCart extends HomeEvent {}

class onNavigateFav extends HomeEvent {}
