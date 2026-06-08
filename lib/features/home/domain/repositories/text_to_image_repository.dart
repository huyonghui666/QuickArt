import 'dart:async';

import 'package:quick_art/features/home/domain/entities/image_generation_task.dart';

/// 文生图 Repository 接口
abstract class ITextToImageRepository {
  /// 提交生成任务
  /// [prompt] 提示词
  Future<ImageGenerationTask> submitTextToImageTask(String prompt);

  /// 提交图生图任务
  Future<ImageGenerationTask> submitImageEditTask(
    String prompt,
    String imagePath,
  );
}
