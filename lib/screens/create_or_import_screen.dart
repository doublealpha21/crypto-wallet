import 'package:crypto_wallet/screens/generate_mnemonic_screen.dart';
import 'package:crypto_wallet/screens/import_wallet_screen.dart';
import 'package:flutter/material.dart';

class CreateOrImportScreen extends StatelessWidget {
  const CreateOrImportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Header
            Container(
              alignment: Alignment.center,
              child: const Text(
                'Crypto Wallet',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 24.0),
            /* Container(
              width: double.infinity,
              alignment: Alignment.center,
              child: SizedBox(
                width: 150,
                height: 200,
                child: Image.asset(
                  'assets/images/logo.png',
                  fit: BoxFit.contain,
                ),
              ),
            ),*/
            const SizedBox(height: 50.0),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const GenerateMnemonicScreen(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    Colors.blue, // Customize button background color
                foregroundColor: Colors.white, // Customize button text color
                padding: const EdgeInsets.all(16.0),
              ),
              child: const Text(
                'Create Wallet',
                style: TextStyle(
                  fontSize: 18.0,
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ImportWalletScreen(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                padding: const EdgeInsets.all(16.0),
              ),
              child: const Text(
                'Import from Seed',
                style: TextStyle(
                  fontSize: 18.0,
                ),
              ),
            ),

            const SizedBox(height: 24.0),
          ],
        ),
      ),
    );
  }
}
