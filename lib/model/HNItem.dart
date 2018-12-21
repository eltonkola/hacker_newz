class HNItem {
  final int id; //The item's unique id.

  final String
      type; //The type of item. One of "job", "story", "comment", "poll", or "pollopt".
  final String by; //The username of the item's author.
  final DateTime time; //Creation date of the item, in Unix Time.
  final String text; //The comment, story or poll text. HTML.
  final String url; //The URL of the story.
  final String title; //The title of the story, poll or job.

  final bool deleted; //true if the item is deleted.
  final bool dead; //true if the item is dead.

  final int
      parent; //The comment's parent: either another comment or the relevant story.
  final int poll; //The pollopt's associated poll.
  final int score; //The story's score, or the votes for a pollopt.
  final int
      descendants; //In the case of stories or polls, the total comment count.

  final List<int>
      kids; //The ids of the item's comments, in ranked display order.
  final List<int> parts; //A list of related pollopts, in display order.

  HNItem(
      {this.id,
      this.type,
      this.by,
      this.time,
      this.text,
      this.url,
      this.title,
      this.deleted,
      this.dead,
      this.parent,
      this.poll,
      this.score,
      this.descendants,
      this.kids,
      this.parts});

  factory HNItem.fromJson(Map<String, dynamic> json) {
    //var weatherList = json['weather'] as List;
    //List<Weather> weatherListData = weatherList.map((i) => Weather.fromJson(i)).toList();

    print(json.toString());
    try {


      DateTime timeValue = DateTime.now();
      if(json['time'] !=null){
        int timestamp = json['time'] as int;
        timeValue =  DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
      }



      HNItem item = HNItem(
        id: json['id'] as int,
        type: json['type'] as String,
        by: json['by'] !=null ? json['by'] as String : "",
        time: timeValue,
        text: json['text'] !=null ? json['text'] as String : "",
        url: json['url'] !=null ? json['url'] as String : "",
        title: json['title'] as String,
        deleted: json['deleted'] as bool,
        dead: json['dead']  as bool,
        parent: json['parent'] as int,
        poll: json['poll'] as int,
        score: json['score'] as int,
        descendants: json['descendants'] as int,
        kids: json['kids']!=null ? List<int>.from(json['kids']) : new List<int>(),
        parts: json['parts'] !=null ? List<int>.from(json['parts']): new List<int>(),


      );

      print(item.toString());
      return item;
    } catch (e) {
      print(e.toString());

      return null;
    }

  }
}
