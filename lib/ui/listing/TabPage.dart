import 'package:flutter/material.dart';
import 'package:hacker_newz/model/AppTabItem.dart';
import 'package:hacker_newz/repo/ApiService.dart';
import 'package:hacker_newz/ui/listing/RowView.dart';

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
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }

  Widget body(BuildContext context, List<int> data) {
    return DefaultTabController(
                  length: data.length,
                  child: new ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (BuildContext ctxt, int index) {
                      return new RowView(apiService, data[index]);
                    },
                  ));

  }
}
