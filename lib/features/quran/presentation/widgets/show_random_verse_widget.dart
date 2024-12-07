import 'package:daily_message/features/quran/domain/entities/author_entity.dart';
import 'package:daily_message/features/quran/presentation/cubit/quran_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShowRandomVerseWidget extends StatelessWidget {
  const ShowRandomVerseWidget({super.key, required this.selectedAuthor});

  final AuthorEntity selectedAuthor;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuranCubit, QuranState>(
      builder: (context, state) {
        if (state is QuranLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is QuranPageState) {
          final verse = state.verseEntity!;
          return Card(
            child: ListTile(
              title: Text(
                '${verse.verse}',
                textAlign: TextAlign.center,
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  Text(verse.translation!.text!),
                  Text(
                    '\n${verse.surah!.name} Suresi - ${verse.verseNumber}. Ayet',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
          );
        } else {
          return const Center(
            child: Text('Hata olustu!'),
          );
        }
      },
    );
  }
}
