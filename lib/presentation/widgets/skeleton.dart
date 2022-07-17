import 'package:flutter/material.dart';
import 'package:rickandmorty/presentation/app_theme.dart';

class SkeletonWidget extends StatefulWidget {
  const SkeletonWidget({Key? key}) : super(key: key);

  @override
  State<SkeletonWidget> createState() => _SkeletonWidgetState();
}

class _SkeletonWidgetState extends State<SkeletonWidget> with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController.unbounded(vsync: this);

  @override
  void initState() {
    _controller.repeat(period: const Duration(seconds: 1), min: -0.5, max: 0.5);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        final gradient = LinearGradient(
          colors: [
            AppTheme.greenAqua,
            AppTheme.greenLight,
            AppTheme.greenAqua,
          ],
          stops: const [
            0.1,
            0.3,
            0.4,
          ],
          begin: const Alignment(-1, -0.3),
          end: const Alignment(1, 0.3),
          tileMode: TileMode.clamp,
          transform: GradientRotation(_controller.value),
        );
        return ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: ShaderMask(
            shaderCallback: (rect) => gradient.createShader(rect),
            blendMode: BlendMode.srcATop,
            child: child,
          ),
        );
      },
      child: Container(
        width: size.width,
        height: size.height,
        decoration: BoxDecoration(
          color: Colors.black12,
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}

class GradientRotation extends GradientTransform {
  final double pos;

  const GradientRotation(this.pos);

  @override
  Matrix4? transform(Rect bounds, {TextDirection? textDirection}) {
    return Matrix4.translationValues(bounds.width * pos, 0.0, 0.0);
  }
}
