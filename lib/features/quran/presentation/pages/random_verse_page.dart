import 'package:daily_message/features/quran/domain/entities/author_entity.dart';
import 'package:daily_message/features/quran/presentation/cubit/quran_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RandomVersePage extends StatefulWidget {
  const RandomVersePage({super.key});

  @override
  State<RandomVersePage> createState() => _RandomVersePageState();
}

class _RandomVersePageState extends State<RandomVersePage> {
  @override
  void initState() {
    super.initState();
    context.read<QuranCubit>().getAuthors();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bana Bir Ayet'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: BlocBuilder<QuranCubit, QuranState>(
          builder: (context, state) {
            if (state is QuranPageState) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Meal Yazarı',
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                  DropdownButton<AuthorEntity>(
                    isExpanded: true,
                    value: state.selectedAuthor,
                    items: state.authors.map((e) {
                      return DropdownMenuItem(
                        value: e,
                        child: Text(e.name ?? 'n/a'),
                      );
                    }).toList(),
                    onChanged: (value) {},
                  ),
                ],
              );
            } else if (state is QuranLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is QuranError) {
              return Center(
                child: Text(state.errMsg),
              );
            } else {
              return const Center(
                child: Text('Beklenmedik bir hata olustu!'),
              );
            }
          },
        ),
      ),
    );
  }
}
