import 'package:flutter/material.dart';
import 'package:hacker_newz/model/AppTabItem.dart';
import 'package:hacker_newz/repo/ApiService.dart';
import 'package:hacker_newz/ui/ItemRow.dart';
import 'package:hacker_newz/ui/details/DetailsPage.dart';


class TabPage extends StatelessWidget {

  final AppTabItem tab;

  final ApiService apiService;

  TabPage(this.tab, this.apiService);

 @override
 Widget build(BuildContext context) {
   return Container(
     child: Center(
          child: FutureBuilder<List<int>>(
            future: apiService.fetchData(tab),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return body(context, snapshot.data);
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }

              // By default, show a loading spinner
              return CircularProgressIndicator();
            },
          ),
        ),
   );
 }

  Widget body(BuildContext context, List<int> data) {
    return new Padding(
        padding:
            new EdgeInsets.only(bottom: 4.0, left: 4.0, right: 4.0, top: 4.0),
        child: Column(children: <Widget>[

           Expanded(
        // decoration: BoxDecoration(border: Border.all(color: Colors.red)),
        child: DefaultTabController(
          length: data.length,
          child:

          new ListView.builder(
              itemCount: data.length,
              itemBuilder: (BuildContext ctxt, int index) {
                 return new ItemRow(apiService, data[index]);
              },


          )

  ))


        ]));
  }




}
