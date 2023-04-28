import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController bill = TextEditingController();
  TextEditingController tax = TextEditingController();
  TextEditingController person = TextEditingController();

  int splitBill = 0;
  double taxAmount = 0;
  int totalAmount = 0;

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Split Bill"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  "$splitBill ₹ / Person",
                  style: const TextStyle(fontSize: 20),
                ),
                const SizedBox(
                  height: 40,
                ),
                TextFormField(
                  controller: bill,
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "Enter total bill";
                    } else {
                      return null;
                    }
                  },
                  decoration: const InputDecoration(
                    labelText: "Bill Amount",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: tax,
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "Enter tax percentage";
                    } else {
                      return null;
                    }
                  },
                  decoration: const InputDecoration(
                    labelText: "Tax Percentage",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: person,
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "Enter no of person";
                    } else {
                      return null;
                    }
                  },
                  decoration: const InputDecoration(
                    labelText: "No of person",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          if (formKey.currentState!.validate()) {
                            taxAmount = double.parse(bill.text) *
                                (double.parse(tax.text) / 100);
                            totalAmount =
                                int.parse(bill.text) + taxAmount.toInt();
                            splitBill = totalAmount ~/ int.parse(person.text);
                          }
                        });
                      },
                      child: const Text("Calculate"),
                    ),
                    OutlinedButton(
                      onPressed: () {
                        setState(() {
                          bill.clear();
                          tax.clear();
                          person.clear();
                          splitBill = 0;
                          totalAmount = 0;
                          totalAmount = 0;
                        });
                      },
                      child: const Text("Clear"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
