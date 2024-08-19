import 'package:flutter/material.dart';

class MultiSelectChip extends StatefulWidget {
  final List<String> selectionList;
  final List<String> selectedList;
  final bool check;
  final Function(List<String>)? onSelectionChanged;
  final Function(List<String>)? onMaxSelected;
  final int? maxSelection;

  const MultiSelectChip(this.selectionList, this.selectedList, this.check,
      {super.key, this.onSelectionChanged, this.onMaxSelected, this.maxSelection});

  @override
  State<MultiSelectChip> createState() => _MultiSelectChipState();
}

class _MultiSelectChipState extends State<MultiSelectChip> {
  // String selectedChoice = "";
  List<String> selectedChoices = [];

  _buildChoiceList() {
    selectedChoices = widget.selectedList;
    List<Widget> choices = [];

    for (var item in widget.selectionList) {
      choices.add(Container(
        padding: const EdgeInsets.all(2.0),
        child: RawChip(
          labelStyle: TextStyle(fontSize: 14,
              fontWeight: FontWeight.w400,
              color: selectedChoices.contains(item)
                  ? Colors.white
                  : Theme.of(context).colorScheme.primary

          ),
          showCheckmark: false,
          shape: RoundedRectangleBorder(
              side: const BorderSide(width: 0.5),
              borderRadius: BorderRadius.circular(20)),
          selectedColor: Theme
              .of(context)
              .colorScheme
              .primary,
          label: Text(item),
          padding: EdgeInsets.zero,
          selected: selectedChoices.contains(item),
          //isEnabled: widget.check,
          tapEnabled: widget.check,
          onSelected: (selected) {
            if (selectedChoices.length == (widget.maxSelection ?? -1) &&
                !selectedChoices.contains(item)) {
              widget.onMaxSelected?.call(selectedChoices);
            } else {
              setState(() {
                selectedChoices.contains(item)
                    ? selectedChoices.remove(item)
                    : selectedChoices.add(item);
                widget.onSelectionChanged?.call(selectedChoices);
              });
            }
          },
        ),
      ));
    }

    return choices;
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: _buildChoiceList(),
    );
  }
}