import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news/models/api.dart';
import 'package:news/models/cryptocurrency.dart';

class MarketProvider with ChangeNotifier {
  bool isLoading = true;

  List<Cryptocurrency> markets = [];

  MarketProvider() {
    fetchData();
  }

  Future<void> fetchData() async {
    List<dynamic> _markets = await API.getMarket();
    List<Cryptocurrency> temp = [];
    for (var market in _markets) {
      Cryptocurrency newCrypto = Cryptocurrency.fromJSON(market);
      temp.add(newCrypto);
    }
    markets = temp;
    notifyListeners();
    isLoading = false;

    Timer(const Duration(seconds: 3), () {
      fetchData();
    });
  }

  Cryptocurrency fetchCryptoId(String id) {
    Cryptocurrency crypto =
        markets.where((element) => element.id == id).toList()[0];
    return crypto;
  }
}
