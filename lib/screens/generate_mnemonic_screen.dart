// import 'package:crypto_wallet/providers/wallet_provider.dart';
// import 'package:crypto_wallet/screens/verify_mnemonic_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:provider/provider.dart';
//
// class GenerateMnemonicScreen extends StatelessWidget {
//   const GenerateMnemonicScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final walletProvider = Provider.of<WalletProvider>(context);
//     final mnemonic = walletProvider.generateMnemonic();
//     final mnemonicWords = mnemonic.split(' ');
//
//     void copyToClipboard() {
//       Clipboard.setData(ClipboardData(text: mnemonic));
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(
//           content: Text('Mnemonic Copied To Clipboard'),
//         ),
//       );
//     }
//
//     Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => VerifyMnemonicScreen(mnemonic: mnemonic),
//       ),
//     );
//
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Generate Secret Phrase'),
//       ),
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.all(16),
//           child: Column(
//             children: [
//               const Text('Please store this secret phrase safely,'),
//               const Text(
//                 'Ensure that you don\'t share it with anyone,and ensure  Keep it in a secure location',
//                 textAlign: TextAlign.center,
//               ),
//               const SizedBox(
//                 height: 20,
//               ),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.stretch,
//                 children: List.generate(
//                   mnemonicWords.length,
//                   (index) => Padding(
//                     padding: const EdgeInsets.symmetric(vertical: 4.0),
//                     child: Text(
//                       '${index + 1}. ${mnemonicWords[index]}',
//                       style: Theme.of(context).textTheme.bodyMedium,
//                     ),
//                   ),
//                 ),
//               ),
//               const SizedBox(
//                 height: 20,
//               ),
//               ElevatedButton(
//                 onPressed: () {
//                   copyToClipboard();
//                 },
//                 child: const Row(
//                   children: [
//                     Icon(Icons.copy),
//                     Text('Copy to ClipBoard'),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:crypto_wallet/providers/wallet_provider.dart';
import 'package:crypto_wallet/screens/verify_mnemonic_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class GenerateMnemonicScreen extends StatefulWidget {
  const GenerateMnemonicScreen({super.key});

  @override
  State<GenerateMnemonicScreen> createState() => _GenerateMnemonicScreenState();
}

class _GenerateMnemonicScreenState extends State<GenerateMnemonicScreen> {
  String? mnemonic;
  List<String> mnemonicWords = [];

  @override
  void initState() {
    super.initState();
    // Defer mnemonic generation to after the first frame
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;

      final walletProvider =
          Provider.of<WalletProvider>(context, listen: false);
      mnemonic = walletProvider.generateMnemonic();
      if (mnemonic != null) {
        setState(() {
          mnemonicWords = mnemonic!.split(' ');
        });

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => VerifyMnemonicScreen(mnemonic: mnemonic!),
          ),
        );
      }
    });
  }

  void copyToClipboard() {
    if (mnemonic != null) {
      Clipboard.setData(ClipboardData(text: mnemonic!));
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Mnemonic Copied To Clipboard')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Generate Secret Phrase'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const Text('Please store this secret phrase safely,'),
              const Text(
                'Ensure that you don\'t share it with anyone,and ensure  Keep it in a secure location',
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              if (mnemonicWords.isNotEmpty)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: List.generate(
                    mnemonicWords.length,
                    (index) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: Text(
                        '${index + 1}. ${mnemonicWords[index]}',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                  ),
                ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: copyToClipboard,
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.copy),
                    SizedBox(width: 8),
                    Text('Copy to ClipBoard'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
