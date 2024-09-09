import 'package:kezanat_alsama/src/core/widget/blure_background.dart';
import 'package:kezanat_alsama/utils/utils.dart';

class BackGround extends StatelessWidget {
  const BackGround({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final quere = MediaQuery.of(context);
    return Stack(
      children: [
        Positioned(
          left: -50,
          top: -50,
          child: Container(
            width: 250,
            height: 250,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              gradient: RadialGradient(colors: [
                theme.primaryColor,
                Colors.transparent,
              ]),
            ),
          ),
        ),
        Positioned(
          right: -50,
          top: quere.size.height / 3,
          child: Container(
            width: 250,
            height: 250,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              gradient: RadialGradient(colors: [
                theme.primaryColor,
                theme.primaryColor.withOpacity(0.1),
              ]),
            ),
          ),
        ),
        Positioned(
          left: -100,
          bottom: -100,
          child: Container(
            width: 250,
            height: 250,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              gradient: RadialGradient(colors: [
                theme.primaryColor,
                theme.primaryColor.withOpacity(0.2),
              ]),
            ),
          ),
        ),
        Positioned(
          right: -100,
          bottom: -150,
          child: Container(
            width: 250,
            height: 250,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              gradient: RadialGradient(colors: [
                theme.primaryColor,
                theme.primaryColor.withOpacity(0.2),
              ]),
            ),
          ),
        ),
        SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Container(
            color: theme.scaffoldBackgroundColor.withOpacity(0.6),
          ),
        ),
        if (theme.brightness != Brightness.dark)
          Positioned(
              top: 0,
              bottom: 0,
              left: 0,
              right: 0,
              child: Image.asset(
                "assets/images/bk.jpg",
                alignment: Alignment.center,
                fit: BoxFit.cover,
              )),
        if (theme.brightness != Brightness.dark)
          Positioned(
              top: 0,
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                color: theme.scaffoldBackgroundColor.withOpacity(0.4),
              )),
        if (theme.brightness != Brightness.dark)
          BlureWidget(
            // blur: 10,
            // width: double.infinity,
            // height: double.infinity,
            // elevation: 0,
            // color: theme.scaffoldBackgroundColor.withOpacity(0.5),
            sigmaX: 2, sigmaY: 2,
            child: child,
          ),
        if (theme.brightness == Brightness.dark)
          BlureWidget(
            // blur: 10,
            // width: double.infinity,
            // height: double.infinity,
            // elevation: 0,
            // color: theme.scaffoldBackgroundColor.withOpacity(0.5),
            sigmaX: 60, sigmaY: 60,
            child: child,
          ),
      ],
    );
  }
}
