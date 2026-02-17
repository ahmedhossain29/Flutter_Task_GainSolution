import 'package:flutter/material.dart';
import 'package:flutter_task_gain_solution/core/common_widgets/custom_text.dart';

import '../../../../../core/utils/utils.dart';
import '../../../domain/entities/filter_data.dart';

class LoadedFilterView extends StatefulWidget {
  final FilterData data;

  const LoadedFilterView({super.key, required this.data});

  @override
  State<LoadedFilterView> createState() => _LoadedFilterViewState();
}

class _LoadedFilterViewState extends State<LoadedFilterView> {
  final selectedBrands = <String>{};
  String? selectedPriority;
  String searchText = "";

  @override
  Widget build(BuildContext context) {
    final tags =
        widget.data.tags
            .where((t) => t.toLowerCase().contains(searchText))
            .toList();

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _SectionTitle("Brand"),
          Utils.verticalSpace(12.0),

          ...widget.data.brands.map((b) {
            final checked = selectedBrands.contains(b);

            return CheckboxListTile(
              value: checked,
              onChanged: (_) {
                setState(() {
                  checked ? selectedBrands.remove(b) : selectedBrands.add(b);
                });
              },
              title: Row(
                children: [
                  const CircleAvatar(
                    radius: 12,
                    child: Icon(Icons.business, size: 14),
                  ),
                  Utils.horizontalSpace(8.0),
                  CustomText(text: b),
                ],
              ),
              controlAffinity: ListTileControlAffinity.leading,
              contentPadding: EdgeInsets.zero,
            );
          }),

          Utils.verticalSpace(24.0),

          const _SectionTitle("Priority"),
          Utils.verticalSpace(12.0),

          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(12),
              color: Colors.white,
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                icon: Icon(Icons.keyboard_arrow_down_rounded),
                hint: const CustomText(text: "Select priority"),
                value: selectedPriority,
                isExpanded: true,
                items:
                    widget.data.priorities
                        .map(
                          (p) => DropdownMenuItem(
                            value: p,
                            child: CustomText(text: p),
                          ),
                        )
                        .toList(),
                onChanged: (v) => setState(() => selectedPriority = v),
              ),
            ),
          ),

          Utils.verticalSpace(24.0),

          const _SectionTitle("Tags"),
          Utils.verticalSpace(12.0),

          TextField(
            decoration: InputDecoration(
              hintText: "Search tags",
              prefixIcon: const Icon(Icons.search),
              filled: true,
              fillColor: Color(0xFFF3F4F8),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide.none,
              ),
            ),
            onChanged: (v) => setState(() => searchText = v.toLowerCase()),
          ),

          Utils.verticalSpace(12.0),

          Wrap(
            spacing: 8,
            runSpacing: 8,
            children:
                tags
                    .map(
                      (t) => Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.grey.shade300),
                          color: Colors.white,
                        ),
                        child: CustomText(text: t),
                      ),
                    )
                    .toList(),
          ),
        ],
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String text;

  const _SectionTitle(this.text);

  @override
  Widget build(BuildContext context) {
    return CustomText(text: text, fontSize: 16, fontWeight: FontWeight.w600);
  }
}
