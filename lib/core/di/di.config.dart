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

import '../../features/auth/data/repositories/auth/auth_repoistory_impl.dart'
    as _i638;
import '../../features/auth/data/repositories/auth/data_sources/auth_remote_data_source.dart'
    as _i61;
import '../../features/auth/data/repositories/auth/data_sources/auth_remote_data_source_impl.dart'
    as _i948;
import '../../features/auth/domain/repositories/auth_repoistory.dart' as _i544;
import '../../features/auth/domain/usecase/login_usecase.dart' as _i911;
import '../../features/auth/ui/login/cubit/login_cubit.dart' as _i416;
import '../../features/cart/data/cart_repository/cart_repository_impl.dart'
    as _i400;
import '../../features/cart/data/cart_repository/data_source%20/cart_remote_data_source.dart'
    as _i325;
import '../../features/cart/data/cart_repository/data_source%20/cart_remote_data_source_impl.dart'
    as _i286;
import '../../features/cart/data/mapper/cart_mapper.dart' as _i817;
import '../../features/cart/domain/repository/cart_repository.dart' as _i26;
import '../../features/cart/presentation/cart_cubit%20/cart_cubit.dart'
    as _i579;
import '../../features/navigation_layout/data/home_repository/data_sources/home_remote_data_source.dart'
    as _i726;
import '../../features/navigation_layout/data/home_repository/data_sources/home_remote_data_source_impl.dart'
    as _i153;
import '../../features/navigation_layout/data/home_repository/home_repository_impl.dart'
    as _i337;
import '../../features/navigation_layout/data/mappers/category_mapper.dart'
    as _i662;
import '../../features/navigation_layout/data/mappers/product_mapper.dart'
    as _i993;
import '../../features/navigation_layout/domain/repository/home_repository.dart'
    as _i318;
import '../../features/navigation_layout/domain/usecase/load_categories_use_case.dart'
    as _i572;
import '../../features/navigation_layout/domain/usecase/load_products_use_case.dart'
    as _i526;
import '../../features/navigation_layout/domain/usecase/load_subcategories.dart'
    as _i1035;
import '../../features/navigation_layout/tabs/categories/presentation/cubit/categories_cubit.dart'
    as _i774;
import '../../features/navigation_layout/tabs/home/presentation/cubit/home_tab_cubit.dart'
    as _i627;
import '../../features/network/api/commerce_services.dart' as _i392;
import '../../features/products/ui/screens/category_products/cubit/category_products_cubit.dart'
    as _i321;
import '../shared_pref_helper/shared_pref_helper.dart' as _i1062;
import 'get_it_modules.dart' as _i320;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final getItModule = _$GetItModule();
    gh.factory<_i361.Dio>(() => getItModule.getDio());
    gh.factory<_i1062.SharedPrefHelper>(() => _i1062.SharedPrefHelper());
    gh.factory<_i662.CategoryMapper>(() => _i662.CategoryMapper());
    gh.factory<_i993.ProductMapper>(() => _i993.ProductMapper());
    gh.factory<_i392.CommerceServices>(
      () => _i392.CommerceServices.new(gh<_i361.Dio>()),
    );
    gh.factory<_i817.CartMapper>(
      () => _i817.CartMapper(gh<_i993.ProductMapper>()),
    );
    gh.factory<_i325.CartRemoteDataSource>(
      () => _i286.CartRemoteDataSourceImpl(gh<_i392.CommerceServices>()),
    );
    gh.factory<_i26.CartRepository>(
      () => _i400.CartRepositoryImpl(
        gh<_i817.CartMapper>(),
        gh<_i325.CartRemoteDataSource>(),
      ),
    );
    gh.factory<_i726.HomeRemoteDataSource>(
      () => _i153.HomeRemoteDataSourceImpl(gh<_i392.CommerceServices>()),
    );
    gh.factory<_i61.AuthRemoteDataSource>(
      () => _i948.AuthRemoteDataSourceImpl(gh<_i392.CommerceServices>()),
    );
    gh.factory<_i318.HomeRepository>(
      () => _i337.HomeRepositoryImpl(
        gh<_i726.HomeRemoteDataSource>(),
        gh<_i662.CategoryMapper>(),
        gh<_i993.ProductMapper>(),
      ),
    );
    gh.factory<_i579.CartCubit>(
      () => _i579.CartCubit(gh<_i26.CartRepository>()),
    );
    gh.factory<_i544.AuthRepository>(
      () => _i638.AuthRepositoryImpl(
        gh<_i61.AuthRemoteDataSource>(),
        gh<_i1062.SharedPrefHelper>(),
      ),
    );
    gh.factory<_i1035.LoadSubCategoriesUseCase>(
      () => _i1035.LoadSubCategoriesUseCase(gh<_i318.HomeRepository>()),
    );
    gh.factory<_i572.LoadCategoriesUseCase>(
      () => _i572.LoadCategoriesUseCase(gh<_i318.HomeRepository>()),
    );
    gh.factory<_i526.LoadProductsUseCase>(
      () => _i526.LoadProductsUseCase(gh<_i318.HomeRepository>()),
    );
    gh.factory<_i627.HomeTabCubit>(
      () => _i627.HomeTabCubit(
        gh<_i572.LoadCategoriesUseCase>(),
        gh<_i526.LoadProductsUseCase>(),
      ),
    );
    gh.factory<_i774.CategoriesCubit>(
      () => _i774.CategoriesCubit(
        gh<_i572.LoadCategoriesUseCase>(),
        gh<_i1035.LoadSubCategoriesUseCase>(),
      ),
    );
    gh.factory<_i321.CategoryProductsCubit>(
      () => _i321.CategoryProductsCubit(gh<_i526.LoadProductsUseCase>()),
    );
    gh.factory<_i911.LoginUseCase>(
      () => _i911.LoginUseCase(gh<_i544.AuthRepository>()),
    );
    gh.factory<_i416.LoginCubit>(
      () => _i416.LoginCubit(gh<_i911.LoginUseCase>()),
    );
    return this;
  }
}

class _$GetItModule extends _i320.GetItModule {}
