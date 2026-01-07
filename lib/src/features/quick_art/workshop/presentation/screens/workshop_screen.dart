import 'package:flutter/material.dart';
import 'package:quick_art/src/features/quick_art/workshop/domain/entities/workshop_task.dart';
import 'package:quick_art/src/features/quick_art/workshop/presentation/widgets/pro_banner.dart';
import 'package:quick_art/src/features/quick_art/workshop/presentation/widgets/workshop_header.dart';
import 'package:quick_art/src/features/quick_art/workshop/presentation/widgets/workshop_task_card.dart';

class WorkshopScreen extends StatefulWidget {
  const WorkshopScreen({super.key});

  @override
  State<WorkshopScreen> createState() => _WorkshopScreenState();
}

class _WorkshopScreenState extends State<WorkshopScreen> {
  // Mock Data
  final List<WorkshopTask> _tasks = [
    const WorkshopTask(
      id: '1',
      type: WorkshopTaskType.image,
      status: WorkshopTaskStatus.processing,
    ),
    const WorkshopTask(
      id: '2',
      type: WorkshopTaskType.image,
      status: WorkshopTaskStatus.success,
      url: 'https://images.unsplash.com/photo-1544005313-94ddf0286df2?ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80', // Open source image
    ),
    const WorkshopTask(
      id: '3',
      type: WorkshopTaskType.video,
      status: WorkshopTaskStatus.failed,
      errorMessage: '生成失败，请重试！',
    ),
    const WorkshopTask(
      id: '4',
      type: WorkshopTaskType.video,
      status: WorkshopTaskStatus.failed,
      errorMessage: '生成失败，请重试！',
    ),
    const WorkshopTask(
      id: '5',
      type: WorkshopTaskType.image,
      status: WorkshopTaskStatus.success,
      url: 'https://images.unsplash.com/photo-1517841905240-472988babdf9?ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80',
    ),
    const WorkshopTask(
      id: '6',
      type: WorkshopTaskType.video,
      status: WorkshopTaskStatus.success,
      url: 'https://ark-content-generation-cn-beijing.tos-cn-beijing.volces.com/doubao-seedance-1-0-pro/02176777100425300000000000000000000ffffac155a711f4868.mp4?X-Tos-Algorithm=TOS4-HMAC-SHA256&X-Tos-Credential=AKLTYWJkZTExNjA1ZDUyNDc3YzhjNTM5OGIyNjBhNDcyOTQ%2F20260107%2Fcn-beijing%2Ftos%2Frequest&X-Tos-Date=20260107T073027Z&X-Tos-Expires=86400&X-Tos-Signature=8227a340333fbadc2cd236717617df856b296bcc4599460ab1119b1542147b0d&X-Tos-SignedHeaders=host',
      thumbnailUrl: 'https://ark-content-generation-cn-beijing.tos-cn-beijing.volces.com/doubao-seedance-1-0-pro/02176777100425300000000000000000000ffffac155a711f4868_last-frame.png?X-Tos-Algorithm=TOS4-HMAC-SHA256&X-Tos-Credential=AKLTYWJkZTExNjA1ZDUyNDc3YzhjNTM5OGIyNjBhNDcyOTQ%2F20260107%2Fcn-beijing%2Ftos%2Frequest&X-Tos-Date=20260107T073027Z&X-Tos-Expires=86400&X-Tos-Signature=90e546adfe53b0ab2bffdb1088dcdb39a872f3f79f73eea60e1a049b78a332f6&X-Tos-SignedHeaders=host',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            const WorkshopHeader(),
            const ProBanner(),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    childAspectRatio: 0.8, // Adjust aspect ratio as needed
                  ),
                  itemCount: _tasks.length,
                  itemBuilder: (context, index) {
                    final task = _tasks[index];
                    return WorkshopTaskCard(
                      task: task,
                      onRetry: () {
                        // Mock retry action
                        debugPrint('Retry task ${task.id}');
                      },
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
