part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class SelectedCategory extends HomeState {}

final class ChangeQuantityState extends HomeState {}

final class GetItemsLoading extends HomeState {}
final class GetItemsSuccess extends HomeState {}
final class GetItemsFailed extends HomeState {}

final class SeedItems extends HomeState {}
