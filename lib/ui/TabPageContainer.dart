

import 'package:flutter/material.dart';
import 'package:hacker_newz/model/AppTabPageItem.dart';
import 'package:hacker_newz/model/AppTabItem.dart';
import 'package:hacker_newz/repo/ApiService.dart';
import 'package:hacker_newz/ui/TabPage.dart';

class TabPageContainer extends StatelessWidget {

  final AppTabPageItem tabPage;
  final ApiService apiService;


  TabPageContainer(this.tabPage, this.apiService);

 @override
 Widget build(BuildContext context) {
   return Container(
     child: Center(
          child: body(context)
        ),
   );
 }

  Widget body(BuildContext context) {
    return new Padding(
        padding:
            new EdgeInsets.only(bottom: 0.0, left: 0.0, right: 0.0, top: 0.0),
        child:
        DefaultTabController(
          length: tabPage.tabs.length,
          child: Scaffold(
            appBar: AppBar(
              bottom: TabBar(
                tabs:
                  tabPage.tabs
                  .map((AppTabItem item){
                    return Tab(text: item.tab_title);
                  })
                  .toList()
                ,
              ),
              title: Text(tabPage.title),
            ),
            body: TabBarView(
              children:
              tabPage.tabs
                  .map((AppTabItem item){
                return TabPage(item , apiService);
              })
                  .toList()
              ,
            ),
          ),
        ),
    );
  }
}
