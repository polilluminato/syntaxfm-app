import 'package:flutter/material.dart';
import 'package:syntaxfm_app/models/show_model.dart';
import 'package:syntaxfm_app/pages/singleshow_page.dart';
import 'package:syntaxfm_app/styles/my_styles.dart' as mStyles;
import 'package:syntaxfm_app/ui/custom_outline_buttonicon.dart';

class ShowRow extends StatelessWidget {
  final Show show;

  const ShowRow({Key? key, required this.show}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SingleShowPage(
              show: show,
            ),
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Image.asset(
                  "assets/icons/logo.jpg",
                  width: 40,
                ),
                SizedBox(
                  width: 16,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Episode ${show.displayNumber}',
                      style: mStyles.textStyleSubtitle2,
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      '${show.displayDate}',
                      style: mStyles.textStyleSubtitle3,
                    )
                  ],
                )
              ],
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              show.title,
              style: mStyles.textStyleSubtitle1,
              textAlign: TextAlign.left,
            ),
            SizedBox(
              height: 16,
            ),
            Row(
              children: [
                CustomOutlineButtonIcon(
                  text: "Website",
                  icon: Icons.share,
                  callback: () {},
                ),
                SizedBox(width: 16),
                CustomOutlineButtonIcon(
                  text: "Share",
                  icon: Icons.share,
                  callback: () {},
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
