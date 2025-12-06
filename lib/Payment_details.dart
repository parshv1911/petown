import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PaymentDetails extends StatefulWidget {
  const PaymentDetails({super.key});

  @override
  State<PaymentDetails> createState() => _PaymentDetailsState();
}

class _PaymentDetailsState extends State<PaymentDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Image(image: AssetImage("assets/WhatsApp Image 2025-02-21 at 6.51.59 PM.jpeg")),
      ),
    );
  }
}
