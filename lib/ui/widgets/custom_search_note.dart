import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_notes_app/bloc/get_note/get_note_cubit.dart';

import '../resources/color_manager.dart';

class CustomSearchNote extends StatelessWidget {
  const CustomSearchNote({Key? key, this.onChanged}) : super(key: key);
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: MediaQuery.of(context).size.width - 100,
        child: TextField(
          controller: BlocProvider.of<GetNoteCubit>(context).controller,
          autofocus: true,
          cursorColor: NoteColor.primary,
          onChanged: onChanged,
          style: Theme.of(context).textTheme.labelMedium,
          decoration: const InputDecoration(
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: NoteColor.primary)),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: NoteColor.white)),
          ),
        ));
  }
}
