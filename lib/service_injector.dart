import 'package:advice_generator/Data/remote.dart';
import 'package:advice_generator/Data/repository.dart';
import 'package:advice_generator/Domain/repostory.dart';
import 'package:advice_generator/Domain/usecase.dart';
import 'package:advice_generator/Presentation/advice_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

final sl = GetIt.instance;

Future<void> init() async {
  // External
  sl.registerLazySingleton(() => http.Client());

  // Data sources
  sl.registerLazySingleton(() => AdviceRemoteDataSource(sl()));

  // Repository - register using abstract class
  sl.registerLazySingleton<AdviceRepository>(() => AdviceRepositoryImpl(sl()));

  // Use case
  sl.registerLazySingleton(() => GetRandomAdvice(sl()));

  // Bloc
  sl.registerFactory(() => AdviceBloc(sl()));
}
