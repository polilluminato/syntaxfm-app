import 'package:flutter/material.dart';
import 'package:syntaxfm_app/models/show_model.dart';

class ShowRow extends StatelessWidget {

  final Show show;

  const ShowRow({ Key? key, required this.show }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print('Tap on show n° ${show.number} with title: ${show.title}');
      },
      child: ListTile(
        title: Text(show.title),
      ),
    );
  }
}