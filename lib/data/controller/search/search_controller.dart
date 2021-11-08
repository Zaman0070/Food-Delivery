import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zcart/data/controller/search/search_state.dart';
import 'package:zcart/data/models/search/search_model.dart';
import 'package:zcart/data/network/api.dart';
import 'package:zcart/data/network/network_exception.dart';
import 'package:zcart/data/network/network_utils.dart';

final searchProvider =
    StateNotifierProvider.autoDispose<SearchRepository, SearchState>((ref) {
  return SearchRepository();
});

class SearchRepository extends StateNotifier<SearchState> {
  SearchRepository() : super(SearchInitialState());

  Future search(String searchedText) async {
    state = SearchLoadingState();
    var responseBody;
    try {
      responseBody =
          await handleResponse(await getRequest(API.search(searchedText)));
      if (responseBody is int) if (responseBody > 206) throw NetworkException();
      SearchModel searchModel = SearchModel.fromJson(responseBody);
      state = SearchLoadedState(searchModel.data);
    } on NetworkException {
      state = SearchErrorState("There is an error!");
    }
  }
}
