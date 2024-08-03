part of 'cart_bloc.dart';

@immutable
sealed class CartEvent {}

final class OnNavCartTOFav extends CartEvent {}

final class OnNavCartTOHome extends CartEvent {}
