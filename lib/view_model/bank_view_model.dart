import 'package:banking_provider/data/models/bank_cart_model.dart';
import 'package:banking_provider/data/repositories/my_repository.dart';
import 'package:flutter/cupertino.dart';

class BankViewModel extends ChangeNotifier{
  BankViewModel({required MyRepository myRepository}) {
    _myRepository = myRepository;
  }
  late MyRepository _myRepository;

  bool isLoading = false;

  List<BankCart>? bankCart;

  fetchBankInfo() async {
    notify(true);
    bankCart = await _myRepository.getBankInfo();
    notify(false);
  }
  notify(bool value) {
    isLoading = value;
    notifyListeners();
  }

}