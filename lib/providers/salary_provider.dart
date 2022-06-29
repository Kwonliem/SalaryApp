import 'package:flutter/material.dart';
import 'package:training_app/models/salary_model.dart';
import 'package:training_app/services/salary_service.dart';

class SalaryProvider extends ChangeNotifier {
  SalaryModel? _salaryModel;
  SalaryModel get data => _salaryModel!;

  set data(SalaryModel salaryModel) {
    _salaryModel = salaryModel;
    notifyListeners();
  }

  Future<void> getPenggajian() async {
    try {
      SalaryModel data = await SalaryService().getPenggajian();
      _salaryModel = data;
    } catch (e) {
      print(e);
    }
  }
}
