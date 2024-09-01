import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:saber_module/components/home/preview_card.dart';
import 'package:saber_module/data/extensions/change_notifier_extensions.dart';

class MasonryFiles extends StatefulWidget {
  const MasonryFiles({
    super.key,
    required this.files,
    required this.selectedFiles,
    required this.crossAxisCount,
  });

  final List<String> files;
  final int crossAxisCount;
  final ValueNotifier<List<String>> selectedFiles;

  @override
  State<MasonryFiles> createState() => _MasonryFilesState();
}

class _MasonryFilesState extends State<MasonryFiles> {
  final ValueNotifier<bool> isAnythingSelected = ValueNotifier(false);

  void toggleSelection(String filePath, bool selected) {
    if (selected) {
      widget.selectedFiles.value.add(filePath);
    } else {
      widget.selectedFiles.value.remove(filePath);
    }
    isAnythingSelected.value = widget.selectedFiles.value.isNotEmpty;
    widget.selectedFiles.notifyListenersPlease();
  }

  @override
  Widget build(BuildContext context) {
    isAnythingSelected.value = widget.selectedFiles.value.isNotEmpty;

    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      sliver: SliverMasonryGrid.count(
        childCount: widget.files.length,
        crossAxisCount: widget.crossAxisCount,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        itemBuilder: (context, index) {
          if (index >= widget.files.length) {
            return const SizedBox.shrink();
          }

          final file = widget.files[index];
          return ValueListenableBuilder(
            valueListenable: isAnythingSelected,
            builder: (context, isAnythingSelected, _) {
              return PreviewCard(
                filePath: file,
                toggleSelection: toggleSelection,
                selected: widget.selectedFiles.value.contains(file),
                isAnythingSelected: isAnythingSelected,
              );
            },
          );
        },
      ),
    );
  }
}
