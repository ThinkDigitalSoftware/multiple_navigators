import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InternalPage extends StatefulWidget {
  final GlobalKey<NavigatorState> navigatorKey;
  final int pageIndex;

  const InternalPage({
    Key key,
    @required this.navigatorKey,
    @required this.pageIndex,
  }) : super(key: key);

  @override
  _InternalPageState createState() => _InternalPageState();
}

class _InternalPageState extends State<InternalPage> {
  int currentInternalPage = 0;

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: widget.navigatorKey,
      onGenerateRoute: (RouteSettings settings) {
        return CupertinoPageRoute(builder: (BuildContext context) {
          return Container(
              alignment: Alignment.center,
              color: Colors.green,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text("Page $currentInternalPage"),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      FlatButton(
                          onPressed: () {
                            if (navigator.canPop()) {
                              navigator.pop();
                            }
                          },
                          child: Text('Navigate back')),
                      FlatButton(
                          onPressed: () {
                            navigator.pushNamed('${currentInternalPage++}');
                          },
                          child: Text('Navigate Forward'))
                    ],
                  )
                ],
              ));
        });
      },
    );
  }

  NavigatorState get navigator => widget.navigatorKey.currentState;
}
