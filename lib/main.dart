import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notepad/service/locator.dart';

import 'features/main_page/presentation/main_page.dart';
import 'features/main_page/presentation/notes_bloc/notes_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    setUp();
    return MaterialApp(
      title: 'Notepad',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.grey),
        useMaterial3: true,
      ),
      home: BlocProvider<NotesBloc>(
        create: (context) => locator<NotesBloc>()..add(const NotesEvent.started()),
        child: const MainPage(
          key: Key('MainPage'),
        ),
      ),
    );
  }
}
