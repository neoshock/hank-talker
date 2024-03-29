// ignore_for_file: cascade_invocations, inference_failure_on_function_invocation, strict_raw_type, avoid_dynamic_calls

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:hank_talker_mobile/core/profile/providers/profile_provider.dart';
import 'package:hank_talker_mobile/features/content/models/lesson_model.dart';
import 'package:hank_talker_mobile/features/content/pages/correct_sentence.dart';
import 'package:hank_talker_mobile/features/content/pages/finish_test_page.dart';
import 'package:hank_talker_mobile/features/content/pages/link_word_image.dart';
import 'package:hank_talker_mobile/features/content/pages/loading_screen.dart';
import 'package:hank_talker_mobile/features/content/pages/select_correct_image.dart';
import 'package:hank_talker_mobile/features/content/pages/select_correct_word.dart';
import 'package:hank_talker_mobile/features/content/provider/content_provider.dart';
import 'package:hank_talker_mobile/features/content/widgets/custom_test_progress_bar.dart';
import 'package:hank_talker_mobile/features/content/widgets/error_modal_bottom.dart';
import 'package:hank_talker_mobile/features/content/widgets/success_modal_bottom.dart';
import 'package:hank_talker_mobile/widgets/failed_page.dart';
import 'package:provider/provider.dart';

class TestContentPage extends StatefulWidget {
  final int lessonId;
  const TestContentPage({Key? key, required this.lessonId}) : super(key: key);

  @override
  _TestContentPageState createState() => _TestContentPageState();
}

class _TestContentPageState extends State<TestContentPage> {
  final player = AudioPlayer();
  final PageController pageController = PageController();
  Future? lessonDetailFuture;
  BuildContext? modalContext;

  int currentQuestion = 0;
  bool dataLoaded = false;
  bool isFinished = false;

  void checkAnswer(bool onCorrectAnswer) {
    if (!onCorrectAnswer) {
      playSound('sounds/incorrect.ogg');
      Provider.of<ProfileProvider>(context, listen: false).decrementHeart();
    } else {
      playSound('sounds/correct.mp3');
    }

    showModalBottomSheet(
      context: context,
      isDismissible: false,
      enableDrag: false,
      backgroundColor: Colors.transparent,
      barrierColor: Colors.transparent,
      builder: (BuildContext context) {
        modalContext = context;
        return PopScope(
          child: onCorrectAnswer
              ? SuccessModalBottom(onSuccess: onNextQuestion)
              : ErrorModalBottom(onSuccess: onNextQuestion),
        );
      },
    );
  }

  void playSound(String soundUrl) {
    player.play(AssetSource(soundUrl));
  }

  void onNextQuestion() {
    setState(() {
      currentQuestion++;
    });
    pageController.animateToPage(
      currentQuestion,
      duration: const Duration(milliseconds: 500),
      curve: Curves.ease,
    );
  }

  Widget getQuestionPage(String type, Question question, int totalExp,
      {int? length}) {
    // validate if is the last question
    if (currentQuestion >= length!) {
      return FinishTestPage(
        lessonId: widget.lessonId,
        totalExp: totalExp,
      );
    }
    switch (type) {
      case 'select_correct_word':
        return SelectCorrectWord(
          questionModel: question,
          onCheckAnswer: checkAnswer,
        );

      case 'select_correct_image':
        return SelectCorrectImage(
          questionModel: question,
          onCheckAnswer: checkAnswer,
        );

      case 'link_word_image':
        return LinkWordImage(
          questionModel: question,
          onCheckAnswer: checkAnswer,
        );

      case 'correct_sentence':
        return CorrectSentence(
          questionModel: question,
          onCheckAnswer: checkAnswer,
        );
      default:
        return Container();
    }
  }

  @override
  void initState() {
    super.initState();
    lessonDetailFuture = Provider.of<ContentProvider>(context, listen: false)
        .getLessonDetail(widget.lessonId);
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ContentProvider(),
      builder: (context, child) {
        return Scaffold(
          body: FutureBuilder(
            future: lessonDetailFuture,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return const FailedPage(
                  title: '¡Atención!',
                  description:
                      'Ocurrió un error al cargar el contenido, por favor intenta de nuevo',
                );
              }
              if (snapshot.hasData) {
                final response = snapshot.data;
                if (response!.code != 200) {
                  return Center(
                    child: Text(response.message as String),
                  );
                }
                final lessonDetail = response.data as LessonDetailModel;
                final totalHeart = context
                    .watch<ProfileProvider>()
                    .userProfileModel
                    .statistic
                    .remainingLive;
                if (totalHeart <= 0) {
                  if (modalContext != null) {
                    playSound('sounds/lose.wav');
                    Navigator.of(modalContext!).pop();
                    modalContext = null;
                  }
                  return const FailedPage(
                    title: '¡Atención!',
                    description:
                        'No tienes más vidas disponibles, espera a que se recarguen',
                  );
                }

                if (lessonDetail.questions.isEmpty) {
                  return const FailedPage(
                    title: '¡Atención!',
                    description: 'No hay preguntas disponibles',
                  );
                }
                return SafeArea(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: CustomTestProgressBar(
                          currentIndex: currentQuestion,
                          totalQuestions: lessonDetail.questions.length,
                        ),
                      ),
                      Expanded(
                        child: PageView.builder(
                          controller: pageController,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: lessonDetail.questions.length,
                          itemBuilder: (context, index) {
                            return getQuestionPage(
                              lessonDetail.questions[index].questionDescription,
                              lessonDetail.questions[index],
                              lessonDetail.totalExperience,
                              length: lessonDetail.questions.length,
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                );
              } else {
                return const LoadingScreen();
              }
            },
          ),
        );
      },
    );
  }
}
