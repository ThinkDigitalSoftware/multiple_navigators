import 'package:flutter/material.dart';
import 'package:multiple_navigators/internal_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var pageController = PageController();
  int currentIndex = 0;
  List<GlobalKey<NavigatorState>> navigatorKeys = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: PageView.builder(
        controller: pageController,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          if (navigatorKeys.length <= index) {
            navigatorKeys.add(GlobalKey<NavigatorState>());
          }
          var navigatorKey = navigatorKeys[index];
          return InternalPage(
            pageIndex: index,
            navigatorKey: navigatorKey,
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              title: Text("page 1"), icon: Icon(Icons.looks_one)),
          BottomNavigationBarItem(
              title: Text("page 2"), icon: Icon(Icons.looks_two))
        ],
        onTap: (index) {
          pageController.jumpToPage(index);
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}
