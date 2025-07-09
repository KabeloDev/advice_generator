import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'advice_bloc.dart';
import 'advice_event.dart';
import 'advice_state.dart';

class AdviceScreen extends StatelessWidget {
  const AdviceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Advice Generator")),
      body: BlocBuilder<AdviceBloc, AdviceState>(
        builder: (context, state) {
          if (state is AdviceInitial) {
            return const Center(child: Text("Press the button to get advice."));
          } else if (state is AdviceLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is AdviceLoaded) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(state.advice.advice, textAlign: TextAlign.center),
              ),
            );
          } else if (state is AdviceError) {
            return Center(child: Text(state.message));
          } else {
            return const SizedBox();
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            context.read<AdviceBloc>().add(GetAdviceEvent()),
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
