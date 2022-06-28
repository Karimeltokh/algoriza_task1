import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:task1/componants/componants.dart';
import 'package:task1/screens/login_screen.dart';
import 'package:task1/screens/sign_up_screen.dart';

class BoardingModel {
  final String image;
  final String title;
  final String body;

  BoardingModel({
    required this.title,
    required this.image,
    required this.body,
  });
}

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  var boardController = PageController();
  List<BoardingModel> boarding = [
    BoardingModel(
      image: 'images/image1.png',
      title: 'Get food delivery to your doorstep asap',
      body: 'We have young and professional delivery team that will bring your food as soon as possible to your doorstep',
    ),
    BoardingModel(
      image: 'images/image2.png',
      title: 'Buy Any food from your favorite restaurant',
      body: 'We are constantly adding your favourite restaurant throughout the territory and around your area carefully selected',
    ),
    BoardingModel(
      image: 'images/image3.png',
      title: 'Buy Any food from your favorite restaurant',
      body: 'We are constantly adding your favourite restaurant throughout the territory and around your area carefully selected',
    ),
  ];
  bool isLast = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.white,
            statusBarIconBrightness: Brightness.dark,
          ),
          iconTheme: const IconThemeData(
            color: Colors.black,
          ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(30)
              ),
                child: TextButton(
                    onPressed: (){
                      navigateAndFinish(context, const LoginScreen());
                    },
                    child: const Text('skip',style: TextStyle(color: Colors.black),)),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                physics: const BouncingScrollPhysics(),
                controller: boardController,
                onPageChanged: (int index) {
                  if (index == boarding.length - 1) {
                    setState(() {
                      isLast = true;
                    });
                  } else {
                    setState(() {
                      isLast = false;
                    });
                  }
                },
                itemBuilder: (context, index) =>
                    buildBoardingItem(boarding[index]),
                itemCount: boarding.length,
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Column(
              children: [
                SmoothPageIndicator(
                  controller: boardController,
                  effect: const ExpandingDotsEffect(
                    dotColor: Colors.grey,
                    activeDotColor: Colors.brown,
                    dotHeight: 10,
                    expansionFactor: 4,
                    dotWidth: 10,
                    spacing: 5.0,
                  ),
                  count: boarding.length,
                ),
                const SizedBox(height: 10,),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.teal,
                    borderRadius: BorderRadius.circular(10)
                  ),
                  height: 60,
                  width: double.infinity,
                  child: MaterialButton(
                    onPressed: () {
                      if(isLast){
                        navigateAndFinish(context, const LoginScreen());
                      }
                    },
                    child: const Text(
                      'Get started',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Don\'t have an account?',
                    ),
                    TextButton(
                      onPressed: () {
                        navigateAndFinish(context, const SignUpScreen());
                      },
                      child: const Text(
                        'Sign up',
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildBoardingItem(BoardingModel model) => Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Expanded(
        child: Image(
          image: AssetImage(model.image),
        ),
      ),
      Text(
        textAlign: TextAlign.center,
        model.title,
        style: const TextStyle(
          fontSize: 30.0,
        ),
      ),
      const SizedBox(
        height: 15.0,
      ),
      Text(
        textAlign: TextAlign.center,
        model.body,
        style: const TextStyle(
          fontSize: 18.0,
          color: Colors.grey
        ),
      ),
      const SizedBox(
        height: 30.0,
      ),
    ],
  );
}