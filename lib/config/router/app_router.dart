import 'package:blog/features/auth/presentation/pages/signin.ui.dart';
import 'package:blog/features/blog_upload/presentation/pages/upload_blog.dart';
import 'package:go_router/go_router.dart';

import '../../features/bottom_nav/presentation/pages/bottom_nav_screen.dart';

import '../route_constant/route_constant.dart';

abstract class AppRouter {
  static GoRouter router =
  GoRouter(initialLocation: RouteConstant.dashboard,
      // redirect: (BuildContext context, GoRouterState state) async {
      //
      //   final bool isLoggedIn = await StorageService.hasToken();
      //
      //   final isAuthRoute = state.matchedLocation == RouteConstant.login ||
      //       state.matchedLocation == RouteConstant.otpVerification;
      //
      //   if (!isLoggedIn && !isAuthRoute) {
      //     return RouteConstant.login;
      //   }
      //
      //   if (isLoggedIn && isAuthRoute) {
      //     return RouteConstant.dashboard;
      //   }
      //
      //   // 4. If none of the above conditions are met, allow navigation.
      //   return null;
      // },


      routes: [
    GoRoute(
        path: RouteConstant.login,
        name: RouteConstant.login,
        builder: (context, state) {
          return SignInScreen();
        }),
    // GoRoute(
    //     path: RouteConstant.otpVerification,
    //     name: RouteConstant.otpVerification,
    //     builder: (context, state) {
    //       return OtpScreen();
    //     }),
    GoRoute(
        path: RouteConstant.dashboard,
        name: RouteConstant.dashboard,
        builder: (context, state) {
          return BottomNavScreen();
        }),
    GoRoute(
        path: RouteConstant.uploadBlog,
        name: RouteConstant.uploadBlog,
        builder: (context, state) {
          return UploadBlog();
        }),
  ]);
}