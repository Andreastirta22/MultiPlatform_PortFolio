import 'package:flutter/material.dart';
import 'package:portfolio/features/eng_capabilities/model/engineering_model.dart';

class EngineeringController extends ChangeNotifier {
  EngineeringController({required List<EngineeringModel> capabilities})
    : _capabilities = capabilities {
    if (_capabilities.isNotEmpty) {
      _selectedCapability = _capabilities.first;
    }
  }
  final List<EngineeringModel> _capabilities;
  int _currentTab = 0;
  EngineeringModel? _selectedCapability;
  TargetPlatform? _selectedPlatform;
  int get currentTab => _currentTab;
  List<EngineeringModel> get capabilities => _capabilities;
  EngineeringModel? get selectedCapability => _selectedCapability;
  TargetPlatform? get selectedPlatform => _selectedPlatform;

  void changeTab(int index) {
    if (_currentTab == index) return;
    _currentTab = index;
    notifyListeners();
  }

  void selectCapability(EngineeringModel capability) {
    if (_selectedCapability == capability) return;

    _selectedCapability = capability;

    notifyListeners();
  }

  void selectPlatform(TargetPlatform platform) {
    if (_selectedPlatform == platform) return;
    _selectedPlatform = platform;
    notifyListeners();
  }
}
