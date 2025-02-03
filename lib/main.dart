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
      home: HomeScreen(),
      routes: {
        '/account': (context) => AccountDetailsScreen(),
        '/transfer': (context) => TransferFundsScreen(),
        '/transaction': (context) => TransactionHistoryScreen(),
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
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
              child: const Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Text('Account Balance',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black54,
                        )),
                    SizedBox(height: 8),
                    Text('\$1,000.00',
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
              onPressed: () {
                Navigator.pushNamed(context, '/transfer');
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
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance),
            label: 'Account',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        onTap: (index) {
          if (index == 1) {
            Navigator.pushNamed(context, '/account');
          }
        },
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
            SizedBox(
              height: 10,
            ),
            Text('Account Type: Savings',
                style: TextStyle(fontSize: 18, color: Colors.black54)),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                // Navigator.pop(context);
              },
              child: Text('Edit Account Details'),
            )
          ],
        ),
      ),
    );
  }
}

class TransferFundsScreen extends StatelessWidget {
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
                  decoration: InputDecoration(
                labelText: "Recipient's Account Number",
                labelStyle: TextStyle(fontSize: 18, color: Colors.black54),
              )),
              SizedBox(height: 10),
              TextField(
                decoration: InputDecoration(
                  labelText: "Amount",
                  labelStyle: TextStyle(fontSize: 18, color: Colors.black54),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  // Navigator.pop(context);
                },
                child: Text('Transfer Funds'),
              )
            ],
          ),
        ));
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
              title: Text('Transaction 1', style: TextStyle(fontSize: 18)),
              subtitle:
                  Text('Amount: \$100', style: TextStyle(color: Colors.red))),
          ListTile(
              title: Text('Transaction 2', style: TextStyle(fontSize: 19)),
              subtitle:
                  Text('Amount: \$200', style: TextStyle(color: Colors.green))),
          ListTile(
              title: Text('Transaction 3', style: TextStyle(fontSize: 17)),
              subtitle: Text('Amount: \$300',
                  style: TextStyle(color: Colors.purple))),
        ],
      ),
    );
  }
}
