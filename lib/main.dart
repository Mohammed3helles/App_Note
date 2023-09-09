import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:my_notes_app/data/models/note_model.dart';
import 'package:my_notes_app/ui/resources/constants_manager.dart';
import 'package:my_notes_app/ui/resources/route_manager.dart';
import 'package:my_notes_app/ui/resources/strings_manager.dart';
import 'package:my_notes_app/ui/resources/theme_manager.dart';

import 'bloc/get_note/get_note_cubit.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(NoteAdapter());
  await Hive.openBox<Note>(kBoxNote);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => GetNoteCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: NoteStrings.titleApp,
        theme: NoteTheme.getNoteTheme(),
        onGenerateRoute: NoteRoute.getRoutes,
      ),
    );
  }
}
