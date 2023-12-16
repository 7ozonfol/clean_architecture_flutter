import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:nawy_task/core/params/params.dart';

import 'package:nawy_task/features/search/business/entities/compound_entity.dart';
import 'package:nawy_task/features/search/business/entities/filter_option.dart';
import 'package:nawy_task/features/search/business/entities/unit_entity.dart';
import 'package:nawy_task/features/search/business/useCases/get_compounds.dart';
import 'package:nawy_task/features/search/business/useCases/get_filter_option.dart';
import 'package:nawy_task/features/search/business/useCases/get_unit.dart';
import 'package:nawy_task/features/search/data/dataSources/areas_data_source.dart';
import 'package:nawy_task/features/search/data/dataSources/compounds_data_source.dart';
import 'package:nawy_task/features/search/data/dataSources/filter_option_data_source.dart';
import 'package:nawy_task/features/search/data/dataSources/unit_data_source.dart';
import 'package:nawy_task/features/search/data/repositories/area_repository_impl.dart';
import 'package:nawy_task/features/search/data/repositories/compound_repository_impl.dart';
import 'package:nawy_task/features/search/data/repositories/filter_option_repository_impl.dart';

import '../../../../core/errors/failure.dart';
import '../../business/entities/area_entity.dart';
import '../../business/useCases/get_areas.dart';
import '../../data/repositories/unit_repository_impl.dart';

class SearchProvider extends ChangeNotifier {
  bool _loading = false;
  bool _error = false;

  int? _selectedPrice;

  CompoundEntity? _selectedCompound;
  AreaEntity? _selectedArea;

  final List<AreaEntity> _areaList = [];
  final List<CompoundEntity> _compoundList = [];
  final List<UnitEntity> _unitList = [];

  final List<CompoundEntity> _filteredCompoundList = [];

  FilterOptionEntity? _priceList;

  bool get loading => _loading;
  bool get error => _error;

  int? get selectedPrice => _selectedPrice;

  CompoundEntity? get selectedCompound => _selectedCompound;
  AreaEntity? get selectedArea => _selectedArea;

  List<AreaEntity> get areaList => _areaList;
  List<CompoundEntity> get compoundList => _compoundList;
  List<UnitEntity> get unitList => _unitList;
  List<CompoundEntity> get filteredCompoundList => _filteredCompoundList;

  FilterOptionEntity? get priceList => _priceList;

  void getSearchData() async {
    // await getUnitData();
    await getAreaData();
    await getCompoundData();
    await getFilterOptionData();
  }

  void setSelectedPrice(int? price) {
    _selectedPrice = price;
    notifyListeners();
  }

  void setSelectedArea(AreaEntity? area) {
    _selectedArea = area;
    filterCompoundList();
    notifyListeners();
  }

  void setSelectedCompound(CompoundEntity? compound) {
    _selectedCompound = compound;
    notifyListeners();
  }

  void setDataToAreaList(List<AreaEntity> data) {
    _areaList.clear();
    _areaList.addAll(data);
    _loading = false;
    notifyListeners();
  }

  void setDataToCompoundList(List<CompoundEntity> data) {
    _compoundList.clear();
    _compoundList.addAll(data);
    setDataToFilteredCompoundList(_compoundList);
    _loading = false;
    notifyListeners();
  }

  void setDataToFilteredCompoundList(List<CompoundEntity> data) {
    _filteredCompoundList.clear();
    _filteredCompoundList.addAll(data);
    notifyListeners();
  }

  void setDataToUnitList(List<UnitEntity> data) {
    _unitList.clear();
    _unitList.addAll(data);
    _loading = false;
    notifyListeners();
  }

  void filterCompoundList() {
    _filteredCompoundList.clear();
    if (_selectedArea != null) {
      _filteredCompoundList.addAll(_compoundList.where((element) {
        return element.areaId == _selectedArea?.id;
      }).toList());
    } else {
      _filteredCompoundList.addAll(_compoundList);
    }
  }

  Future<bool> getAreaData() async {
    _loading = true;
    _error = false;

    AreaRepositoryImpl repository = AreaRepositoryImpl(
      areaDataSource: AreaDataSourceImpl(dio: Dio()),
    );

    final failureOrAreaList = await GetAreas(repository).call();

    return failureOrAreaList.fold(
      (fail) {
        ServerFailure failure = fail as ServerFailure;
        Fluttertoast.showToast(
          msg: failure.errorMessage.toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0,
        );
        _loading = false;
        _error = true;
        notifyListeners();
        return false;
      },
      (data) {
        setDataToAreaList(data);
        return true;
      },
    );
  }

  Future<bool> getCompoundData() async {
    _loading = true;
    _error = false;

    CompoundRepositoryImpl repository = CompoundRepositoryImpl(
      compoundDataSource: CompoundsDataSourceImpl(dio: Dio()),
    );

    final failureOrCompoundList = await GetCompounds(repository).call();

    return failureOrCompoundList.fold(
      (fail) {
        ServerFailure failure = fail as ServerFailure;
        Fluttertoast.showToast(
          msg: failure.errorMessage.toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0,
        );
        _loading = false;
        _error = true;
        notifyListeners();
        return false;
      },
      (data) {
        setDataToCompoundList(data);
        return true;
      },
    );
  }

  Future<bool> getFilterOptionData() async {
    _loading = true;
    _error = false;

    FilterOptionRepositoryImpl repository = FilterOptionRepositoryImpl(
      filterOptionDataSource: FilterOptionsDataSourceImpl(dio: Dio()),
    );

    final failureOrFilterOption = await GetFilterOption(repository).call();

    return failureOrFilterOption.fold(
      (fail) {
        ServerFailure failure = fail as ServerFailure;
        Fluttertoast.showToast(
          msg: failure.errorMessage.toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0,
        );
        _loading = false;
        _error = true;
        notifyListeners();
        return false;
      },
      (data) {
        _priceList = data;
        _loading = false;
        notifyListeners();
        return true;
      },
    );
  }

  Future<bool> getUnitData() async {
    _loading = true;
    _error = false;

    UnitRepositoryImpl repository = UnitRepositoryImpl(
      unitDataSource: UnitDataSourceImpl(dio: Dio()),
    );

    final failureOrUnits = await GetUnit(repository).call(
        params: SearchParams(
            compoundId: _selectedCompound?.id ?? 1,
            areaId: _selectedArea?.id ?? 0,
            minPrice: selectedPrice ?? 1,
            maxPrice: selectedPrice ?? 0,
            minBedroom: 0,
            maxBedroom: 8));

    return failureOrUnits.fold(
      (fail) {
        ServerFailure failure = fail as ServerFailure;
        Fluttertoast.showToast(
          msg: failure.errorMessage.toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0,
        );
        _loading = false;
        _error = true;
        notifyListeners();
        return false;
      },
      (data) {
        setDataToUnitList(data);
        notifyListeners();
        return true;
      },
    );
  }
}
