import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quick_art/src/core/websocket/websocket_provider.dart';

class TestWebsocketScreen extends ConsumerStatefulWidget {
  const TestWebsocketScreen({super.key});

  @override
  ConsumerState<TestWebsocketScreen> createState() =>
      _TestWebsocketScreenState();
}

class _TestWebsocketScreenState extends ConsumerState<TestWebsocketScreen> {
  final TextEditingController _taskIdController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _taskIdController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _subscribe() {
    String input = _taskIdController.text.trim();
    if (input.isEmpty) return;

    String taskId = input;
    // Try to parse as JSON if it looks like JSON
    if (input.startsWith('{')) {
      try {
        final json = jsonDecode(input);
        if (json is Map && json['taskId'] != null) {
          taskId = json['taskId'];
        }
      } catch (_) {
        // Ignore parse error, treat as raw taskId
      }
    }

    if (taskId.isNotEmpty) {
      ref.read(webSocketNotifierProvider.notifier).subscribeTask(taskId);
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Subscribed to task: $taskId')));
    }
  }

  @override
  Widget build(BuildContext context) {
    final results = ref.watch(generationResultNotifierProvider);
    // Listen to websocket state to show connection status
    ref.listen(webSocketNotifierProvider, (previous, next) {
      // You could add logic here to show connection status changes
    });

    return Scaffold(
      appBar: AppBar(title: const Text('WebSocket Test')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _taskIdController,
              decoration: const InputDecoration(
                labelText: 'Task ID',
                hintText: 'Enter Task ID or JSON',
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _subscribe,
              child: const Text('Subscribe'),
            ),
            const SizedBox(height: 24),
            const Text(
              'Received Results:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: results.isEmpty
                  ? const Center(child: Text('No results yet'))
                  : ListView.builder(
                      controller: _scrollController,
                      itemCount: results.length,
                      itemBuilder: (context, index) {
                        final taskId = results.keys.elementAt(index);
                        final result = results[taskId];
                        
                        if (result == null) return const SizedBox.shrink();

                        return Card(
                          margin: const EdgeInsets.only(bottom: 8),
                          child: ListTile(
                            title: Text('Task: $taskId'),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Event: ${result.event}'),
                                if (result.type != null) Text('Type: ${result.type}'),
                                if (result.url != null) Text('URL: ${result.url}'),
                                if (result.error != null) 
                                  Text('Error: ${result.error}', style: const TextStyle(color: Colors.red)),
                              ],
                            ),
                            trailing: IconButton(
                              icon: const Icon(Icons.copy),
                              onPressed: () {
                                // Copy to clipboard logic if needed
                              },
                            ),
                            onTap: () {
                              // Maybe open url
                            },
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
