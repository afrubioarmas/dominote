import 'package:dominote/controller/navigation/app_navigator.dart';
import 'package:get_it/get_it.dart';

final ServiceLocator locator = ServiceLocator._();

/// Convenience wrapper around GetIt.
class ServiceLocator<T> {
  ServiceLocator._();

  final GetIt _getIt = GetIt.instance;

  T call<T>() => _getIt<T>();

  Future<void> registerDependencies() async {
    //final sharedPreferences = await SharedPreferences.getInstance();

    _getIt.registerSingleton(AppNavigator());
  }
}
