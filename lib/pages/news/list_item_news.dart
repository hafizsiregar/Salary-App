
// class ini berfungsi sebagai model dari class news page
// yang mana datanya akan dipakai oleh news page

class ListItemNews {
  String? imgPath;
  String? title;
  String? author;
  String? date;
  String? content;

  ListItemNews({
    required this.imgPath,
    required this.title,
    required this.author,
    required this.date,
    required this.content
  });
}