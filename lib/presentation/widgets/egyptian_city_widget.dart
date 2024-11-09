
import 'package:flutter/material.dart';

class EgyptianCityWidget extends StatefulWidget {
  @override
  _EgyptianCityWidgetState createState() => _EgyptianCityWidgetState();
}

class _EgyptianCityWidgetState extends State<EgyptianCityWidget> {
  final List<Map<String, String>> _governorates = [
    {'name': 'محافظة القاهرة'},
    {'name': 'محافظة الإسكندرية'},
    {'name': 'محافظة الجيزة'},
    {'name': 'محافظة الأقصر'},
    {'name': 'محافظة أسوان'},
    {'name': 'محافظة بورسعيد'},
    {'name': 'محافظة السويس'},
    {'name': 'محافظة الدقهلية'},
    {'name': 'محافظة الغربية'},
    {'name': 'محافظة الإسماعيلية'},
    {'name': 'محافظة الفيوم'},
    {'name': 'محافظة المنيا'},
    {'name': 'محافظة قنا'},
    {'name': 'محافظة بني سويف'},
    {'name': 'محافظة البحيرة'},
    {'name': 'محافظة كفر الشيخ'},
    {'name': 'محافظة دمياط'},
    {'name': 'محافظة المنوفية'},
    {'name': 'محافظة الشرقية'},
    {'name': 'محافظة الجيزة'},
    {'name': 'محافظة شمال سيناء'},
    {'name': 'محافظة جنوب سيناء'},
    {'name': 'محافظة مطروح'},
    {'name': 'محافظة الوادي الجديد'},
    {'name': 'محافظة البحر الأحمر'},
    {'name': 'محافظة أسيوط'},
    {'name': 'محافظة سوهاج'},
    {'name': 'محافظة قنا'},
    {'name': 'محافظة بني سويف'},
    {'name': 'محافظة الأقصر'},
    {'name': 'محافظة أسوان'},
  ];

  String? _selectedGovernorate;
  final TextEditingController _cityController = TextEditingController();

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
          'أدخل اسم المدينة',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        TextField(
          controller: _cityController,
          decoration: InputDecoration(
            hintText: 'أدخل المدينة',
            border: OutlineInputBorder(),
          ),
        ),
        SizedBox(height: 10),
        // Governorate Dropdown
        GestureDetector(
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
        SizedBox(height: 10),
        if (_selectedGovernorate != null) ...[
          Text(
            'المحافظة: $_selectedGovernorate',
            style: TextStyle(fontSize: 14),
          ),
        ],
        SizedBox(height: 20),
        // Next Button
        ElevatedButton(
          onPressed: () {
            if (_cityController.text.isNotEmpty && _selectedGovernorate != null) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('تم اختيار المدينة: ${_cityController.text} و المحافظة: $_selectedGovernorate')),
              );
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('يرجى إدخال المدينة واختيار محافظة أولاً.')),
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
    'محافظة كفر الشيخ',
    'محافظة دمياط',
    'محافظة المنوفية',
    'محافظة الشرقية',
    'محافظة شمال سيناء',
    'محافظة جنوب سيناء',
    'محافظة مطروح',
    'محافظة الوادي الجديد',
    'محافظة البحر الأحمر',
    'محافظة أسيوط',
    'محافظة سوهاج',
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