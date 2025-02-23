import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stocks/model/stock_model.dart';
import 'package:stocks/model/user_model.dart';
import 'package:stocks/repository/stock_repo.dart';
import 'package:stocks/repository/user_repo.dart';

final userRepositoryProvider = Provider((ref) => UserRepository());
final stockRepositoryProvider = Provider((ref) => StockRepository());

final loginProvider =
    FutureProvider.family<UserModel?, Map<String, String>>((ref, credentials) {
  final repo = ref.read(userRepositoryProvider);
  return repo.login(credentials['email']!, credentials['password']!);
});

final searchStocksProvider =
    FutureProvider.family<List<StockModel>, String>((ref, query) {
  final repo = ref.read(stockRepositoryProvider);
  return repo.searchStocks(query);
});

final stockByIdProvider = FutureProvider.family<StockModel?, int>((ref, id) {
  final repo = ref.read(stockRepositoryProvider);
  return repo.getStockById(id);
});
