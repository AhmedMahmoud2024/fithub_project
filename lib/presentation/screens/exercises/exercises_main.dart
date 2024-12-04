import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

import '_widgets/workout_list.dart';

class ExercisesMain extends StatefulWidget {
  const ExercisesMain({super.key});

  @override
  _ExercisesMainState createState() => _ExercisesMainState();
}

class _ExercisesMainState extends State<ExercisesMain> {
  final ValueNotifier<String> _searchQuery = ValueNotifier('');

  List<WorkoutPlan> _workoutPlans = [];
  List<WorkoutPlan> _filteredWorkoutPlans = [];

  Future<List<WorkoutPlan>> fetchWorkoutPlans() async {
    final response = await rootBundle.loadString('assets/exercises.json');
    final List<dynamic> data = jsonDecode(response);
    print(data);
    return data.where((item) => item != null).map((item) => WorkoutPlan.fromJson(item)).toList();
  }

  @override
  void initState() {
    super.initState();
    fetchWorkoutPlans().then((workoutPlans) {
      setState(() {
        _workoutPlans = workoutPlans;
        _filteredWorkoutPlans = workoutPlans;
      });
    });
    _searchQuery.addListener(_updateSearchResults);
  }

  @override
  void dispose() {
    _searchQuery.removeListener(_updateSearchResults);
    _searchQuery.dispose();
    super.dispose();
  }

  void _updateSearchResults() {
    setState(() {
      _filteredWorkoutPlans = _workoutPlans.where((plan) => plan.name!.toLowerCase().contains(_searchQuery.value.toLowerCase())).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SearchInput(
          hintText: 'Search',
          onChanged: (value) {
            _searchQuery.value = value;
          },
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(8.0),
        child: _filteredWorkoutPlans.isEmpty
            ? const Center(child: Text('No exercises match your search.'))
            : WorkoutPlanListScreen(workoutPlans: _filteredWorkoutPlans),
      ),
    );
  }
}

class SearchInput extends StatelessWidget {
  final String hintText;
  final Function(String)? onChanged;

  const SearchInput({
    super.key,
    required this.hintText,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFFDDE4EE)),
      ),
      child: Row(
        children: [
          SvgPicture.asset('assets/icons/24-search.svg'),
          const SizedBox(width: 16),
          Expanded(
            child: TextField(
              onChanged: onChanged,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: hintText,
                hintStyle: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF66768E),
                  height: 1.5,
                ),
              ),
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Color(0xFF66768E),
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
