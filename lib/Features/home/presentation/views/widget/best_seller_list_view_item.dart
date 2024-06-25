import 'package:book/Features/home/data/Models/book_model/book_model.dart';
import 'package:book/Features/home/presentation/views/widget/booking_rating.dart';
import 'package:book/Features/home/presentation/views/widget/custom_book_image.dart';
import 'package:book/constants.dart';
import 'package:book/core/utils/app_router.dart';
import 'package:book/core/utils/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

class BestSellerListViewItem extends StatelessWidget {
  const BestSellerListViewItem({super.key, required this.bookModel});

  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(
          AppRouter.kBookDetailesView,
          extra: bookModel,
        );
      },
      child: SizedBox(
        height: 125,
        child: Row(
          children: [
            CustomBookImage(
                imageUrl: bookModel.volumeInfo.imageLinks?.thumbnail ?? ''),
            const SizedBox(
              width: 30,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .5,
                    child: Text(bookModel.volumeInfo.title!,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Styles.textStyle20
                            .copyWith(fontFamily: kGtSectraFine)),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Text(bookModel.volumeInfo.authors![0],
                      style: Styles.textStyle14
                          .copyWith(color: const Color(0xff707070))),
                  const SizedBox(
                    height: 3,
                  ),
                  Row(
                    children: [
                      Text('Free',
                          style: Styles.textStyle20
                              .copyWith(fontWeight: FontWeight.bold)),
                      const Spacer(),
                      BookRating(
                        rating:
                            bookModel.volumeInfo.averageRating?.round() ?? 0,
                        count: bookModel.volumeInfo.ratingsCount ?? 0,
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
