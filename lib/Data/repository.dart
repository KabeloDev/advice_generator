import 'package:advice_generator/Data/remote.dart';
import 'package:advice_generator/Domain/advice.dart';
import 'package:advice_generator/Domain/repostory.dart';

class AdviceRepositoryImpl implements AdviceRepository {
  final AdviceRemoteDataSource remoteDataSource;

  AdviceRepositoryImpl(this.remoteDataSource);

  @override
  Future<Advice> getRandomAdvice() async {
    return await remoteDataSource.getRandomAdvice();
  }
}