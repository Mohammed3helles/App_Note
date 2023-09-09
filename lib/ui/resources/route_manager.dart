import 'package:flutter/material.dart';
import 'package:my_notes_app/data/models/note_model.dart';
import 'package:my_notes_app/ui/resources/strings_manager.dart';
import 'package:my_notes_app/ui/screens/edit_note_screen.dart';
import 'package:my_notes_app/ui/screens/note_screen.dart';

class NoteRoute {
  static const String homeNoteScreen = '/';
  static const String editNoteScreen = '/edit note';

  static Route<dynamic> getRoutes(RouteSettings settings) {
    switch (settings.name) {
      case homeNoteScreen:
        return MaterialPageRoute(
            builder: (_) => const HomeNote());
      case editNoteScreen:
        return MaterialPageRoute(builder: (_) {
          Note note = settings.arguments as Note;
          return EditNote(note: note);
        });
      default:
        return unKnownScreen();
    }
  }

  static Route<dynamic> unKnownScreen() {
    return MaterialPageRoute(
        builder: (_) => const Scaffold(
              body: Center(
                child: Text(NoteStrings.notAnyScreen),
              ),
            ));
  }
}
