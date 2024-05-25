part of 'cat_cubit.dart';

abstract class CatState extends Equatable {
  const CatState();

  @override
  List<Object> get props => [];
}

class CatInitial extends CatState {}

class CatLoading extends CatState {}

class CatLoaded extends CatState {
  final List<Breed> breeds;
  final List<Breed> filteredBreeds;

  CatLoaded(this.breeds, [List<Breed>? filteredBreeds])
      : filteredBreeds = filteredBreeds ?? breeds;

  @override
  List<Object> get props => [breeds, filteredBreeds];
}

class CatError extends CatState {
  final String message;

  CatError(this.message);

  @override
  List<Object> get props => [message];
}
