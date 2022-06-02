import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:megenagna/employee/screens/ProfileUpdate.dart';
import 'package:megenagna/Auth/bloc/auth_bloc.dart';
import 'package:megenagna/Auth/screen/Login.dart';
import 'package:megenagna/Auth/screen/SignUp.dart';
import 'package:megenagna/employer/screens/Applicants.dart';
import 'package:megenagna/employee/screens/Apply.dart';
import 'package:megenagna/employer/screens/CompanyHome.dart';
import 'package:megenagna/employee/screens/Status.dart';
import './employee/blocs/apply_bloc/apply_state.dart';
import 'package:megenagna/employer/screens/companyProfile.dart';
import 'employee/screens/Home.dart';
import 'employee/screens/Profile.dart';
import './employee/blocs/apply_bloc/apply_bloc.dart';
import 'package:megenagna/employee/blocs/bottom_navigation/bottom_navigation_bloc.dart';
import './employee/blocs/profile _update_blocs/profile_updater_bloc.dart';

void main() {
  final router = GoRouter(routes: [
    GoRoute(
        path: '/',
        pageBuilder: (context, state) {
          return MaterialPage(child: Home());
        },
        routes: [
          GoRoute(
              path: 'apply',
              pageBuilder: (context, state) {
                return MaterialPage(child: Apply());
              }),
          GoRoute(
            path: 'more',
            pageBuilder: (context, state) {
              return MaterialPage(child: CompanyProfile());
            },
          ),
          // GoRoute(
          //   path: 'profile/user',
          //   pageBuilder: (context, state) {
          //     return MaterialPage(child: Profile());
          //   },
          // ),
          GoRoute(
            path: 'profile/company',
            pageBuilder: (context, state) {
              return MaterialPage(child: CompanyProfile());
            },
          ),
          GoRoute(
              path: "user/profile",
              pageBuilder: (context, state) {
                return MaterialPage(child: Profile());
              },
              routes: [
                GoRoute(
                    path: "profileUpdate",
                    pageBuilder: (context, state) {
                      return MaterialPage(child: ProfileUpdate());
                    }),
              ])
        ]),
  ]);
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (BuildContext context) => BottomNavBloc(0)),
        BlocProvider(create: (BuildContext context) => ApplyBloc()),
        BlocProvider(create: (BuildContext context) => ProfileUpdaterBloc())
      ],
      child: MaterialApp.router(
        routeInformationParser: router.routeInformationParser,
        routerDelegate: router.routerDelegate,
        // home: Home(),
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Inter',
        ),
      ),
    ),
  );
}
