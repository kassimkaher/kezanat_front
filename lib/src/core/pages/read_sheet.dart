import 'package:kezanat_alsama/utils/utils.dart';
import 'package:lucide_icons/lucide_icons.dart';

class ReadSheet extends StatelessWidget {
  const ReadSheet(
      {super.key,
      required this.title,
      required this.content,
      this.desc,
      this.animation});
  final String title;
  final String? desc;
  final String content;
  final String? animation;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.cardColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          flexibleSpace: Container(
            padding: const EdgeInsets.only(
                top: kDefaultPadding,
                bottom: 10,
                left: kDefaultPadding,
                right: kDefaultPadding),
            decoration: BoxDecoration(
              color: theme.cardColor,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    title,
                    style: theme.textTheme.titleLarge,
                  ),
                ),
                IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(LucideIcons.x))
              ],
            ),
          ),
        ),
      ),
      body: Container(
        height: double.infinity,
        margin: const EdgeInsets.all(kDefaultSpacing),
        decoration: BoxDecoration(
          color: theme.scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(kDefaultPadding),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
              horizontal: kDefaultPadding, vertical: kDefaultSpacing),
          child: Column(
            children: [
              desc != null
                  ? Column(
                      children: [
                        Text(
                          desc ?? "",
                          style: theme.textTheme.displayLarge!
                              .copyWith(fontSize: 16, color: jbUnselectColor),
                        ),
                        const SizedBox(
                          height: kDefaultSpacing,
                        ),
                      ],
                    )
                  : const SizedBox(),
              Text(
                content,
                style: theme.textTheme.titleMedium!
                    .copyWith(height: 2, letterSpacing: 0.5, wordSpacing: 1.4),
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
    );
  }
}
