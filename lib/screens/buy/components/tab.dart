import 'package:flutter/material.dart';

class Tabs extends StatefulWidget {
  _TabsState createState() => _TabsState();
}

class _TabsState extends State<Tabs> with TickerProviderStateMixin {
  final tabs = ['forfait', 'telephone', 'something', 'autre'];

  TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: tabs.length, vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      TabBar(
        tabs: [for (final tab in tabs) Tab(text: tab)],
        isScrollable: true,
        controller: _controller,
      ),
      TabBarView(children: <Widget>[], controller: _controller),
    ]);
  }
}
