import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_application/core/constants/authentication/login_constants.dart';
import 'package:movie_application/core/theme/app_theme.dart';
import 'package:movie_application/features/movie_feature1/presentation/providers/auth_provider.dart';
import 'package:movie_application/features/movie_feature1/presentation/widgets/login_container_widget.dart';
import 'package:movie_application/features/movie_feature1/presentation/widgets/loginbtn_widget.dart';
import 'package:movie_application/features/movie_feature1/presentation/widgets/textfield_widget.dart';

class OtpVerificationPage extends ConsumerWidget {
  const OtpVerificationPage({super.key});
  static const routePath = '/loginwithotp';
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final maindata = ref.read(movieProvider.notifier);
    final theme = AppTheme.of(context);
    final data = ref.watch(loginConstantsProvider);

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
                  labeltext: data.otpfield,
                  icondata: const Icon(Icons.lock_clock_rounded),
                  controller: maindata.otpcontroller),
              SizedBox(
                height: theme.spaces.space_300,
              ),
              LoginButtonWidget(
                btntxt: data.otpconfirmbtn,
                onPressed: () {
                  maindata.verifyOtp(
                    context,
                    maindata.otpcontroller.text,
                  );
                },
              ),
              SizedBox(
                height: theme.spaces.space_800 * 2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
