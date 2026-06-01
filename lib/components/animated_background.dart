import 'package:flutter/material.dart';
import 'dart:math' as math;

/// A reusable animated background widget with:
/// - Smooth animated gradient
/// - Subtle floating particles
/// - Color customization per page
/// - Optimized performance
class AnimatedBackground extends StatefulWidget {
  final List<Color> colors;
  final List<Alignment> topAlignments;
  final List<Alignment> bottomAlignments;
  final Duration gradientAnimationDuration;
  final Duration particleAnimationDuration;
  final int particleCount;
  final double particleSpeedMultiplier;
  final Color? particleColor;
  final Widget? child;

  const AnimatedBackground({
    super.key,
    required this.colors,
    this.topAlignments = const [Alignment.topLeft, Alignment.topRight],
    this.bottomAlignments = const [Alignment.bottomRight, Alignment.bottomLeft],
    this.gradientAnimationDuration = const Duration(seconds: 10),
    this.particleAnimationDuration = const Duration(seconds: 8),
    this.particleCount = 40,
    this.particleSpeedMultiplier = 1.8,
    this.particleColor,
    this.child,
  });

  @override
  State<AnimatedBackground> createState() => _AnimatedBackgroundState();
}

class _AnimatedBackgroundState extends State<AnimatedBackground>
    with TickerProviderStateMixin {
  late AnimationController _gradientController;
  late AnimationController _particleController;
  late Animation<Alignment> _topAlignmentAnimation;
  late Animation<Alignment> _bottomAlignmentAnimation;
  late List<Particle> _particles;

  @override
  void initState() {
    super.initState();

    // Gradient animation - smooth and slow (slightly faster than before)
    _gradientController = AnimationController(
      vsync: this,
      duration: widget.gradientAnimationDuration,
    );

    // Particle animation - independent smooth loop
    _particleController = AnimationController(
      vsync: this,
      duration: widget.particleAnimationDuration,
    );

    _setupGradientAnimation();
    _initializeParticles();

    _gradientController.repeat(reverse: true);
    _particleController.repeat();
  }

  void _setupGradientAnimation() {
    _topAlignmentAnimation = TweenSequence<Alignment>(
      widget.topAlignments
          .asMap()
          .entries
          .map((entry) => TweenSequenceItem(
                tween: Tween(
                  begin: entry.value,
                  end: widget.topAlignments[
                      (entry.key + 1) % widget.topAlignments.length],
                ),
                weight: 1,
              ))
          .toList(),
    ).animate(
        CurvedAnimation(parent: _gradientController, curve: Curves.easeInOut));

    _bottomAlignmentAnimation = TweenSequence<Alignment>(
      widget.bottomAlignments
          .asMap()
          .entries
          .map((entry) => TweenSequenceItem(
                tween: Tween(
                  begin: entry.value,
                  end: widget.bottomAlignments[
                      (entry.key + 1) % widget.bottomAlignments.length],
                ),
                weight: 1,
              ))
          .toList(),
    ).animate(
        CurvedAnimation(parent: _gradientController, curve: Curves.easeInOut));
  }

  void _initializeParticles() {
    final random = math.Random();
    _particles = List.generate(widget.particleCount, (index) {
      return Particle(
        x: random.nextDouble(),
        y: random.nextDouble(),
        size: random.nextDouble() * 3 + 1.5,
        opacity: random.nextDouble() * 0.4 + 0.1,
        speed: random.nextDouble() * 0.3 + 0.12,
        angle: random.nextDouble() * 2 * math.pi,
        phase: random.nextDouble() * 2 * math.pi,
      );
    });
  }

  @override
  void dispose() {
    _gradientController.dispose();
    _particleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: Listenable.merge([_gradientController, _particleController]),
      builder: (context, _) {
        // Update particle positions
        final progress = _particleController.value;
        for (var particle in _particles) {
          particle.update(progress, widget.particleSpeedMultiplier);
        }

        return Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: _topAlignmentAnimation.value,
              end: _bottomAlignmentAnimation.value,
              colors: widget.colors,
            ),
          ),
          child: Stack(
            fit: StackFit.expand,
            children: [
              // Particle layer
              CustomPaint(
                painter: ParticlePainter(
                    _particles, widget.colors, widget.particleColor),
                size: Size.infinite,
              ),
              // Content layer
              if (widget.child != null) widget.child!,
            ],
          ),
        );
      },
    );
  }
}

/// Particle model for floating animation
class Particle {
  double x;
  double y;
  final double size;
  final double opacity;
  final double speed;
  final double angle;
  final double phase;
  final double startX;
  final double startY;

  Particle({
    required this.x,
    required this.y,
    required this.size,
    required this.opacity,
    required this.speed,
    required this.angle,
    required this.phase,
  })  : startX = x,
        startY = y;

  void update(double progress, double speedMultiplier) {
    // Smooth circular movement for seamless looping
    final movementAmplitude = 0.04 + speed * 0.03;
    final time = 2 * math.pi * (progress * speedMultiplier * 0.5) + phase;

    x = (startX + math.sin(time + angle) * movementAmplitude).clamp(0.0, 1.0);
    y = (startY + math.cos(time + angle) * movementAmplitude).clamp(0.0, 1.0);
  }
}

/// Custom painter for rendering particles
class ParticlePainter extends CustomPainter {
  final List<Particle> particles;
  final List<Color> colors;
  final Color? overrideColor;

  ParticlePainter(this.particles, this.colors, this.overrideColor);

  @override
  void paint(Canvas canvas, Size size) {
    // Get a subtle particle color based on the theme
    final base = overrideColor ?? colors.first;
    final particleColor = base.withValues(alpha: 0.3);

    for (var particle in particles) {
      final px = particle.x * size.width;
      final py = particle.y * size.height;

      // Draw glow effect (optional, for more subtle appearance)
      canvas.drawCircle(
        Offset(px, py),
        particle.size * 1.5,
        Paint()
          ..color = particleColor.withValues(alpha: particle.opacity * 0.3)
          ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 2),
      );

      // Draw particle
      canvas.drawCircle(
        Offset(px, py),
        particle.size,
        Paint()
          ..color = particleColor.withValues(alpha: particle.opacity)
          ..isAntiAlias = true,
      );
    }
  }

  @override
  bool shouldRepaint(ParticlePainter oldDelegate) {
    // Always repaint because particle positions change every frame.
    return true;
  }
}
