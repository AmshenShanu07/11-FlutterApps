import 'package:flutter/material.dart';
import 'coin_data.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String selectedItem = currenciesList[0];
  CoinData coinFetch = CoinData();
  int btcPrice = 0;
  int ethPrice = 0;
  int ltcPrice = 0;

  void updatePrice(cur) async {
    int btc = await coinFetch.getPrice('BTC', cur);
    int eth = await coinFetch.getPrice('ETH', cur);
    int ltc = await coinFetch.getPrice('LTC', cur);
    setState(() {
      btcPrice = btc;
      ethPrice = eth;
      ltcPrice = ltc;
    });
  }

  @override
  void initState() {
    super.initState();
    updatePrice(currenciesList[0]);
  }

  Padding priceCard(crypto, value) {
    return Padding(
      padding: EdgeInsets.fromLTRB(15, 18.0, 18.0, 0),
      child: Card(
        color: Colors.lightBlueAccent,
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 28.0),
          child: Text(
            '1 $crypto = $value $selectedItem',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Crypto Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          priceCard('BTC', btcPrice),
          priceCard('ETH', ethPrice),
          priceCard('LTC', ltcPrice),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: DropdownButton(
              value: selectedItem,
              onChanged: (value) async {
                // price = val;
                setState(() {
                  selectedItem = value.toString();
                  updatePrice(value.toString());
                });
              },
              items: currenciesList.map((element) {
                return DropdownMenuItem(
                  child: Text(element),
                  value: element,
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
