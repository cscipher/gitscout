import 'package:flutter/material.dart';
import 'package:git_scout/core/di/di_initializer.dart';
import 'package:git_scout/core/network/environment/environment_config_module.dart';

class GitScoutApp extends StatelessWidget {
  const GitScoutApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(child: Text("Git Scout!")),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final envConfig = diContainer.get<IEnvConfig>();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("env -> ${envConfig.toPrettyString()}")),
          );
        },
        child: const Icon(Icons.info),
      ),
    );
  }
}
