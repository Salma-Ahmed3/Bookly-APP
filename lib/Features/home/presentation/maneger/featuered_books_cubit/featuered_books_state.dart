part of 'featuered_books_cubit.dart';

sealed class FeatueredBooksState extends Equatable {
  const FeatueredBooksState();

  @override
  List<Object> get props => [];
}

final class FeatueredBooksInitial extends FeatueredBooksState {}

final class FeatueredBooksLoading extends FeatueredBooksState {}

final class FeatueredBooksFailure extends FeatueredBooksState {
  final String errMessege;

  const FeatueredBooksFailure(this.errMessege);
}

final class FeatueredBooksSuccess extends FeatueredBooksState {
  final List<BookModel> books;

  const FeatueredBooksSuccess(this.books);
}
