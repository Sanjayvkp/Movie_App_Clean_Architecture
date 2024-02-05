import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_application/core/theme/app_theme.dart';
import 'package:movie_application/features/movie_feature2/domain/entities/review_entity.dart';
import 'package:movie_application/features/movie_feature2/presentation/providers/movie_provider.dart';

class CommentListViewWidget extends ConsumerWidget {
  final List<ReviewEntity> entity;
  const CommentListViewWidget({super.key, required this.entity});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      // height: 600,
      child: ListView.builder(
        physics: const ClampingScrollPhysics(),
        itemCount: entity.length,
        shrinkWrap: true,
        padding: EdgeInsets.only(bottom: AppTheme.of(context).spaces.space_200),
        itemBuilder: (context, index) {
          return Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Container(
                width: MediaQuery.sizeOf(context).width / 1.07,
                decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(.3),
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      backgroundImage: NetworkImage(
                          FirebaseAuth.instance.currentUser!.photoURL!),
                    ),
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width / 1.6,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(FirebaseAuth
                                .instance.currentUser!.displayName!),
                            Text(
                              entity[index].review,
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w400),
                            ),
                            Divider(
                              thickness: 1.5,
                              color: Colors.black.withOpacity(.1),
                            ),
                            const Text('12.30 pm'),
                          ],
                        ),
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          ref
                              .read(movieHomeProvider.notifier)
                              .deleteReview(entity[index].id.toString());
                        },
                        icon: const Icon(Icons.delete))
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
