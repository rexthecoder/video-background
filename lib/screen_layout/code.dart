import 'dart:convert';

import 'package:flutter/material.dart';

class BoyModel {
  String name;
  String meaning;

  BoyModel({this.name, this.meaning});

  BoyModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    meaning = json['meaning'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['meaning'] = this.meaning;
    return data;
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> alphabets = [
    "A",
    "B",
    "C",
    "D",
    "E",
    "F",
    "G",
    "H",
    "I",
    "J",
    "K",
    "L",
    "M",
    "O",
    "P",
    "Q",
    "R",
    "S",
    "T",
    "U",
    "V",
    "W",
    "X",
    "Y",
    "Z"
  ];
  List<BoyModel> boys = [];
  List<BoyModel> _selectedBoyList;
  String url = Uri.encodeFull(
      "http://tnxpro.com/Flutterapps/Babynames/Jsonfiles/boys.json");

  Future getData() async {
    List<BoyModel> parsedResponse = [];
    dynamic response = await get(url);
    final parsed = jsonDecode(response.body) as List;
    parsedResponse = List.from(parsed.map((e) => BoyModel.fromJson(e)));
    return parsedResponse;
  }

  @override
  void initState() {
    super.initState();
    getData().then((values) {
      setState(() => boys = values);
      _selectedBoyList = boys
          .where((BoyModel boy) => boy.name.startsWith(alphabets.first))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: <Widget>[
        SizedBox(
          height: 1,
        ),
        Container(
          height: 50,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: alphabets
                .map((e) => CircularButton(
                      alphabet: e,
                      letterPressed: () {
                        print(e);
                        setState(() {
                          _selectedBoyList.clear();
                          _selectedBoyList = boys
                              .where((BoyModel boy) =>
                                  boy.name.startsWith(e.toString()))
                              .toList();
                        });
                      },
                    ))
                .toList(),
          ),
        ),
        SizedBox(
          height: 3,
        ),
        Expanded(
          child: boys.isNotEmpty && _selectedBoyList.isNotEmpty
              ? ListView(
                  children: _selectedBoyList.map((e) {
                    Future<void> share() async {
                      //   await FlutterShare.share(
                      //     title: ' ',
                      //     text: 'Name:-'+e.name+'                  ' +'Meaning:-'+ e.meaning);
                      // }
                      //  final bool alreadySaved = _selectedBoyList.contains([index]);
                      return Container(
                          width: double.infinity,
                          margin: EdgeInsets.only(top: 20, right: 10, left: 10),
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.red,
                                    spreadRadius: 2,
                                    blurRadius: 3)
                              ]),
                          child: Row(
                            children: <Widget>[
                              CircleAvatar(
                                child: Image.asset(
                                  'assets/images/boy_name.png',
                                  height: 90,
                                ),
                                backgroundColor: Colors.white,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Container(
                                      child: Row(
                                        children: <Widget>[
                                          Expanded(
                                            child: Text('Name:-' + e.name),
                                          ),
                                          IconButton(
                                            icon: Icon(Icons.content_copy),
                                            color: Colors.black,
                                            onPressed: () {
                                              // ClipboardManager.copyToClipBoard('Name:'+e.name+ '                  '+'Meaning:-'+ e.meaning).then((result) {
                                              //   final snackBar = SnackBar(
                                              //     content: Text('Copied to Clipboard'),
                                              //     action: SnackBarAction(
                                              //       label: 'Undo',
                                              //       onPressed: () {},
                                              //     ),
                                              //   );
                                              //   Scaffold.of(context).showSnackBar(snackBar);
                                              // // print('hvhhv');
                                              // });
                                            },
                                          ),
                                          IconButton(
                                            icon: Icon(Icons.share),
                                            color: Colors.black,
                                            onPressed: () {
                                              share();
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text('Meaning:-' + e.meaning)
                                  ],
                                ),
                              )
                            ],
                          ));
                    }
                  }).toList(),
                )
              : Center(
                  child: CircularProgressIndicator(),
                ),
        ),
      ],
    ));
  }
}

class CircularButton extends StatefulWidget {
  final String alphabet;
  final Function letterPressed;
  CircularButton({
    Key key,
    this.alphabet,
    this.letterPressed,
  }) : super(key: key);

  @override
  _CircularButtonState createState() => _CircularButtonState();
}

class _CircularButtonState extends State<CircularButton> {
  String get alphabet => widget.alphabet;
  @override
  Widget build(BuildContext context) {
    return OutlineButton(
      shape: CircleBorder(side: BorderSide(color: Colors.green)),
      child: Text("$alphabet"),
      onPressed: widget.letterPressed,
    );
  }
}
