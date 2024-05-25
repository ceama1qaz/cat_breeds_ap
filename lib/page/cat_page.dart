import 'package:cat_breeds_ap/page/breed_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/cat_cubit.dart';


/// Página principal que muestra una lista de razas de gatos.
/// 
/// Esta página incluye una barra de búsqueda y una lista de razas
/// que se cargan al iniciar la página. Cada raza se muestra en una
/// tarjeta que incluye el nombre, origen, nivel de inteligencia y
/// una imagen de la raza.
class CatPage extends StatefulWidget {
  const CatPage({super.key});

  @override
  _CatPageState createState() => _CatPageState();
}

class _CatPageState extends State<CatPage> {
  @override
  void initState() {
    super.initState();
    context.read<CatCubit>().fetchBreeds();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cat Breeds'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (query) {
                context.read<CatCubit>().filterBreeds(query);
              },
              decoration: const InputDecoration(
                labelText: 'Search Breeds',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Expanded(
            child: BlocBuilder<CatCubit, CatState>(
              builder: (context, state) {
                if (state is CatInitial) {
                  return const Center(child: Text('Loading cat breeds...'));
                } else if (state is CatLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is CatLoaded) {
                  final breeds = state.filteredBreeds;
                  return ListView.builder(
                    itemCount: breeds.length,
                    itemBuilder: (context, index) {
                      final breed = breeds[index];
                      final imageUrl =
                          'https://cdn2.thecatapi.com/images/${breed.referenceImageId}.jpg';

                      return Card(
                        margin: const EdgeInsets.all(8.0),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(breed.name,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  IconButton(
                                    icon: const Icon(Icons.more_vert),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              BreedDetailPage(breed: breed),
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              ),
                              AspectRatio(
                                aspectRatio:
                                    1.0, // Mantiene la relación de aspecto 1:1 (cuadrada)
                                child: imageUrl.isNotEmpty
                                    ? Image.network(
                                        imageUrl,
                                        width: double.infinity,
                                        fit: BoxFit.cover,
                                        errorBuilder:
                                            (context, error, stackTrace) {
                                          return Container(
                                            color: Colors.grey,
                                            child: const Icon(Icons.error,
                                                color: Colors.red),
                                          );
                                        },
                                      )
                                    : Container(color: Colors.grey),
                              ),
                              const SizedBox(height: 8),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(breed.origin),
                                  Container(
                                    width: 20,
                                  ),
                                  Flexible(
                                    child: Text(
                                      breed.temperament,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                } else if (state is CatError) {
                  return Center(child: Text(state.message));
                } else {
                  return Container();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
