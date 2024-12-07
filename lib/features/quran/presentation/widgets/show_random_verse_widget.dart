import 'package:daily_message/features/quran/presentation/cubit/quran_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShowRandomVerseWidget extends StatelessWidget {
  const ShowRandomVerseWidget({super.key});

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
                  Text(verse.translation!.text!),
                  Text(verse.translation?.author?.name ?? 'n/a'),
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
