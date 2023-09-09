import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_notes_app/bloc/get_note/get_note_cubit.dart';
import 'package:my_notes_app/ui/resources/route_manager.dart';

import '../../data/models/note_model.dart';
import '../resources/color_manager.dart';

class NoteItem extends StatelessWidget {
  final Note note;

  const NoteItem({Key? key, required this.note}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, NoteRoute.editNoteScreen,arguments: note);
      },
      child: Container(
        margin: const EdgeInsets.only(top: 10, right: 25, left: 25),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        width: double.infinity,
        height: 240,
        decoration: BoxDecoration(
            color: Color(note.color), borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ListTile(
                title: Text(
                  note.title,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Text(
                    note.description,
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ),
                trailing: GestureDetector(
                  onTap: () {
                    note.delete();
                    BlocProvider.of<GetNoteCubit>(context).getNote();
                  },
                  child: const Icon(
                    Icons.delete,
                    color: NoteColor.black,
                    size: 30,
                  ),
                ),
                contentPadding: EdgeInsets.zero,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Text(
                  note.date,
                  style: Theme.of(context).textTheme.labelSmall,
                  textAlign: TextAlign.start,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
