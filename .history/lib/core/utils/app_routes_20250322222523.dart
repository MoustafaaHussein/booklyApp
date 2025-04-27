import 'package:bookly_app/features/home/data/presentation/views/detalied_books_view.dart';
import 'package:bookly_app/features/home/data/presentation/views/home_view.dart';
import 'package:bookly_app/features/search/presentation/views/search_view.dart';
import 'package:bookly_app/features/splash/presentation/views/splash_view.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouters {
  static const kHomePath = '/homeView';
  static const kDetailedBookView = '/detaliedBooksView';
  static const kSearchView = '/searchView';
  static GoRouter router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => const SplashView()),
      GoRoute(path: kHomePath, builder: (context, state) => const HomeView()),
      GoRoute(
        path: kDetailedBookView,
        builder: (context, state) => const DetaliedBooksView(),
      ),
      GoRoute(
        path: kSearchView,
        builder: (context, state) => const SearchView(),
      ),
    ],
  );
}
