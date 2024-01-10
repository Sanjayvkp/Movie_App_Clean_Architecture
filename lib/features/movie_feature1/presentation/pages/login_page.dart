import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_application/core/constants/login/login_constants.dart';
import 'package:movie_application/core/theme/app_theme.dart';
import 'package:movie_application/features/movie_feature1/presentation/widgets/login_container_widget.dart';
import 'package:movie_application/features/movie_feature1/presentation/widgets/login_txtbtn.dart';
import 'package:movie_application/features/movie_feature1/presentation/widgets/loginbtn_widget.dart';
import 'package:movie_application/features/movie_feature1/presentation/widgets/textfield_widget.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(loginConstantsProvider);
    final theme = AppTheme.of(context);
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const LoginContainerWidget(image: 'assets/images/logo_2.png'),
              Text(
                data.welcometxt,
                style: theme.typography.h700,
              ),
              SizedBox(
                height: theme.spaces.space_500,
              ),
              TextfieldWidget(
                labeltext: data.emailtxt,
                icondata: Icon(
                  Icons.email_outlined,
                  color: theme.colors.secondary,
                ),
              ),
              SizedBox(
                height: theme.spaces.space_200,
              ),
              TextfieldWidget(
                labeltext: data.passwordtxt,
                icondata: Icon(
                  Icons.remove_red_eye_outlined,
                  color: theme.colors.secondary,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    LogintxtButtonWidget(
                        txtbtntext: ref
                            .watch(loginConstantsProvider)
                            .forgotpasswordtxt),
                  ],
                ),
              ),
              SizedBox(
                height: theme.spaces.space_300,
              ),
              LoginButtonWidget(
                btntxt: data.loginbtntxt,
              ),
              SizedBox(
                height: theme.spaces.space_500,
              ),
              Text(ref.watch(loginConstantsProvider).alternativetxt),
              SizedBox(
                height: theme.spaces.space_200,
              ),
              InkWell(
                onTap: () {},
                child: const LoginContainerWidget(
                    image: 'assets/images/login_google.png'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
