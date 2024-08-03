part of 'fav_bloc.dart';

@immutable
sealed class FavEvent {}

final class OnNavigatingFavTOHome extends FavEvent {}

final class OnNavigatingFavTOCart extends FavEvent {}
