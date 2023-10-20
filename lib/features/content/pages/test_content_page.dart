import 'package:flutter/material.dart';
import 'package:hank_talker_mobile/features/content/pages/finish_test_page.dart';
import 'package:hank_talker_mobile/features/content/pages/loading_screen.dart';
import 'package:hank_talker_mobile/features/content/widgets/custom_test_progress_bar.dart';
import 'package:hank_talker_mobile/features/content/widgets/error_modal_bottom.dart';
import 'package:hank_talker_mobile/features/content/widgets/success_modal_bottom.dart';
import 'package:hank_talker_mobile/widgets/buttons.dart';

class TestContentPage extends StatefulWidget {
  const TestContentPage({Key? key}) : super(key: key);

  @override
  _TestContentPageState createState() => _TestContentPageState();
}

class _TestContentPageState extends State<TestContentPage>
    with SingleTickerProviderStateMixin {
  final PageController pageController = PageController();
  int currentQuestion = 0;
  int totalQuestion = 6;
  bool dataLoaded = false;
  bool isFinished = false;

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
    if (currentQuestion < totalQuestion) {
      pageController.nextPage(
          duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
      setState(() {
        currentQuestion++;
      });
    }
    if (currentQuestion == totalQuestion) {
      setState(() {
        isFinished = true;
      });
    }
  }

  Future<void> loadData() async {
    await Future.delayed(Duration(seconds: 2));
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
                              totalQuestions: totalQuestion,
                            ),
                          ),
                          Expanded(
                            child: PageView.builder(
                              controller: pageController,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: totalQuestion,
                              itemBuilder: (context, index) {
                                return Container(
                                    margin: EdgeInsets.all(15),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: Theme.of(context)
                                            .colorScheme
                                            .secondary),
                                    child: Center(
                                      child: ElevatedButton(
                                        onPressed: () {
                                          _showBottomDialog(context);
                                        },
                                        child: Text('Mostrar Diálogo'),
                                      ),
                                    ));
                              },
                            ),
                          )
                        ],
                      )
                : LoadingScreen()));
  }
}
