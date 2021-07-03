import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syntaxfm_app/models/error_message_model.dart';
import 'package:syntaxfm_app/models/show_model.dart';
import 'package:syntaxfm_app/repository/show_repository.dart';
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
          "Title",
          style: GoogleFonts.notoSans(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          _refreshPostList();
        },
        child: FutureBuilder<List<Show>>(
          future: _futureShows,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final items = snapshot.data!;
              return ListView.builder(
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
      ),
    );
  }
}
