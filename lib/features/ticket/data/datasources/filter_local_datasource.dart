import '../models/filter_model.dart';

class FilterLocalDataSource {
  Future<FilterModel> getFilters() async {
    await Future.delayed(const Duration(milliseconds: 600));

    return FilterModel(
      brands: ["Gains", "GainSolution", "GainHQ"],
      priorities: ["Low", "Medium", "High", "Urgent"],
      tags: [
        "Tag one",
        "Tag two",
        "Tag three wit long text",
        "Tag four",
        "Tag five",
        "Tag six with long text",
        "Tag seven",
      ],
    );
  }
}
