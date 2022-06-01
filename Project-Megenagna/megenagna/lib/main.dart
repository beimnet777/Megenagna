import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:megenagna/ui/Applicants.dart';
import 'package:megenagna/ui/Apply.dart';
import 'package:megenagna/ui/CompanyHome.dart';
import 'package:megenagna/ui/Status.dart';
import 'package:megenagna/ui/blocs/apply_bloc/apply_state.dart';
import 'package:megenagna/ui/companyProfile.dart';
import 'package:megenagna/ui/Home.dart';
import 'package:megenagna/ui/Profile.dart';
import 'ui/blocs/apply_bloc/apply_bloc.dart';
import 'ui/blocs/bottom_navigation/bottom_navigation_bloc.dart';
import 'ui/blocs/profile _update_blocs/profile_updater_bloc.dart';

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
          GoRoute(
            path: 'profile/comany',
            pageBuilder: (context, state) {
              return MaterialPage(child: CompanyProfile());
            },
          ),
        ]),
  ]);
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (BuildContext context) => BottomNavBloc(0)),
        BlocProvider(create: (BuildContext context) => ApplyBloc(Idle())),
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
