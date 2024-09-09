// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:kezanat_alsama/model/books/remote.dart' as _i905;
import 'package:kezanat_alsama/src/admin/logic/work_cubit/work_crud_cubit.dart'
    as _i1011;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i905.BookDataSource>(() => _i905.BookDataSource());
    gh.singleton<_i1011.WorkCrudCubit>(() => _i1011.WorkCrudCubit());
    return this;
  }
}
