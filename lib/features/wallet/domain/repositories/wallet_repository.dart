import 'package:credix_app/features/wallet/data/models/wallet_response.dart';
import 'package:either_dart/either.dart';

abstract class WalletRepository {
  Future<Either<WalletResponse, String>> myWallet();
}
