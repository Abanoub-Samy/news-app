import 'package:flutter/material.dart';
import 'package:news_app/screens/web_view-screen.dart';

class ArticleItem extends StatelessWidget {
  final Map list;

  ArticleItem(this.list);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => WebViewScreen(list['url'])),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                    image: NetworkImage(list['urlToImage'].toString()),
                    fit: BoxFit.cover),
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Expanded(
              child: Container(
                height: 120,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        child: Text(
                          list['title'].toString(),
                          style: Theme.of(context).textTheme.headline1,
                          maxLines: 4,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Text(
                        list['publishedAt'].toString(),
                        style: TextStyle(color: Colors.grey),
                      ),
                    ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
