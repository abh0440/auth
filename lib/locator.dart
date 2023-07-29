import 'package:get_it/get_it.dart';
import 'package:otp_application/data/data_sources/auth_data_source.dart';
import 'package:otp_application/data/repositories/auth_repository_impl.dart';
import 'package:otp_application/domain/repositories/auth_repository.dart';
import 'package:otp_application/features/authentication/provider/auth_provider.dart';

final locator = GetIt.instance;

void init() {
  //providers
  locator.registerFactory(() => AuthProvider(locator()));

  //repositories
  locator.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(authDataSource: locator()));

  //data source
  locator.registerLazySingleton<AuthDataSource>(() => AuthDataSourceImpl());
}
