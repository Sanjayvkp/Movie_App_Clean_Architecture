import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_application/features/movie_feature1/presentation/providers/movie_provider.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});
  static const routePath = '/';
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                ref.read(movieProvider(context).notifier).signOut();
              },
              icon: const Icon(
                Icons.logout,
                color: Colors.black,
              ))
        ],
      ),
      body: Center(
        child: Text(
          'HOMEPAGE',
          style: TextStyle(fontSize: 30),
        ),
      ),
    );
  }
}
