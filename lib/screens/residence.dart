import 'package:bureau_base/components/spacing.dart';
import 'package:bureau_base/resources/strings.dart';
import 'package:bureau_base/resources/style.dart';
import 'package:bureau_base/respository/local_repository.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:forui/forui.dart';

class ResidenceInfoScreen extends StatefulWidget {
  static const String route = "/residence-info";
  const ResidenceInfoScreen({super.key});

  @override
  State<ResidenceInfoScreen> createState() => _ResidenceInfoScreenState();
}

class _ResidenceInfoScreenState extends State<ResidenceInfoScreen> {
  final LocalRepository localRepository = LocalRepository();
  final List<dynamic> states = [];
  final List<dynamic> cities = [];
  String? selectedState;
  String? selectedCity;

  final GlobalKey<FormFieldState> _cityKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _fetchStates();
  }

  void _fetchStates() async {
    states.addAll(await localRepository.getStatesList());
    setState(() {});
  }

  void _fetchCities() async {
    selectedCity = null;
    _cityKey.currentState?.reset();
    cities.clear();
    cities.addAll(
        await localRepository.getCitiesList(state: selectedState ?? ""));
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: FScaffold(
          content: ListView(
        children: [
          Center(
            child: Text(
              "Just one last step",
              style: context.theme.typography.xl4,
            ),
          ),
          const Spacing(
            large: true,
          ),
          _buildDropDown(
            "Select your state",
            "Enter your state",
            (value) {
              selectedState = value;
              _fetchCities();
            },
            (value) {
              selectedState = value;
              _fetchCities();
            },
            states,
          ),
          const Spacing(),
          _buildDropDown("Select your city", "Enter your city", (value) {
            selectedCity = value;
          }, (value) {
            selectedCity = value;
          }, cities, key: _cityKey),
          const Spacing(large: true),
          Hero(
            tag: Strings.proceed,
            child: FButton(
              label: const Text(Strings.proceed),
              onPress: () {},
            ),
          )
        ],
      )),
    );
  }

  Widget _buildDropDown(
    String heading,
    String validatorMessage,
    Function(dynamic) onChanged,
    Function(dynamic) onSaved,
    List<dynamic> items, {
    GlobalKey? key,
  }) {
    return DropdownButtonFormField2<String>(
      key: key,
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
