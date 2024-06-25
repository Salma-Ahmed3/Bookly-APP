import 'package:bloc/bloc.dart';
import 'package:book/Features/home/data/Models/book_model/book_model.dart';
import 'package:book/Features/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'newst_books_state.dart';

class NewsetBooksCubit extends Cubit<NewsetBooksState> {
  NewsetBooksCubit(this.homeRepo) : super(NewsetBooksInitial());

  final HomeRepo homeRepo;
  Future<void> fetchNewsetBooks() async {
    emit(NewsetBooksLoading());
    var result = await homeRepo.fetchNewsetBooks();
    result.fold((failure) {
      emit(NewsetBooksFailure(failure.errMessage));
    }, (bookModel) {
      emit(NewsetBooksSuccess(bookModel));
    });
  }
}
