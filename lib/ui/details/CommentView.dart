import 'package:flutter/material.dart';


class CommentView extends StatefulWidget {
  int nrComments;
  MaterialColor color;

  CommentView(this.nrComments, this.color);

  @override
  _CommentView createState() => _CommentView(nrComments, color);
}

class _CommentView extends State<CommentView> {
  bool visible = false;

  int nrComments = 0;
  MaterialColor color;

  _CommentView(this.nrComments, this.color);

  @override
  Widget build(BuildContext context) {
    return 
    Card( 
          child: 
          Column(children: [
                mainComment(context),
              getSubComments(context)
      ]
    )
    );
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
                        child: Text(
                          'Show hn: elton kola makes the best hn flutter app ever, unisntall yours and use this!',
                          maxLines: 2,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
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
                '1h',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
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
                'misterlkz0',
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

//TODO - ceter this row!!
  Widget getShowHideButton(BuildContext context) {

    if(nrComments == 0){
      return Container();
    }


    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text("4 Comments",
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

              left: BorderSide( //                   <--- left side
                color: color,
                width: 1.0,
              )
            )

              ),

            child: ListView(
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                children: getCommentData()),
          )
        : Container();
  }

  List<Widget> getCommentData() {
    List<Widget> allComments = new List<Widget>();

    if (nrComments > 0) {
      for (int i = 0; i < nrComments; i++) {
        allComments.add(CommentView(0, Colors.green));
      }
    }
    return allComments;
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
