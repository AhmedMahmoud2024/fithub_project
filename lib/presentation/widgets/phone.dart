import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'dart:convert';
import 'package:flutter/services.dart';

class PhoneNumberInput extends StatefulWidget {
  @override
  _PhoneNumberInputState createState() => _PhoneNumberInputState();
}

class _PhoneNumberInputState extends State<PhoneNumberInput> {
  final TextEditingController _phoneController = TextEditingController();
  PhoneNumber? _phoneNumber;
  String _countryCode = '+1'; // Default country code
  List<Map<String, String>> _countryCodes = [];

  @override
  void initState() {
    super.initState();
    _loadCountryCodes();
  }

  Future<void> _loadCountryCodes() async {
    final String response = await rootBundle.loadString('assets/country_codes.json');
    final List<dynamic> data = json.decode(response);
    setState(() {
      _countryCodes = data.map((item) => {
        'code': item['code'] as String,
        'name': item['name'] as String,
      }).toList().cast<Map<String, String>>();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl, // Set text direction to RTL
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end, // Align items to the end
        children: [
          Text(
            'رقم الهاتف',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Row(
            children: [
              // Country Code Dropdown
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: DropdownButton<String>(
                  value: _countryCode,
                  items: _countryCodes.map((country) {
                    return DropdownMenuItem<String>(
                      value: country['code'],
                      child: Text('${country['code']} (${country['name']})'),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _countryCode = value!;
                    });
                  },
                  underline: SizedBox(),
                ),
              ),
              SizedBox(width: 8.0),
              // Phone Number Input Field
              Expanded(
                child: InternationalPhoneNumberInput(
                  onInputChanged: (PhoneNumber number) {
                    _phoneNumber = number;
                  },
                  selectorConfig: SelectorConfig(
                    selectorType: PhoneInputSelectorType.DROPDOWN,
                  ),
                  ignoreBlank: false,
                  autoValidateMode: AutovalidateMode.disabled,
                  selectorTextStyle: TextStyle(color: Colors.black),
                  initialValue: _phoneNumber,
                  textFieldController: _phoneController,
                  formatInput: false,
                  keyboardType: TextInputType.number,
                  inputBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  hintText: 'أدخل رقم هاتفك',
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              // Validate the phone number
              if (_phoneController.text.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('يرجى إدخال رقم الهاتف.')));
              } else {
                // Here you can handle the phone number submission
                print('رمز الدولة: $_countryCode, رقم الهاتف: ${_phoneController.text}');
              }
            },
            child: Text('إرسال'),
          ),
        ],
      ),
    );
  }
}