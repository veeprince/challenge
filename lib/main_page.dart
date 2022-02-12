import 'package:challege_app/home.dart';
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(221, 18, 17, 17),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(221, 18, 17, 17),
        title: const Text('Challenge'),
        actions: [
          IconButton(
              onPressed: () => {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => const MySearchPage(),
                    ))
                  },
              icon: const Icon(Icons.search_rounded))
        ],
      ),
      body: const Center(child: Text('Hello')),
    );
  }
}
