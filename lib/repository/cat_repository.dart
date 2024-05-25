import 'package:dio/dio.dart';
import '../models/breed.dart';

/// Repository para manejar las operaciones relacionadas con las razas de gatos.
/// Utiliza Dio para realizar solicitudes HTTP a The Cat API.
class CatRepository {
  final Dio _dio;

  /// Crea una instancia de [CatRepository] con un cliente [Dio] proporcionado.
  CatRepository(this._dio);

  /// Obtiene una lista de razas de gatos desde The Cat API.
  /// 
  /// Envía una solicitud GET a la API y devuelve una lista de [Breed].
  /// Si la solicitud falla, lanza una excepción.
  /// 
  /// [returns] Una lista de objetos [Breed].
  /// [throws] Una excepción si la solicitud falla.
  Future<List<Breed>> fetchBreeds() async {
    final response = await _dio.get(
      'https://api.thecatapi.com/v1/breeds',
      options: Options(
        headers: {
          'x-api-key': 'bda53789-d59e-46cd-9bc4-2936630fde39',
        },
      ),
    );
    
    if (response.statusCode == 200) {
      List<dynamic> data = response.data;
      return data.map((json) => Breed.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load breeds');
    }
  }

  /// Obtiene la URL de la imagen de una raza de gato dada su [referenceImageId].
  /// 
  /// Si la [referenceImageId] es nula o vacía, devuelve una URL de imagen por defecto.
  /// De lo contrario, devuelve la URL de la imagen correspondiente.
  /// 
  /// [param] referenceImageId La ID de referencia de la imagen.
  /// [returns] La URL de la imagen.
  String getImageUrl(String? referenceImageId) {
    if (referenceImageId == null || referenceImageId.isEmpty) {
      return 'https://via.placeholder.com/150'; // URL de imagen por defecto
    }
    return 'https://cdn2.thecatapi.com/images/$referenceImageId.jpg';
  }
}
