import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  final bool isLoading;

  const LoadingWidget({
    Key? key,
    required this.isLoading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SizedBox(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
