import 'package:flutter/material.dart';
import 'package:mmapp/Main/structure.dart';
import 'package:mmapp/More/About.dart';
import 'package:mmapp/More/Delivery.dart';
import 'package:mmapp/More/Edit.dart';
import 'package:mmapp/More/Schemes.dart';
import 'package:mmapp/More/TTD.dart';
import 'package:mmapp/main.dart';

class Feed {
  String item;
  Widget location;
  Feed({this.item, this.location});
}

List<Feed> feedList() {
  return [
    Feed(item: 'About', location: About()),
    Feed(item: 'Edit Profile', location: Edit()),
    Feed(item: 'My Health', location: Structure(id:1)),
    Feed(item: 'My Menu', location: MyMenu()),
    Feed(item: 'My Medication plan', location: Structure(id:0)),
    Feed(item: 'Profile', location: Structure(id:3)),
    Feed(item: 'Schemes', location: Schemes()),
    Feed(item: 'Talk to a Doctor', location: Ttd()),
    Feed(item: 'Request home Delivery', location: Delivery()),
  ];
}
