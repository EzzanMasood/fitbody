import 'package:fitbody/config/colors.dart';

import 'package:flutter/material.dart';

import 'dart:math';


class HeightPicker extends StatefulWidget {
  const HeightPicker({super.key});

  @override
  _HeightPickerState createState() => _HeightPickerState();
}

class _HeightPickerState extends State<HeightPicker> {
  RulerPickerController? _rulerPickerController;

  num currentValue = 20;

  List<RulerRange> ranges = const [
    RulerRange(begin: 0, end: 150, scale: 1),
  ];

  @override
  void initState() {
    super.initState();
    _rulerPickerController = RulerPickerController(value: currentValue);
  }

  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          // const SizedBox(height: 10),
          RulerPicker(
            height: 70,
            controller: _rulerPickerController!,
            onBuildRulerScaleText: (index, value) {
              return value.toInt().toString();
            },
            ranges: ranges,
            scaleLineStyleList: const [
              ScaleLineStyle(
                  color: Colors.white, width: 1.5, height: 60, scale: 0),
              ScaleLineStyle(
                  color: Colors.white, width: 1, height: 35, scale: 5),
              ScaleLineStyle(
                  color: Colors.white, width: 1, height: 25, scale: -1)
            ],
            rulerBackgroundColor: AppColors.backgroundColor,
            onValueChanged: (value) {
              setState(() {
                currentValue = value;
              });
            },
            width: MediaQuery.of(context).size.width,
            rulerMarginTop: 40,
            marker: Image.asset("assets/images/setup/Polygon.png"),
          ),
          RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                  text: currentValue.toStringAsFixed(1),
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 50),
                  children: const [
                    TextSpan(
                      text: "cm",
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                      ),
                    ),
                  ])),
        ],
      ),
    )
  ,
    );
  }
}





/// a triangle painter
class _TrianglePainter extends CustomPainter {
  // final double lineSize;

  // _TrianglePainter({this.lineSize = 16});
  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();
    path.moveTo(0, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width / 2, tan(pi / 3) * size.width / 2);
    path.close();
    Paint paint = Paint();
    paint.color = const Color.fromARGB(255, 118, 165, 248);
    paint.style = PaintingStyle.fill;
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}


class RulerPickerController extends ValueNotifier<num> {
  RulerPickerController({num value = 0}) : super(value);
  num get value => super.value;
  set value(num newValue) {
    super.value = newValue;
  }
}

typedef void ValueChangedCallback(num value);


class RulerPicker extends StatefulWidget {
  final ValueChangedCallback onValueChanged;
  final String Function(int index, num rulerScaleValue) onBuildRulerScaleText;
  final double width;
  final double height;
  final TextStyle rulerScaleTextStyle;
  final List<ScaleLineStyle> scaleLineStyleList;
  final List<RulerRange> ranges;
  final Widget? marker;
  final double rulerMarginTop;
  final Color rulerBackgroundColor;
  final RulerPickerController? controller;

  const RulerPicker({super.key,
    required this.onValueChanged,
    required this.width,
    required this.height,
    required this.onBuildRulerScaleText,
    this.ranges = const [],
    this.rulerMarginTop = 0,
    this.scaleLineStyleList = const [
      ScaleLineStyle(
          scale: 0,
          color: Color.fromARGB(255, 188, 194, 203),
          width: 2,
          height: 32),
      ScaleLineStyle(
          color: Color.fromARGB(255, 188, 194, 203), width: 1, height: 20),
    ],
    this.rulerScaleTextStyle = const TextStyle(
      color: Colors.white,//10,20,30 color
      fontSize: 14,
    ),
    this.marker,
    this.rulerBackgroundColor = Colors.white,
    this.controller,
  });
  @override
  State<StatefulWidget> createState() {
    return RulerPickerState();
  }
}

class RulerPickerState extends State<RulerPicker> {
  double lastOffset = 0;
  bool isPosFixed = false;
  String value = '';
  late ScrollController scrollController;
  final Map<int, ScaleLineStyle> _scaleLineStyleMap = {};
  int itemCount = 0;

