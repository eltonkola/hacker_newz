import 'package:flutter/material.dart';
import 'package:hacker_newz/model/HNItem.dart';
import 'package:hacker_newz/repo/ApiService.dart';
import 'package:hacker_newz/ui/details/DetailsPage.dart';

class ItemRow extends StatelessWidget {

  final ApiService apiService;
  final int itemId;

  ItemRow(this.apiService, this.itemId);

  @override
  Widget build(BuildContext context) {

    String aa = "aa";
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: FutureBuilder<HNItem>(
        future: apiService.getItemById(itemId),
        builder: (context, snapshot) {
          if (snapshot.hasData) {


            return GestureDetector(
              child: bindData(context, snapshot.data),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => DetailsPage(item: snapshot.data),
                  ),
                );
              },
            );

          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }

          // By default, show a loading spinner
          return CircularProgressIndicator();
        },
      ),
    );
  }

  Widget bindData(BuildContext context, HNItem item) {

    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Image.network(
            "http://openweathermap.org/img/w/" + item.id.toString() + ".png", width: 60.0,
            height: 60.0,)
          ,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    item.title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  item.time.toString(),
                  style: TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
                Text(
                  item.title,
                  style: TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
              ],

            ),
          ),
          Icon(
            Icons.star,
            color: Colors.red[500],
          ),
        ],
      ),


    );
  }


}