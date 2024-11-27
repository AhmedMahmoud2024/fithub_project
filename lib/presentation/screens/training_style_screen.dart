
import 'package:flutter/material.dart';
import '../widgets/custom_heading.dart';
import '../widgets/next_Button.dart';
import '../widgets/training_style_card.dart';


class TrainingStyleScreen extends StatefulWidget {
  @override
  _TrainingStyleScreenState createState() => _TrainingStyleScreenState();
}

class _TrainingStyleScreenState extends State<TrainingStyleScreen> {
  List<String> _selectedStyles = [];

  void _selectStyle(String style) {
    setState(() {
      if (_selectedStyles.contains(style)) {
        _selectedStyles.remove(style);
      } else {
        _selectedStyles.add(style);
      }
    });
  }

  void _submitStyles() {
    if (_selectedStyles.isNotEmpty) {
      // Implement submission logic here
      print('Selected Styles: $_selectedStyles');
     // Navigator.push(context, MaterialPageRoute(builder: (context) => TrainingEnvironmentFormScreen(),));
    } else {
      // Show an error message or toast
      print('Please select at least one style');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CustomHeading(
                step: 'الخطوة 6',
                question: 'اختار نمط التدريب المناسب لك؟',
                subtitle: 'تخصيص تجربة التدريب الخاصة بك داخل التطبيق وفقًا لتفضيلاتك وأسلوب التدريب المفضل لديك.',
              ),
              const SizedBox(height: 32),
              TrainingStyleCard(
                title: 'خطط التدريب الشخصية',
                description: "استلم خطط تدريب شخصية مصممة خصيصًا لأهدافك ومستوى لياقتك وتفضيلاتك، لتوجيهك خطوة بخطوة نحو تحقيق النتائج.",
                isSelected: _selectedStyles.contains('خطط التدريب الشخصية'),
                onSelect: _selectStyle,
              ),
              const SizedBox(height: 8),
              TrainingStyleCard(
                title: 'صفوف اللياقة الجماعية',
                description: "انضم إلى صفوف اللياقة البدنية التي يقودها المدربون وتغطي أنماط تدريب مختلفة ومستويات الشدة، مما يعزز التحفيز وروح التعاون بين المشاركين.",
                isSelected: _selectedStyles.contains('صفوف اللياقة الجماعية'),
                onSelect: _selectStyle,
              ),
              const SizedBox(height: 8),
              TrainingStyleCard(
                title: 'جلسات التدريب الافتراضية',
                description: "شارك في جلسات تدريب افتراضية فردية مع المدربين المعتمدين عبر المكالمات الفيديو أو الرسائل داخل التطبيق، لتلقي التوجيه والتغذية الراجعة الشخصية على تقدمك.",
                isSelected: _selectedStyles.contains('جلسات التدريب الافتراضية'),
                onSelect: _selectStyle,
              ),
              const SizedBox(height: 8),
              TrainingStyleCard(
                title: 'التمارين التوجيهية الذاتية',
                description: "اتبع تمارين توجيهية ذاتية القيادة وتمارينًا تم اختيارها بعناية من قبل خبراء اللياقة، مما يتيح لك مرونة في جدول التدريب واختيار التمارين.",
                isSelected: _selectedStyles.contains('التمارين التوجيهية الذاتية'),
                onSelect: _selectStyle,
              ),
              const SizedBox(height: 8),
              TrainingStyleCard(
                title: 'مزيج من أساليب التدريب',
                description: "استمتع بمزيج من الأساليب والتقنيات التوجيهية المختلفة والمصممة خصيصًا لتفضيلاتك، مما يجمع بين الخطط الشخصية وصفوف اللياقة الجماعية والتدريب الافتراضي لتجربة لياقة بدنية شاملة.",
                isSelected: _selectedStyles.contains('مزيج من أساليب التدريب'),
                onSelect: _selectStyle,
              ),
              const SizedBox(height: 32),
              NextButton(onPressed: _submitStyles),
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
      ),
    );
  }
}
