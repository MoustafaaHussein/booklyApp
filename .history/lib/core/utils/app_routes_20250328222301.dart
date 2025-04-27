import 'package:bookly_app/core/models/books_model/books_model.dart';
import 'package:bookly_app/core/utils/service_locator.dart';
import 'package:bookly_app/features/home/data/presentation/manger/similar%20books%20cubit/similar_books_cubit.dart';
import 'package:bookly_app/features/home/data/presentation/views/detalied_books_view.dart';
import 'package:bookly_app/features/home/data/presentation/views/home_view.dart';
import 'package:bookly_app/features/home/data/repos/home_repo_implementation.dart';
import 'package:bookly_app/features/search/data/presentation/manger/serch%20specific%20category%20cubit/serch_specific_category_cubit.dart';
import 'package:bookly_app/features/search/data/presentation/views/search_view.dart';
import 'package:bookly_app/features/search/data/repos/search_repo_implementation.dart';
import 'package:bookly_app/features/splash/presentation/views/splash_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouters {
  static const kHomePath = '/homeView';
  static const kDetailedBookView = '/detaliedBooksView';
  static const kSearchView = '/searchView';
  static GoRouter router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => const SplashView()),
      GoRoute(
        path: kHomePath,
        builder:
            (context, state) => BlocProvider(
              create: (context) {
                return SerchSpecificCategoryCubit(
                  getIt.get<SearchRepoImplementation>(),
                );
              },
              child: HomeView(category: state.extra as String),
            ),
      ),
      GoRoute(
        path: kDetailedBookView,
        builder:
            (context, state) => BlocProvider(
              create:
                  (context) =>
                      SimilarBooksCubit(getIt.get<HomeRepoImplementation>()),
              child: DetaliedBooksView(book: state.extra as BooksModel),
            ),
      ),
      GoRoute(
        path: kSearchView,
        builder:
            (context, state) => BlocProvider(
              create:
                  (context) => SerchSpecificCategoryCubit(
                    getIt.get<SearchRepoImplementation>(),
                  ),
              child: const SearchView(),
            ),
      ),
    ],
  );
}
