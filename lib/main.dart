import 'package:crypto_wallet/wallet_provider.dart';
import 'package:flutter/material.dart';
import 'package:crypto_wallet/wallet_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider<WalletProvider>(
    create: (context) => WalletProvider(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    final walletProvider = Provider.of<WalletProvider>(context);
    return MaterialApp(
      title: 'Crypto Wallet',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Crpto Wallet'),
        ),
        body: Center(
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () async
                {
                 final mnemonic = walletProvider.generateMnemonic();
                 final privateKey = await walletProvider.getPrivateKey(mnemonic);
                 final publicKey = await walletProvider.getPublicKey(privateKey);
                },
                child: Text('Generate Wallet'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
