import 'package:flutter/material.dart';

import 'package:hacker_newz/repo/ApiService.dart';
import 'package:hacker_newz/model/HNItem.dart';
import 'package:hacker_newz/ui/details/CommentView.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:flutter_html_view/flutter_html_view.dart';


class CommentViewData extends StatefulWidget {
  final int depth;
  final HNItem item;
  final ApiService apiService;

  CommentViewData(this.apiService, this.item, this.depth);

  @override
  _CommentViewData createState() => _CommentViewData(apiService, item, depth);
}

class _CommentViewData extends State<CommentViewData> {
  final int depth;
  final HNItem item;
  final ApiService apiService;

  bool visible = false;

  MaterialColor color = Colors.red;

  _CommentViewData(this.apiService, this.item, this.depth);

  @override
  Widget build(BuildContext context) {

    switch (depth) {
      case 0: color = Colors.red; break;
      case 1: color = Colors.green; break;
      case 2: color = Colors.blue; break;
      case 3: color = Colors.amber; break;
      case 4: color = Colors.deepOrange; break;
      case 5: color = Colors.lightBlue; break;
      case 6: color = Colors.teal; break;
      case 7: color = Colors.purple; break;

      default:color = Colors.red;
    }


    return Card(
        child:
            Column(children: [mainComment(context), getSubComments(context)]));
  }

  Widget mainComment(BuildContext context) {
    return Container(
      //padding: const EdgeInsets.only(bottom: 1.0),
      color: color,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          getAnash(context),
          Expanded(
            child: Container(
                color: Colors.black,
                padding: const EdgeInsets.all(8),
                child: Column(
                  //crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    getRow1(context),
                    Container(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: HtmlView(
                        data: item.text,
//                        style: TextStyle(
//                          fontSize: 16,
//                          color: Colors.white,
//                        ),
                      ),
                    ),
                    getShowHideButton(context),
                  ],
                )),
          )
        ],
      ),
    );
  }

  Widget getAnash(BuildContext context) {
    return Container(
      width: 6,
      child: Column(children: []),
    );
  }

  Widget getRow1(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                timeago.format(item.time) ,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                ),
              ),
              Text(
                ' - ',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                ),
              ),
              Text(
                item.by,
                style: TextStyle(
                  fontSize: 14,
                  color: color,
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
              color: color,
            )),
        Text(
          '125',
          style: TextStyle(
            color: color,
          ),
        ),
        getMenu(context)
      ],
    );
  }

//TODO - center this row!!
  Widget getShowHideButton(BuildContext context) {
    if (item.kids.length == 0) {
      return Container();
    }

    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(item.kids.length.toString() + " Comments",
              style: TextStyle(
                color: color,
              )),
          IconButton(
            icon: Icon(
              visible ? Icons.arrow_drop_up : Icons.arrow_drop_down,
              color: Colors.white,
            ),
            onPressed: showHideComments,
          )
        ],
      ),
    );
  }

  void showHideComments() {
    setState(() => visible = !visible);
  }

  Widget getSubComments(BuildContext context) {
    return visible
        ? Container(
            padding: const EdgeInsets.only(bottom: 0, left: 4),
            decoration: new BoxDecoration(
                border: Border(
                    left: BorderSide(
              //                   <--- left side
              color: color,
              width: 1.0,
            ))),
            child: new ListView.builder(
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                itemCount: item.kids.length,
                itemBuilder: (BuildContext ctxt, int index) {
                  return new CommentView(
                      apiService, item.kids[index], depth + 1);
                }))
        : Container();
  }

  Widget getMenu(BuildContext context) {
    return PopupMenuButton<CommentPopUpMenu>(
      icon: Icon(
        Icons.more_vert,
        color: Colors.grey,
      ),
      onSelected: (CommentPopUpMenu result) {},
      itemBuilder: (BuildContext context) => <PopupMenuEntry<CommentPopUpMenu>>[
            const PopupMenuItem<CommentPopUpMenu>(
              value: CommentPopUpMenu.VOTE_UP,
              child: ListTile(
                  leading: Icon(Icons.thumb_up), title: Text('Vote up')),
            ),
            const PopupMenuItem<CommentPopUpMenu>(
              value: CommentPopUpMenu.ADD_COMMENTS,
              child: ListTile(
                  leading: Icon(Icons.add_comment), title: Text('Add comment')),
            ),
            const PopupMenuItem<CommentPopUpMenu>(
              value: CommentPopUpMenu.SHARE,
              child: ListTile(leading: Icon(Icons.share), title: Text('Share')),
            ),
            const PopupMenuItem<CommentPopUpMenu>(
                value: CommentPopUpMenu.REFRESH,
                child: ListTile(
                    leading: Icon(Icons.refresh), title: Text('Refresh'))),
            const PopupMenuItem<CommentPopUpMenu>(
              value: CommentPopUpMenu.VIEW_USER,
              child: ListTile(
                  leading: Icon(Icons.supervised_user_circle),
                  title: Text('View user')),
            ),
          ],
    );
  }
}

enum CommentPopUpMenu { VOTE_UP, REFRESH, ADD_COMMENTS, VIEW_USER, SHARE }
