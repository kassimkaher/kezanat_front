import 'package:kezanat_alsama/src/admin/logic/work_cubit/work_crud_cubit.dart';
import 'package:kezanat_alsama/src/admin/pages/relationships/relation_admin_view.dart';
import 'package:kezanat_alsama/src/core/entity/data_status.dart';
import 'package:kezanat_alsama/utils/injector.dart';
import 'package:kezanat_alsama/utils/utils.dart';

class RelationAdminPage extends StatefulWidget {
  const RelationAdminPage({super.key});

  @override
  State<RelationAdminPage> createState() => _RelationAdminPageState();
}

class _RelationAdminPageState extends State<RelationAdminPage> {
  late WorkCrudCubit workCrudCubit;
  @override
  void initState() {
    super.initState();
    workCrudCubit = getIt<WorkCrudCubit>();
    if (workCrudCubit.state.dataStatus != const StateSucess()) {
      workCrudCubit.getWorkData();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: workCrudCubit,
      child: const RelationAdminView(),
    );
  }
}
