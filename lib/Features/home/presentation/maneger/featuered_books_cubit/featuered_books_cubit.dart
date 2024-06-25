import 'package:bloc/bloc.dart';
import 'package:book/Features/home/data/Models/book_model/book_model.dart';
import 'package:book/Features/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'featuered_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeatueredBooksState> {
  FeaturedBooksCubit(this.homeRepo) : super(FeatueredBooksInitial());

  final HomeRepo homeRepo;

  Future<void> fetchFeatureBooks() async {
    emit(FeatueredBooksLoading());
    var result = await homeRepo.fetchFeaturedBooks();
    result.fold((failure) {
      emit(FeatueredBooksFailure(failure.errMessage));
    }, (bookModel) {
      emit(FeatueredBooksSuccess(bookModel));
    });
  }
}
