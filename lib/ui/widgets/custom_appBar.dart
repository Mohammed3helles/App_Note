import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_notes_app/bloc/get_note/get_note_cubit.dart';

import '../resources/color_manager.dart';
import 'custom_search_note.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  final IconData iconData;
  final Function()? onTap;
  final Function(String)? onChanged;

  const CustomAppBar(
      {Key? key,
      required this.title,
      this.iconData = Icons.search,
      this.onTap,
      this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetNoteCubit, GetNoteState>(builder: (context, state) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: BlocProvider.of<GetNoteCubit>(context).search
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomSearchNote(onChanged: onChanged),
                  buttonGestureDetector(
                    context: context,
                    onTap: () {
                      BlocProvider.of<GetNoteCubit>(context).fetchSearch();
                      BlocProvider.of<GetNoteCubit>(context).controller.clear();
                    },
                    iconData: Icons.close,
                  ),
                ],
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(title, style: Theme.of(context).textTheme.titleLarge),
                  buttonGestureDetector(
                      context: context, onTap: onTap, iconData: iconData),
                ],
              ),
      );
    });
  }

  GestureDetector buttonGestureDetector({
    required BuildContext context,
    required IconData iconData,
    Function()? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 45,
        height: 45,
        decoration: BoxDecoration(
          color: NoteColor.white.withOpacity(.07),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Icon(iconData, size: 30),
      ),
    );
  }
}
