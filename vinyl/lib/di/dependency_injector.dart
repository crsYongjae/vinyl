import 'package:get_it/get_it.dart';

class DependencyInjector {
  static final GetIt _instance = GetIt.instance;
  /// Register Dependency
  static void register() {
    // _instance.registerLazySingleton<AlbumRepository>(() => AlbumRepositoryImpl());
  }

  static T inject<T extends Object>() {
    return _instance.get<T>();
  }
}