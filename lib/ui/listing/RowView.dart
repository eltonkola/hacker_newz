import 'package:flutter/material.dart';
import 'package:hacker_newz/model/HNItem.dart';
import 'package:hacker_newz/repo/ApiService.dart';
import 'package:hacker_newz/ui/details/DetailsPage.dart';
import 'package:hacker_newz/ui/listing/RowViewData.dart';
import 'package:hacker_newz/ui/listing/RowViewLoading.dart';

class RowView extends StatelessWidget {

  final ApiService apiService;
  final int itemId;

  RowView(this.apiService, this.itemId);

  @override
  Widget build(BuildContext context) {

    return Container(
      child: FutureBuilder<HNItem>(
        future: apiService.getItemById(itemId),
        builder: (context, snapshot) {
          if (snapshot.hasData) {

            return GestureDetector(
              //child: RowViewLoading(),
              child: RowViewData(snapshot.data),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => DetailsPage(apiService: apiService,item: snapshot.data),
                  ),
                );
              },
            );

          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }

          // By default, show a loading spinner
          return RowViewLoading();
          //return CircularProgressIndicator();
        },
      ),
    );
  }

}