import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_application/core/constants/authentication/login_constants.dart';
import 'package:movie_application/core/constants/authentication/signup_constants.dart';
import 'package:movie_application/core/theme/app_theme.dart';
import 'package:movie_application/features/movie_feature1/presentation/pages/login_page.dart';
import 'package:movie_application/features/movie_feature1/presentation/providers/movie_provider.dart';
import 'package:movie_application/features/movie_feature1/presentation/widgets/login_container_widget.dart';
import 'package:movie_application/features/movie_feature1/presentation/widgets/login_txtbtn.dart';
import 'package:movie_application/features/movie_feature1/presentation/widgets/loginbtn_widget.dart';
import 'package:movie_application/features/movie_feature1/presentation/widgets/textfield_widget.dart';

class SignupPage extends ConsumerWidget {
  const SignupPage({super.key});
  static const routePath = '/signup';
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(signupConstantsProvider);
    final maindata = ref.read(movieProvider(context).notifier);
    final emails = ref.read(movieProvider(context).notifier).emailcontroller;
    final password =
        ref.read(movieProvider(context).notifier).passwordcontroller;
    final theme = AppTheme.of(context);

    return Scaffold(
      backgroundColor: theme.colors.secondary,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LoginContainerWidget(
                width: theme.spaces.space_800 * 2,
                image: data.movielogo,
                height: theme.spaces.space_800 * 3,
              ),
              Text(
                data.welcometxt,
                style: theme.typography.h800
                    .copyWith(color: theme.colors.textInverse),
              ),
              SizedBox(
                height: theme.spaces.space_300,
              ),
              TextfieldWidget(
                controller: maindata.namecontroller,
                labeltext: data.user,
                icondata: Icon(
                  Icons.person_3_outlined,
                  color: theme.colors.secondary,
                ),
              ),
              SizedBox(
                height: theme.spaces.space_200,
              ),
              TextfieldWidget(
                controller: maindata.numbercontroller,
                labeltext: data.phonenumber,
                icondata: Icon(
                  Icons.phone_android_rounded,
                  color: theme.colors.secondary,
                ),
              ),
              SizedBox(
                height: theme.spaces.space_200,
              ),
              TextfieldWidget(
                controller: maindata.emailcontroller,
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
                controller: maindata.passwordcontroller,
                labeltext: data.passwordtxt,
                icondata: Icon(
                  Icons.remove_red_eye_outlined,
                  color: theme.colors.secondary,
                ),
              ),
              SizedBox(
                height: theme.spaces.space_200,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    LogintxtButtonWidget(
                      txtbtntext:
                          ref.watch(loginConstantsProvider).forgotpasswordtxt,
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: theme.spaces.space_300,
              ),
              LoginButtonWidget(
                btntxt: data.signupbtntxt,
                onPressed: () {
                  maindata.signUpwithEmail(emails.text, password.text);
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    data.alreadyuser,
                    style: theme.typography.h400
                        .copyWith(color: theme.colors.textSubtlest),
                  ),
                  LogintxtButtonWidget(
                    txtbtntext: data.loginnow,
                    onPressed: () {
                      context.go(LoginPage.routePath);
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
