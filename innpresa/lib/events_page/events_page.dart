import 'package:flutter/material.dart';

class EventsPage extends StatefulWidget {
  @override
  _EventsPageState createState() => _EventsPageState();
}

class _EventsPageState extends State<EventsPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Seus Eventos"),
          centerTitle: true,
          bottom: TabBar(
            indicatorColor: Colors.amber,
            tabs: [
              Tab(
                icon: Icon(Icons.grid_off),
              ),
              Tab(
                icon: Icon(Icons.list),
              )
            ],
          ),
        ),
        //body: TabBarView(
        //physics: NeverScrollableScrollPhysics(),
        //children: [],
        //),
      ),
    );
  }
}
