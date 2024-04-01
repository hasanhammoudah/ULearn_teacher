import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearn_teacher/common/routes/names.dart';
import 'package:ulearn_teacher/global.dart';
import 'package:ulearn_teacher/pages/messages/chat/bloc/chat_bloc.dart';
import 'package:ulearn_teacher/pages/messages/chat/chat.dart';
import 'package:ulearn_teacher/pages/messages/message/cubit/message_cubit.dart';
import 'package:ulearn_teacher/pages/messages/message/message.dart';
import 'package:ulearn_teacher/pages/sign_in/bloc/sign_in_bloc.dart';
import 'package:ulearn_teacher/pages/sign_in/sign_in.dart';
import 'package:ulearn_teacher/pages/welcome/bloc/welcome_bloc.dart';
import 'package:ulearn_teacher/pages/welcome/welcome.dart';

class AppPages {
  static List<PageEntity> routes() {
    return [
      PageEntity(
        route: AppRoutes.INITIAL,
        page: const Welcome(),
        bloc: BlocProvider(
          create: (_) => WelcomeBloc(),
        ),
      ),
      PageEntity(
        route: AppRoutes.SIGN_IN,
        page: const SignIn(),
        bloc: BlocProvider(
          create: (_) => SignInBloc(),
        ),
      ),
  //     PageEntity(
  //       route: AppRoutes.REGISTER,
  //       page: const Register(),
  //       bloc: BlocProvider(
  //         create: (_) => RegisterBloc(),
  //       ),
  //     ),
  //     PageEntity(
  //       route: AppRoutes.APPLACATION,
  //       page: const ApplicationPage(),
  //       bloc: BlocProvider(
  //         create: (_) => ApplicationBloc(),
  //       ),
  //     ),
  //     PageEntity(
  //       route: AppRoutes.HOME_PAGE,
  //       page: const HomePage(),
  //       bloc: BlocProvider(
  //         create: (_) => HomePageBloc(),
  //       ),
  //     ),
  //     PageEntity(
  //       route: AppRoutes.SETTINGS,
  //       page: const SettingsPage(),
  //       bloc: BlocProvider(
  //         create: (_) => SettingsBloc(),
  //       ),
  //     ),
  //     PageEntity(
  //       route: AppRoutes.COURSE_DETAIL,
  //       page: const CourseDetail(),
  //       bloc: BlocProvider(
  //         create: (_) => CourseDetailBloc(),
  //       ),
  //     ),
  //     PageEntity(
  //       route: AppRoutes.Lesson_DETAIL,
  //       page: const LessonDetail(),
  //       bloc: BlocProvider(
  //         create: (_) => LessonBloc(),
  //       ),
  //     ),
  //     PageEntity(
  //       route: AppRoutes.PAY_WEB_VIEW,
  //       page: const PayWebView(),
  //       bloc: BlocProvider(
  //         create: (_) => PayviewBloc(),
  //       ),
  //     ),
  //     PageEntity(
  //       route: AppRoutes.PROFILE,
  //       page: const ProfilePage(),
  //       bloc: BlocProvider(
  //         create: (_) => ProfileBloc(),
  //       ),
  //     ),
  //     PageEntity(
  //       route: AppRoutes.MY_COURSES,
  //       page: const MyCourses(),
  //       bloc: BlocProvider(
  //         create: (_) => MyCoursesBloc(),
  //       ),
  //     ),
  //     PageEntity(
  //       route: AppRoutes.BUY_COURSES,
  //       page: const BuyCourses(),
  //       bloc: BlocProvider(
  //         create: (_) => BuyCoursesBloc(),
  //       ),
  //     ),
  //     PageEntity(
  //       route: AppRoutes.PAYMENT_DETAILS,
  //       page: const PaymentDetails(),
  //       bloc: BlocProvider(
  //         create: (_) => PaymentDetailsCubit(),
  //       ),
  //     ),
  //     PageEntity(
  //       route: AppRoutes.CONTRIBUTOR,
  //       page: const Contributor(),
  //       bloc: BlocProvider(
  //         create: (_) => ContributorCubit(),
  //       ),
  //     ),

       PageEntity(
        route: AppRoutes.MESSAGE,
        page: const Message(),
        bloc: BlocProvider(
          create: (_) => MessageCubit(),
        ),
      ),
      PageEntity(
        route: AppRoutes.CHAT,
        page: const ChatPage(),
        bloc: BlocProvider(
          create: (_) => ChatBloc(),
        ),
      ),
  //     // PageEntity(
  //     //   route: AppRoutes.MESSAGE,
  //     //   page: const Message(),
  //     //   bloc: BlocProvider(
  //     //     create: (_) => MessageCubit(),
  //     //   ),
  //     // ),
     ];
   }

// return all the bloc providers
  static List<dynamic> allBlocProviders(BuildContext context) {
    List<dynamic> blocProviders = <dynamic>[];
    for (var bloc in routes()) {
      blocProviders.add(bloc.bloc);
    }
    return blocProviders;
  }

  // a modal that covers entire screen as we click on navigator object
  static MaterialPageRoute GenarateRouteSettings(RouteSettings settings) {
    if (settings.name != null) {
      // check for route name macthing when navigator gets triggered
      var result = routes().where((element) => element.route == settings.name);
      if (result.isNotEmpty) {
        print('first log');
        bool deviceFirstOpen = Global.storageService.getDeviceFirstOpen();
        if (result.first.route == AppRoutes.INITIAL && deviceFirstOpen) {
          bool isLoggedin = Global.storageService.getIsLoggedIn();
          if (isLoggedin) {
            // return MaterialPageRoute(
            //   builder: (_) => const ApplicationPage(),
            //   settings: settings,
            // );
          }
          return MaterialPageRoute(
            builder: (_) => const SignIn(),
            settings: settings,
          );
        }
        // print('valid route name ${settings.name}');
        return MaterialPageRoute(
          builder: (_) => result.first.page,
          settings: settings,
        );
      }
    }
    return MaterialPageRoute(
        builder: (_) => const SignIn(), settings: settings);
  }
}

class PageEntity {
  String route;
  Widget page;
  dynamic bloc;
  PageEntity({
    required this.route,
    required this.page,
    this.bloc,
  });
}
