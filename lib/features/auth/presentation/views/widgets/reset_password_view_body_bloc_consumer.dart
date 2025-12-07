import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/helpers/build_snack_bar.dart';
import '../../../../../core/helpers/error_message_helper.dart';
import '../../../../../generated/l10n.dart';
import '../../manager/cubits/reset_password_cubit/reset_password_cubit.dart';
import 'reset_password_view_body.dart';

class ResetPasswordViewBodyBlocConsumer extends StatelessWidget {
  const ResetPasswordViewBodyBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ResetPasswordCubit, ResetPasswordState>(
      listener: (context, state) {
        if (state is ResetPasswordSuccess) {
          buildSnackBar(
            context: context,
            title: 'نجح',
            message:
                'تم إرسال رابط إعادة تعيين كلمة المرور إلى بريدك الإلكتروني',
            contentType: ContentType.success,
          );
          Navigator.pop(context);
        }

        if (state is ResetPasswordFailure) {
          buildSnackBar(
            context: context,
            title: S.of(context).error,
            message: getErrorMessage(context, state.message),
            contentType: ContentType.failure,
          );
        }
      },
      builder: (context, state) {
        //  تم التغيير من color: Colors.white إلى لون الخلفية الديناميكي
        return ModalProgressHUD(
          inAsyncCall: state is ResetPasswordLoading,
          color: Theme.of(context).scaffoldBackgroundColor,
          opacity: 0.7, // ترك الشفافية كما هي
          child: const ResetPasswordViewBody(),
        );
      },
    );
  }
}

class ModalProgressHUD extends StatelessWidget {
  final bool inAsyncCall;
  final double opacity;
  final Color color;
  final Widget child;

  const ModalProgressHUD({
    super.key,
    required this.inAsyncCall,
    this.opacity = 0.5,
    this.color = Colors.grey,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;

    return Stack(
      children: [
        child,
        if (inAsyncCall)
          Opacity(
            opacity: opacity,
            // color هنا هو اللون الذي تم تمريره ديناميكياً من الباني
            child: ModalBarrier(dismissible: false, color: color),
          ),
        if (inAsyncCall)
          Center(child: CircularProgressIndicator(color: primaryColor)),
      ],
    );
  }
}
