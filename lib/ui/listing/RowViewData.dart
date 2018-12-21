import 'package:flutter/material.dart';
import 'package:hacker_newz/model/HNItem.dart';

class RowViewData extends StatelessWidget {

  HNItem item;

  RowViewData(this.item);

  @override
  Widget build(BuildContext context) {
    Widget titleSection = Container(
      padding: const EdgeInsets.only(bottom: 1.0),
      color: Colors.black54,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          getAnash(context),
          Expanded(
            child: Container(
                color: Colors.black,
                height: 112.0,
                padding: const EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Text(
                        item.title,
                        maxLines: 2,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    getRow1(context),
                  ],
                )),
          )
        ],
      ),
    );
    //...

    return titleSection;
  }

  Widget getAnash(BuildContext context) {
    return Container(
      color: Colors.black45,
      height: 112.0,
      padding: const EdgeInsets.all(16.0),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              item.score.toString(),
              maxLines: 1,
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            Container(
                padding: const EdgeInsets.only(bottom: 4.0, top: 4.0),
                child: Icon(
                  Icons.filter_drama,
                  color: Colors.white,
                )),
            Text(item.descendants.toString() ,
                maxLines: 1,
                style: TextStyle(color: Colors.white, fontSize: 16)),
          ]),
    );
  }

  Widget getRow1(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text(
                  item.url ,
                  maxLines: 1,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                  ),
                ),
              ),
              Text(
                item.time.toIso8601String() + ' - ' + item.by,
                maxLines: 1,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[500],
                ),
              ),
            ],
          ),
        ),
        Container(
            padding:
                const EdgeInsets.only(bottom: 8, left: 8, top: 8, right: 8),
            child: Icon(
              Icons.comment,
              color: Colors.red[500],
            )),
        Text(
          item.descendants.toString(),
          maxLines: 1,
          style: TextStyle(
            color: Colors.red[500],
          ),
        ),
        getMenu(context)
      ],
    );
  }

  Widget getMenu(BuildContext context) {
    return PopupMenuButton<RowPopUpMenu>(
      icon: Icon(
        Icons.more_vert,
        color: Colors.grey,
      ),
      onSelected: (RowPopUpMenu result) {},
      itemBuilder: (BuildContext context) => <PopupMenuEntry<RowPopUpMenu>>[
            const PopupMenuItem<RowPopUpMenu>(
                value: RowPopUpMenu.REFRESH,
                child: ListTile(
                    leading: Icon(Icons.refresh), title: Text('Refresh'))),
            const PopupMenuItem<RowPopUpMenu>(
              value: RowPopUpMenu.ADD_COMMENTS,
              child: ListTile(
                  leading: Icon(Icons.add_comment), title: Text('Add comment')),
            ),
            const PopupMenuItem<RowPopUpMenu>(
              value: RowPopUpMenu.VIEW_USER,
              child: ListTile(
                  leading: Icon(Icons.supervised_user_circle),
                  title: Text('View user')),
            ),
            const PopupMenuItem<RowPopUpMenu>(
              value: RowPopUpMenu.SHARE,
              child: ListTile(leading: Icon(Icons.share), title: Text('Share')),
            ),
          ],
    );
  }
}

enum RowPopUpMenu { REFRESH, ADD_COMMENTS, VIEW_USER, SHARE }
