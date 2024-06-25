import 'package:book/Features/home/presentation/maneger/featuered_books_cubit/featuered_books_cubit.dart';
import 'package:book/Features/home/presentation/views/widget/custom_book_image.dart';
import 'package:book/core/Widgets/custom_error_widget.dart';
import 'package:book/core/Widgets/custom_loading_indicator.dart';
import 'package:book/core/utils/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class FeatueredBooksListView extends StatelessWidget {
  const FeatueredBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit, FeatueredBooksState>(
      builder: (context, state) {
        if (state is FeatueredBooksSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * .26,
            child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: state.books.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: GestureDetector(
                      onTap: () {
                        GoRouter.of(context).push(
                          AppRouter.kBookDetailesView,
                          extra: state.books[index],
                        );
                      },
                      child: CustomBookImage(
                        imageUrl: state.books[index].volumeInfo.imageLinks
                                ?.thumbnail ??
                            '',
                      ),
                    ),
                  );
                }),
          );
        } else if (state is FeatueredBooksFailure) {
          return CustomErrorWidget(errMessage: state.errMessege);
        } else {
          return const CustomLoadingIndicator();
        }
      },
    );
  }
}
