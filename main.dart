import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(
      length: 3,
      initialIndex: 0,
      vsync: this,
    );
  }

  /*final _devices = const [
    {
      'device':'Light (Living Room)',
      'img1':'image/light_off.png',
      'img2':'image/light_on.png',
      'switch': true,
    },
    {
      'device':'Television',
      'img1':'image/tv_off.png',
      'img2':'image/tv_on.png',
      'switch': true,
    },
    {
      'device':'Aina Room Light',
      'img1':'image/light_off.png',
      'img2':'image/light_on.png',
      'switch': true,
    },
    {
      'device':'Kitchen Plug',
      'img1':'image/switchoff.png',
      'img2':'image/switchon.png',
      'switch': true,
    },
  ];*/

  var index = 0;
  var device = [
    'Light (Living Room)',
    'Television',
    'Kitchen Plug',
    'Aina Room Light',
  ];
  
  var img1 = ['image/light_off.png', 'image/tv_off.png', 'image/switchoff.png', 'image/light_off.png'];
  var img2 = ['image/light_on.png', 'image/tv_on.png', 'image/switchon.png', 'image/light_on.png'];
  List<bool> toggleSwitch = [true, true, true, true];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        tabBarTheme: const TabBarTheme(
          labelPadding: EdgeInsets.symmetric(horizontal: 15),
          labelColor: Colors.black,
          unselectedLabelColor: Colors.grey,
        ),
      ),
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: SizedBox(
              child: Row(
                children: [
                  Text(
                    'My Home',
                    style: TextStyle(color: Colors.black),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 7, right: 7),
                    child: Icon(
                      Icons.arrow_forward_ios,
                      size: 10.0,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
          body: Column(children: [
            Row(
              children: [
                Expanded(
                  child: Stack(
                    children: [
                      Container(
                        width: 250,
                        child: TabBar(
                          controller: tabController,
                          isScrollable: true,
                          tabs: [
                            Tab(child: Text('All')),
                            Tab(
                                child: Text(
                              'Living room',
                            )),
                            Tab(
                                child: Text(
                              'Bedroom',
                            )),
                          ],
                        ),
                      ),
                      Positioned(
                        right: 10,
                        bottom: 10,
                        child: Icon(Icons.more_horiz),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Flexible(
              child: Container(
                height: double.infinity, //height of TabBarView
                color: Colors.grey[300],
                child: TabBarView( controller: tabController, children: [
                  all(),
                  livingroom(),
                  bedroom(),
                ])
              ),
            ),
          ])),
    );
  }

  Widget all(){
    return GridView.count(
      // Create a grid with 2 columns. If you change the scrollDirection to
      // horizontal, this produces 2 rows.
      padding: const EdgeInsets.all(10),
      crossAxisCount: 2, // No of column
      crossAxisSpacing: 10, // Vertical line
      mainAxisSpacing: 10, // Horizontal line
      // Generate number of widgets that display their index in the List.
      children: List.generate(4, (index) {
        return Container(
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10)),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(children: [
              Image.asset(toggleSwitch[index] ? img1[index] : img2[index],
                  height: 67, width: 64),
              Spacer(),
              Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.black,
                    )),
                child: IconButton(
                    icon: const Icon(Icons.power_settings_new_rounded),
                    onPressed: () {
                      setState(() {
                        toggleSwitch[index] = !toggleSwitch[index];
                      });
                    }),
              ),
            ]),
            Spacer(),
            Text(
              device[index],
              //style: Theme.of(context).textTheme.bodyText1,
            ),
            Text(
              toggleSwitch[index] ? 'OFF' : 'ON',
              //style: Theme.of(context).textTheme.bodyText1,
            ),
          ]),
        );
      }),
    );
  }

  Widget livingroom(){
    return GridView.count(
      // Create a grid with 2 columns. If you change the scrollDirection to
      // horizontal, this produces 2 rows.
      padding: const EdgeInsets.all(10),
      crossAxisCount: 2, // No of column
      crossAxisSpacing: 10, // Vertical line
      mainAxisSpacing: 10, // Horizontal line
      // Generate number of widgets that display their index in the List.
      children: List.generate(3, (index) {
        return Container(
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10)),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(children: [
              Image.asset(toggleSwitch[index] ? img1[index] : img2[index],
                  height: 67, width: 64),
              Spacer(),
              Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.black,
                    )),
                child: IconButton(
                    icon: const Icon(Icons.power_settings_new_rounded),
                    onPressed: () {
                      setState(() {
                          toggleSwitch[index] = !toggleSwitch[index];
                      });
                    }),
              ),
            ]),
            Spacer(),
            Text(
              device[index],
              //style: Theme.of(context).textTheme.bodyText1,
            ),
            Text(
              toggleSwitch[index] ? 'OFF' : 'ON',
              //style: Theme.of(context).textTheme.bodyText1,
            ),
          ]),
        );
      }),
    );
  }

  Widget bedroom(){
    return GridView.count(
      // Create a grid with 2 columns. If you change the scrollDirection to
      // horizontal, this produces 2 rows.
      padding: const EdgeInsets.all(10),
      crossAxisCount: 2, // No of column
      crossAxisSpacing: 10, // Vertical line
      mainAxisSpacing: 10, // Horizontal line
      // Generate number of widgets that display their index in the List.
      children: List.generate(1, (index) {
        return Container(
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10)),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(children: [
              Image.asset(toggleSwitch[3] ? img1[3] : img2[3],
                  height: 67, width: 64),
              Spacer(),
              Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.black,
                    )),
                child: IconButton(
                    icon: const Icon(Icons.power_settings_new_rounded),
                    onPressed: () {
                      setState(() {
                        toggleSwitch[3] = !toggleSwitch[3];
                      });
                    }),
              ),
            ]),
            Spacer(),
            Text(
              device[3],
              //style: Theme.of(context).textTheme.bodyText1,
            ),
            Text(
              toggleSwitch[3] ? 'OFF' : 'ON',
              //style: Theme.of(context).textTheme.bodyText1,
            ),
          ]),
        );
      }),
    );
  }
}

