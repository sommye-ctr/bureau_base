import 'package:bureau_base/resources/style.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class ResidenceDropdown extends StatelessWidget {
  final String heading;
  final String validatorMessage;
  final Function(dynamic) onChanged;
  final Function(dynamic) onSaved;
  final List items;
  final GlobalKey? dropdownKey;
  const ResidenceDropdown({
    required this.heading,
    required this.validatorMessage,
    required this.onChanged,
    required this.onSaved,
    required this.items,
    this.dropdownKey,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField2<String>(
      key: dropdownKey,
      isExpanded: true,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      hint: Text(
        heading,
      ),
      items: items
          .map((item) => DropdownMenuItem<String>(
                value: item,
                child: Text(item),
              ))
          .toList(),
      validator: (value) {
        if (value == null) {
          return validatorMessage;
        }
        return null;
      },
      onChanged: onChanged,
      onSaved: onSaved,
      buttonStyleData: const ButtonStyleData(
        padding: EdgeInsets.only(right: 8),
      ),
      dropdownStyleData: DropdownStyleData(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Style.largeRoundEdgeRadius),
        ),
      ),
      menuItemStyleData: const MenuItemStyleData(
        padding: EdgeInsets.symmetric(horizontal: 16),
      ),
    );
  }
}
