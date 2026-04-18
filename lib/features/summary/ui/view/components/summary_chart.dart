import 'package:flutter/material.dart';
import 'package:graphic/graphic.dart';

class SummaryChart extends StatelessWidget {
  const SummaryChart({
    super.key,
    required this.data,
  });

  final List<dynamic> data;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      width: 600,
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surfaceContainer,
          borderRadius: BorderRadius.circular(24.0)
        ),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 140),
            transitionBuilder: (Widget child, Animation<double> animation) {
              return FadeTransition(
                opacity: animation,
                child: SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(0, 0),
                    end: Offset.zero,
                  ).animate(CurvedAnimation(
                    parent: animation,
                    curve: Curves.easeInOut,
                  )),
                  child: child,
                ),
              );
            },
            child: Chart(
              key: ValueKey(data.hashCode),
              data: data,
              variables: {
                'period': Variable(
                  accessor: (data) => (data as Map)['period'] as String,
                ),
                'amount': Variable(
                  accessor: (data) => (data as Map)['amount'] as num,
                  scale: LinearScale(tickCount: 3, marginMax: 0),
                ),
              },
              marks: [
                IntervalMark(
                  color: ColorEncode(
                    value: Theme.of(context).colorScheme.primary),
                    shape: ShapeEncode(value: RectShape(borderRadius: BorderRadius.circular(24))
                  ),
                ),
              ],
              axes: [
                AxisGuide(
                  line: PaintStyle(
                    strokeColor: Theme.of(context).colorScheme.onSurface
                  ),
                  label: LabelStyle(
                    textStyle: TextStyle(color: Theme.of(context).textTheme.labelLarge!.color, fontSize: 12),
                    offset: Offset(0, 8)
                  ),
                ),
                AxisGuide(
                  label: LabelStyle(
                    textStyle: TextStyle(color: Theme.of(context).textTheme.labelLarge!.color, fontSize: 12),
                    offset: Offset(-8, 0)
                  ),
                  grid: PaintStyle(
                    strokeColor: Colors.white.withAlpha(60),
                  )
                ),
              ],
            ),
          ),
        ),
      )
    );
  }
}