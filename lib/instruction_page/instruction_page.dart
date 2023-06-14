import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:izimemo/custom/colors/custom_design_colors.dart';

class InstructionPage extends StatelessWidget {
  InstructionPage({super.key});

  final introKey = GlobalKey<IntroductionScreenState>();

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      key: introKey,
      // globalBackgroundColor: CustomDesignColors.darkBlue,
      globalBackgroundColor: CustomDesignColors.mediumBlue,
      nextFlex: 0,
      skipOrBackFlex: 0,
      pages: [
        PageViewModel(
          // title: 'Для чего эта программа?',
          title: 'Это необычная программа',
          body: '''
Она позволяет учить иностранные языки прямо во время твоего отдыха в телефоне.

Она идеально подходит, чтобы зубрить новые или повторять знакомые слова.
''',
          image: Image.asset("assets/instruction/page_1_3.png", height: 220.0),
          decoration: const PageDecoration(
            titleTextStyle: TextStyle(fontSize: 22),
            bodyTextStyle: TextStyle(fontSize: 16),
          ),
        ),
        PageViewModel(
          title: 'В этой программе ты можешь открыть любой сайт',
          body: 'Это могут быть твои любимые социальные сети, новости, онлайн-игры, фильмы или музыка.',
          image: Image.asset('assets/instruction/page_2_3.png', height: 220.0),
          decoration: const PageDecoration(
            titleTextStyle: TextStyle(fontSize: 22),
            bodyTextStyle: TextStyle(fontSize: 16),
          ),
        ),
        PageViewModel(
          title: 'Самое главное — внизу программы',
          body: '''
Там ты увидишь поле, где по кругу листаются иностранные слова, пока ты их не выучишь.

Это происходит прямо во время того, как ты смотришь в программе то, что хочешь.
''',
          image: Image.asset('assets/instruction/page_3_3.png', height: 220.0),
          decoration: const PageDecoration(
            titleTextStyle: TextStyle(fontSize: 22),
            bodyTextStyle: TextStyle(fontSize: 16),
          ),
        ),
        PageViewModel(
          title: 'Нажми на слово, когда ты его выучил',
          body: '''
В появившемся меню нажми Пропустить. На место этого слова подставится следующее из словаря. 

Делай так, пока всё не выучишь.
''',
          image: Image.asset('assets/instruction/page_4_2.png', height: 220.0),
          decoration: const PageDecoration(
            titleTextStyle: TextStyle(fontSize: 22),
            bodyTextStyle: TextStyle(fontSize: 16),
          ),
        ),
        PageViewModel(
          title: 'Используй закладки тех сайтов, где мы тратим больше всего времени',
          body: '''
Нажми на сердечко, чтобы добавить новую закладку.

Чтобы изменить или удалить свою закладку, просто нажми на неё долго.
''',
          image: Image.asset('assets/instruction/page_5_2.png', height: 220.0),
          decoration: const PageDecoration(
            titleTextStyle: TextStyle(fontSize: 22),
            bodyTextStyle: TextStyle(fontSize: 16),
          ),
        ),
        PageViewModel(
          title: 'Выбери словарь или создай свой',
          body: '''
Лучше создать свой собственный словарь. 

Добавляй в него те слова, которые ты сам часто говоришь или встречаешь в общении.
''',
          image: Image.asset('assets/instruction/page_6_1.png', height: 220.0),
          decoration: const PageDecoration(
            titleTextStyle: TextStyle(fontSize: 22),
            bodyTextStyle: TextStyle(fontSize: 16),
          ),
        ),
        PageViewModel(
          title: 'Особенности программы',
          body: '''
Надеемся, она достаточно интуитивна, и ты сможешь разобраться в ней больше.
*
Она работает с веб-версиями популярных приложений. Они имеют свои особенности, на которые мы не можем влиять. Тут решай сам, что тебе важнее.
*
Эту инструкцию ты можешь открыть в любой момент, нажав знак вопроса в меню.
''',
          image: Image.asset('assets/instruction/page_7_1.png', height: 220.0),
          decoration: const PageDecoration(
            titleTextStyle: TextStyle(fontSize: 22),
            bodyTextStyle: TextStyle(fontSize: 16),
          ),
        ),
        PageViewModel(
          title: 'Трать своё время в телефоне продуктивно',
          body: 'Всё можно выучить, если делать это каждый день, насколько тебе комфортно.',
          image: Image.asset('assets/instruction/page_8_1.png', height: 220.0),
          decoration: const PageDecoration(
            titleTextStyle: TextStyle(fontSize: 22),
            bodyTextStyle: TextStyle(fontSize: 16),
          ),
        ),
      ],
      onDone: () {
        // Action to perform after the last page is shown (e.g., go to the home screen)
        // You can navigate to a new screen or set a flag to indicate the user has seen the introduction
        Get.back();
      },
      onSkip: () {
        // Action to perform when the user taps on the Skip button
        // You can navigate to a new screen or set a flag to indicate the user has skipped the introduction
        Get.back();
      },
      showSkipButton: true,
      skip: const Text('Skip'),
      next: const Icon(Icons.arrow_forward),
      done: const Text('Done', style: TextStyle(fontWeight: FontWeight.w600)),
    );
  }
}
