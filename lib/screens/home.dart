import 'dart:async';

import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:geolocator/geolocator.dart';
import 'package:background_location/background_location.dart';
import 'package:task/widgets/activityCard.dart';
import 'package:task/widgets/stayCard.dart';

class MainCollapsingToolbar extends StatefulWidget {
  @override
  _MainCollapsingToolbarState createState() => _MainCollapsingToolbarState();
}

class _MainCollapsingToolbarState extends State<MainCollapsingToolbar> {

  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  Timer? timer;
  double lat = 0.0, lon = 0.0;
  Color myColor = Color(0xff00a651);

  @override
  void initState() {
    super.initState();
    _checkLocationPermission();

    var initializationSettingsAndroid =
    AndroidInitializationSettings('app_icon');
    var initSetttings = InitializationSettings(
        android: initializationSettingsAndroid);

    flutterLocalNotificationsPlugin.initialize(initSetttings);

    // Get current location every 1min and show it on notification.
    timer = Timer.periodic(Duration(seconds: 600), (Timer t) async {

      await BackgroundLocation.setAndroidConfiguration(1000);
      await BackgroundLocation.startLocationService(
          distanceFilter: 20);
      var position = await GeolocatorPlatform.instance.getCurrentPosition();
      setState(() {
        lat = position.latitude;
        lon = position.longitude;
      });

      // //Show notification
      showNotification();

    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  showNotification() async {
    var android = AndroidNotificationDetails(
        'id', 'channel ',
        priority: Priority.high, importance: Importance.max);
    var platform = new NotificationDetails(android: android);
    await flutterLocalNotificationsPlugin.show(
        0, 'Your Current Location', 'Latitude - ${lat}, Longtitude - ${lon}', platform,
        payload: 'Latitude - ${lat}, Longtitude - ${lon}');
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {  },
        child: Icon(Icons.shop),
      ),
      bottomNavigationBar: _customNavigation(),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.favorite_border_outlined),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.share_outlined),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.download_outlined),
            onPressed: () {},
          ),
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Icon(Icons.arrow_back),
      ),
      body: DefaultTabController(
        length: 6,
        child: NestedScrollView(
          physics: NeverScrollableScrollPhysics(),
          headerSliverBuilder: (context,isScrolled){
            return [
              SliverAppBar(
                  expandedHeight: 130,
                  pinned: true,
                  flexibleSpace:
                  FlexibleSpaceBar(
                    title: Text("Ramadan Umrah Package", style: TextStyle(fontSize: 18),),
                    background:
                    Stack(
                      children: [
                        Image.network(
                          "https://img.redbull.com/images/c_crop,w_4499,h_2248,x_0,y_387,f_auto,q_auto/c_scale,w_1200/redbullcom/2015/07/27/1331737542701_2/moon-hill-natural-bridge-in-china",
                          fit: BoxFit.cover,
                        ),
                        //Border radius
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            color: Colors.transparent,
                            height: 20,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                Container(
                                  height: 10,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                      topLeft: const Radius.circular(20),
                                      topRight: const Radius.circular(20),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  )
              ),
              SliverList(
                delegate: SliverChildListDelegate(
                  <Widget>[
                    ListTile(
                      leading: Icon(Icons.calendar_today_outlined),
                      title: Text('14 Jan 202'),
                      subtitle: Text('15 Days Trip'),
                    ),
                    ListTile(
                      leading: Icon(Icons.location_on),
                      title: Text('Monday'),
                      subtitle: Text('sunny, h: 80, l: 65'),
                    ),
                    ListTile(
                        title: Text('Place Covered'),
                        leading: Image.asset("images/binoculars.png", height: 35,),
                        subtitle:  Column(
                          children: <Widget>[
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                child: Text('Makkah (9N)'),
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                child: Text('Madinah (9N)'),
                              ),
                            ),
                          ],
                        )
                    ),
                    ListTile(
                      leading: Icon(Icons.flight),
                      title: Text('Flights'),
                      subtitle: Image.asset("images/flights.jpg", height: 25, alignment: Alignment.topLeft,),
                    ),
                    ListTile(
                      leading: Icon(Icons.event_note),
                      title: Text('Inclusions'),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Icon(Icons.flight_outlined, color: myColor,),
                            Text('Flights'),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Icon(Icons.home_work_outlined, color: myColor,),
                            Text('Stay'),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Icon(Icons.fastfood_outlined, color: myColor,),
                            Text('Food'),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Icon(Icons.local_activity_outlined, color: myColor,),
                            Text('Activities'),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Icon(Icons.directions_bus_outlined, color: myColor,),
                            Text('Transfers'),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Icon(Icons.credit_card, color: myColor,),
                            Text('Visa'),
                          ],
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text("Sed ut perspiciatis unmnis iste natus error sit voluptatem accusantium doloremque dantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.",
                          style: TextStyle(color: Colors.black87)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15, bottom: 15),
                      child: Text("Read More", style: TextStyle(color: Colors.black54),),
                    ),
                    new Divider(
                      color: Colors.black54,
                    ),
                  ],
                ),
              ),
              SliverPersistentHeader(
                delegate: _SliverAppBarDelegate(
                    TabBar(
                      isScrollable: true,
                      tabs: [
                        Tab(
                          child: Text("Itinerary"),
                        ),
                        Tab(
                          child: Text("Flights"),
                        ),
                        Tab(
                          child: Text("Stay"),
                        ),
                        Tab(
                          child: Text("Activities"),
                        ),
                        Tab(
                          child: Text("Transfers"),
                        ),
                        Tab(
                          child: Text("Inclusions"),
                        ),
                      ],
                      indicatorColor: Color(0xff00a651),
                      unselectedLabelColor: Colors.grey,
                      labelColor: Color(0xff00a651),
                    )
                ),
                pinned: true,
              )
            ];
          },
          body: TabBarView(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [

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

                // Stay
                ListView(
                  children: [
                    StayCard(date: "18 January 2020 - 18 January 2020 (4 Nights)", description: "Le Meridian, Cario Le Meridian, Cario Le Meridian", address: "1115 Nile Camiche, Sharkas, Bulaq, Cario, Egypt"),
                    StayCard(date: "18 January 2020 - 18 January 2020 (4 Nights)", description: "Le Meridian, Cario Le Meridian, Cario Le Meridian", address: "1115 Nile Camiche, Sharkas, Bulaq, Cario, Egypt"),
                    StayCard(date: "18 January 2020 - 18 January 2020 (4 Nights)", description: "Le Meridian, Cario Le Meridian, Cario Le Meridian", address: "1115 Nile Camiche, Sharkas, Bulaq, Cario, Egypt"),
                    StayCard(date: "18 January 2020 - 18 January 2020 (4 Nights)", description: "Le Meridian, Cario Le Meridian, Cario Le Meridian", address: "1115 Nile Camiche, Sharkas, Bulaq, Cario, Egypt"),
                  ],
                ),

                // Activity
                ListView(
                  children: [
                    ActivityCard(location: 'Amusment Park', title: 'Visit to Lego Land, Dubai Parks & Resorts', description: 'A one day tour in a sharing bus to visit Lego Land and Dubai prks with a tour guide located in the dentral parks in Dubai. '),
                    ActivityCard(location: 'Theme Park', title: 'Visit to Lego Land, Dubai Parks & Resorts', description: 'A one day tour in a sharing bus to visit Lego Land and Dubai prks with a tour guide located in the dentral parks in Dubai. '),
                    ActivityCard(location: 'Amusment Park', title: 'Visit to Lego Land, Dubai Parks & Resorts', description: 'A one day tour in a sharing bus to visit Lego Land and Dubai prks with a tour guide located in the dentral parks in Dubai. '),
                    ActivityCard(location: 'Theme Park', title: 'Visit to Lego Land, Dubai Parks & Resorts', description: 'A one day tour in a sharing bus to visit Lego Land and Dubai prks with a tour guide located in the dentral parks in Dubai. '),
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

  _customNavigation() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(50))
      ),
      height: MediaQuery.of(context).size.width / 8.5,
      margin: EdgeInsets.symmetric(vertical: 4, horizontal: 12),
      child: Row(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width / 1.5,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("₹8,50,000 / ", style: TextStyle(color: Colors.black87, fontSize: 26, fontWeight: FontWeight.w800)),
                Text("Adult", style: TextStyle(color: Colors.black87)),
              ],
            ),
          ),
          Expanded(
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(45.0),
              ),
              child: Container(
                color: myColor,
                alignment: Alignment.center,
                child: Text("BOOK NOW", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _checkLocationPermission() async {
    var status = await Permission.location.status;
    if (status.isDenied) {
      await Permission.location.request();
    }
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
      color: Colors.white,
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}