import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_clone/presentation/widgets/next_Button.dart';
import '../widgets/custom_heading.dart';
import '../widgets/training_environment_card.dart';

class TrainingEnvironmentScreen extends StatefulWidget {
  const TrainingEnvironmentScreen({super.key});

  @override
  State<TrainingEnvironmentScreen> createState() => _TrainingEnvironmentScreenState();
}

class _TrainingEnvironmentScreenState extends State<TrainingEnvironmentScreen> {

  List<String> _selectedEnvironments = [];

  void _selectEnvironment(String environment) {
    setState(() {
      if (_selectedEnvironments.contains(environment)) {
        _selectedEnvironments.remove(environment);
      } else {
        _selectedEnvironments.add(environment);
      }
    });
  }

  void _submitEnvironments() {
    if (_selectedEnvironments.isNotEmpty) {
      // Implement submission logic here
      print('Selected Environments: $_selectedEnvironments');
     // Navigator.push(context, MaterialPageRoute(builder: (context) => BodyStatusFormScreen(),));
    } else {
      // Show an error message or toast
      print('Please select at least one environment');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        width: double.infinity,
        margin: EdgeInsets.only(right: 10.0),
        child: ListView(
          // crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                CustomHeading(
                  step: 'الخطوة 7',
                  question: 'ما هي بيئاتك المثالية للتدريب؟',
                  subtitle: 'تحديد التمارين المناسبة لك بناءً على أماكن التدريب لا تقلق يمكنك تغيير ذلك فى الاعدادات بعد ذلك',
                ),
                const SizedBox(height: 32),
                TrainingEnvironmentCard(
                  title: 'التمرين في الهواء الطلق',
                  description: 'اختر هذا الخيار إذا كنت تفضل ممارسة التمارين في الهواء الطلق مثل الركض في الحديقة أو التمارين على الشاطئ.',
                  isSelected: _selectedEnvironments.contains('التمرين في الهواء الطلق'),
                  onSelect: _selectEnvironment,
                ),
                const SizedBox(height: 8),
                TrainingEnvironmentCard(
                  title: 'صالة الألعاب الرياضية',
                  description: 'اختر هذا الخيار إذا كنت تفضل ممارسة التمارين في بيئة داخلية مجهزة مثل النوادي الرياضية أو الصالات الرياضية.',
                  isSelected: _selectedEnvironments.contains('صالة الألعاب الرياضية'),
                  onSelect: _selectEnvironment,
                ),
                const SizedBox(height: 8),
                TrainingEnvironmentCard(
                  title: 'المنزل',
                  description: 'اختر هذا الخيار إذا كنت تفضل ممارسة التمارين في راحة منزلك وباستخدام معدات التمرين الخاصة بك.',
                  isSelected: _selectedEnvironments.contains('المنزل'),
                  onSelect: _selectEnvironment,
                ),
                const SizedBox(height: 8),
                TrainingEnvironmentCard(
                  title: 'تمارين اليوغا والاسترخاء',
                  description: 'اختر هذا الخيار إذا كنت تفضل ممارسة تمارين اليوغا والاسترخاء في بيئة هادئة ومنعشة.',
                  isSelected: _selectedEnvironments.contains('تمارين اليوغا والاسترخاء'),
                  onSelect: _selectEnvironment,

                ),
                const SizedBox(height: 8),
                TrainingEnvironmentCard(
                  title: 'التمارين في مرافق متعددة',
                  description: 'اختر هذا الخيار إذا كنت تفضل الاستفادة من مرافق متعددة مثل صالات الألعاب الرياضية التي توفر مجموعة متنوعة من الأنشطة الرياضية.',
                  isSelected: _selectedEnvironments.contains('التمارين في مرافق متعددة'),
                  onSelect: _selectEnvironment,
                ),
                const SizedBox(height: 5),
                NextButton(onPressed: _submitEnvironments),
              ],
            )
            ,

          ],
        ),

      ),
    );

  }
}
