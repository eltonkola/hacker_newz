import 'package:flutter/material.dart';

import 'package:hacker_newz/repo/ApiService.dart';
import 'package:hacker_newz/model/HNItem.dart';
import 'package:hacker_newz/ui/details/CommentViewLoading.dart';
import 'package:hacker_newz/ui/details/CommentViewData.dart';

class CommentView extends StatelessWidget {

  final int depth;
  final int itemId;
  final ApiService apiService;

  CommentView(this.apiService, this.itemId, this.depth);


  @override
  Widget build(BuildContext context) {

    return Container(
      child: FutureBuilder<HNItem>(
        future: apiService.getItemById(itemId),
        builder: (context, snapshot) {
          if (snapshot.hasData) {

            return GestureDetector(
              //child: RowViewLoading(),
              child: CommentViewData(apiService, snapshot.data, depth),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    //builder: (_) => DetailsPage(item: snapshot.data),
                  ),
                );
              },
            );

          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }

          // By default, show a loading spinner
          return CommentViewLoading();
          //return CircularProgressIndicator();
        },
      ),
    );
  }

}