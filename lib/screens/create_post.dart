import 'package:bureau_base/components/residence_dropdown.dart';
import 'package:bureau_base/components/spacing.dart';
import 'package:bureau_base/resources/constants.dart';
import 'package:bureau_base/resources/strings.dart';
import 'package:bureau_base/resources/style.dart';
import 'package:bureau_base/respository/local_repository.dart';
import 'package:flutter/material.dart';
import 'package:forui/forui.dart';
import 'package:multi_dropdown/multi_dropdown.dart';

class CreatePostScreen extends StatefulWidget {
  static const String route = "/create-post";
  const CreatePostScreen({super.key});

  @override
  State<CreatePostScreen> createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends State<CreatePostScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final LocalRepository localRepository = LocalRepository();
  final GlobalKey<FormFieldState> _cityKey = GlobalKey();

  final MultiSelectController<String> _controller = MultiSelectController();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descController = TextEditingController();
  final TextEditingController _quotationController = TextEditingController();

  bool hideDetails = false;

  final List<dynamic> states = [];
  final List<dynamic> cities = [];
  String? selectedState;
  String? selectedCity;

  final List<String> items = [
    "Plumbing",
    "Carpentry",
    "Orchestra"
  ]; //TODO CHANGE THIS

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
      child: ListView(
        children: [
          Center(
            child: Text(
              "Create Job Post",
              style: context.theme.typography.xl4,
            ),
          ),
          const Spacing(large: true),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  FTextField(
                    hint: "Construction Work Manager",
                    keyboardType: TextInputType.name,
                    label: const Text("Title"),
                    maxLength: Constants.postTitleMaxLength,
                    controller: _titleController,
                  ),
                  FTextField.multiline(
                    hint: "",
                    label: const Text("Description"),
                    controller: _descController,
                  ),
                  const Spacing(
                    large: true,
                  ),
                  FTextField(
                    label: const Text("Quotation"),
                    hint: "10k - 20k",
                    controller: _quotationController,
                  ),
                  const Spacing(
                    large: true,
                  ),
                  MultiDropdown(
                    items: Constants.qualifications.entries
                        .map(
                          (e) => DropdownItem(label: e.value, value: e.key),
                        )
                        .toList(),
                    fieldDecoration: const FieldDecoration(
                      hintText: "Select Eligible Qualifications",
                    ),
                    controller: _controller,
                  ),
                  const Spacing(large: true),
                  ResidenceDropdown(
                    heading: Strings.selectState,
                    validatorMessage: Strings.selectState,
                    onChanged: (value) {
                      selectedState = value;
                      _fetchCities();
                    },
                    onSaved: (value) {
                      selectedState = value;
                      _fetchCities();
                    },
                    items: states,
                  ),
                  const Spacing(large: true),
                  ResidenceDropdown(
                    heading: Strings.selectCity,
                    validatorMessage: Strings.selectCity,
                    onChanged: (value) {
                      selectedCity = value;
                    },
                    onSaved: (value) {
                      selectedCity = value;
                    },
                    items: cities,
                    key: _cityKey,
                  ),
                  const Spacing(large: true),
                  MultiDropdown<String>(
                    items: items
                        .map((e) => DropdownItem(label: e, value: e))
                        .toList(),
                    enabled: true,
                    singleSelect: false,
                    chipDecoration: const ChipDecoration(
                        backgroundColor: Style.primaryColor),
                    searchEnabled: true,
                    fieldDecoration:
                        const FieldDecoration(hintText: "Select your industry"),
                    controller: _controller,
                  ),
                  const Spacing(large: true),
                  Row(
                    children: [
                      FCheckbox(
                        onChange: (value) => hideDetails = value,
                      ),
                      const Spacing(),
                      const Text("Hide my details"),
                    ],
                  ),
                  const Spacing(large: true),
                  FButton(
                      onPress: () {
                        _onSubmit();
                      },
                      label: const Text("Submit")),
                  const Spacing(large: true),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _onSubmit() {}
}
