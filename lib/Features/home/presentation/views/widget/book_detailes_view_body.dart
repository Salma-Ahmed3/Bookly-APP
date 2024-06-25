import 'package:book/Features/home/data/Models/book_model/book_model.dart';
import 'package:book/Features/home/presentation/views/widget/book_detailes_section.dart';
import 'package:book/Features/home/presentation/views/widget/custom_book_detailes_app_bar.dart';
import 'package:book/Features/home/presentation/views/widget/similar_books_section.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BookDetailesViewBody extends StatelessWidget {
  const BookDetailesViewBody({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                const CustomBookDetailesAppBar(),
                BookDetailesSection(
                  book: bookModel,
                ),
                const Expanded(
                  child: SizedBox(
                    height: 50,
                  ),
                ),
                const SimilarBooksSection(),
                const SizedBox(
                  height: 40,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
