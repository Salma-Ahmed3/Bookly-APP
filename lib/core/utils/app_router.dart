// ignore_for_file: constant_identifier_names

import 'package:book/Features/Search/presentation/views/search_view.dart';
import 'package:book/Features/Splash/presentation/view_models/views/splash_view.dart';
import 'package:book/Features/home/data/Models/book_model/book_model.dart';
import 'package:book/Features/home/data/repos/home_repo_impl.dart';
import 'package:book/Features/home/presentation/maneger/similar_books_cubit/similar_books_cubit.dart';
import 'package:book/Features/home/presentation/views/book_detailes_view.dart';
import 'package:book/Features/home/presentation/views/home_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'service_locator.dart';

abstract class AppRouter {
  static const kHomeView = '/homeView';
  static const kBookDetailesView = '/bookDetailesView';
  static const kSearchView = '/searchView';
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: kSearchView,
        builder: (context, state) => const SearchView(),
      ),
      GoRoute(
        path: kHomeView,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: kBookDetailesView,
        builder: (context, state) => BlocProvider(
          create: (context) => SimilarBooksCubit(getIt.get<HomeRepoImpl>()),
          child: BookDetailesView(
            bookModel: state.extra as BookModel,
          ),
        ),
      ),
    ],
  );
}
