import 'package:destiny_app_flutter/story_logic.dart';
import 'package:flutter/material.dart';

void main() => runApp(const Destini());

class Destini extends StatelessWidget {
  const Destini({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: const StoryPage(),
    );
  }
}

final storyLogic = StoryLogic();

class StoryPage extends StatefulWidget {
  const StoryPage({super.key});

  @override
  StoryPageState createState() => StoryPageState();
}

class StoryPageState extends State<StoryPage> {
  final title = storyLogic.getStory();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        padding: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 15.0),
        constraints: const BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                flex: 12,
                child: Center(
                  child: Text(
                    // 'Story text will go here.',
                    storyLogic.getStory(),
                    style: const TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: TextButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all<Color>(Colors.red),
                    foregroundColor:
                        WidgetStateProperty.all<Color>(Colors.white),
                  ),
                  child: Text(
                    // 'Choice 1',
                    storyLogic.getChoice1(),
                    style: const TextStyle(
                      fontSize: 18.0,
                    ),
                  ),
                  onPressed: () {
                    //Choice 1 made by user.
                    storyLogic.nextStory(1);
                    setState(() {});
                  },
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Expanded(
                flex: 2,
                child: Visibility(
                  visible: storyLogic.buttonShouldBeVisible(),
                  child: TextButton(
                    onPressed: () {
                      //Choice 2 made by user.
                      storyLogic.nextStory(2);
                      setState(() {});
                    },
                    style: ButtonStyle(
                      backgroundColor:
                          WidgetStateProperty.all<Color>(Colors.blue),
                      foregroundColor:
                          WidgetStateProperty.all<Color>(Colors.white),
                    ),
                    child: Text(
                      // 'Choice 2',
                      storyLogic.getChoice2(),
                      style: const TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
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
