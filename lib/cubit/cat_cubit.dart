import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../models/breed.dart';
import '../repository/cat_repository.dart';

part 'cat_state.dart';

/// Cubit para manejar el estado de las razas de gatos.
/// Utiliza un repositorio [CatRepository] para obtener y filtrar las razas.
class CatCubit extends Cubit<CatState> {
  final CatRepository repository;

  /// Crea una instancia de [CatCubit] con un repositorio [CatRepository] proporcionado.
  CatCubit(this.repository) : super(CatInitial());

  /// Obtiene las razas de gatos desde el repositorio.
  /// 
  /// Emite [CatLoading] mientras se realiza la solicitud.
  /// Si la solicitud es exitosa, emite [CatLoaded] con la lista de razas.
  /// Si la solicitud falla, emite [CatError] con un mensaje de error.
  void fetchBreeds() async {
    try {
      emit(CatLoading());
      final breeds = await repository.fetchBreeds();
      emit(CatLoaded(breeds));
    } catch (e) {
      emit(CatError('Failed to fetch breeds'));
    }
  }

  /// Filtra las razas de gatos según el [query] proporcionado.
  /// 
  /// Si el estado actual es [CatLoaded], filtra la lista de razas
  /// por el nombre de la raza y emite un nuevo estado [CatLoaded]
  /// con la lista filtrada.
  /// 
  /// [param] query El texto de búsqueda para filtrar las razas.
  void filterBreeds(String query) {
    final currentState = state;
    if (currentState is CatLoaded) {
      final filteredBreeds = currentState.breeds.where((breed) {
        return breed.name.toLowerCase().contains(query.toLowerCase());
      }).toList();
      emit(CatLoaded(currentState.breeds, filteredBreeds));
    }
  }
}
