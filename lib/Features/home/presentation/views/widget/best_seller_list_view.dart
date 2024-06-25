import 'package:book/Features/home/presentation/maneger/newst_books_cubit/newst_books_cubit.dart';
import 'package:book/Features/home/presentation/views/widget/best_seller_list_view_item.dart';
import 'package:book/core/Widgets/custom_error_widget.dart';
import 'package:book/core/Widgets/custom_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BestSellerListView extends StatelessWidget {
  const BestSellerListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsetBooksCubit, NewsetBooksState>(
      builder: (context, state) {
        if (state is NewsetBooksSuccess) {
          return ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              itemCount: state.books.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: BestSellerListViewItem(
                    bookModel: state.books[index],
                  ),
                );
              });
        } else if (state is NewsetBooksFailure) {
          return CustomErrorWidget(errMessage: state.errMessege);
        } else {
          return const CustomLoadingIndicator();
        }
      },
    );
  }
}
