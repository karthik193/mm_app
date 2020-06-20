import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:mmapp/analytics/analytics.dart';
import 'Plan/plan.dart';

final Color darkBlue = Color.fromARGB(255, 18, 32, 47);

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int bottomSelectedIndex = 0;
  

  List<BottomNavigationBarItem> buildBottomNavBarItems() {
    return [
      BottomNavigationBarItem(
          icon: Icon(Icons.check),
          backgroundColor: Color(0xFF0A2D5E),
          title: Text('')),
      BottomNavigationBarItem(
          icon: Icon(Icons.equalizer),
          backgroundColor: Color(0xFF0A2D5E),
          title: Text('')),
      BottomNavigationBarItem(
        icon: Icon(Icons.search),
        title: Text(''),
        backgroundColor: Color(0xFF0A2D5E),
      ),
      BottomNavigationBarItem(
          icon: Icon(Icons.person),
          backgroundColor: Color(0xFF0A2D5E),
          title: Text('')),
    ];
  }

  PageController pageController = PageController(
    initialPage: 0,
    keepPage: true,
  );

  Widget buildPageView() {
    return PageView(
      controller: pageController,
      onPageChanged: (index) {
        pageChanged(index);
      },
      children: <Widget>[
        plan(),
        analytics(),
        SearchPage(),
        AppBody(),
      ],
    );
  }

  @override
  void initState() {
    super.initState();
  }

  void pageChanged(int index) {
    setState(() {
      bottomSelectedIndex = index;
    });
  }

  void bottomTapped(int index) {
    setState(() {
      bottomSelectedIndex = index;
      pageController.animateToPage(index,
          duration: Duration(milliseconds: 500), curve: Curves.ease);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: Icon(Icons.panorama_fish_eye),
        title: Text('stimuLife'),
        actions: <Widget>[
          // action button
          IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyMenu()),
                );
              }),
        ],
        backgroundColor: Color(0xFF0A2D5E),
      ),
      body: buildPageView(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: bottomSelectedIndex,
        selectedItemColor: Color(0xFF0A2D5E),
        onTap: (index) {
          bottomTapped(index);
        },
        items: buildBottomNavBarItems(),
      ),
    );
  }
}



class AppBody extends StatefulWidget {
  @override
  _AppBodyState createState() => _AppBodyState();
}

