import 'package:flutter/material.dart';
import 'dart:async';

class LearningScreen extends StatefulWidget {
  @override
  _LearningScreenState createState() => _LearningScreenState();
}

class _LearningScreenState extends State<LearningScreen> {
  final List<String> plans = ["5 слов", "10 слов", "15 слов"];
  int _selectedPlanIndex = -1; // -1 означает, что ни один план не выбран

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: <Widget>[
          Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.3,
                width: double.infinity,
                color: Color(0xFF0F0F0F),
                padding: EdgeInsets.only(bottom: 16.0, left: 38.0),
                alignment: Alignment.bottomLeft,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "количество",
                      style: TextStyle(
                        fontFamily: 'GothamPro',
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                        fontSize: 40,
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      "Выберите один из трех доступных режимов для вашего ежедневного теста.",
                      style: TextStyle(
                        fontFamily: 'GothamPro',
                        color: Color(0xFF6F6F6F),
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 16.0,
                left: 16.0,
                child: IconButton(
                  icon: Image.asset('assets/back.png', color: Colors.white),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: plans.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => setState(() => _selectedPlanIndex = index),
                  child: Card(
                    color: Color(0xFF0F0F0F),
                    shape: RoundedRectangleBorder(
                      side: _selectedPlanIndex == index
                          ? BorderSide(color: Color(0xff003AFF), width: 2.0)
                          : BorderSide.none,
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.15,
                      child: Center(
                        child: Text(
                          plans[index],
                          style: TextStyle(
                            fontFamily: 'GothamPro',
                            color: _selectedPlanIndex == index
                                ? Color(0xFF003AFF)
                                : Color(0xFF6F6F6F),
                            fontSize: 24,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: _selectedPlanIndex != -1
                  ? () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CategoryScreen()),
                      );
                    }
                  : null,
              style: ElevatedButton.styleFrom(
                primary:
                    _selectedPlanIndex != -1 ? Color(0xFF003AFF) : Colors.grey,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                minimumSize: Size(double.infinity, 50),
              ),
              child: Text(
                "продолжить",
                style: TextStyle(
                  fontFamily: 'GothamPro',
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CategoryScreen extends StatefulWidget {
  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  final List<String> categories = [
    'Animals',
    'Business',
    'Food & Drink',
    'Science',
    'Sport',
    'Travel',
  ];
  List<int> _selectedCategoryIndices = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: <Widget>[
          Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.3,
                width: double.infinity,
                color: Color(0xFF0F0F0F),
                padding: EdgeInsets.only(bottom: 16.0, left: 38.0),
                alignment: Alignment.bottomLeft,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Категории",
                      style: TextStyle(
                        fontFamily: 'GothamPro',
                        color: Colors.white,
                        fontSize: 40,
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      "Выберите 2 категории, которые вас интересуют для будущего изучения.",
                      style: TextStyle(
                        fontFamily: 'GothamPro',
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 32.0,
                left: 12.0,
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Image.asset('assets/back.png'),
                ),
              ),
            ],
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 3 / 2,
              ),
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      if (_selectedCategoryIndices.contains(index)) {
                        _selectedCategoryIndices.remove(index);
                      } else if (_selectedCategoryIndices.length < 2) {
                        _selectedCategoryIndices.add(index);
                      }
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: Color(0xFF0F0F0F),
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(
                        color: _selectedCategoryIndices.contains(index)
                            ? Color(0xFF6F6F6F)
                            : Colors.white,
                        width: 2.0,
                      ),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      categories[index],
                      style: TextStyle(
                        fontFamily: 'GothamPro',
                        color: _selectedCategoryIndices.contains(index)
                            ? Color(0xFF6F6F6F)
                            : Colors.white,
                        fontSize: 24,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: _selectedCategoryIndices.length == 2
                  ? () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => DoneScreen()),
                      );
                    }
                  : null,
              style: ElevatedButton.styleFrom(
                primary: _selectedCategoryIndices.length == 2
                    ? Color(0xFF003AFF)
                    : Colors.grey,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                minimumSize: Size(double.infinity, 50),
              ),
              child: Text(
                "Продолжить",
                style: TextStyle(
                  fontFamily: 'GothamPro',
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DoneScreen extends StatefulWidget {
  @override
  _DoneScreenState createState() => _DoneScreenState();
}

class _DoneScreenState extends State<DoneScreen> {
  @override
  void initState() {
    super.initState();
    startTimer();
  }

  startTimer() async {
    var _duration = Duration(seconds: 3);
    return Timer(_duration, navigateToStudyScreen);
  }

  navigateToStudyScreen() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => StudyScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Image.asset('assets/done.png'),
      ),
    );
  }
}

class StudyScreen extends StatefulWidget {
  @override
  _StudyScreenState createState() => _StudyScreenState();
}

class _StudyScreenState extends State<StudyScreen> {
  int _currentQuestionIndex = 0;
  int _score = 0;
  List<String> _questions = [
    'Question 1',
    'Question 2',
    'Question 3',
    //...
  ];
  List<List<String>> _answers = [
    ['Option 1', 'Option 2', 'Option 3', 'Option 4'],
    ['Option 1', 'Option 2', 'Option 3', 'Option 4'],
    ['Option 1', 'Option 2', 'Option 3', 'Option 4'],
    //...
  ];
  List<int> _correctAnswers = [1, 0, 2]; // indexes of the correct answers

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: LayoutBuilder(builder: (context, constraints) {
          return Column(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    _buildStatusCard('eye.png', _score.toString(), constraints),
                    _buildStatusCard(
                        'done.png',
                        '${_currentQuestionIndex + 1}/${_questions.length}',
                        constraints),
                  ],
                ),
              ),
              Expanded(
                flex: 3,
                child: _buildQuestionCard(
                    _questions[_currentQuestionIndex], constraints),
              ),
              SizedBox(height: 20),
              ..._answers[_currentQuestionIndex].asMap().entries.map(
                    (entry) => Expanded(
                      flex: 1,
                      child: _buildAnswerCard(
                          entry.value,
                          entry.key == _correctAnswers[_currentQuestionIndex],
                          constraints),
                    ),
                  ),
            ],
          );
        }),
      ),
    );
  }

  Widget _buildStatusCard(
      String imagePath, String text, BoxConstraints constraints) {
    return Card(
      color: Colors.grey[900],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(38),
      ),
      child: Center(
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset('assets/$imagePath',
                  width: constraints.maxWidth * 0.1),
              SizedBox(width: 10),
              Text(
                text,
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildQuestionCard(String question, BoxConstraints constraints) {
    return Card(
      color: Colors.grey[900],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(38),
      ),
      child: Center(
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Text(
            question,
            style: TextStyle(color: Colors.white, fontSize: 24),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

  Widget _buildAnswerCard(
      String answer, bool isCorrect, BoxConstraints constraints) {
    return Card(
      color: Colors.grey[900],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(38),
      ),
      child: ListTile(
        title: Center(
          child: Text(
            answer,
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
        onTap: () {
          if (isCorrect) {
            setState(() {
              _score += 100;
              _currentQuestionIndex++;
            });
          } else {
            // Incorrect answer, show feedback
          }
        },
      ),
    );
  }
}
