import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_e_commerce_v2/core/di/di.dart';
import 'package:route_e_commerce_v2/core/l10n/translations/app_localizations.dart';
import 'package:route_e_commerce_v2/core/network_utilis/api_result.dart';
import 'package:route_e_commerce_v2/core/routing/routes.dart';
import 'package:route_e_commerce_v2/core/theme/app_colors.dart';
import 'package:route_e_commerce_v2/core/utils/app_assets.dart';
import 'package:route_e_commerce_v2/core/utils/dialog_utils.dart';
import 'package:route_e_commerce_v2/core/utils/validation.dart';
import 'package:route_e_commerce_v2/features/auth/ui/login/cubit/login_cubit.dart';
import 'package:route_e_commerce_v2/features/auth/ui/login/cubit/login_state.dart';
import 'package:route_e_commerce_v2/features/auth/ui/widgets/auth_textfield.dart';

///Widget -> ViewModel -> Usecase-> Repoistory-> Datasources
class Login extends StatelessWidget {
  LoginCubit loginCubit = getIt();
  Login({super.key});

  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      bloc: loginCubit, /// instead of using bloc provider
      listener: (context, state){
        if(state.loginApiState is SuccessApiResult){
          Navigator.pop(context);
          Navigator.pushNamed(context, Routes.navigationRoute);
        }else if(state.loginApiState is ErrorApiResult){
          Navigator.pop(context);
          showMessage(context,
              title: "error",
              message: (state.loginApiState as ErrorApiResult).errorMessage,
               posButtonText: "ok");
        }else if(state.loginApiState is LoadingApiResult){
          showLoading(context);
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.blue,
        body: Form(
          key: formKey,
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Image.asset(AppImages.logo),
                    const SizedBox(height: 80),
      
                    Text(
                      AppLocalizations.of(context)!.welcomeBackToRoute,
                      style: Theme.of(
                        context,
                      ).textTheme.headlineMedium!.copyWith(color: AppColors.white),
                    ),
      
                    Text(
                      AppLocalizations.of(context)!.pleaseSignInWithYourMail,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 40),
      
      
      
                    AuthTextField(
                      title: AppLocalizations.of(context)!.enterYourMail,
                      hintText: AppLocalizations.of(context)!.mail,
                      validator: Validation.validateEmail,
                      controller: emailController,
                    ),
                    SizedBox(height: 40),
      
                    AuthTextField(
                      title: AppLocalizations.of(context)!.enterYourPassword,
                      hintText: AppLocalizations.of(context)!.password,
                      validator: Validation.validatePassword,
                      obscureText: true,
                      controller: passwordController,
                    ),
      
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {
                            // TODO:  Navigate to forget password
                          },
                          child: Text(
                            AppLocalizations.of(context)!.forgetPassword,
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 56),
                  ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        loginCubit.login(emailController.text, passwordController.text);
                      }
                    },
                    style: ElevatedButton.styleFrom(backgroundColor: AppColors.white),
                    child: Text(
                      AppLocalizations.of(context)!.signIn,
                      style: Theme.of(
                        context,
                      ).textTheme.titleMedium!.copyWith(color: AppColors.darkBlue),
                    ),
                  ),
      
                    const SizedBox(height: 32),
      
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          AppLocalizations.of(context)!.dontHaveAnAccount,
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        TextButton(
                          onPressed: () {
                            // TODO:  Navigate to create account
                          },
      
                          child: Text(
                            AppLocalizations.of(context)!.createAccount,
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
