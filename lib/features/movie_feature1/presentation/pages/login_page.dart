import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_application/core/constants/authentication/login_constants.dart';
import 'package:movie_application/core/theme/app_theme.dart';
import 'package:movie_application/features/movie_feature1/presentation/pages/login_with_phone_page.dart';
import 'package:movie_application/features/movie_feature1/presentation/pages/signup_page.dart';
import 'package:movie_application/features/movie_feature1/presentation/providers/auth_provider.dart';
import 'package:movie_application/features/movie_feature1/presentation/widgets/login_container_widget.dart';
import 'package:movie_application/features/movie_feature1/presentation/widgets/login_txtbtn.dart';
import 'package:movie_application/features/movie_feature1/presentation/widgets/loginbtn_widget.dart';
import 'package:movie_application/features/movie_feature1/presentation/widgets/textfield_widget.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});
  static const routePath = '/login';
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(loginConstantsProvider);
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
                image: data.movielogo,
                height: theme.spaces.space_800 * 3,
                width: theme.spaces.space_800 * 2,
              ),
              SizedBox(
                height: theme.spaces.space_800,
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
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                        onPressed: () {
                          maindata.passwordResetEmail(emails.text);
                        },
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
                onPressed: () {
                  maindata.signInWithEmail(emails.text, password.text);
                },
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      maindata.signinWithGoogle();
                    },
                    child: LoginContainerWidget(
                      width: theme.spaces.space_800,
                      image: data.googlelogo,
                      height: theme.spaces.space_700,
                    ),
                  ),
                  SizedBox(
                    width: theme.spaces.space_500,
                  ),
                  InkWell(
                    onTap: () {
                      context.push(LoginPageWithPhone.routePath);
                    },
                    child: LoginContainerWidget(
                      width: theme.spaces.space_500,
                      image: data.phonelogo,
                      height: theme.spaces.space_50 * 11,
                    ),
                  ),
                ],
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
                        context.go(SignupPage.routePath);
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
