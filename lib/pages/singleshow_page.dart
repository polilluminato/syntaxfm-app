import 'package:flutter/material.dart';
import 'package:syntaxfm_app/models/show_model.dart';

class SingleShowPage extends StatelessWidget {
  const SingleShowPage({ Key? key, required this.show}) : super(key: key);

  final Show show;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Episode ${show.displayNumber}'),
      ),
      body: Container(),
    );
  }
}