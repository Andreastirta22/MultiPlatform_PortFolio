import 'package:flutter/material.dart';
import 'package:portfolio/features/eng_capabilities/page/languages/models/engineering_languages_models.dart';

class EngineeringLanguageController extends ChangeNotifier {
  final List<LanguageModel> _languages;

  EngineeringLanguageController(this._languages);

  List<LanguageModel> get languages => _languages;

  // =========================
  // Desktop / Tablet
  // =========================

  LanguageModel? _selectedLanguage;
  LanguageModel? get selectedLanguage => _selectedLanguage;

  bool get hasSelection => _selectedLanguage != null;

  bool _focusMode = false;
  bool get focusMode => _focusMode;

  bool _isTransitioning = false;
  bool get isTransitioning => _isTransitioning;

  // =========================
  // Mobile Accordion
  // =========================

  String? _expandedId;
  String? get expandedId => _expandedId;

  // =========================
  // Desktop Selection
  // =========================

  void selectLanguage(LanguageModel language) {
    _isTransitioning = true;
    notifyListeners();

    Future.microtask(() {
      if (_selectedLanguage?.id == language.id) {
        _selectedLanguage = null;
        _focusMode = false;
      } else {
        _selectedLanguage = language;
        _focusMode = true;
      }

      _isTransitioning = false;
      notifyListeners();
    });
  }

  // =========================
  // Mobile Accordion
  // =========================

  void toggleExpanded(LanguageModel language) {
    if (_expandedId == language.id) {
      _expandedId = null;
      _selectedLanguage = null;
    } else {
      _expandedId = language.id;
      _selectedLanguage = language;
    }

    notifyListeners();
  }

  // =========================
  // Common
  // =========================

  void clearSelection() {
    _selectedLanguage = null;
    _expandedId = null;
    _focusMode = false;
    notifyListeners();
  }

  void exitFocus() {
    clearSelection();
  }
}
