import 'package:flutter/material.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Icon(Icons.arrow_back),
        backgroundColor: Colors.transparent,
        elevation: 0,
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
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: <Widget>[
                Container(
                  height: height / 3,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                          'https://images.unsplash.com/photo-1517030330234-94c4fb948ebc?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1275&q=80'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'mrflutter.com',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  child: AppBar(
                    title: Icon(Icons.arrow_back),
                    backgroundColor: Colors.transparent,
                    elevation: 0,
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
                  ),
                ),
              ],
            ),
            Card(
              elevation: 2,
              child: ClipPath(
                child: Container(
                  height: 100,
                ),
                clipper: ShapeBorderClipper(shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(3))),
              ),
            ),
            Card(
              elevation: 2,
              child: ClipPath(
                child: Container(
                  height: 100,
                ),
                clipper: ShapeBorderClipper(shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(3))),
              ),
            ),
            Card(
              elevation: 2,
              child: ClipPath(
                child: Container(
                  height: 100,
                ),
                clipper: ShapeBorderClipper(shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(3))),
              ),
            ),
            Card(
              elevation: 2,
              child: ClipPath(
                child: Container(
                  height: 100,
                ),
                clipper: ShapeBorderClipper(shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(3))),
              ),
            ),
            Card(
              elevation: 2,
              child: ClipPath(
                child: Container(
                  height: 100,
                ),
                clipper: ShapeBorderClipper(shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(3))),
              ),
            ),
            Card(
              elevation: 2,
              child: ClipPath(
                child: Container(
                  height: 100,
                ),
                clipper: ShapeBorderClipper(shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(3))),
              ),
            ),
            Card(
              elevation: 2,
              child: ClipPath(
                child: Container(
                  height: 100,
                ),
                clipper: ShapeBorderClipper(shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(3))),
              ),
            ),
            Card(
              elevation: 2,
              child: ClipPath(
                child: Container(
                  height: 100,
                ),
                clipper: ShapeBorderClipper(shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(3))),
              ),
            ),
            Card(
              elevation: 2,
              child: ClipPath(
                child: Container(
                  height: 100,
                ),
                clipper: ShapeBorderClipper(shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(3))),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

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