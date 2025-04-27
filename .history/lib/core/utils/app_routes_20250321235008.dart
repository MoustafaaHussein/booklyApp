import 'package:bookly_app/features/home/data/presentation/views/home_view.dart';
import 'package:bookly_app/features/home/data/presentation/views/views_model/detalied_books_view.dart';
import 'package:bookly_app/features/splash/presentation/views/splash_view.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouters {
  static const kHomePath = '/homeView';
  static const kDetailedBookView = '/detaliedBooksView';
  static GoRouter router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => const SplashView()),
      GoRoute(path: kHomePath, builder: (context, state) => const HomeView()),
      GoRoute(
        path: kDetailedBookView,
        builder: (context, state) => const DetaliedBooksView(),
      ),
    ],
  );
}
