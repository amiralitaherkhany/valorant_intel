import 'package:flutter/material.dart';
import 'package:valorant_intel/core/extensions/context_extensions.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.localizations.home),
        centerTitle: true,
        titleTextStyle: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
        elevation: 0,
        scrolledUnderElevation: 0,
      ),
      body: const CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate.fixed(
              [],
            ),
          )
        ],
      ),
    );
  }
}
