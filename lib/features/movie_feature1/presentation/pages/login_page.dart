import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_application/core/constants/authentication/login_constants.dart';

import 'package:movie_application/core/theme/app_theme.dart';
import 'package:movie_application/features/movie_feature1/presentation/pages/signup_page.dart';
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
      backgroundColor: theme.colors.secondary,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LoginContainerWidget(
                image: 'assets/images/movie_logo3.png',
                height: theme.spaces.space_800 * 3,
              ),
              SizedBox(
                height: theme.spaces.space_800,
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
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          data.forgotpasswordtxt,
                          style: theme.typography.h400
                              .copyWith(color: theme.colors.primary),
                        ))
                  ],
                ),
              ),
              SizedBox(
                height: theme.spaces.space_300,
              ),
              LoginButtonWidget(
                btntxt: data.loginbtntxt,
                onPressed: () {},
              ),
              SizedBox(
                height: theme.spaces.space_500,
              ),
              Text(
                ref.watch(loginConstantsProvider).alternativetxt,
                style: theme.typography.h400
                    .copyWith(color: theme.colors.textSubtlest),
              ),
              SizedBox(
                height: theme.spaces.space_200,
              ),
              InkWell(
                onTap: () {},
                child: LoginContainerWidget(
                  image: 'assets/images/login_google.png',
                  height: theme.spaces.space_700,
                ),
              ),
              SizedBox(
                height: theme.spaces.space_700,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    data.registertxt,
                    style: theme.typography.h400
                        .copyWith(color: theme.colors.textSubtlest),
                  ),
                  LogintxtButtonWidget(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return SignupPage();
                          },
                        ));
                      },
                      txtbtntext:
                          ref.watch(loginConstantsProvider).registerbtntxt)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
