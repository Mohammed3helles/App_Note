import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_notes_app/bloc/add_note/add_note_cubit.dart';
import 'package:my_notes_app/data/models/note_model.dart';

import '../resources/constants_manager.dart';

class CustomListColor extends StatefulWidget {
  final Note? note;

  const CustomListColor({Key? key, this.note}) : super(key: key);

  @override
  State<CustomListColor> createState() => _CustomListColorState();
}

class _CustomListColorState extends State<CustomListColor> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      height: 100,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: kColorNote.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: InkWell(
                borderRadius: BorderRadius.circular(80),
                onTap: () {
                  setState(() {
                    currentIndex = index;
                    BlocProvider.of<AddNoteCubit>(context).selectedColor =
                        kColorNote[index];
                    if (widget.note != null) {
                      widget.note!.color = kColorNote[index].value;
                    }
                  });
                },
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: currentIndex == index ? 43 : 37,
                  child: Container(
                    width: 77,
                    height: 77,
                    decoration: BoxDecoration(
                      color: kColorNote[index],
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
