import 'package:flutter/material.dart';
import '../widgets/custom_heading.dart';
import '../widgets/next_Button.dart';
import '../widgets/sport_card.dart';
class SportsScreen extends StatefulWidget {
  @override
  _SportsScreenState createState() => _SportsScreenState();
}

class _SportsScreenState extends State<SportsScreen> {
  List<String> _selectedSports = [];

  void _selectSport(String sport) {
    setState(() {
      if (_selectedSports.contains(sport)) {
        _selectedSports.remove(sport);
      } else {
        _selectedSports.add(sport);
      }
    });
  }

  void _submitSports() {
    if (_selectedSports.isNotEmpty) {
      // Implement submission logic here
      print('Selected Sports: $_selectedSports');
    //  Navigator.push(context, MaterialPageRoute(builder: (context) => GoalsFormScreen(),));
    } else {
      // Show an error message or toast
      print('Please select at least one sport');
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
                step: 'الخطوة 4',
                question: 'ما هي الرياضات التى تهمك؟',
                subtitle: 'اختر واحدة أو اكثر من هذه الرياضات وسنقوم بتخصيص التطبيق لمساعدتك فى التمرن عليها',
              ),
              const SizedBox(height: 32),
              GridView(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: (374 / 68) / (68 / 48),
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                ),
                children: [
                  SportCard(
                    sport: 'كرة السلة',
                    iconPath: 'assets/sport.svg',
                    isSelected: _selectedSports.contains('كرة السلة'),
                    onSelect: _selectSport,
                  ),
                  SportCard(
                    sport: 'كرة الشاطئ',
                    iconPath: 'assets/sport-2.svg',
                    isSelected: _selectedSports.contains('كرة الشاطئ'),
                    onSelect: _selectSport,
                  ),
                  SportCard(
                    sport: 'السباحة',
                    iconPath: 'assets/sport-3.svg',
                    isSelected: _selectedSports.contains('السباحة'),
                    onSelect: _selectSport,
                  ),
                  SportCard(
                    sport: 'التزحلق',
                    iconPath: 'assets/sport-4.svg',
                    isSelected: _selectedSports.contains('التزحلق'),
                    onSelect: _selectSport,
                  ),
                  SportCard(
                    sport: 'البولينج',
                    iconPath: 'assets/sport-5.svg',
                    isSelected: _selectedSports.contains('البولينج'),
                    onSelect: _selectSport,
                  ),
                  SportCard(
                    sport: 'كرة القدم الامريكية',
                    iconPath: 'assets/sport-6.svg',
                    isSelected: _selectedSports.contains('كرة القدم الامريكية'),
                    onSelect: _selectSport,
                  ),
                  SportCard(
                    sport: 'الالعاب الالكترونيه',
                    iconPath: 'assets/sport-7.svg',
                    isSelected: _selectedSports.contains('الالعاب الالكترونيه'),
                    onSelect: _selectSport,
                  ),
                  SportCard(
                    sport: 'التنس',
                    iconPath: 'assets/sport-8.svg',
                    isSelected: _selectedSports.contains('التنس'),
                    onSelect: _selectSport,
                  ),
                  SportCard(
                    sport: 'رالى',
                    iconPath: 'assets/sport-9.svg',
                    isSelected: _selectedSports.contains('رالى'),
                    onSelect: _selectSport,
                  ),
                  SportCard(
                    sport: 'السباقات',
                    iconPath: 'assets/sport-10.svg',
                    isSelected: _selectedSports.contains('السباقات'),
                    onSelect: _selectSport,
                  ),
                  SportCard(
                    sport: 'الخيل',
                    iconPath: 'assets/sport-11.svg',
                    isSelected: _selectedSports.contains('الخيل'),
                    onSelect: _selectSport,
                  ),
                  SportCard(
                    sport: 'الترحلق على الجليد',
                    iconPath: 'assets/sport-12.svg',
                    isSelected: _selectedSports.contains('الترحلق على الجليد'),
                    onSelect: _selectSport,
                  ),
                  SportCard(
                    sport: 'كرة الطاولة',
                    iconPath: 'assets/sport-13.svg',
                    isSelected: _selectedSports.contains('كرة الطاولة'),
                    onSelect: _selectSport,
                  ),
                  SportCard(
                    sport: 'الشطرنج',
                    iconPath: 'assets/sport-14.svg',
                    isSelected: _selectedSports.contains('الشطرنج'),
                    onSelect: _selectSport,
                  ),
                ],
              ),
              const SizedBox(height: 32),
                  NextButton(onPressed: _submitSports),
            ],
          ),
        ),
      ),
    );
  }
}
