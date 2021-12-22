import 'package:flutter/material.dart';

import 'demo.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MainCollapsingToolbar(),
    );
  }
}

class MainCollapsingToolbar extends StatefulWidget {
  @override
  _MainCollapsingToolbarState createState() => _MainCollapsingToolbarState();
}

class _MainCollapsingToolbarState extends State<MainCollapsingToolbar> {

  late TabController _controller;
  List posts = ["https://picsum.photos/200", "https://picsum.photos/200", "https://picsum.photos/200", "https://picsum.photos/200"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.favorite_border_outlined),
            onPressed: () {},
            tooltip: 'Share',
          ),
          IconButton(
            icon: Icon(Icons.share_outlined),
            onPressed: () {},
            tooltip: 'Share',
          ),
          IconButton(
            icon: Icon(Icons.download_outlined),
            onPressed: () {},
            tooltip: 'Share',
          ),
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Icon(Icons.arrow_back),
      ),
      body: DefaultTabController(
        length: 3,
        child: NestedScrollView(
          physics: NeverScrollableScrollPhysics(),
          headerSliverBuilder: (context, isScolled){
            return [
              SliverAppBar(
                expandedHeight: 200.0,
                floating: false,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                    centerTitle: true,
                    title: Text("Collapsing Toolbar",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                        )),
                    background: Image.network(
                      "https://images.pexels.com/photos/396547/pexels-photo-396547.jpeg?auto=compress&cs=tinysrgb&h=350",
                      fit: BoxFit.cover,
                    )),
              ),
              // SliverAppBar(
              //   backgroundColor: Colors.white,
              //   collapsedHeight: 250,
              //   expandedHeight: 250,
              //   flexibleSpace: Container(
              //       width: double.infinity,
              //       height: double.infinity,
              //       decoration: BoxDecoration(
              //         image: DecorationImage(
              //           image: NetworkImage(posts[0]),
              //           fit: BoxFit.cover,
              //         ),
              //       ),
              // )),
              SliverPersistentHeader(
                delegate: _SliverAppBarDelegate(
                    TabBar(
                      controller: _controller,
                      tabs: [
                        Tab(icon: Icon(Icons.grid_on)),
                        Tab(icon: Icon(Icons.favorite_border_outlined)),
                        Tab(icon: Icon(Icons.bookmark_border)),
                      ],
                      indicatorColor: Colors.blue,
                      unselectedLabelColor: Colors.grey,
                      labelColor: Colors.black,
                    )
                ),
                floating: true,
                pinned: true,
              )
            ];
          },
          body: TabBarView(
              children: [

                Column(
                  children: [
                    Card(
                      child: ListTile(


                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    Card(
                      child: ListTile(


                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    Card(
                      child: ListTile(


                      ),
                    )
                  ],
                ),

              ]
          ),
        ),
      ),
    );
  }
}

// @override
// Widget build(BuildContext context) {
//   return Scaffold(
//     body: DefaultTabController(
//       length: 2,
//       child: NestedScrollView(
//         headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
//           return <Widget>[
//             SliverAppBar(
//               expandedHeight: 200.0,
//               floating: false,
//               pinned: true,
//               flexibleSpace: FlexibleSpaceBar(
//                   title: Text("Collapsing Toolbar",
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 16.0,
//                       )),
//                   background: Image.network(
//                     "https://images.pexels.com/photos/396547/pexels-photo-396547.jpeg?auto=compress&cs=tinysrgb&h=350",
//                     fit: BoxFit.cover,
//                   )),
//             ),
//             SliverPersistentHeader(
//               delegate: _SliverAppBarDelegate(
//                 TabBar(
//                   labelColor: Colors.black87,
//                   unselectedLabelColor: Colors.grey,
//                   tabs: [
//                     Tab(icon: Icon(Icons.info), text: "Tab 1"),
//                     Tab(icon: Icon(Icons.lightbulb_outline), text: "Tab 2"),
//                   ],
//                 ),
//               ),
//               pinned: true,
//             ),
//           ];
//         },
//         body: Center(
//           child: Text("Sample text"),
//         ),
//       ),
//     ),
//   );
// }
// }

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;
  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new Container(
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}