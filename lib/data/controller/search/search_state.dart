import 'package:zcart/data/models/search/search_model.dart';

abstract class SearchState {
  const SearchState();
}

class SearchInitialState extends SearchState {
  const SearchInitialState();
}

class SearchLoadingState extends SearchState {
  const SearchLoadingState();
}

class SearchLoadedState extends SearchState {
  final List<SearchedItem>? searchedItem;

  const SearchLoadedState(this.searchedItem);
}

class SearchErrorState extends SearchState {
  final String message;

  const SearchErrorState(this.message);
}
