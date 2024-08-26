import 'package:clase2/presentation/screens/home.dart';
import 'package:clase2/presentation/screens/login.dart';
import 'package:go_router/go_router.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: "/login",
routes : [

  GoRoute(
    path: '/login',
    builder: (context, state) => const LoginScreen(),
  ),
  GoRoute(
    path: '/home',
    builder: (context, state) =>  HomeScreen(userName : state.extra.toString())
  )


]
//return HomeScreen(userName : state.extra as String);


);