class _AppBodyState extends State<AppBody> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.all(15.0),
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: new DecorationImage(
                            fit: BoxFit.fill,
                            image: new NetworkImage(
                                "https://cdn.pixabay.com/photo/2016/03/26/20/35/young-man-1281282__340.jpg"))),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("Name: Virajith Kumar"),
                      Text("Age: 28"),
                      Text("CurOrg: KIMS Hospital"),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(5),
            child: Container(
              height: 35,
              color: Color(0xFF009DF0),
              child: Center(
                child: Text("History"),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(5),
            height: 70,
            color: Color(0xFFF6F6F6),
            child: Center(
              child: Row(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(20),
                    child: Icon(Icons.fiber_manual_record, color: Colors.green),
                  ),
                  Expanded(
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Center(
                            child: Text("KIMS Hospital"),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(5),
            height: 70,
            color: Color(0xFFF6F6F6),
            child: Center(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Gandhi Hospital"),
                    Text("Reason: Not satisfied with..."),
                  ],
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(5),
            height: 70,
            color: Color(0xFFF6F6F6),
            child: Center(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Osmania Hospital"),
                    Text("Reason: Course completed..."),
                  ],
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(5),
            height: 70,
            color: Color(0xFFF6F6F6),
            child: Center(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("XYZ Hospital"),
                    Text("Reason: Treatment for ..."),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MyMenu extends StatefulWidget {
  @override
  _MyMenuState createState() => _MyMenuState();
}

class _MyMenuState extends State<MyMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("More Options"),
        backgroundColor: Color(0xFF0A2D5E),
      ),
      body: Container(
        color: Colors.white,
        child: ListView(
          children: ListTile.divideTiles(context: context, tiles: [
            ListTile(title: Text("Edit Profile"), onTap: () {}),
            ListTile(title: Text("Request Home Delivery"), onTap: () {}),
            ListTile(title: Text("Schemes"), onTap: () {}),
            ListTile(title: Text("Talk to a Doctor"), onTap: () {}),
            ListTile(title: Text("About"), onTap: () {}),
          ]).toList(),
        ),
      ),
    );
  }
}













class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}



class _SearchPageState extends State<SearchPage> {
  
  Widget feed(){
    return Container(
      color: Color(0xFFF6F6F6),
      margin: EdgeInsets.all(5),
      padding: EdgeInsets.all(8),
    child: Column(
     
    children: <Widget>[
      Row(
        children: <Widget>[Icon(Icons.add_circle,color: Color(0xFFD64D65)),
                           Text('WHO', style: TextStyle(fontWeight: FontWeight.bold)),
                          ], 
         ),
       Container(margin: EdgeInsets.all(5), child: Text('ARE YOU CORONA PRONE?',style: TextStyle(fontStyle: FontStyle.italic)),),
      Text('"WHO" says that these are the corona prone areas...',style: TextStyle(color: Colors.black.withOpacity(0.4))),
      
    ],
    ),
    );
  }
  
  
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      padding: EdgeInsets.all(15.0),
      children: <Widget>[
        Container(
          
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[Center(child: Text("Search the App",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white, ),),),IconButton(icon: Icon(Icons.search, color: Colors.white, ), onPressed: (){
            showSearch(context: context, delegate: SearchFeed());
          },),],),
          color: Color(0xFF009DF0),
        ),
        Container(
      color: Color(0xFFF6F6F6),
      margin: EdgeInsets.all(5),
      padding: EdgeInsets.all(8),
    child: Column(
     
    children: <Widget>[
      Row(
        children: <Widget>[Icon(Icons.add_circle,color: Color(0xFFD64D65)),
                           Text('WHO', style: TextStyle(fontWeight: FontWeight.bold)),
                          ], 
         ),
      Container(margin: EdgeInsets.all(5), child: Text('ARE YOU CORONA PRONE?', style: TextStyle(fontStyle: FontStyle.italic)),),
      Text('"WHO" says that these are the corona prone areas...',style: TextStyle(color: Colors.black.withOpacity(0.4))),
      
    ],
    ),
    ),
        Container(
      color: Color(0xFFF6F6F6),
      margin: EdgeInsets.all(5),
      padding: EdgeInsets.all(8),
    child: Column(
     
    children: <Widget>[
      Row(
        children: <Widget>[Icon(Icons.add_circle,color: Color(0xFFD64D65)),
                           Text('Dr. Morris, WHO', style: TextStyle(fontWeight: FontWeight.bold)),
                          ], 
         ),
      Container(margin: EdgeInsets.all(5), child: Text('Safest Food Today',style: TextStyle(fontStyle: FontStyle.italic)),),
      Text('These foods keep you safe amidst the pandemic...',style: TextStyle(color: Colors.black.withOpacity(0.4))),
      
    ],
    ),
    ),
        Container(
      color: Color(0xFFF6F6F6),
      margin: EdgeInsets.all(5),
      padding: EdgeInsets.all(8),
    child: Column(
     
    children: <Widget>[
      Row(
        children: <Widget>[Icon(Icons.add_circle,color: Color(0xFFD64D65)),
                           Text('Gandhi Hospital', style: TextStyle(fontWeight: FontWeight.bold)),
                          ], 
         ),
       Container(margin: EdgeInsets.all(5), child: Text('More Beds',style: TextStyle(fontStyle: FontStyle.italic)),),
      Text('State government has bestowed Gandhi by supplying...',style: TextStyle(color: Colors.black.withOpacity(0.4))),
      
    ],
    ),
    ),
        Container(
      color: Color(0xFFF6F6F6),
      margin: EdgeInsets.all(5),
      padding: EdgeInsets.all(8),
    child: Column(
     
    children: <Widget>[
      Row(
        children: <Widget>[Icon(Icons.add_circle,color: Color(0xFFD64D65)),
                           Text('Dr. Rama Rao, Cardiologist', style: TextStyle(fontWeight: FontWeight.bold)),
                          ], 
         ),
       Container(margin: EdgeInsets.all(5), child: Text('ARE YOU CORONA PRONE?',style: TextStyle(fontStyle: FontStyle.italic)),),
      Text('"WHO" says that these are the corona prone areas...',style: TextStyle(color: Colors.black.withOpacity(0.4))),
      
    ],
    ),
    ),
        feed(),
        feed(),
        feed(),
      ],
    );
  }
}


class Feed{
}

List<Feed> feedList(){
  return [];
}

class SearchFeed extends SearchDelegate<Feed>{
  @override
  List<Widget> buildActions(BuildContext context) {
      return [IconButton(icon: Icon(Icons.clear),onPressed: (){
        query="";
      }),];
    }
  
    @override
    Widget buildLeading(BuildContext context) {
      
      return IconButton(icon: Icon(Icons.arrow_back),onPressed: (){
        close(context,null);
      });
    }
  
    @override
    Widget buildResults(BuildContext context) {
     
      throw UnimplementedError();
    }
  
    @override
    Widget buildSuggestions(BuildContext context) {
    final myList = feedList();
      return ListView(
        
      );
  }
  
}