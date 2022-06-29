// Class ini berfungsi sebagai model dari class new page
// yang mana daftarnya aka didapakai oleh news page

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
    required this.content,
  });
}
