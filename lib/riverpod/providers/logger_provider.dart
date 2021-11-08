import 'package:flutter_riverpod/flutter_riverpod.dart';

class Logger extends ProviderObserver {
  @override
  void didUpdateProvider(ProviderBase provider, Object? newValue) {
    //print('["didUpdateProvider": "${provider.name ?? provider.runtimeType}", "newValue": "$newValue"]');
  }

  @override
  void didAddProvider(ProviderBase provider, Object? value) {
    super.didAddProvider(provider, value);
    //print('["didAddProvider": "${provider.name ?? provider.runtimeType}", "newValue": "$value"]');
  }
}
