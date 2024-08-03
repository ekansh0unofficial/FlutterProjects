part of 'fav_bloc.dart';

@immutable
sealed class FavState {}

final class FavInitial extends FavState {}

final class FavActionState extends FavState {}

final class FavToHomeNavigatingState extends FavActionState {}

final class FavToCartNavigatingState extends FavActionState {}