  @override
  void initState() {
    super.initState();

    itemCount = _calculateItemCount();
    print(itemCount);

    widget.scaleLineStyleList.forEach((element) {
      _scaleLineStyleMap[element.scale] = element;
    });

    double initValueOffset = getPositionByValue(widget.controller?.value ?? 0);

    scrollController = ScrollController(
        initialScrollOffset: initValueOffset > 0 ? initValueOffset : 0);

    scrollController.addListener(_onValueChanged);

    widget.controller?.addListener(() {
      setPositionByValue(widget.controller?.value ?? 0);
    });
  }

  int _calculateItemCount() {
    int itemCount = 0;
    widget.ranges.forEach((element) {
      // print(element.end);
      itemCount += ((element.end - element.begin) / element.scale).truncate();
    });
    itemCount += 1;
    return itemCount;
  }

  void _onValueChanged() {
    int currentIndex = scrollController.offset ~/ _ruleScaleInterval.toInt();

    if (currentIndex < 0) currentIndex = 0;
    num currentValue = getRulerScaleValue(currentIndex);

    var lastConfig = widget.ranges.last;
    if (currentValue > lastConfig.end) currentValue = lastConfig.end;

    widget.onValueChanged(currentValue);
  }

  /// default mark
  Widget _buildMark() {
    /// default mark arrow
    Widget triangle() {
      return CustomPaint(
        painter: _TrianglePainter(),
      );
    }

    return SizedBox(
      width: _ruleScaleInterval * 2,
      height: 45,
      child: Stack(
        children: <Widget>[
          Align(alignment: Alignment.topCenter, child: triangle(

          )),
          Align(
              child: Container(
                width: 3,
                height: 34,
                color: const Color.fromARGB(255, 118, 165, 248),
              )),
        ],
      ),
    );
  }


  Widget _buildRulerScaleLine(int index) {
    int scale = index % 10;

    // Default line style
    double width = 1;
    double height = 20;
    Color color = const Color.fromARGB(255, 188, 194, 203);

    // Apply specific styles if available
    if (_scaleLineStyleMap.containsKey(scale)) {
      width = _scaleLineStyleMap[scale]!.width;
      height = _scaleLineStyleMap[scale]!.height;
      color = _scaleLineStyleMap[scale]!.color;
    } else if (_scaleLineStyleMap.containsKey(-1)) {
      width = _scaleLineStyleMap[-1]!.width;
      height = _scaleLineStyleMap[-1]!.height;
      color = _scaleLineStyleMap[-1]!.color;
    }

    // Height of the background should match the tallest possible line
    double backgroundHeight = _scaleLineStyleMap.values
        .map((style) => style.height)
        .reduce((a, b) => a > b ? a : b);

    // Wrap the line with a container for consistent background height
    return Container(
      width: _ruleScaleInterval,
      height: backgroundHeight + 10, // Add padding around the lines
      color: AppColors.purple, // Background color for all lines
      alignment: Alignment.center,
      child: Container(
        width: width,
        height: height,
        color: color, // Original color of the scale line
      ),
    );
  }



  Widget _buildRulerScale(BuildContext context, int index) {
    return SizedBox(
      width: _ruleScaleInterval,
      child: Stack(
        clipBehavior: Clip.none,
        children: <Widget>[
          Positioned(
            top: 0,
            width: 100,
            left: -50 + _ruleScaleInterval / 2,
            child: index % 10 == 0
                ? Container(
              alignment: Alignment.center,
              child: Text(
                widget.onBuildRulerScaleText(
                    index, getRulerScaleValue(index)),
                style: widget.rulerScaleTextStyle,
              ),
            )
                : const SizedBox(),
          ),
          Align(
            alignment: Alignment.center,
            child: _buildRulerScaleLine(index),
          ),
        ],
      ),
    );
  }


