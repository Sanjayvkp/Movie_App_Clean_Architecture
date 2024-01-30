import 'package:flutter/material.dart';

class WatchListPage extends StatelessWidget {
  const WatchListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Watchlist'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListTile(
              leading: const CircleAvatar(),
              title: const Text('aaaa'),
              trailing:
                  IconButton(onPressed: () {}, icon: const Icon(Icons.remove)),
            )
          ],
        ),
      ),
    );
  }
}
