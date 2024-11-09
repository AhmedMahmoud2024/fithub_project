import 'package:flutter/material.dart';

class CityWidget extends StatefulWidget {
  @override
  _CityWidgetState createState() => _CityWidgetState();
}

class _CityWidgetState extends State<CityWidget> {
  final List<Map<String, String>> _cities = [
    {'name': 'Cairo', 'governorate': 'محافظة القاهرة'},
    {'name': 'Alexandria', 'governorate': 'محافظة الإسكندرية'},
    {'name': 'Giza', 'governorate': 'محافظة الجيزة'},
    {'name': 'Luxor', 'governorate': 'محافظة الأقصر'},
    {'name': 'Aswan', 'governorate': 'محافظة أسوان'},
    {'name': 'Port Said', 'governorate': 'محافظة بورسعيد'},
    {'name': 'Suez', 'governorate': 'محافظة السويس'},
    {'name': 'Mansoura', 'governorate': 'محافظة الدقهلية'},
    {'name': 'Tanta', 'governorate': 'محافظة الغربية'},
    {'name': 'Ismailia', 'governorate': 'محافظة الإسماعيلية'},
    {'name': 'Fayoum', 'governorate': 'محافظة الفيوم'},
    {'name': 'Minya', 'governorate': 'محافظة المنيا'},
    {'name': 'Qena', 'governorate': 'محافظة قنا'},
    {'name': 'Beni Suef', 'governorate': 'محافظة بني سويف'},
    {'name': 'Damanhur', 'governorate': 'محافظة البحيرة'},
  ];

  String? _selectedCity;
  String? _selectedGovernorate;

  void _showGovernorateBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return GovernorateBottomSheet(
          onSelect: (governorate) {
            setState(() {
              _selectedGovernorate = governorate;
            });
            Navigator.pop(context);
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'اختر المدينة والمحافظة',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Row(
          children: [
            // City Dropdown
            Expanded(
              child: DropdownButton<String>(
                hint: Text('اختر مدينة'),
                value: _selectedCity,
                items: _cities.map((city) {
                  return DropdownMenuItem<String>(
                    value: city['name'],
                    child: Text(city['name']!),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedCity = value;
                  });
                },
                underline: SizedBox(),
              ),
            ),
            SizedBox(width: 10),
            // Governorate Dropdown
            Expanded(
              child: GestureDetector(
                onTap: _showGovernorateBottomSheet,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        _selectedGovernorate ?? 'اختر محافظة',
                        style: TextStyle(color: _selectedGovernorate == null ? Colors.grey : Colors.black),
                      ),
                      Icon(Icons.arrow_drop_down),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 10),
        if (_selectedCity != null) ...[
          Text(
            'المحافظة: ${_selectedGovernorate ?? 'لم يتم اختيار محافظة'}',
            style: TextStyle(fontSize: 14),
          ),
        ],
        SizedBox(height: 20),
        // Next Button
        ElevatedButton(
          onPressed: () {
            if (_selectedCity != null && _selectedGovernorate != null) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('تم اختيار المدينة: $_selectedCity و المحافظة: $_selectedGovernorate')),
              );
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('يرجى اختيار مدينة ومحافظة أولاً.')),
              );
            }
          },
          child: Text('التالي'),
        ),
      ],
    );
  }
}

class GovernorateBottomSheet extends StatefulWidget {
  final Function(String) onSelect;

  GovernorateBottomSheet({required this.onSelect});

  @override
  _GovernorateBottomSheetState createState() => _GovernorateBottomSheetState();
}

class _GovernorateBottomSheetState extends State<GovernorateBottomSheet> {
  final List<String> _governorates = [
    'محافظة القاهرة',
    'محافظة الإسكندرية',
    'محافظة الجيزة',
    'محافظة الأقصر',
    'محافظة أسوان',
    'محافظة بورسعيد',
    'محافظة السويس',
    'محافظة الدقهلية',
    'محافظة الغربية',
    'محافظة الإسماعيلية',
    'محافظة الفيوم',
    'محافظة المنيا',
    'محافظة قنا',
    'محافظة بني سويف',
    'محافظة البحيرة',
  ];

  String _searchText = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'اختر المحافظة',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 10),
          TextField(
            decoration: InputDecoration(
              hintText: 'ابحث عن محافظة',
              border: OutlineInputBorder(),
            ),
            onChanged: (value) {
              setState(() {
                _searchText = value;
              });
            },
          ),
          SizedBox(height: 10),
          Expanded(
            child: ListView(
              children: _governorates
                  .where((gov) => gov.contains(_searchText))
                  .map((gov) {
                return ListTile(
                  title: Text(gov),
                  onTap: () {
                    widget.onSelect(gov);
                  },
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}