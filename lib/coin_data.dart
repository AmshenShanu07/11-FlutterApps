import 'package:http/http.dart';
import 'dart:convert';

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

class CoinData {
  Future<dynamic> getPrice(String crypto, String currency) async {
    const String apiKey = 'B6026EF8-8B29-491F-85B0-D1E29324E1D4';
    String url =
        'https://rest.coinapi.io/v1/exchangerate/$crypto/$currency?apikey=$apiKey';
    Client req = Client();

    var data = await req.get(Uri.parse(url));
    var body = jsonDecode(data.body);
    return body['rate'].toInt();
  }
}
