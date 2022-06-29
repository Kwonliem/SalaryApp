import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:training_app/pages/news/detail_news.dart';
import 'package:training_app/pages/news/list_item_news.dart';
import 'package:training_app/pages/news/list_item_widget.dart';
import 'package:training_app/providers/news_provider.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  // List<ListItemNews> _listItem = [
  //   ListItemNews(
  //       imgPath: 'images/img_news.jpeg',
  //       title: 'Judul Berita',
  //       author: 'Salim',
  //       date: '30-11-2021',
  //       content:
  //           'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged'),
  //   ListItemNews(
  //       imgPath: 'images/img_news.jpeg',
  //       title: 'Judul Berita 2',
  //       author: 'Salim',
  //       date: '30-11-2021',
  //       content:
  //           'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged'),
  // ];

  @override
  Widget build(BuildContext context) {
    BeritaProvider beritaProvider = Provider.of<BeritaProvider>(context);

    final allBerita = beritaProvider.beritaModel;

    ListItemNews? listItemNews;
    return Container(
      child: ListView.builder(
          itemCount: allBerita.length,
          itemBuilder: (context, index) {
            var berita = allBerita[index];
            return InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DetailNews(itemNews: berita)));
                },
                child: listItem(allBerita[index]));
          }),
    );
  }
}
