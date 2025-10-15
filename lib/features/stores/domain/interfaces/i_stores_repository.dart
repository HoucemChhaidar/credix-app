import 'package:credix_app/features/stores/data/models/store_response.dart';
import 'package:either_dart/either.dart';

// ignore: one_member_abstracts
abstract class IStoresRepository {
  Future<Either<List<StoreResponse>, String>> getAllStores();
}
