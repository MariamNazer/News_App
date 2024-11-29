import 'package:flutter/material.dart';

class ErrorIndecator extends StatelessWidget {
  final String errorMesage;
  const ErrorIndecator(this.errorMesage,{super.key});
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Somethine went wrong!'),
    );
  }
}
