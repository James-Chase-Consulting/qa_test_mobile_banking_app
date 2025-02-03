import 'package:flutter/material.dart';

void main() {
  runApp(MobileBankingQaApp());
}

class MobileBankingQaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mobile Banking QA App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Roboto',
      ),
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
      routes: {
        '/account': (context) => AccountDetailsScreen(),
        '/transfer': (context) => TransferFundsScreen(),
        '/transaction': (context) => TransactionHistoryScreen(),
      },
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double balance = 1000.00;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mobile Banking QA App',
            style: TextStyle(
              fontSize: 24,
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Welcome, User!',
                style: TextStyle(fontSize: 20, color: Colors.black87)),
            SizedBox(height: 20),
            Card(
              color: Colors.grey[200],
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Text('Account Balance',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black54,
                        )),
                    SizedBox(height: 8),
                    Text('\$${balance.toStringAsFixed(2)}',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        )),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/account');
              },
              child: const Text('View Account Details'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () async {
                final result = await Navigator.pushNamed(context, '/transfer');
                if (result != null && result is double) {
                  setState(() {
                    balance -= result;
                  });
                }
              },
              child: const Text('Transfer Funds'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/transaction');
              },
              child: const Text('View Transactions'),
            ),
          ],
        ),
      ),
    );
  }
}

class AccountDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Account Details', style: TextStyle(fontSize: 24)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Account Number: 123456789',
                style: TextStyle(fontSize: 18, color: Colors.black54)),
            SizedBox(height: 10),
            Text('Account Type: Savings',
                style: TextStyle(fontSize: 18, color: Colors.black54)),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              child: Text('Edit Account Details'),
            )
          ],
        ),
      ),
    );
  }
}

class TransferFundsScreen extends StatefulWidget {
  @override
  _TransferFundsScreenState createState() => _TransferFundsScreenState();
}

class _TransferFundsScreenState extends State<TransferFundsScreen> {
  final TextEditingController accountController = TextEditingController();
  final TextEditingController amountController = TextEditingController();
  String errorMessage = '';

  void transferFunds() {
    String account = accountController.text.trim();
    String amountText = amountController.text.trim();

    if (account.isEmpty || amountText.isEmpty) {
      setState(() {
        errorMessage = 'All fields are required!';
      });
      return;
    }

    double? amount = double.tryParse(amountText);
    if (amount == null || amount <= 0) {
      setState(() {
        errorMessage = 'Invalid amount!';
      });
      return;
    }

    if (amount > 1000.00) {
      // Assume balance is $1000
      setState(() {
        errorMessage = 'Insufficient balance!';
      });
      return;
    }

    Navigator.pop(context, amount);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transfer Funds', style: TextStyle(fontSize: 24)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: accountController,
              decoration: InputDecoration(
                labelText: "Recipient's Account Number",
                labelStyle: TextStyle(fontSize: 18, color: Colors.black54),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: amountController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Amount",
                labelStyle: TextStyle(fontSize: 18, color: Colors.black54),
              ),
            ),
            SizedBox(height: 10),
            if (errorMessage.isNotEmpty)
              Text(errorMessage, style: TextStyle(color: Colors.red)),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: transferFunds,
              child: Text('Transfer Funds'),
            ),
          ],
        ),
      ),
    );
  }
}

class TransactionHistoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transaction History', style: TextStyle(fontSize: 24)),
      ),
      body: ListView(
        children: [
          ListTile(
              title:
                  Text('Transfer to 987654321', style: TextStyle(fontSize: 18)),
              subtitle:
                  Text('Amount: \$100', style: TextStyle(color: Colors.red))),
          ListTile(
              title: Text('Received from 123456789',
                  style: TextStyle(fontSize: 19)),
              subtitle:
                  Text('Amount: \$200', style: TextStyle(color: Colors.green))),
          ListTile(
              title:
                  Text('Transfer to 555666777', style: TextStyle(fontSize: 17)),
              subtitle:
                  Text('Amount: \$300', style: TextStyle(color: Colors.red))),
        ],
      ),
    );
  }
}
