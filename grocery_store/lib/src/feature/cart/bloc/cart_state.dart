part of 'cart_bloc.dart';

@immutable
sealed class CartState {}

final class CartInitial extends CartState {}

final class CartActionState extends CartState {}

final class CartToHomeNavigationState extends CartActionState {}

final class CartToFavoritesNavigationState extends CartActionState {}
