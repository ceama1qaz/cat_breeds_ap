import 'package:cat_breeds_ap/models/breed.dart';
import 'package:flutter/material.dart';

/// Página que muestra los detalles de una raza de gato.
///
/// Muestra una imagen de la raza en la parte superior y la información detallada
/// debajo de la imagen en una lista desplazable.
class BreedDetailPage extends StatelessWidget {
  final Breed breed;

  const BreedDetailPage({super.key, required this.breed});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(breed.name),
      ),
      body: Column(
        children: [
          // Imagen fija en la parte superior
            // Imagen fija en la parte superior
          SizedBox(
            width: double.infinity,
            height: 300,
            child: breed.referenceImageId.isNotEmpty
                ? Image.network(
                    'https://cdn2.thecatapi.com/images/${breed.referenceImageId}.jpg',
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: Colors.grey,
                        child: const Center(
                          child: Icon(Icons.error, color: Colors.red),
                        ),
                      );
                    },
                  )
                : Container(
                    color: Colors.grey,
                    child: const Center(
                      child: Icon(Icons.image, color: Colors.white),
                    ),
                  ),
          ),
          // Contenido desplazable debajo de la imagen
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      breed.description,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    const SizedBox(height: 16),
                    _buildDetailSection(context, 'Origin', breed.origin),
                    _buildDetailSection(context, 'Life Span', breed.lifeSpan),
                    _buildDetailSection(context, 'Temperament', breed.temperament),
                    _buildDetailSection(context, 'Adaptability', breed.adaptability.toString()),
                    _buildDetailSection(context, 'Affection Level', breed.affectionLevel.toString()),
                    _buildDetailSection(context, 'Child Friendly', breed.childFriendly.toString()),
                    _buildDetailSection(context, 'Dog Friendly', breed.dogFriendly.toString()),
                    _buildDetailSection(context, 'Energy Level', breed.energyLevel.toString()),
                    _buildDetailSection(context, 'Grooming', breed.grooming.toString()),
                    _buildDetailSection(context, 'Health Issues', breed.healthIssues.toString()),
                    _buildDetailSection(context, 'Intelligence', breed.intelligence.toString()),
                    _buildDetailSection(context, 'Shedding Level', breed.sheddingLevel.toString()),
                    _buildDetailSection(context, 'Social Needs', breed.socialNeeds.toString()),
                    _buildDetailSection(context, 'Stranger Friendly', breed.strangerFriendly.toString()),
                    _buildDetailSection(context, 'Vocalisation', breed.vocalisation.toString()),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Construye una sección de detalle para mostrar información de la raza.
  ///
  /// [title] es el título de la sección.
  /// [content] es el contenido de la sección.
  Widget _buildDetailSection(BuildContext context, String title, String content) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text(
              content,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}
