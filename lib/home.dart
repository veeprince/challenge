import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MySearchPage extends StatefulWidget {
  const MySearchPage({Key? key}) : super(key: key);

  @override
  _MySearchPageState createState() => _MySearchPageState();
}

class _MySearchPageState extends State<MySearchPage> {
  final List<Map<String, dynamic>> _allUsers = [
    {"name": "Andy", "date": "11/25/2019", "img": "https://picsum.photos/100"},
    {
      "name": "Aragon",
      "date": "11/25/2019",
      "img": "https://picsum.photos/100"
    },
    {"name": "Bob", "date": "11/25/2019", "img": "https://picsum.photos/100"},
    {
      "name": "Barbara",
      "date": "11/25/2019",
      "img": "https://picsum.photos/100"
    },
    {"name": "Candy", "date": "11/25/2019", "img": "https://picsum.photos/100"},
  ];
  List<Map<String, dynamic>> _foundUsers = [];
  @override
  initState() {
    _foundUsers = _allUsers;
    super.initState();
  }

  void _runFilter(String enteredKeyword) {
    List<Map<String, dynamic>> results = [];
    if (enteredKeyword.isEmpty) {
      results = _allUsers;
    } else {
      results = _allUsers
          .where((user) =>
              user["name"].toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
    }

    setState(() {
      _foundUsers = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(221, 28, 26, 26),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(221, 18, 17, 17),
        title: const Text('Add an Admin'),
        actions: const <Widget>[
          SizedBox(width: 60, child: Icon(Icons.heart_broken_sharp))
        ],
      ),
      body: Column(
        children: [
          Row(
            children: [
              SizedBox(
                width: 326,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(9, 9, 0, 9),
                  child: CupertinoTextField(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(9),
                        color: Colors.grey[800]),
                    cursorColor: Colors.grey,
                    style: const TextStyle(color: Colors.white),
                    prefix: const Padding(
                      padding: EdgeInsets.fromLTRB(5, 5, 0, 5),
                      child: Icon(
                        Icons.search_rounded,
                        color: Colors.grey,
                        size: 20,
                      ),
                    ),
                    clearButtonMode: OverlayVisibilityMode.always,
                    onChanged: (value) => _runFilter(value),
                  ),
                ),
              ),
              TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text(
                    'Cancel',
                    style: TextStyle(color: Colors.blue),
                  )),
            ],
          ),
          Expanded(
            child: _foundUsers.isNotEmpty
                ? ListView.builder(
                    itemCount: _foundUsers.length,
                    itemBuilder: (context, index) => ListTile(
                      leading: CircleAvatar(
                        backgroundImage:
                            NetworkImage('${_foundUsers[index]['img']}'),
                        radius: 30,
                      ), //CircleAvatar
                      title: Text(_foundUsers[index]['name']),
                      subtitle:
                          Text('Member since ${_foundUsers[index]["date"]}'),
                      trailing: const Icon(Icons.more_horiz),
                    ),
                  )
                : const Text(
                    'No results found',
                    style: TextStyle(fontSize: 24),
                  ),
          ),
        ],
      ),
    );
  }
}
