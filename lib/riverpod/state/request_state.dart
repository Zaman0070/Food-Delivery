/* import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

part 'request_state_notifier.freezed.dart';

abstract class RequestStateNotifier<T> extends StateNotifier<RequestState<T>> {
  RequestStateNotifier() : super(RequestState.idle());

  //It returns a Future with state if you want to avoid ProviderListener
  Future<RequestState<T>> makeRequest(Future<T> Function() function) async {
    try {
      state = RequestState<T>.loading();
      final response = await function();
      final newState = RequestState<T>.success(response);
      if (mounted) {
        state = newState;
      }
      return newState;
    } catch (e, st) {
      final newState = RequestState<T>.error(e, st);
      if (mounted) {
        state = newState;
      }
      return newState;
    }
  }
}

@freezed
abstract class RequestState<T> with _$RequestState<T> {
  const factory RequestState.idle() = Idle<T>;

  const factory RequestState.loading() = Loading<T>;

  const factory RequestState.success(@nullable T value) = Success<T>;

  const factory RequestState.error(Object error, [StackTrace stackTrace]) = Error<T>;
}

final signInEmailRequestProvider = StateNotifierProvider<SignInEmailRequestNotifier>(
  (ref) => SignInEmailRequestNotifier(ref.watch(apiProvider)),
);

class SignInEmailRequestNotifier extends RequestStateNotifier<void> {
  final NetworkApi _api;

  SignInEmailRequestNotifier(this._api);

  Future<void> signIn(String email) => makeRequest(() => _api.signIn(email));
}
 */
