import 'package:book/Features/home/data/Models/book_model/book_model.dart';
import 'package:book/Features/home/presentation/maneger/similar_books_cubit/similar_books_cubit.dart';
import 'package:book/Features/home/presentation/views/widget/book_detailes_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookDetailesView extends StatefulWidget {
  const BookDetailesView({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  State<BookDetailesView> createState() => _BookDetailesViewState();
}

class _BookDetailesViewState extends State<BookDetailesView> {
  @override
  void initState() {
    BlocProvider.of<SimilarBooksCubit>(context).fetchSimilarBooks(
        category: widget.bookModel.volumeInfo.categories![0]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BookDetailesViewBody(
          bookModel: widget.bookModel,
        ),
      ),
    );
  }
}
