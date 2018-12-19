
import 'Conts.dart';
import 'AppTabItem.dart';

class AppTabPageItem {

  final List<AppTabItem> tabs;
  final String title;

  AppTabPageItem({this.tabs, this.title});



  factory AppTabPageItem.getTabsNewsStories(){
    List<AppTabItem> tabs = new List<AppTabItem>();
    tabs.add(AppTabItem(icon_id: 1,
        tab_title: "Top Stories",
        api_url: Conts.baseUrl + Conts.topstories + Conts.basePostfix));
    tabs.add(AppTabItem(icon_id: 2,
        tab_title: "Best Stories",
        api_url: Conts.baseUrl + Conts.beststories + Conts.basePostfix));
    tabs.add(AppTabItem(icon_id: 2,
        tab_title: "New Stories",
        api_url: Conts.baseUrl + Conts.newstories + Conts.basePostfix));

    return AppTabPageItem(tabs: tabs, title: "Stories");
  }

  factory AppTabPageItem.getTabsMoreStories(){
    List<AppTabItem> tabs = new List<AppTabItem>();
    tabs.add(AppTabItem(icon_id: 1,
        tab_title: "Ask Stories",
        api_url: Conts.baseUrl + Conts.askstories + Conts.basePostfix));
    tabs.add(AppTabItem(icon_id: 2,
        tab_title: "Show Stories",
        api_url: Conts.baseUrl + Conts.showstories + Conts.basePostfix));
    tabs.add(AppTabItem(icon_id: 2,
        tab_title: "Job Stories",
        api_url: Conts.baseUrl + Conts.jobstories + Conts.basePostfix));

    return AppTabPageItem(tabs: tabs, title: "More Stories");
  }

}


