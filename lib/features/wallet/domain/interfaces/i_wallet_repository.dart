import 'package:credix_app/features/wallet/data/models/wallet_response.dart';
import 'package:either_dart/either.dart';

// ignore: one_member_abstracts
abstract class IWalletRepository {
  Future<Either<WalletResponse, String>> myWallet();
}
