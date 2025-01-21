import 'package:crypto_wallet/providers/wallet_provider.dart';
import 'package:flutter/material.dart';
import 'package:crypto_wallet/providers/wallet_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider<WalletProvider>(
    create: (context) => WalletProvider(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final walletProvider = Provider.of<WalletProvider>(context);
    return MaterialApp(
      title: 'Crypto Wallet',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Crypto Wallet'),
        ),
        body: Center(
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () async {
                  final mnemonic = walletProvider.generateMnemonic();
                  final privateKey =
                      await walletProvider.getPrivateKey(mnemonic);
                  final publicKey =
                      await walletProvider.getPublicKey(privateKey);
                },
                child: const Text('Generate Wallet'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
