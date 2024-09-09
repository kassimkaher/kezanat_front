import 'dart:async';

import 'package:flutter/rendering.dart';
import 'package:kezanat_alsama/utils/utils.dart';
import 'package:rxdart/rxdart.dart';

class FloatPageNumber extends StatefulWidget {
  const FloatPageNumber({
    super.key,
    required this.pageNumber,
  });
  final int pageNumber;
  @override
  State<FloatPageNumber> createState() => _FloatPageNumberState();
}

class _FloatPageNumberState extends State<FloatPageNumber> {
  bool _isFabExtended = true;
  final StreamController<ScrollDirection> _debounceStreamController =
      StreamController<ScrollDirection>();
  @override
  void initState() {
    super.initState();

    globalScrollController.addListener(() {
      _debounceStreamController
          .add(globalScrollController.position.userScrollDirection);
    });
    _debouncedTermStream();
  }

  _debouncedTermStream() {
    _debounceStreamController.stream
        .distinct()
        .debounceTime(const Duration(milliseconds: 150))
        .listen((userScrollDirection) {
      if (mounted) {
        if (userScrollDirection == ScrollDirection.reverse) {
          if (_isFabExtended) {
            setState(() {
              _isFabExtended = false;
            });

            // kdp(name: "userScrollDirection", msg: _isFabExtended, c: 'm');
          }
        } else if (userScrollDirection == ScrollDirection.forward) {
          if (!_isFabExtended) {
            setState(() {
              _isFabExtended = true;
            });

            //  kdp(name: "userScrollDirection_0", msg: _isFabExtended, c: 'm');
          }
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AnimatedSlide(
      duration: const Duration(milliseconds: 100),
      offset: !_isFabExtended ? const Offset(-1, 0) : const Offset(0, 0),
      child: Container(
        margin: const EdgeInsets.all(12),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(kDefaultBorderRadius),
            color: theme.disabledColor),
        child: Text(
          "صفحة  ${widget.pageNumber}",
          style: theme.textTheme.titleMedium!
              .copyWith(color: theme.cardColor, fontSize: 20),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
