import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:valorant_intel/core/constants/api_constants.dart';
import 'package:valorant_intel/features/agents/data/datasources/remote/agent_remote_datasource.dart';
import 'package:valorant_intel/features/agents/data/repositories/agent_repository_impl.dart';
import 'package:valorant_intel/features/agents/domain/repositories/agent_repository.dart';

final GetIt locator = GetIt.instance;

Future<void> initGetIt() async {
  // Register Dio as a singleton
  locator.registerLazySingleton<Dio>(
    () => Dio(BaseOptions(baseUrl: ApiConstants.baseUrl)),
  );

  //register dataSources
  locator.registerFactory<AgentRemoteDatasource>(
    () => AgentRemoteDatasource(
      dio: locator(),
    ),
  );
  //register repositories
  locator.registerFactory<AgentRepository>(
    () => AgentRepositoryImpl(
      agentRemoteDatasource: locator(),
    ),
  );
}