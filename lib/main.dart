import 'package:cat_breeds_ap/page/cat_page.dart';
import 'package:cat_breeds_ap/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'cubit/cat_cubit.dart';
import 'repository/cat_repository.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final dio = Dio();
    final repository = CatRepository(dio);

    return MaterialApp(
      title: 'Cat Breeds',
      theme: appTheme,
      home: BlocProvider(
        create: (_) => CatCubit(repository)..fetchBreeds(), // Llamada inicial
        child: const CatPage(),
      ),
    );
  }
}


