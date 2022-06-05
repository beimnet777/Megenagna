import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:last/Auth/bloc/radiobloc/radiobloc.dart';
import 'package:last/employer/blocs/applicantsbloc/applicantsbloc.dart';
import 'package:last/employer/blocs/company_home_bloc/companyHomeBloc.dart';
import 'package:last/employer/blocs/create_profile_blocs/createprofilebloc.dart';
import 'package:last/employer/blocs/post_blocs/postbloc.dart';
import 'package:last/employer/blocs/statistics_bloc/statisticsbloc.dart';
import 'package:last/employer/screens/postAd.dart';
import 'package:last/employer/screens/profileform.dart';
import '/employee/screens/ProfileUpdate.dart';
import 'Auth/bloc/auth_bloc.dart';
import 'Auth/screen/Login.dart';
import 'Auth/screen/SignUp.dart';
import 'employee/blocs/job_bloc/job_bloc.dart';
import 'employee/data provider/ApplicationProvider.dart';
import 'employee/data provider/EmployerProvider.dart';
import 'employee/data provider/employee_local_data_provier.dart';
import 'employee/repository/EmployerRepository.dart';
import 'employee/repository/app_repository.dart';
import 'employee/repository/employee_local_repository.dart';
import 'employer/screens/Applicants.dart';
import '/employee/screens/Apply.dart';
import '/employer/screens/CompanyHome.dart';
import './employee/blocs/apply_bloc/apply_state.dart';
import '/employer/screens/companyProfile.dart';
import 'employee/screens/Home.dart';
import 'Auth/screen/SignUp.dart';
import 'employee/screens/Profile.dart';
import './employee/blocs/apply_bloc/apply_bloc.dart';
import '/employee/blocs/bottom_navigation/bottom_navigation_bloc.dart';
import './employee/blocs/profile _update_blocs/profile_updater_bloc.dart';
import './employer/screens/Stats.dart';

