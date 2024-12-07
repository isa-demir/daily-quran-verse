import 'package:daily_message/features/quran/presentation/cubit/quran_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthorsPage extends StatelessWidget {
  const AuthorsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Autthors'),
      ),
      body: BlocBuilder<QuranCubit, QuranState>(
        builder: (context, state) {
          if (state is QuranInitial) {
            context.read<QuranCubit>().getAuthors();
            return const Text('veriler aliniyor!');
          } else if (state is QuranLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is AuthorLoaded) {
            return Expanded(
              child: ListView.builder(
                itemCount: state.authors.length,
                itemBuilder: (context, index) {
                  final item = state.authors[index];
                  return Text(item.name ?? 'n/a');
                },
              ),
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
    );
  }
}
