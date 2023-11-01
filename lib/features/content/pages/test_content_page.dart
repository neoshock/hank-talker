import 'package:flutter/material.dart';
import 'package:hank_talker_mobile/features/content/models/link_word_image_model.dart';
import 'package:hank_talker_mobile/features/content/models/question_model.dart';
import 'package:hank_talker_mobile/features/content/models/select_image_model.dart';
import 'package:hank_talker_mobile/features/content/pages/correct_sentence.dart';
import 'package:hank_talker_mobile/features/content/pages/finish_test_page.dart';
import 'package:hank_talker_mobile/features/content/pages/link_word_image.dart';
import 'package:hank_talker_mobile/features/content/pages/loading_screen.dart';
import 'package:hank_talker_mobile/features/content/pages/select_correct_image.dart';
import 'package:hank_talker_mobile/features/content/pages/select_correct_word.dart';
import 'package:hank_talker_mobile/features/content/widgets/custom_test_progress_bar.dart';
import 'package:hank_talker_mobile/features/content/widgets/error_modal_bottom.dart';
import 'package:hank_talker_mobile/features/content/widgets/success_modal_bottom.dart';

class TestContentPage extends StatefulWidget {
  const TestContentPage({Key? key}) : super(key: key);

  @override
  _TestContentPageState createState() => _TestContentPageState();
}

class _TestContentPageState extends State<TestContentPage> {
  final PageController pageController = PageController();
  List<Widget> questionsPages = [];
  final List<QuestionModel> questions = [
    QuestionModel(
      id: 1,
      title: 'Selecciona la imagen correcta',
      content: LinkWordImageModel(images: [
        LinkedImageModel(imageUrl: 'https://picsum.photos/200', value: '1'),
        LinkedImageModel(imageUrl: 'https://picsum.photos/200', value: '2'),
        LinkedImageModel(imageUrl: 'https://picsum.photos/200', value: '3'),
        LinkedImageModel(imageUrl: 'https://picsum.photos/200', value: '4'),
      ], words: [
        LinkedWordModel(word: 'Uno', value: '1'),
        LinkedWordModel(word: 'Dos', value: '2'),
        LinkedWordModel(word: 'Tres', value: '3'),
        LinkedWordModel(word: 'Cuatro', value: '4'),
      ]),
      answer: '1',
      questionType: 'link_word_image',
    ),
    QuestionModel(
      id: 2,
      title: 'Selecciona la imagen correcta',
      content: [
        SelectImageModel(
            name: 'Uno', imageUrl: 'https://picsum.photos/200', value: '1'),
        SelectImageModel(
            name: 'Dos', imageUrl: 'https://picsum.photos/200', value: '2'),
        SelectImageModel(
            name: 'Tres', imageUrl: 'https://picsum.photos/200', value: '3'),
        SelectImageModel(
            name: 'Cuatro', imageUrl: 'https://picsum.photos/200', value: '4'),
      ],
      answer: '1',
      questionType: 'select_correct_image',
    ),
    QuestionModel(
      id: 3,
      title: 'Selecciona la palabra correcta',
      content: [],
      answer: '1',
      questionType: 'select_correct_word',
    ),
    QuestionModel(
      id: 4,
      title: 'Selecciona la palabra correcta',
      content: [],
      answer: '1',
      questionType: 'select_correct_word',
    ),
    QuestionModel(
      id: 5,
      title: 'Selecciona la palabra correcta',
      content: [
        SelectImageModel(
            name: 'Uno', imageUrl: 'https://picsum.photos/200', value: '1'),
        SelectImageModel(
            name: 'Dos', imageUrl: 'https://picsum.photos/200', value: '2'),
        SelectImageModel(
            name: 'Tres', imageUrl: 'https://picsum.photos/200', value: '3'),
        SelectImageModel(
            name: 'Cuatro', imageUrl: 'https://picsum.photos/200', value: '4'),
      ],
      answer: '1',
      questionType: 'select_correct_image',
    ),
    QuestionModel(
      id: 6,
      title: 'Selecciona la palabra correcta',
      content: [
        SelectImageModel(
            name: 'Uno', imageUrl: 'https://picsum.photos/200', value: '1'),
        SelectImageModel(
            name: 'Dos', imageUrl: 'https://picsum.photos/200', value: '2'),
        SelectImageModel(
            name: 'Tres', imageUrl: 'https://picsum.photos/200', value: '3'),
        SelectImageModel(
            name: 'Cuatro', imageUrl: 'https://picsum.photos/200', value: '4'),
      ],
      answer: '1',
      questionType: 'select_correct_image',
    ),
    QuestionModel(
      id: 7,
      title: 'Arme la oración correcta',
      content: [],
      answer: '1',
      questionType: 'correct_sentence',
    ),
  ];

  int currentQuestion = 0;
  bool dataLoaded = false;
  bool isFinished = false;

  void checkAnswer(String answer) {
    _showBottomDialog(context);
  }

  void _showBottomDialog(BuildContext context) {
    // set random bool
    bool isCorrect = true;
    if (currentQuestion == 2 || currentQuestion == 4) {
      isCorrect = false;
    } else if (currentQuestion == 5) {
      isCorrect = true;
    }
    showModalBottomSheet(
        context: context,
        isDismissible: false,
        backgroundColor: Colors.transparent,
        barrierColor: Colors.transparent,
        builder: (BuildContext context) {
          return isCorrect
              ? SuccessModalBottom(
                  onSuccess: onNextQuestion,
                )
              : ErrorModalBottom(
                  onSuccess: onNextQuestion,
                );
        });
  }

  void onNextQuestion() {
    if (currentQuestion < questions.length) {
      pageController.nextPage(
          duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
      setState(() {
        currentQuestion++;
      });
    }
    if (currentQuestion == questions.length) {
      setState(() {
        isFinished = true;
      });
    }
  }

  Future<void> loadData() async {
    await Future.delayed(Duration(seconds: 1));
    List.generate(
      questions.length,
      (index) {
        if (questions[index].questionType == 'link_word_image') {
          return questionsPages.add(LinkWordImage(
            onCheckAnswer: checkAnswer,
            questionModel: questions[index],
          ));
        } else if (questions[index].questionType == 'select_correct_image') {
          return questionsPages.add(SelectCorrectImage(
            onCheckAnswer: checkAnswer,
            questionModel: questions[index],
          ));
        } else if (questions[index].questionType == 'select_correct_word') {
          return questionsPages.add(SelectCorrectWord(
            onCheckAnswer: checkAnswer,
            questionModel: questions[index],
          ));
        } else if (questions[index].questionType == 'correct_sentence') {
          return questionsPages.add(CorrectSentence(
            onCheckAnswer: checkAnswer,
            questionModel: questions[index],
          ));
        }
      },
    );
    setState(() {
      dataLoaded =
          true; // Marcar los datos como cargados cuando la carga está completa
    });
  }

  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: dataLoaded
                ? isFinished
                    ? FinishTestPage(totalExp: 300)
                    : Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(15),
                            child: CustomTestProgressBar(
                              currentIndex: currentQuestion,
                              totalQuestions: questions.length,
                            ),
                          ),
                          Expanded(
                            child: PageView.builder(
                              controller: pageController,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: questions.length,
                              itemBuilder: (context, index) {
                                return questionsPages[index];
                              },
                            ),
                          )
                        ],
                      )
                : LoadingScreen()));
  }
}
