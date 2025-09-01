// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/auth/data/auth_repo/auth_repo_impl.dart' as _i913;
import '../../features/auth/data/auth_repo/data_sources/auth_remote_data_source.dart'
    as _i385;
import '../../features/auth/data/auth_repo/data_sources/auth_remote_data_source_impl.dart'
    as _i1045;
import '../../features/auth/domain/repositories/auth_repo.dart' as _i723;
import '../../features/auth/domain/usecases/login_usecase.dart' as _i188;
import '../../features/auth/domain/usecases/register_usecase.dart' as _i941;
import '../../features/auth/ui/login/cubit/login_cubit.dart' as _i416;
import '../../features/navigation_layout/data/mappers/category_mapper.dart'
    as _i662;
import '../../features/navigation_layout/data/mappers/product_mapper.dart'
    as _i993;
import '../../features/navigation_layout/data/repository/home_remote_data_source/home_remote_data_source.dart'
    as _i165;
import '../../features/navigation_layout/data/repository/home_remote_data_source/home_remote_data_source_impl.dart'
    as _i919;
import '../../features/navigation_layout/data/repository/home_repository_impl.dart'
    as _i658;
import '../../features/navigation_layout/domain/repository/home_repository.dart'
    as _i318;
import '../../features/navigation_layout/domain/usecases/load_categories_use_case.dart'
    as _i562;
import '../../features/navigation_layout/domain/usecases/load_products_use_case.dart'
    as _i795;
import '../../features/navigation_layout/tabs/home/presentation/cubit/home_cubit.dart'
    as _i490;
import '../../features/network%20/api_services.dart' as _i635;
import '../shared_prefs_helper/shared_prefs_helper.dart' as _i7;
import 'get_it_modules.dart' as _i320;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final getItModules = _$GetItModules();
    gh.factory<_i361.Dio>(() => getItModules.getDio());
    gh.factory<_i7.SharedPrefsHelper>(() => _i7.SharedPrefsHelper());
    gh.factory<_i662.CategoryMapper>(() => _i662.CategoryMapper());
    gh.factory<_i993.ProductMapper>(() => _i993.ProductMapper());
    gh.factory<_i635.ApiServices>(() => _i635.ApiServices.new(gh<_i361.Dio>()));
    gh.factory<_i385.AuthRemoteDataSource>(
      () => _i1045.AuthRemoteDataSourceImpl(gh<_i635.ApiServices>()),
    );
    gh.factory<_i165.HomeRemoteDataSource>(
      () => _i919.HomeRemoteDataSourceImpl(gh<_i635.ApiServices>()),
    );
    gh.factory<_i723.AuthRepo>(
      () => _i913.AuthRepoImpl(
        gh<_i385.AuthRemoteDataSource>(),
        gh<_i7.SharedPrefsHelper>(),
      ),
    );
    gh.factory<_i941.RegisterUseCase>(
      () => _i941.RegisterUseCase(gh<_i723.AuthRepo>()),
    );
    gh.factory<_i188.LoginUseCase>(
      () => _i188.LoginUseCase(gh<_i723.AuthRepo>()),
    );
    gh.factory<_i318.HomeRepository>(
      () => _i658.HomeRepositoryImpl(
        gh<_i165.HomeRemoteDataSource>(),
        gh<_i662.CategoryMapper>(),
        gh<_i993.ProductMapper>(),
      ),
    );
    gh.factory<_i795.LoadProductsUseCase>(
      () => _i795.LoadProductsUseCase(gh<_i318.HomeRepository>()),
    );
    gh.factory<_i562.LoadCategoriesUseCase>(
      () => _i562.LoadCategoriesUseCase(gh<_i318.HomeRepository>()),
    );
    gh.factory<_i416.LoginCubit>(
      () => _i416.LoginCubit(gh<_i188.LoginUseCase>()),
    );
    gh.factory<_i490.HomeCubit>(
      () => _i490.HomeCubit(
        gh<_i795.LoadProductsUseCase>(),
        gh<_i562.LoadCategoriesUseCase>(),
      ),
    );
    return this;
  }
}

class _$GetItModules extends _i320.GetItModules {}
