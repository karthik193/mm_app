import 'package:flutter/material.dart';
import 'package:mmapp/More/About.dart';
import 'package:mmapp/Profile/profilepage.dart';
import 'feed.dart';
class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}



class _SearchPageState extends State<SearchPage> {
  
  Widget feed(){
    return Container(

      margin: EdgeInsets.all(5),
      padding: EdgeInsets.all(8),
    decoration: bd,
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
  
  BoxDecoration bd = BoxDecoration(
    color: Colors.white,
    boxShadow: [
      BoxShadow(
        color: Colors.grey,
        blurRadius: 12.0, // soften the shadow
        spreadRadius: 3.0, //extend the shadow
        offset: Offset(
          5.0, // Move to right 10  horizontally
          5.0, // Move to bottom 10 Vertically
        ),
      )
    ],
    borderRadius:new BorderRadius.all(new Radius.circular(20.0)),
  ) ;
  @override
  Widget build(BuildContext context) {

    return ListView(
      shrinkWrap: true,
      padding: EdgeInsets.all(15.0),
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            color: Color(0xFF009DF0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 12.0, // soften the shadow
                spreadRadius: 3.0, //extend the shadow
                offset: Offset(
                  5.0, // Move to right 10  horizontally
                  5.0, // Move to bottom 10 Vertically
                ),
              )
            ],
            borderRadius:new BorderRadius.all(new Radius.circular(20.0)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[Center(child: Text("Search the App",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white, ),),),IconButton(icon: Icon(Icons.search, color: Colors.white, ), onPressed: (){
            showSearch(context: context, delegate: SearchFeed());
          },),],),

        ),
        Container(

      margin: EdgeInsets.all(5),
      padding: EdgeInsets.all(8),
          decoration: bd ,
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

      margin: EdgeInsets.all(5),
      padding: EdgeInsets.all(8),
          decoration: bd,
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

      margin: EdgeInsets.all(5),
      padding: EdgeInsets.all(8),
      decoration: bd,
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

      margin: EdgeInsets.all(5),
      padding: EdgeInsets.all(8),
    decoration: bd,
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

class SearchFeed extends SearchDelegate<Feed> {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [IconButton(icon: Icon(Icons.clear), onPressed: () {
      query = "";
    }),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(icon: Icon(Icons.arrow_back), onPressed: () {
      close(context, null);
    });
  }

  @override
  Widget buildResults(BuildContext context) {
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final myList = query.isEmpty ? feedList() : feedList().where((p) =>
        p.item.startsWith(query)).toList();

    return myList.isEmpty ? Text('No results found...') : ListView.builder(
      itemCount: myList.length,
      itemBuilder: ((context, index) {
        final String listItem = myList[index].item;
        return ListTile(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => myList[index].location),
            );
          },
          title: Text(listItem),);
      }),
    );
  }
}