import 'dart:async';

import 'package:flutter/rendering.dart';
import 'package:kezanat_alsama/utils/utils.dart';
import 'package:rxdart/rxdart.dart';

class AutoHideAppBar extends StatefulWidget {
  const AutoHideAppBar({
    super.key,
    required this.title,
    this.leading,
  });
  final String title;
  final Widget? leading;
  @override
  State<AutoHideAppBar> createState() => _AutoHideAppBarState();
}

class _AutoHideAppBarState extends State<AutoHideAppBar> {
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

            kdp(name: "userScrollDirection", msg: _isFabExtended, c: 'm');
          }
        } else if (userScrollDirection == ScrollDirection.forward) {
          if (!_isFabExtended) {
            setState(() {
              _isFabExtended = true;
            });

            kdp(name: "userScrollDirection_0", msg: _isFabExtended, c: 'm');
          }
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final query = MediaQuery.of(context);
    return AnimatedSlide(
        duration: const Duration(milliseconds: 100),
        offset: !_isFabExtended ? const Offset(0, -1) : const Offset(0, 0),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 100),
          margin: EdgeInsets.only(top: !_isFabExtended ? 0 : query.padding.top),
          child: ListTile(
            // tileColor: theme.scaffoldBackgroundColor,
            trailing: widget.leading,
            title: Text(
              widget.title,
              style: theme.textTheme.titleLarge,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            leading: IconButton(
              padding: EdgeInsets.zero,
              icon: const Icon(
                Icons.arrow_back_rounded,
                size: 25,
              ),
              onPressed: () {
                navigatorKey.currentState?.pop();
              },
            ),
          ),
        ));
  }
}
