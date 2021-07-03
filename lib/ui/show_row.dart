import 'package:flutter/material.dart';
import 'package:syntaxfm_app/models/show_model.dart';
import 'package:syntaxfm_app/styles/my_styles.dart' as mStyles;

class ShowRow extends StatelessWidget {
  final Show show;

  const ShowRow({Key? key, required this.show}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print('Tap on show n° ${show.number} with title: ${show.title}');
      },
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8),
        child: ListTile(
          leading: Image.asset(
            "assets/icons/logo.png",
            width: 64,
          ),
          title: Padding(
            padding: EdgeInsets.only(bottom: 12),
            child: Text(
              'Episode ${show.displayNumber}',
              style: mStyles.textStyleSubtitle1,
            ),
          ),
          subtitle: Text(
            show.title,
            style: mStyles.textStyleSubtitle2,
          ),
        ),
      ),
    );
  }
}
