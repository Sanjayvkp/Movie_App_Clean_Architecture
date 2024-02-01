import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_application/core/constants/homepage/home_page_constants.dart';
import 'package:movie_application/core/theme/app_theme.dart';
import 'package:movie_application/features/movie_feature2/presentation/providers/movie_provider.dart';
import 'package:movie_application/features/movie_feature2/presentation/widgets/elevatedbutton_widget.dart';

class ShowModelWidget extends ConsumerWidget {
  final String title;
  final void Function()? onPressed;
  const ShowModelWidget(
      {super.key, required this.title, required this.onPressed});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = AppTheme.of(context);
    final data = ref.read(movieHomeProvider.notifier);
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: SizedBox(
        height: theme.spaces.space_800 * 3,
        width: MediaQuery.sizeOf(context).width,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                    controller: data.reviewController,
                    decoration: InputDecoration(
                        isCollapsed: false,
                        fillColor: theme.colors.primary,
                        filled: true,
                        labelText: title,
                        prefixIcon: const Icon(Icons.arrow_right_alt_rounded),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                          color: theme.colors.secondary,
                          width: 10,
                        )))),
                SizedBox(
                  height: theme.spaces.space_400,
                ),
                PlayButtonWidget(
                  bgcolor: theme.colors.secondary,
                  textcolor: theme.colors.primary,
                  btntxt: HomePageConstants().reviewsubmit,
                  onPressed: onPressed,
                ),
              ],
            ),
          ),
        ),
      ),
    );
    ;
  }
}
