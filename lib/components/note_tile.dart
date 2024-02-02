import 'package:flutter/material.dart';
import 'package:notes_app/components/note_settings.dart';
import 'package:popover/popover.dart';

class NoteTile extends StatelessWidget {
  final String text;
  final void Function()? onEditTap;
  final void Function()? onDeleteTAp;
  const NoteTile(
      {super.key,
      required this.text,
      required this.onEditTap,
      required this.onDeleteTAp});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(8),
      ),
      margin: const EdgeInsets.only(left: 25, right: 25, top: 10),
      child: ListTile(
        title: Text(text),
        trailing: Builder(builder: (context) {
          return IconButton(
              onPressed: () => showPopover(
                    width: 100,
                    height: 100,
                    context: context,
                    backgroundColor: Theme.of(context).colorScheme.background,
                    bodyBuilder: (context) => NoteSettings(
                      onEditTap: onEditTap,
                      onDeleteTap: onDeleteTAp,
                    ),
                  ),
              icon: const Icon(
                Icons.more_vert,
              ));
        }),
      ),
    );
  }
}
