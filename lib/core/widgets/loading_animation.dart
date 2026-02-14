import 'dart:math';
import 'package:flutter/material.dart';

/// 粒子类
class Particle {

  Particle({
    required this.x,
    required this.y,
    this.z = 0,
    required this.vx,
    required this.vy,
    this.vz = 0,
    required this.color,
    required this.baseColor,
    required this.baseSize,
    required this.size,
  });
  double x;
  double y;
  double z; // 模拟深度
  double vx;
  double vy;
  double vz;
  Color color;
  Color baseColor; // 预计算的基础颜色
  double baseSize;
  double size;
}

class ParticleAnimation extends StatefulWidget {
  const ParticleAnimation({super.key});

  @override
  State<ParticleAnimation> createState() => _ParticleAnimationState();
}

class _ParticleAnimationState extends State<ParticleAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  // 粒子数量：增加数量以提升视觉密度
  final int _particleCount = 2000;
  final List<Particle> _particles = [];
  final Random _random = Random();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )..repeat();

    // 初始化粒子
    for (int i = 0; i < _particleCount; i++) {
      // 预计算颜色
      double hue = 340 + (i % 60).toDouble(); // 偏红/紫
      if (i % 3 == 0) hue = 45; // 金色点缀
      final Color particleBaseColor = HSVColor.fromAHSV(
        0.8,
        hue % 360,
        1.0,
        1.0,
      ).toColor();

      _particles.add(
        Particle(
          x: 0,
          y: 0,
          z: 0,
          vx: 0,
          vy: 0,
          color: Colors.white,
          baseColor: particleBaseColor,
          baseSize: 1.5 + _random.nextDouble() * 2.0, // 基础大小
          size: 0,
        ),
      );
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _updateParticles(Size size, double t) {
    if (size.isEmpty) return;

    final double centerX = size.width / 2;
    final double centerY = size.height / 2;
    final double minDim = min(size.width, size.height);
    final double baseRadius = minDim * 0.25;

    // 初始化位置到中心（如果尚未初始化）
    if (_particles.isNotEmpty && _particles[0].x == 0 && _particles[0].y == 0) {
      for (var p in _particles) {
        p.x = centerX;
        p.y = centerY;
      }
    }

    for (int i = 0; i < _particles.length; i++) {
      final Particle p = _particles[i];

      // === 目标计算 ===
      // 使用球坐标系或加厚圆环来模拟“球体”或“厚圆”效果
      // 这里使用随机偏移量来创建一个“厚度”
      // 我们可以利用 index 做一些确定性的随机，保证每次目标位置一致
      final rRandom = (i * 1327.0) % 1.0; // 伪随机
      final angleRandom = (i * 345.0) % 1.0;

      // 角度分布：均匀分布
      final double angle = (i / _particleCount) * 2 * pi + (angleRandom * 0.2);

      // 半径分布：高斯分布感觉的厚度
      // 这里的厚度设为半径的 30% 左右，形成一个环带
      final double thickness = (rRandom - 0.5) * baseRadius * 0.6;
      final double targetRadius = baseRadius + thickness;

      double targetX = centerX + targetRadius * cos(angle);
      double targetY = centerY + targetRadius * sin(angle);

      // 阶段划分
      // 0.0 - 0.4: 聚拢/维持形态 (Form)
      // 0.4 - 0.45: 收缩蓄力 (Shrink)
      // 0.45 - 0.8: 爆炸 (Explode)
      // 0.8 - 1.0: 回归 (Return)

      if (t < 0.4) {
        // === 阶段1：形态维持 (Form) ===
        // 添加一点旋转效果
        const double rotSpeed = 0.5;
        // 让粒子绕圆心微转
        // double pdx = p.x - centerX;
        // double pdy = p.y - centerY;
        // 使用乘法代替 pow，避免开方（除非必须）
        // 这里只是为了限制最小距离，可以简化
        // 如果距离非常小，不处理也没关系，或者直接用 squared distance 判断

        // 目标位置加上旋转偏移
        final double rotAngle = angle + t * rotSpeed;
        targetX = centerX + targetRadius * cos(rotAngle);
        targetY = centerY + targetRadius * sin(rotAngle);

        final double dx = targetX - p.x;
        final double dy = targetY - p.y;

        p.vx += dx * 0.02;
        p.vy += dy * 0.02;
        p.vx *= 0.85; // 强阻尼
        p.vy *= 0.85;

        // 颜色：直接使用预计算的颜色，避免每帧 HSV 转换
        p.color = p.baseColor;
      } else if (t < 0.45) {
        // === 阶段2：蓄力 (Shrink) ===
        // 快速向圆心塌陷
        final double dx = centerX - p.x;
        final double dy = centerY - p.y;
        p.vx += dx * 0.08;
        p.vy += dy * 0.08;
        p.vx *= 0.9;
        p.vy *= 0.9;

        // 变亮变白
        p.color = Color.lerp(p.color, Colors.white, 0.2)!;
      } else if (t < 0.8) {
        // === 阶段3：爆炸 (Explode) ===
        // 计算离圆心的方向
        final double dx = p.x - centerX;
        final double dy = p.y - centerY;
        double dist = sqrt(dx * dx + dy * dy);
        if (dist < 0.1) dist = 0.1;

        // 爆炸瞬间 (0.45 - 0.50) 施加较短且分散的斥力
        // 缩短加速时间，防止飞出屏幕
        if (t < 0.50) {
          // 混合模式：70% 沿径向散开，30% 完全随机方向，确保填满屏幕中心和四周
          final bool isRandomDirection = _random.nextDouble() < 0.3;
          double explodeAngle;

          if (isRandomDirection) {
            explodeAngle = _random.nextDouble() * 2 * pi;
          } else {
            // 径向散开，带较大的随机偏移
            final double randomAngleOffset = (_random.nextDouble() - 0.5) * 2.5;
            explodeAngle = atan2(dy, dx) + randomAngleOffset;
          }

          // 力度差异化：扩大范围，让有的粒子留在中心，有的飞向边缘
          final double randomForceFactor = _random.nextDouble();
          // 5.0 - 120.0 的力度范围
          final double force = 5.0 + randomForceFactor * 115.0;

          p.vx += cos(explodeAngle) * force * 0.1;
          p.vy += sin(explodeAngle) * force * 0.1;
        }

        // 增加阻尼，让粒子快速停留在屏幕内漂浮
        // 稍微降低阻尼 (0.92 -> 0.94) 让它们飘得更久一点
        p.vx *= 0.94;
        p.vy *= 0.94;

        // 边界处理：碰到屏幕边缘反弹
        // 提高反弹系数 (0.5 -> 0.8) 避免吸附在边缘
        if (p.x < 0) {
          p.x = 0;
          p.vx = -p.vx * 0.8;
        } else if (p.x > size.width) {
          p.x = size.width;
          p.vx = -p.vx * 0.8;
        }

        if (p.y < 0) {
          p.y = 0;
          p.vy = -p.vy * 0.8;
        } else if (p.y > size.height) {
          p.y = size.height;
          p.vy = -p.vy * 0.8;
        }

        // 颜色：金色、紫色粒子散开
        // 随距离变暗或变淡，保持一定的透明度营造星空感
        p.color = p.color.withValues(alpha: max(0.4, 1.0 - (t - 0.45) * 1.5));
      } else {
        // === 阶段4：回归 (Return) ===
        // 重新计算目标位置（无旋转，快速归位）
        final double dx = targetX - p.x;
        final double dy = targetY - p.y;

        p..vx += dx * 0.03
        ..vy += dy * 0.03
        ..vx *= 0.82
        ..vy *= 0.82

        ..color = Colors.white.withValues(alpha: 0.5);
      }

      // 更新位置
      p..x += p.vx * 0.6 // 时间步长缩放
      ..y += p.vy * 0.6;

      // 简单模拟 3D 尺寸变化 (根据 y 轴或假想 z 轴)
      // 这里简单用随机闪烁或距离中心的距离来调整大小
      final pulse = sin(t * 10 + i) * 0.5 + 1.0;
      p.size = p.baseSize * pulse;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.black,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return CustomPaint(
            painter: ParticlePainter(
              particles: _particles,
              controllerValue: _controller.value,
              onUpdate: _updateParticles,
            ),
          );
        },
      ),
    );
  }
}


class ParticlePainter extends CustomPainter {
  /// 构造
  ParticlePainter({
    required this.particles,
    required this.controllerValue,
    required this.onUpdate,
  });
  final List<Particle> particles;
  final double controllerValue;
  final Function(Size, double) onUpdate;

  @override
  void paint(Canvas canvas, Size size) {
    onUpdate(size, controllerValue);

    // 使用 SrcOver 混合模式，或者 Plus (Additive) 模式增强发光感
    // 注意：Plus 模式在白色背景下不可见，但在黑色背景下效果很好
    // 复用 Paint 对象，这里由于是局部变量且 blendMode 固定，
    // 虽然 Dart 编译器可能会优化，但显式复用更好。
    // 不过考虑到 CustomPainter 每次 paint 可能都在不同的 Canvas 上，
    // 创建一个 Paint 对象开销很小。如果追求极致，可以作为类成员。
    final paint = Paint()..blendMode = BlendMode.srcOver;

    for (final p in particles) {
      // 只有当 alpha > 0 时才绘制，减少绘制指令
      if (p.color.a > 0) {
        paint.color = p.color;
        // 绘制粒子
        canvas.drawCircle(Offset(p.x, p.y), p.size / 2, paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant ParticlePainter oldDelegate) => true;
}
