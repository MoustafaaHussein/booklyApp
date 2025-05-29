import 'package:bookly_app/core/utils/api_service.dart';
import 'package:bookly_app/features/home/data/data_source/home_local_data_source.dart';
import 'package:bookly_app/features/home/data/data_source/home_remote_data_source.dart';
import 'package:bookly_app/features/home/data/repos/home_repo_implementation.dart';
import 'package:bookly_app/features/home/domain/use_cases/featch_featured_books_use_case.dart';
import 'package:bookly_app/features/home/domain/use_cases/fetch_newest_books_use_case.dart';
import 'package:bookly_app/features/home/domain/use_cases/fetch_similar_books_use_case.dart';
import 'package:bookly_app/features/search/data/repos/search_repo_implementation.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<ApiService>(ApiService(Dio()));

  getIt.registerSingleton<HomeRemoteDataSource>(
    HomeRemoteDataSourceImplementation(apiService: getIt.get<ApiService>()),
  );

  getIt.registerSingleton<HomeLocalDataSource>(HomeLocalDataSourceImpl());

  getIt.registerSingleton<HomeRepoImplementation>(
    HomeRepoImplementation(
      homeRemoteDataSource: getIt.get<HomeRemoteDataSource>(),
      homeLocalDataSource: getIt.get<HomeLocalDataSource>(),
    ),
  );

  // Registering all use cases
  getIt.registerSingleton<FetchFeaturedBooksUseCase>(
    FetchFeaturedBooksUseCase(getIt.get<HomeRepoImplementation>()),
  );

  getIt.registerSingleton<FetchNewestBooksUseCase>(
    FetchNewestBooksUseCase(getIt.get<HomeRepoImplementation>()),
  );

  getIt.registerSingleton<FetchSimilarBooksUseCase>(
    FetchSimilarBooksUseCase(getIt.get<HomeRepoImplementation>()),
  );

  // Optional
  getIt.registerSingleton<SearchRepoImplementation>(
    SearchRepoImplementation(getIt.get<ApiService>()),
  );
}
