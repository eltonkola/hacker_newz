import 'package:flutter/material.dart';
import 'TabPageContainer.dart';
import 'Settings.dart';
import 'package:hacker_newz/model/AppTabPageItem.dart';
import 'package:hacker_newz/repo/ApiService.dart';


class Home extends StatefulWidget {
 @override
 State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {

 int _currentIndex = 0;

 static final ApiService apiService =  new ApiService();

  final List<Widget> _children = [
    TabPageContainer(AppTabPageItem.getTabsNewsStories(), apiService),
    TabPageContainer(AppTabPageItem.getTabsMoreStories(), apiService),
    Settings()
 ];

   void onTabTapped(int index) {
   setState(() {
     _currentIndex = index;
   });
 }

 @override
 Widget build(BuildContext context) {

   return Scaffold(
      body: _children[_currentIndex], // new
     bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped, // new

        currentIndex: _currentIndex, // new
        items: [
         BottomNavigationBarItem(
           icon: new Icon(Icons.access_time),
           title: new Text('Stories'),
         ), 
         BottomNavigationBarItem(
           icon: new Icon(Icons.calendar_today),
           title: new Text('Other'),
         ),
         BottomNavigationBarItem(
           icon: Icon(Icons.weekend),
           title: Text('Settings')
         )
      
       ],
     ),
   );

 }
}
