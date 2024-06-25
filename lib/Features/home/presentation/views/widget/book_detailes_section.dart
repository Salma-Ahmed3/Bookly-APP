import 'package:book/Features/home/data/Models/book_model/book_model.dart';
import 'package:book/Features/home/presentation/views/widget/booking_rating.dart';
import 'package:book/Features/home/presentation/views/widget/books_action.dart';
import 'package:book/Features/home/presentation/views/widget/custom_book_image.dart';
import 'package:book/core/utils/styles.dart';
import 'package:flutter/material.dart';

class BookDetailesSection extends StatelessWidget {
  const BookDetailesSection({super.key, required this.book});

  final BookModel book;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * .2),
          child: CustomBookImage(
              imageUrl: book.volumeInfo.imageLinks?.thumbnail ?? ''),
        ),
        const SizedBox(
          height: 45,
        ),
        Text(
          book.volumeInfo.title!,
          style: Styles.textStyle30,
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 7,
        ),
        Opacity(
          opacity: .7,
          child: Text(
            book.volumeInfo.authors![0],
            // book.volumeInfo.authors?[0]?? '',
            style: Styles.textStyle18.copyWith(
                fontStyle: FontStyle.italic, fontWeight: FontWeight.w500),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        BookRating(
          mainAxisAlignment: MainAxisAlignment.center,
          rating: book.volumeInfo.averageRating ?? 0,
          count: book.volumeInfo.ratingsCount ?? 0,
        ),
        const SizedBox(
          height: 37,
        ),
        const BooksAction(),
      ],
    );
  }
}
