import 'package:flutter/material.dart';
import 'transaction_item.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTransaction;
  TransactionList(
      {@required this.transactions, @required this.deleteTransaction});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return transactions.isEmpty
        ? LayoutBuilder(
            builder: (ctx, contraint) => Column(
              children: [
                Text('No transactions added yet'),
                SizedBox(
                  height: contraint.maxHeight * 0.05,
                ),
                Container(
                  height: contraint.maxHeight * 0.7,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.contain,
                  ),
                )
              ],
            ),
          )
        : ListView.builder(
            itemCount: transactions.length,
            itemBuilder: (ctx, index) {
              return TransactionItem(
                transaction: transactions[index],
                mediaQuery: mediaQuery,
                deleteTransaction: deleteTransaction,
              );
            },
          );
  }
}
