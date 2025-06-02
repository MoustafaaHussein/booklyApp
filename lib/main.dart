import 'package:bookly_app/constants.dart';
import 'package:bookly_app/core/utils/app_routes.dart';
import 'package:bookly_app/core/utils/service_locator.dart';
import 'package:bookly_app/features/auth/data/presentation/manger/auth_bloc/auth_bloc.dart';
import 'package:bookly_app/features/home/domain/entities/books_entity.dart';
import 'package:bookly_app/features/home/domain/use_cases/featch_featured_books_use_case.dart';
import 'package:bookly_app/features/home/domain/use_cases/fetch_newest_books_use_case.dart';
import 'package:bookly_app/features/home/presentation/manger/featured_books_cubit/featured_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/manger/newest_books_cubit/newest_books_cubit_cubit.dart';
import 'package:bookly_app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // <-- Move this to the top

  await Hive.initFlutter();
  Hive.registerAdapter(BooksEntityAdapter());
  await Hive.openBox<BooksEntity>(kFeaturedBox);
  await Hive.openBox<BooksEntity>(kNewestBox);
  await Hive.openBox<BooksEntity>(kSimilarBox);

  setupServiceLocator();

  await Firebase.initializeApp(
    name: 'bookly-app',
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const BooklyApp());
}

class BooklyApp extends StatelessWidget {
  const BooklyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create:
              (context) =>
                  FeaturedBooksCubit(getIt.get<FetchFeaturedBooksUseCase>()),
        ),
        BlocProvider(
          create:
              (context) =>
                  NewestBooksCubit(getIt.get<FetchNewestBooksUseCase>()),
        ),
        BlocProvider(create: (context) => AuthBloc()),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouters.router,
        debugShowCheckedModeBanner: false,

        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: kPrimaryColor,
          textTheme: GoogleFonts.montserratTextTheme(
            ThemeData.dark().textTheme,
          ),
        ),
        /* darkTheme: ThemeData.dark(), */
      ),
    );
  }
}
