import 'package:flutter/material.dart';

class AndroidVersion {
  String _name;
  int _viewType;

  AndroidVersion(this._name, this._viewType);

  int get viewType => _viewType;

  set viewType(int value) {
    _viewType = value;
  }

  String get name => _name;

  set name(String value) {
    _name = value;
  }
}

class LatihanListView4 extends StatelessWidget {
  var androidVersions = [
    AndroidVersion("Android Cupcake", 1),
    AndroidVersion("Android Donut", 2),
    AndroidVersion("Android Eclair", 1),
    AndroidVersion("Android Froyo", 2),
    AndroidVersion("Android Gingerbread", 1),
    AndroidVersion("Android Honeycomb", 2),
    AndroidVersion("Android Ice Cream Sandwich", 1),
    AndroidVersion("Android Jelly Bean", 2),
    AndroidVersion("Android Kitkat", 1),
    AndroidVersion("Android Lollipop", 2),
    AndroidVersion("Android Marshmallow", 1),
    AndroidVersion("Android Nougat", 2),
    AndroidVersion("Android Oreo", 1),
    AndroidVersion("Android Pie", 2)
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        var androidVersion = androidVersions[index];
        switch (androidVersion._viewType) {
          case 1:
            return Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(androidVersion._name),
                ),
              ],
            );
          default:
            return Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(androidVersion._name),
                ),
              ],
            );
        }
      },
      itemCount: androidVersions.length,
    );
  }
}
