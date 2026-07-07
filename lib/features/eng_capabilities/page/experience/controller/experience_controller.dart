import 'package:flutter/material.dart';
import 'package:portfolio/features/eng_capabilities/page/experience/models/engineering_experience_model.dart';

class ExperienceController extends ChangeNotifier {
  int _activeIndex = 0;
  int get activeIndex => _activeIndex;

  ExperienceModel? _selected;
  ExperienceModel? get selected => _selected;

  bool isSelected(ExperienceModel experience) {
    return _selected?.id == experience.id;
  }

  void toggle(ExperienceModel experience) {
    if (isSelected(experience)) {
      _selected = null;
    } else {
      _selected = experience;
    }

    notifyListeners();
  }

  void select(ExperienceModel experience) {
    if (_selected?.id == experience.id) return;

    _selected = experience;
    notifyListeners();
  }

  void changeIndex(int index) {
    if (_activeIndex == index) return;

    _activeIndex = index;
    notifyListeners();
  }

  void clear() {
    if (_selected == null) return;

    _selected = null;
    notifyListeners();
  }
}
