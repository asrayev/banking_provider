import '../api_service/api_bank_service.dart';
import '../local_data/local_db.dart';
import '../models/bank_cart_model.dart';

class MyRepository {
  MyRepository({
    required ApiService apiService,
    required LocalDatabase localDatabase,
  }) {
    _apiService = apiService;
    _localDatabase = localDatabase;
  }

  late ApiService _apiService;
  late LocalDatabase _localDatabase;

  Future<List<BankCart>> getBankInfo() => _apiService.getBankData();
}
