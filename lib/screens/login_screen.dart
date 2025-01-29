import 'package:crypto_wallet/providers/wallet_provider.dart';
import 'package:crypto_wallet/screens/wallet_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'create_or_import_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final walletProvider = Provider.of<WalletProvider>(context);

    if (walletProvider.privateKey == null) {
      // If private key doesn't exist, load CreateOrImportPage
      return const CreateOrImportScreen();
    } else {
      // If private key exists, load WalletPage
      return const WalletScreen();
    }
  }
}
