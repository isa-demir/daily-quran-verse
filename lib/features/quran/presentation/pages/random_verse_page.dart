import 'package:daily_message/features/quran/domain/entities/author_entity.dart';
import 'package:daily_message/features/quran/presentation/cubit/quran_cubit.dart';
import 'package:daily_message/features/quran/presentation/widgets/show_random_verse_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RandomVersePage extends StatefulWidget {
  const RandomVersePage({super.key});

  @override
  State<RandomVersePage> createState() => _RandomVersePageState();
}

class _RandomVersePageState extends State<RandomVersePage> {
  AuthorEntity? _selectedAuthor;
  List<AuthorEntity> _authors = [];

  @override
  void initState() {
    super.initState();
    context.read<QuranCubit>().getAuthors();
  }

  _changeSelectedAuthor(AuthorEntity? newAuthor) {
    setState(() {
      _selectedAuthor = newAuthor;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bana Bir Ayet'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: BlocListener<QuranCubit, QuranState>(
          listener: (context, state) {
            if (state is AuthorLoaded) {
              _authors = state.authors;
              _changeSelectedAuthor(state.authors.first);
            }
          },
          child: _authors.isNotEmpty
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Meal Yazarı',
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                    DropdownButton<AuthorEntity>(
                      isExpanded: true,
                      value: _selectedAuthor,
                      items: _authors.map((e) {
                        return DropdownMenuItem(
                          value: e,
                          child: Text(e.name ?? 'n/a'),
                        );
                      }).toList(),
                      onChanged: (value) {
                        _changeSelectedAuthor(value);
                      },
                    ),
                    const ShowRandomVerseWidget(),
                    // BlocBuilder<QuranCubit, QuranState>(
                    //   builder: (context, state) {
                    //     if (state is SurahLoaded) {
                    //       return Expanded(
                    //         child: ListView.builder(
                    //           itemBuilder: (context, index) {
                    //             final surah = state.surahs[index];
                    //             return ListTile(
                    //               title: Text(surah.name ?? 'n/a'),
                    //               subtitle:
                    //                   Text('Ayet sayisi : ${surah.verseCount}'),
                    //             );
                    //           },
                    //         ),
                    //       );
                    //     } else {
                    //       return const Center(
                    //         child: CircularProgressIndicator(),
                    //       );
                    //     }
                    //   },
                    // ),
                  ],
                )
              : const Center(
                  child: CircularProgressIndicator(),
                ),
        ),
      ),
    );
  }
}
