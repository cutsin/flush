import 'package:flutter/material.dart';
import '../http.dart';

class RandomAvt extends StatefulWidget {
  @override
  _RandomAvtState createState() => _RandomAvtState();
}

class _RandomAvtState extends State<RandomAvt> {
  String uri = '';
  String name = '';
  Map peoples = {};
  Future fetchAvt() async {
    var response = await http.get('https://randomuser.me/api');
    setState(() {
      final person = response.data['results'][0];
      uri = person['picture']['large'];
      name = '${person['name']['first']} ${person['name']['last']}';
    });
    print(response.data['results'][0]['picture']['large']);
  }

  @override
  Widget build(BuildContext context) {
    print('how?');
    print(mounted);
    Widget widget = Material(
      child: InkWell(
        onTap: (){
          fetchAvt();
        },
        child: Column(
          children: <Widget>[
            Container(
              child: Image.network(
                uri,
                width: 100,
                height: 100,
              ),
              width: 100,
              height: 100,
              margin: EdgeInsets.all(10),
            ),
            Container(
              child: Text(
                name,
                style: Theme.of(context).textTheme.display1,
              ),
              height: 48,
            ),
            IconButton(
              icon: Icon(Icons.thumb_up),
              onPressed: () {},
              tooltip: 'Like',
            )
          ],
        ),
      ),
    );
    return widget;
  }

  @override
  void initState() {
    super.initState();
    fetchAvt();
  }

  @override
  void dispose() {
    super.dispose();
  }
}