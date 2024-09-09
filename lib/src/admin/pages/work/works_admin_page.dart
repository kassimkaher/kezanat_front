import 'package:kezanat_alsama/src/admin/logic/work_cubit/work_crud_cubit.dart';
import 'package:kezanat_alsama/src/admin/pages/work/work_admin_view.dart';
import 'package:kezanat_alsama/src/core/entity/data_status.dart';
import 'package:kezanat_alsama/utils/injector.dart';
import 'package:kezanat_alsama/utils/utils.dart';

class WorkAdminPage extends StatefulWidget {
  const WorkAdminPage({super.key});

  @override
  State<WorkAdminPage> createState() => _WorkAdminPageState();
}

class _WorkAdminPageState extends State<WorkAdminPage> {
  late WorkCrudCubit workCrudCubit;
  @override
  void initState() {
    // TODO: implement initState
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
      child: const WorkAdminView(),
    );
  }
}
