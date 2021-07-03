import 'package:avatars/avatars.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syntaxfm_app/models/error_message_model.dart';
import 'package:syntaxfm_app/models/show_model.dart';
import 'package:syntaxfm_app/repository/show_repository.dart';
import 'package:syntaxfm_app/styles/my_dimens.dart' as mDimens;
import 'package:syntaxfm_app/styles/my_styles.dart' as mStyles;
import 'package:syntaxfm_app/ui/show_row.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Future<List<Show>> _futureShows;

  @override
  void initState() {
    super.initState();
    _refreshPostList();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _refreshPostList() async {
    _futureShows = ShowRepository().getAllShows();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Syntax.fm Podcast",
          style: GoogleFonts.roboto(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 16,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text("Hosts", style: mStyles.textStyleHeadline6),
            ),
            SizedBox(
              height: 16,
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                SizedBox(
                  width: 16,
                ),
                Avatar(
                  shape: AvatarShape.circle(mDimens.sizeAvatar),
                  useCache: true,
                  sources: [
                    GitHubSource('wesbos'),
                  ],
                ),
                SizedBox(
                  width: 16,
                ),
                Avatar(
                  shape: AvatarShape.circle(mDimens.sizeAvatar),
                  useCache: true,
                  sources: [
                    GitHubSource('stolinski'),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 24,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text("Shows", style: mStyles.textStyleHeadline6),
            ),
            FutureBuilder<List<Show>>(
              future: _futureShows,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final items = snapshot.data!;
                  return ListView.separated(
                    separatorBuilder: (BuildContext context, int index) => Divider(),
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: items.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ShowRow(show: items[index]);
                    },
                  );
                } else if (snapshot.hasError) {
                  // Show failure error message.
                  final failure = snapshot.error as ErrorMessage;
                  return Center(child: Text(failure.message));
                }
                // Show a loading spinner.
                return const Center(child: CircularProgressIndicator());
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _refreshPostList();
        },
        child: const Icon(Icons.sync),
      ),
    );
  }
}