  //尺子刻度间隔
  final double _ruleScaleInterval = 10;

//使得尺子刻度和指示器对齐
  void fixOffset() {
    int tempFixedOffset = (scrollController.offset + 0.5) ~/ 1;

    double fixedOffset = (tempFixedOffset + _ruleScaleInterval / 2) ~/
        _ruleScaleInterval.toInt() *
        _ruleScaleInterval;
    Future.delayed(Duration.zero, () {
      scrollController.animateTo(fixedOffset,
          duration: const Duration(milliseconds: 50), curve: Curves.bounceInOut);
    });
  }

  ///获取尺子的刻度值
  num getRulerScaleValue(int index) {
    num rulerScaleValue = 0;

    RulerRange? currentConfig;
    for (RulerRange config in widget.ranges) {
      currentConfig = config;
      if (currentConfig == widget.ranges.last) {
        break;
      }
      var totalCount = ((config.end - config.begin) / config.scale).truncate();

      if (index <= totalCount) {
        break;
      } else {
        index -= totalCount;
      }
    }

    rulerScaleValue = index * currentConfig!.scale + currentConfig!.begin;

    return rulerScaleValue;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(

            // right: widget.width - _ruleScaleInterval
          ),
          width: widget.width,
          height: widget.height + widget.rulerMarginTop,
          child: Listener(
            onPointerDown: (event) {
              FocusScope.of(context).requestFocus(new FocusNode());
              isPosFixed = false;
            },
            onPointerUp: (event) {},
            child: NotificationListener(
                onNotification: (scrollNotification) {
                  if (scrollNotification is ScrollStartNotification) {
                  } else if (scrollNotification
                  is ScrollUpdateNotification) {
                  } else if (scrollNotification is ScrollEndNotification) {
                    if (!isPosFixed) {
                      isPosFixed = true;
                      fixOffset();
                    }
                  }
                  return true;
                },
                child: SizedBox(
                    width: double.infinity,
                    height: widget.height,
                    child: ListView.builder(
                      padding: EdgeInsets.only(
                          left: (widget.width - _ruleScaleInterval) / 2,
                          right: (widget.width - _ruleScaleInterval) / 2),
                      itemExtent: _ruleScaleInterval,
                      itemCount: itemCount,
                      controller: scrollController,
                      scrollDirection: Axis.vertical,
                      itemBuilder: _buildRulerScale,
                    ))),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: widget.marker ?? _buildMark(),
        ),
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
  }

  @override
  void didUpdateWidget(RulerPicker oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (mounted) {
      if (isRangesChanged(oldWidget)) {
        Future.delayed(Duration.zero, () {
          setState(() {
            itemCount = _calculateItemCount();
          });
          _onValueChanged();
        });
      }
    }
  }

  bool isRangesChanged(RulerPicker oldWidget) {
    if (oldWidget.ranges.length != widget.ranges.length) {
      return true;
    }

    if (widget.ranges.isEmpty) return false;
    for (int i = 0; i < widget.ranges.length; i++) {
      RulerRange oldRange = oldWidget.ranges[i];
      RulerRange range = widget.ranges[i];
      if (oldRange.begin != range.begin ||
          oldRange.end != range.end ||
          oldRange.scale != range.scale) {
        return true;
      }
    }
    return false;
  }

  double getPositionByValue(num value) {
    double offsetValue = 0;
    for (RulerRange config in widget.ranges) {
      if (config.begin <= value && config.end >= value) {
        offsetValue +=
            ((value - config.begin) / config.scale) * _ruleScaleInterval;
        break;
      } else if (value >= config.begin) {
        var totalCount =
        ((config.end - config.begin) / config.scale).truncate();
        offsetValue += totalCount * _ruleScaleInterval;
      }
    }
    return offsetValue;
  }

  /// 根据数值设置标记位置
  void setPositionByValue(num value) {
    double offsetValue = getPositionByValue(value);
    scrollController.jumpTo(offsetValue);
    fixOffset();
  }
}

class ScaleLineStyle {
  final int scale;
  final Color color;
  final double width;
  final double height;

  const ScaleLineStyle({
    this.scale = -1,
    required this.color,
    required this.width,
    required this.height,
  });
}

class RulerRange {
  final double scale;
  final int begin;
  final int end;
  const RulerRange({
    required this.begin,
    required this.end,
    this.scale = 1,
  });
}