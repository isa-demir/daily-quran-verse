import 'package:daily_message/features/quran/data/datasources/quran_remote_datasource.dart';
import 'package:daily_message/features/quran/data/repositories/quran_repository_impl.dart';
import 'package:daily_message/features/quran/domain/usecases/get_authors_usecase.dart';
import 'package:daily_message/features/quran/presentation/cubit/quran_cubit.dart';
import 'package:daily_message/features/quran/presentation/pages/random_verse_page.dart';
import 'package:daily_message/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  initLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => QuranCubit(
            locator(),
            locator(),
          ),
        ),
      ],
      child: const MaterialApp(
        title: 'Material App',
        home: RandomVersePage(),
      ),
    );
  }
}
