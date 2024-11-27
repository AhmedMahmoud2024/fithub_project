import 'package:flutter/material.dart';

import '../widgets/body_status_card.dart';
import '../widgets/custom_heading.dart';
import '../widgets/next_Button.dart';


class BodyStatusFormScreen extends StatefulWidget {
  @override
  _BodyStatusFormScreenState createState() => _BodyStatusFormScreenState();
}

class _BodyStatusFormScreenState extends State<BodyStatusFormScreen> {
  List<String> _selectedStatuses = [];

  void _selectStatus(String status) {
    setState(() {
      if (_selectedStatuses.contains(status)) {
        _selectedStatuses.remove(status);
      } else {
        _selectedStatuses.add(status);
      }
    });
  }

  void _submitStatus() {
    if (_selectedStatuses.isNotEmpty) {
      // Implement submission logic here
      print('Selected Statuses: $_selectedStatuses');
    } else {
      // Show an error message or toast
      print('Please select at least one status');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    CustomHeading(
                      step: 'الخطوة 8',
                      question: 'هل تعاني من أي إعاقة أو مرض مزمن؟',
                      subtitle: 'تساعد هذه المعلومات في اختيار التمارين و النظام والرياضات الأنسب لحالتك وأيضًا اختيار أفضل الأماكن المتاحة لك.',
                    ),
                    const SizedBox(height: 32),
                    GridView(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 8,
                        childAspectRatio: 3.5,
                      ),
                      children: _buildStatusCards(),
                    ),
                    const SizedBox(height: 15),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  NextButton(onPressed: _submitStatus),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      minimumSize: const Size(68, 56),
                      side: BorderSide(color: Color(0xFFDDE4EE)),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    onPressed: () {
                      // Implement skip logic here
                      print('Skip pressed');
                    },
                    child: Text(
                      'تخطى',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF101C2D),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildStatusCards() {
    final statuses = [
      'السكري',
      'ضغط الدم',
      'إعاقة سمعية',
      'إعاقة بصرية',
      'إعاقة حركيه',
      'إعاقة ذهنية',
      'إعاقة عقليه',
      'التوحد',
      'لا يوجد'
    ];

    return statuses.map((status) {
      return BodyStatusCard(
        status: status,
        isSelected: _selectedStatuses.contains(status),
        onSelect: _selectStatus,
      );
    }).toList();
  }
}

