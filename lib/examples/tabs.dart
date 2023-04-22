import 'package:flutter/material.dart';

class Locationstat extends StatefulWidget {
  @override
  _LocationstatState createState() => _LocationstatState();
}

class _LocationstatState extends State<Locationstat>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = new TabController(length: 2, vsync: this);
  }
  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text('Statistics'),
        bottom: TabBar(
            controller: _tabController,
            indicatorColor: Colors.orange,
            labelColor: Colors.orange,
            unselectedLabelColor: Colors.black54,
            tabs: <Widget>[
              Tab(
                text:('One'),
              ),
              Tab(
                text:('Two'),
              ),
            ]),
      ),
      body: TabBarView(
        children: <Widget>[
          One(),
          Two(),

        ],
        controller: _tabController,
      ),
    );
  }
}

class One extends StatefulWidget {
  const One({Key? key}) : super(key: key);

  @override
  State<One> createState() => _OneState();
}

class _OneState extends State<One> with TickerProviderStateMixin {

  late TabController _oneTabController;

  @override
  void initState() {
    super.initState();
    _oneTabController = new TabController(length: 2, vsync: this);
  }
  @override
  void dispose() {
    super.dispose();
    _oneTabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        TabBar(
          controller: _oneTabController,
          indicatorColor: Colors.orange,
          labelColor: Colors.orange,
          unselectedLabelColor: Colors.black54,
          isScrollable: true,
          tabs: <Widget>[
            Tab(
              text: "One . One",
            ),
            Tab(
              text: "One . Two",
            ),

          ],
        ),
        Container(
          height: screenHeight * 0.70,
          margin: EdgeInsets.only(left: 16.0, right: 16.0),
          child: TabBarView(
            controller: _oneTabController,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: Colors.blueGrey[300],
                ),
                child: Center(
                  child: Text("1.1"),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: Colors.blue[300],
                ),
                child: Center(
                  child: Text("1.2"),
                ),
              ),

            ],
          ),
        )
      ],
    );
  }
}

class Two extends StatefulWidget {
  const Two({Key? key}) : super(key: key);

  @override
  State<Two> createState() => _TwoState();
}

class _TwoState extends State<Two> with TickerProviderStateMixin {
  late TabController _twoTabController;

  @override
  void initState() {
    super.initState();
    _twoTabController = new TabController(length: 2, vsync: this);
  }
  @override
  void dispose() {
    super.dispose();
    _twoTabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        TabBar(
          controller: _twoTabController,
          indicatorColor: Colors.orange,
          labelColor: Colors.orange,
          unselectedLabelColor: Colors.black54,
          isScrollable: true,
          tabs: <Widget>[
            Tab(
              text: "Two . One",
            ),
            Tab(
              text: "Two . Two",
            ),

          ],
        ),
        Container(
          height: screenHeight * 0.70,
          margin: EdgeInsets.only(left: 16.0, right: 16.0),
          child: TabBarView(
            controller: _twoTabController,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: Colors.blueGrey[300],
                ),
                child: Center(
                  child: Text("2.1"),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: Colors.blue[300],
                ),
                child: Center(
                  child: Text("2.2"),
                ),
              ),

            ],
          ),
        )
      ],
    );
  }
}

