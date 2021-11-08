import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zcart/riverpod/state/scroll_state.dart';

class RandomItemScrollNotifier extends StateNotifier<ScrollState> {
  RandomItemScrollNotifier() : super(ScrollInitialState());

  final _scrollController = ScrollController();

  get controller {
    _scrollController.addListener(scrollListener);
    return _scrollController;
  }

  get scrollNotifierState => state;

  scrollListener() {
    if (_scrollController.offset >=
            _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange) {
      state = ScrollReachedBottomState();
    }
  }
}

class VendorItemScrollNotifier extends StateNotifier<ScrollState> {
  VendorItemScrollNotifier() : super(ScrollInitialState());

  final _scrollController = ScrollController();

  get controller {
    _scrollController.addListener(scrollListener);
    return _scrollController;
  }

  get scrollNotifierState => state;

  scrollListener() {
    if (_scrollController.offset >=
            _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange) {
      state = ScrollReachedBottomState();
    }
  }
}

class CategoryDetailsScrollNotifier extends StateNotifier<ScrollState> {
  CategoryDetailsScrollNotifier() : super(ScrollInitialState());

  final _scrollController = ScrollController();

  get controller {
    _scrollController.addListener(scrollListener);
    return _scrollController;
  }

  get scrollNotifierState => state;

  scrollListener() {
    if (_scrollController.offset >=
            _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange) {
      state = ScrollReachedBottomState();
    }
  }
}

class DisputesScrollNotifier extends StateNotifier<ScrollState> {
  DisputesScrollNotifier() : super(ScrollInitialState());

  final _scrollController = ScrollController();

  get controller {
    _scrollController.addListener(scrollListener);
    return _scrollController;
  }

  get scrollNotifierState => state;

  scrollListener() {
    if (_scrollController.offset >=
            _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange) {
      state = ScrollReachedBottomState();
    }
  }
}

class WishListScrollNotifier extends StateNotifier<ScrollState> {
  WishListScrollNotifier() : super(ScrollInitialState());

  final _scrollController = ScrollController();

  get controller {
    _scrollController.addListener(scrollListener);
    return _scrollController;
  }

  get scrollNotifierState => state;

  scrollListener() {
    if (_scrollController.offset >=
            _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange) {
      state = ScrollReachedBottomState();
    }
  }
}
