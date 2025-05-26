import 'package:bookly_app/constants.dart';
import 'package:bookly_app/core/utils/app_routes.dart';
import 'package:bookly_app/core/utils/service_locator.dart';
import 'package:bookly_app/features/auth/data/presentation/manger/auth_bloc/auth_bloc.dart';
import 'package:bookly_app/features/home/domain/entities/books_entity.dart';
import 'package:bookly_app/features/home/domain/repos/home_repo_implementation.dart';
import 'package:bookly_app/features/home/presentation/manger/featured_books_cubit/featured_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/manger/newest_books_cubit/newest_books_cubit_cubit.dart';
import 'package:bookly_app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';

void main() async {
  setupServiceLocator();
  WidgetsFlutterBinding.ensureInitialized();
  Hive.registerAdapter(BooksEntityAdapter());
  await Hive.openBox(kFeaturedBox);
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
                  FeaturedBooksCubit(getIt.get<HomeRepoImplementation>()),
        ),
        BlocProvider(
          create:
              (context) =>
                  NewestBooksCubit(getIt.get<HomeRepoImplementation>()),
        ),
        BlocProvider(create: (context) => AuthBloc()),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouters.router,
        debugShowCheckedModeBanner: false,
        /* locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder, */
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