void main() {
  final router = GoRouter(
    routes: [
      GoRoute(
          path: '/',
          pageBuilder: (context, state) {
            return MaterialPage(child: LoginScreen());
          },
          routes: [
            // GoRoute(
            //     path: "profileUpdate",
            //     pageBuilder: (context, state) {
            //       return MaterialPage(child: ProfileUpdate());
            //     }),
            // GoRoute(
            //     path: "CreateUserProfile",
            //     pageBuilder: (context, state) {
            //       return MaterialPage(child: UserProfileForm());
            //     }),
            GoRoute(
                path: "CreateHostProfile",
                pageBuilder: (context, state) {
                  return MaterialPage(child: ProfileForm());
                }),
            GoRoute(
                path: 'company/home',
                pageBuilder: (context, state) {
                  return MaterialPage(child: CompanyHome());
                },
                routes: [
                  // GoRoute(
                  //   path: 'more',
                  //   pageBuilder: (context, state) {
                  //     return MaterialPage(child: CompanyProfile());
                  //   },
                  // ),
                  GoRoute(
                    path: 'profile',
                    pageBuilder: (context, state) {
                      return MaterialPage(child: CompanyProfile());
                    },
                  ),
                  GoRoute(
                      path: 'postAd',
                      pageBuilder: (context, state) {
                        return MaterialPage(child: PostAd());
                      }),
                  GoRoute(
                      path: 'applicants/:id',
                      pageBuilder: (context, state) {
                        var num = state.params['id'];
                        return MaterialPage(child: ApplicantsList(int.parse(num!)));
                      },
                      routes: [
                        GoRoute(
                            path: 'stats',
                            pageBuilder: (context, state) {
                              return MaterialPage(child: Statistics());
                            }),
                      ]),
                ]),
          ]),
      GoRoute(
          path: '/company/home',
          pageBuilder: (context, state) {
            return MaterialPage(child: CompanyHome());
          },
          routes: [
            GoRoute(
                path: "user/home",
                pageBuilder: (context, state) {
                  return MaterialPage(child: Home());
                },
                routes: [
                  GoRoute(
                      path: "apply/:id",
                      pageBuilder: (context, state) {
                        var num = state.params['id'];
                        return MaterialPage(child: Apply(int.parse(num!)));
                      }),
                  GoRoute(
                      path: 'profile',
                      pageBuilder: (context, state) {
                        return const MaterialPage(child: Profile());
                      },
                      routes: [
                        GoRoute(
                            path: "profileUpdate",
                            pageBuilder: (context, state) {
                              return MaterialPage(child: ProfileUpdate());
                            }),
                      ]),
                  GoRoute(
                      path: "profileUpdate",
                      pageBuilder: (context, state) {
                        return MaterialPage(child: ProfileUpdate());
                      }),
                ]),

            // GoRoute(
            //   path: 'more',
            //   pageBuilder: (context, state) {
            //     return MaterialPage(child: CompanyProfile());
            //   },
            // ),
            GoRoute(
              path: 'profile',
              pageBuilder: (context, state) {
                return MaterialPage(child: CompanyProfile());
              },
            ),
            GoRoute(
                path: 'postAd',
                pageBuilder: (context, state) {
                  return MaterialPage(child: PostAd());
                }),
            GoRoute(
                path: 'applicants/:id',
                pageBuilder: (context, state) {
                  var num = state.params['id'];
                  return MaterialPage(child: ApplicantsList(int.parse(num!)));
                },
                routes: [
                  GoRoute(
                      path: 'stats',
                      pageBuilder: (context, state) {
                        return MaterialPage(child: Statistics());
                      }),
                ]),
          ]),
      GoRoute(
          path: "/user/home",
          pageBuilder: (context, state) {
            return MaterialPage(child: Home());
          },
          routes: [
            GoRoute(
                path: "apply/:id",
                pageBuilder: (context, state) {
                  var num = state.params['id'];
                  return MaterialPage(child: Apply(int.parse(num!)));
                }),
            GoRoute(
                path: 'profile',
                pageBuilder: (context, state) {
                  return const MaterialPage(child: Profile());
                },
                routes: [
                  GoRoute(
                      path: "profileUpdate",
                      pageBuilder: (context, state) {
                        return MaterialPage(child: ProfileUpdate());
                      }),
                ]),
            GoRoute(
                path: "profileUpdate",
                pageBuilder: (context, state) {
                  return MaterialPage(child: ProfileUpdate());
                }),
          ]),
      GoRoute(
          path: "/signup",
          pageBuilder: (context, state) {
            return MaterialPage(child: SignupScreen());
          },
          routes: []),
      GoRoute(
          path: "/login",
          pageBuilder: (context, state) {
            return MaterialPage(child: LoginScreen());
          }),
    ],
  );
  final ProfileUpdaterBloc updaterBloc = ProfileUpdaterBloc(
      EmployeeRepository(employeeProvider: EmployeeDataProvider()));
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (BuildContext context) => BottomNavBloc(0)),
        // BlocProvider(create: (BuildContext context) => ApplyBloc(1)),
        // BlocProvider(create: (BuildContext context) => ProfileUpdaterBloc(1)),
        BlocProvider(create: (BuildContext context) => AuthBloc()),
        BlocProvider(create: (BuildContext context) => CompanyHomeBloc()),
        BlocProvider(create: (BuildContext context) => PostBloc()),
        BlocProvider(create: (BuildContext context) => StatBloc()),
        BlocProvider(create: (BuildContext context) => ApplicantsBloc()),
        BlocProvider(create: (BuildContext context) => CreateProfileBloc()),
        BlocProvider(create: (BuildContext context) => RadioBloc()),
        // BlocProvider(create: (BuildContext context) => CreateUserProfileBloc()),
        BlocProvider(create: (BuildContext context) => BottomNavBloc(0)),
        BlocProvider(
            create: (BuildContext context) => ApplyBloc(ApplicationRepository(
                ApplicationProvider(), EmployerProvider(), jobRepository))),
        BlocProvider(
            create: (BuildContext context) =>
                ProfileUpdaterBloc(updaterBloc.employeeRepository)),
        BlocProvider(create: (BuildContext context) => JobBloc()),
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
