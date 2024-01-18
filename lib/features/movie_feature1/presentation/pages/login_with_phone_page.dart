import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_application/core/constants/authentication/login_constants.dart';
import 'package:movie_application/core/constants/authentication/signup_constants.dart';
import 'package:movie_application/core/theme/app_theme.dart';
import 'package:movie_application/features/movie_feature1/presentation/pages/login_page.dart';
import 'package:movie_application/features/movie_feature1/presentation/providers/auth_provider.dart';
import 'package:movie_application/features/movie_feature1/presentation/widgets/login_container_widget.dart';
import 'package:movie_application/features/movie_feature1/presentation/widgets/login_txtbtn.dart';
import 'package:movie_application/features/movie_feature1/presentation/widgets/loginbtn_widget.dart';
import 'package:movie_application/features/movie_feature1/presentation/widgets/textfield_widget.dart';

class LoginPageWithPhone extends ConsumerWidget {
  const LoginPageWithPhone({super.key});
  static const routePath = '/loginwithphone';
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final maindata = ref.read(movieProvider(context).notifier);
    final theme = AppTheme.of(context);
    final data = ref.watch(loginConstantsProvider);
    final signuptexts = ref.watch(signupConstantsProvider);
    return Scaffold(
      backgroundColor: theme.colors.secondary,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              LoginContainerWidget(
                image: data.movielogo,
                height: theme.spaces.space_800 * 3,
                width: theme.spaces.space_800 * 2,
              ),
              SizedBox(
                height: theme.spaces.space_300,
              ),
              TextfieldWidget(
                  labeltext: data.phonenumber,
                  icondata: Icon(
                    Icons.phone,
                    color: theme.colors.secondary,
                  ),
                  controller: maindata.phonenumberlogincontroller),
              SizedBox(
                height: theme.spaces.space_300,
              ),
              LoginButtonWidget(
                btntxt: data.otp,
                onPressed: () {
                  maindata.signInWithPhone(
                    maindata.phonenumberlogincontroller.text,
                  );
                },
              ),
              SizedBox(
                height: theme.spaces.space_300,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    signuptexts.alreadyuser,
                    style: theme.typography.h400
                        .copyWith(color: theme.colors.textSubtlest),
                  ),
                  LogintxtButtonWidget(
                    txtbtntext: signuptexts.loginnow,
                    onPressed: () {
                      context.go(LoginPage.routePath);
                    },
                  ),
                ],
              ),
              SizedBox(
                height: theme.spaces.space_800,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
