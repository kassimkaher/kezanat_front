import 'package:kezanat_alsama/model/slider_model.dart';
import 'package:kezanat_alsama/src/admin/logic/posts_logic/posts_cubit.dart';
import 'package:kezanat_alsama/src/core/entity/data_status.dart';
import 'package:kezanat_alsama/src/core/resources/validation.dart';
import 'package:kezanat_alsama/src/core/widget/custom_text_input.dart';
import 'package:kezanat_alsama/src/core/widget/jb_button_mix.dart';
import 'package:kezanat_alsama/src/sheet/alert_dialog.dart';
import 'package:kezanat_alsama/utils/utils.dart';
import 'package:lucide_icons/lucide_icons.dart';

class AddPostPage extends StatefulWidget {
  const AddPostPage({super.key, required this.postsCRUDCubit});
  final PostsCRUDCubit postsCRUDCubit;
  @override
  State<AddPostPage> createState() => _AddPostPageState();
}

class _AddPostPageState extends State<AddPostPage> {
  final authorController = TextEditingController();
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final dateController = TextEditingController();
  final imageController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  final key = GlobalKey();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PostsCRUDCubit, PostsCRUDState>(
      bloc: widget.postsCRUDCubit,
      listener: (context, state) {
        if (state.datastatus == const StateError()) {
          showTMDialog(
            title: "fail".tr(),
            msg: "connection_error_confirm".tr(),
            icon: const Icon(
              LucideIcons.alertTriangle,
              color: Colors.red,
            ),
          );
        }
        if (state.datastatus == const StateSucess()) {
          showTMDialog(
              title: "Sucess".tr(),
              msg: "Done Add Work".tr(),
              icon: const Icon(
                LucideIcons.checkCheck,
                color: Colors.green,
              ),
              onDissmiss: () {
                navigatorKey.currentState!.pop();
              });
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("اضافة منشورة"),
          ),
          body: Form(
            key: formKey,
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                CustomTextInput(
                  isRequired: ValidatorEnum.required,
                  validator: ValidatorEnum.textOnly,
                  controller: authorController,
                  label: "القائل",
                  rightPadding: 16,
                  leftPadding: 16,
                ),
                const SizedBox(height: 12),
                CustomTextInput(
                  isRequired: ValidatorEnum.required,
                  controller: titleController,
                  label: "العنوان",
                  rightPadding: 16,
                  leftPadding: 16,
                ),
                const SizedBox(height: 12),
                CustomTextInput(
                  isRequired: ValidatorEnum.required,
                  controller: descriptionController,
                  label: "نص المنشور",
                  rightPadding: 16,
                  leftPadding: 16,
                  maxLine: 3,
                ),
                const SizedBox(height: 12),
                CustomTextInput(
                  validator: ValidatorEnum.textOnly,
                  controller: imageController,
                  label: "رابط صورة",
                  rightPadding: 16,
                  leftPadding: 16,
                ),
              ],
            ),
          ),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.all(16),
            child: JBButtonMix(
              isLoading: state.datastatus == const StateLoading(),
              icon: const Icon(LucideIcons.plusCircle),
              title: "اضاف",
              onPressed: () {
                setState(() {});
                if (formKey.currentState!.validate()) {
                  widget.postsCRUDCubit.addPost(
                    DailyPostData(
                      title: titleController.text,
                      description: descriptionController.text,
                      author: authorController.text,
                      image: imageController.text,
                    ),
                  );
                }
              },
            ),
          ),
        );
      },
    );
  }
}
