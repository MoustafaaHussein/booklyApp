import 'package:bookly_app/core/utils/service_locator.dart';
import 'package:bookly_app/features/auth/data/presentation/manger/auth_bloc/auth_bloc.dart';
import 'package:bookly_app/features/auth/data/presentation/views/RegisterationPage.dart';
import 'package:bookly_app/features/auth/data/presentation/views/login_view.dart';
import 'package:bookly_app/features/auth/data/presentation/views/password_reset_view.dart';
import 'package:bookly_app/features/home/domain/entities/books_entity.dart';
import 'package:bookly_app/features/home/domain/use_cases/fetch_similar_books_use_case.dart';
import 'package:bookly_app/features/home/presentation/manger/similar%20books%20cubit/similar_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/views/detalied_books_view.dart';
import 'package:bookly_app/features/home/presentation/views/home_view.dart';
import 'package:bookly_app/features/search/presentation/views/search_view.dart';
import 'package:bookly_app/features/splash/presentation/views/splash_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouters {
  static const kHomePath = '/homeView';
  static const kDetailedBookView = '/detailedBooksView';
  static const kSearchView = '/searchView';
  static const kLoginView = '/loginView';
  static const kPasswordResetView = '/passwordResetView';
  static const kRegisterView = '/registerView';

  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => const SplashView()),
      GoRoute(
        path: kHomePath,
        builder: (context, state) {
          final category = state.extra as String? ?? 'sports';
          return HomeView(category: category);
        },
      ),
      GoRoute(
        path: kDetailedBookView,
        builder: (context, state) {
          final book = state.extra as BooksEntity;
          return BlocProvider(
            create:
                (context) =>
                    SimilarBooksCubit(getIt.get<FetchSimilarBooksUseCase>()),
            child: DetaliedBooksView(book: book),
          );
        },
      ),
      GoRoute(
        path: kSearchView,
        builder: (context, state) => const SearchView(),
      ),
      GoRoute(
        path: kLoginView,
        builder:
            (context, state) => BlocProvider(
              create: (context) => AuthBloc(),
              child: LoginView(),
            ),
      ),
      GoRoute(
        path: kRegisterView,
        builder:
            (context, state) => BlocProvider(
              create: (context) => AuthBloc(),
              child: RegisterView(),
            ),
      ),
      GoRoute(
        path: kPasswordResetView,
        builder:
            (context, state) => BlocProvider(
              create: (context) => AuthBloc(),
              child: PassowrdResetView(),
            ),
      ),
    ],
  );
}
