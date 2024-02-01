import 'package:flutter/material.dart';
import 'package:movie_application/core/constants/homepage/home_page_constants.dart';
import 'package:movie_application/core/theme/app_theme.dart';
import 'package:movie_application/features/movie_feature2/presentation/widgets/textfield_widget.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search your movies'),
        backgroundColor: AppTheme.of(context).colors.primary,
        elevation: 0.5,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: AppTheme.of(context).spaces.space_400,
            ),
            Center(
              child: TextFieldHomeWidget(
                  labeltext: HomePageConstants().searchText,
                  icondata: Icon(Icons.search)),
            )
          ],
        ),
      ),
    );
  }
}
