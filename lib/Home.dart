import 'package:flutter/material.dart';
import 'package:flutter_bitcoin_price/AllPrices.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _preco = "0";

  void _recuperarPreco() async {
    String url = "https://blockchain.info/ticker";
    http.Response response = await http.get(url);

    Map<String, dynamic> retorno = json.decode(response.body);
    setState(() {
      _preco = retorno["BRL"]["buy"].toString();
    });

    print("Resultado : " + retorno["BRL"]["buy"].toString());
  }

  void _allPrices() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => AllPrices()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(32),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset("assets/bitcoin.png"),
              Padding(
                padding: EdgeInsets.only(top: 30, bottom: 30),
                child: Text(
                  "R\$ " + _preco,
                  style: TextStyle(fontSize: 35),
                ),
              ),
              // ignore: deprecated_member_use
              RaisedButton(
                child: Text(
                  "Atualizar",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                color: Colors.orange,
                padding: EdgeInsets.fromLTRB(30, 15, 30, 15),
                onPressed: _recuperarPreco,
              ),
              // ignore: deprecated_member_use
              Padding(
                padding: EdgeInsets.only(top: 20),
                // ignore: deprecated_member_use
                child: RaisedButton(
                  child: Text(
                    "Outros",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  color: Colors.grey,
                  padding: EdgeInsets.fromLTRB(45, 15, 45, 15),
                  onPressed: _allPrices,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
