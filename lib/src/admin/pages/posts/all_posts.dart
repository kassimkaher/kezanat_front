import 'package:kezanat_alsama/src/admin/logic/posts_logic/posts_cubit.dart';
import 'package:kezanat_alsama/src/admin/pages/posts/add_post_page.dart';
import 'package:kezanat_alsama/src/admin/pages/posts/post_card.dart';
import 'package:kezanat_alsama/src/core/entity/data_status.dart';
import 'package:kezanat_alsama/utils/utils.dart';
import 'package:lucide_icons/lucide_icons.dart';

class AllPostsView extends StatefulWidget {
  const AllPostsView({super.key});

  @override
  State<AllPostsView> createState() => _AllPostsViewState();
}

class _AllPostsViewState extends State<AllPostsView> {
  late PostsCRUDCubit postsCRUDCubit;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    postsCRUDCubit = PostsCRUDCubit();
    postsCRUDCubit.getPosts();
  }

  @override
  Widget build(BuildContext context) {
    // final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("اقوال"),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(LucideIcons.plus),
        onPressed: () => showAdaptiveDialog(
            context: context,
            builder: (c) => AddPostPage(
                  postsCRUDCubit: postsCRUDCubit,
                )),
      ),
      body: BlocConsumer<PostsCRUDCubit, PostsCRUDState>(
          bloc: postsCRUDCubit,
          listener: (context, state) {
            // if (state.datastatus == const DataError()) {
            //   showDialog(context: context, builder: (c) => Text("error add"));
            // }
          },
          builder: (context, state) => switch (state.datastatus) {
                StateLoading() || StateIdeal() => ListView.separated(
                    padding: const EdgeInsets.all(16),
                    shrinkWrap: true,
                    itemBuilder: (c, i) => const PostCardPlaceHolder(),
                    separatorBuilder: (c, i) => const SizedBox(height: 0),
                    itemCount: 4),
                const StateSucess() => ListView.separated(
                    padding: const EdgeInsets.all(16),
                    separatorBuilder: (c, i) => const SizedBox(height: 0),
                    itemCount: state.dailyPostsModel?.data?.length ?? 0,
                    itemBuilder: (c, i) => PostCard(
                      ondelete: () {
                        postsCRUDCubit
                            .deletWork(state.dailyPostsModel!.data![i].id!);
                      },
                      dailyPostData: state.dailyPostsModel!.data![i],
                    ),
                  ),
                _ => const Text("error")
              }),
    );
  }
}
