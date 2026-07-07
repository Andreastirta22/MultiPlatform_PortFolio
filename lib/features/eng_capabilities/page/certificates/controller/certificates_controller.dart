import 'package:flutter/material.dart';
import 'package:portfolio/features/eng_capabilities/page/certificates/data/engineering_certificates_data.dart';
import 'package:portfolio/features/eng_capabilities/page/certificates/models/engineering_certificates_model.dart';

class CertificatesController extends ChangeNotifier {
  final List<CertificateModel> certificates = engineeringCertificates;

  int? _expandedIndex;
  int? get expandedIndex => _expandedIndex;
  bool isExpanded(int index) => _expandedIndex == index;

  void toogle(int index) {
    if (_expandedIndex == index) {
      _expandedIndex = null;
    } else {
      _expandedIndex = index;
    }
    notifyListeners();
  }

  void collapse() {
    _expandedIndex = null;
    notifyListeners();
  }

  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  CertificateModel get selectedCertificate => certificates[_selectedIndex];

  void select(int index) {
    if (_selectedIndex == index) return;

    _selectedIndex = index;
    notifyListeners();
  }
}
