import 'package:flutter/material.dart';
import 'quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

// This is how we create an instance of class in dart
QuizBrain quizBrain = QuizBrain();

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Widget> scorekeeper = [
    // Icon(
    //   Icons.check,
    //   color: Colors.green,
    // ),
    // Icon(
    //  Icons.close,
    // color: Colors.red,
    //),
  ];

  void checkAnswer(bool userResponse) {
    bool correctAnswer = quizBrain.getQuestionAnswer();

    setState(() {
      if (quizBrain.isFinished() == true) {
        Alert(
          context: context,
          title: 'Finished!',
          desc: 'You\'ve reached the end of the quiz.',
        ).show();

        quizBrain.reset();

        scorekeeper = [];
      } else {
        if (correctAnswer == userResponse) {
          scorekeeper.add(
            Icon(
              Icons.check,
              color: Colors.green,
            ),
          );
        } else {
          setState(() {
            scorekeeper.add(
              Icon(
                Icons.close,
                color: Colors.red,
              ),
            );
          });
        }

        quizBrain.nextQuestion();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizBrain.getQuestionText(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              style: TextButton.styleFrom(
                primary: Colors.white,
                backgroundColor: Colors.green,
              ),
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                //The user picked true.
                checkAnswer(true);
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              style: TextButton.styleFrom(backgroundColor: Colors.red),
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                //The user picked false.
                checkAnswer(false);
              },
            ),
          ),
        ),
        Row(
          children: scorekeeper,
        )
      ],
    );
  }
}

/*
 question1:'You can lead a cow down stairs but not up stairs.',false,
 question2:'Approximately one quarter of human bones are in the feet',true,
 question3:'A slug\'s blood is green',true,

*/

/*

  * We gonna be building a Quiz-App where the user has to answer questions and we will tell them how many they have got right

  We learn about Classes and Objects in Dart

  ! How do we create them using Dart?
  So the app needs to keep track of user's score and it lets them to answer questions

  ? Even thought app looks simple we gonna be talking about intermediate programming concepts under the hood

   We can also figure-out how can we better structure the app?

   First things first,we have to set up the project

   Once you run the app,you will see there is a dark background and white text(This is where our questions will go) There we can see 2 answer buttons to click on for answering questions

  ! User-Interface Overview :
   ? - text widget+ flat- button widgets (They embedded inside Expanded widget of column so they take right amount of space ofcourse)

 * We also learn how to modularise and oraganizse our Flutter Code

As I said,first thing we gonna build A score-keeper to keep track of how many questions user got right & how many they got wrong

? In order to do this,we are going to place our code at the end of the Column Widget


 * When you are working on large project,the first thing you probably wanna  do is to break it down into smaller or manageable chunks so that we can tackle each other one by one until your project gets built
 
  We create a Lot of TODO's in the project,so it's really helpful

  So we can figure out what all the steps that we need to complete

 * Our score-keeper is simply going to be Row Widget into our Column Widget
 

 ? Row-widget is going to have bunch of children which are icon widgets,These are coming from Material-Design


 We can also store list of widgets in a single variable of type List<Widget>

  ! SafeArea and Padding Widgets,they can have only one child

  * Difference b/w Single Child & Multiple-Child Widgets
 
  Column Widget can accept Children in the form of List,Now the list is simply a way for grouping data into collections

  This is the most common thing that we can do across different programming languages

  It groups related pieces of data into single list

  We can manipulate and tap into the list

   ! Creating a List in Dart

 ?  As the children property requires List<Widget> type,so we need to compatible with list that we have created

 We can explicitly states what type of data it stores

 * The benefit of getting all the widgets and putting it into separate list in case of score-keeper,I can now add icons into the list on the fly

? When you press the answer button,we need to display check signs on the row using score-keeper

 ! Dart -Lists

  ? We can create list just as you create Shopping-List by adding some items to the list

  - Creating the List

  * It follows zero-based indexing

 We can pick items from the list or access items in the list using index

We can refer items in the list by index

  ? - myList.indexOf(key) returns the index of the key present in the list
   
   ? - myList.add(newItem) we can add newItem to the list(New-Item always go at the end of the list)

   ?- Inserting to the list :- myList.insert(index,elem) where we want to insert and what to insert

  ? - myList.first(),myList.end(),

  * You can remove or sort items much more with Dart Lists

In android studio,we can revert back to the previous state before making any code changed using vcs history
*/

/*
 ! How to display questions?

 We have to create a list of questions everytime we press on true or false button ,To check-out answers or move to next-question

 * In order to do this,we have included 3 questions that you ask and each of them are having correct answers


 List<String> questions=[]

 ? Inside our Text Widget,we can either specify question-list or specify particular question using methods or index

  
 * So we need to create some sort of tracker to know where we are in the questions-list

 We need to keep track of what's the current question that we have displayed on the Text Widget

 In order to track which question we are on

? When we click on either of the FlatButtons,we need to progress to the next question

QuestionNumber is going to keep track of current question


 * Next thing we want to do is,we want to increase this question number whenever we clicking the Button
 
 We can update the state of the app UI through user-interactions

 ? The place we wanted to  do this,ofcourse at onPressed() whether user picked true or false we does samething we are going to next question no matter what which choice they pick

 new_state=prev_state+1
 
 ! We can also use ++ operator to perform increment operation

 Text-widget depends on Question_Number

 In order  to mark the places that we have changed,we need to use setState()

* We need to take care of Exceptions in Flutter app development

 To reset everything,we need to perform Hot-restart

 * If we go out of the bounds,app crashes due to Exception
   
   ! Checking User-Responses ?

  Text that we want to display comes from QuestionsList in Text-Widget

  * First,we need to create a list of answers of type-Boolean

 We are going to figure out whether the user has got right or wrong ,In order to do this first we need to get the correct answer and perform matching with user-response 

 ? We are going to Upgrade questions and answers by using Dart Oops's Features

  ! Dart Conditionals

   If..else statements basically used for decision-making statements 

   If the condition is set to true,then it will carry-out the instructions inside curly braces

    == :- Condition

  We simply trigger the statements when some condition  is met

   In order to understand this concept, we are going to build Love-Calculator it's one of those where we test our compatability with whoever you finds with

   ? Relational operators are used most widely in Dart Conditionals
     ==
     !=
     <=,<,>,>=

    We can combine conditional expressions using
     &&-Logical AND
     ||- Logical OR
     !-Not


     ! Creating Question Class
  
    We create a new class just as like we have Widgets

    We can also create a Class with question-Property and answer property

    We can associate questions and answers together as single object

    All of the action happens in Lib Folder

   class_name starts with Capital Letter

   * We can import files using import statement
   
   We can initialize Constructor by passing values to the arguments and call the constructor by creating an instance of Question

   * We create a new list of questions of type  Question-class ,here are storing instances of classes
   
   Now we need to understand how classes & Constructors works

   ! Dart Oops Features

     - Class & object
     - Abstraction
     -Encapsulation
     -Polymorphism
     -Inheritance

     * Class is simply like a blue-print and it's going to create all of the things  that we are going to show in our app which the user has going to interact with it
     
     * Instance of Class-Object
     
     * A class has 2 important things -Properties(Attributes) which define characteristics & Methods which define the actions
    
    class keyword to define class

    ?  we create an object from class

    *  We can create parameterized Constructors
    * We can also initialize values of the parameters while calling constructors and we wrap these values inside {} in constructor

    ? methods are simply functions that we define inside the clas

     ! Why do we need classes?

     Class is part of Object-Oriented programming paradigm

    * Everyone Loves Objects

    * We are working with objects to do everything that our app/program needs to do

    Four Pillars Of OOP:-
     -Abstraction
     -Encapsulation
     -Inheritance
     -Polymorphism

     ! Abstraction

     How can we make something complex into smaller pieces in more abstract way

    If you have large piece of code that is trying to do lot of different things 

 We make it more abstract and modularize by separating out into different jobs

 Instead of creating single large component which is capable of knowing everything,it's much better split out functionality into Components

 You might be confused and doesn't understand what does what


 ! Encapsulation

  We can able to change any of the properties  in other class
  It works just like you encapsulate your workers into different queues so that they work on their own thing

  You might encapsulate your class and objects

  Each class have a separate role& job.We usually create a wall between them

   We can make a variable as private,the way we  can do that in Dart is putting _before variable name(Private properties)
  We can access private properties only within the class

  How we can access outside the class?

  We can get the things that we want by defining methods inside the class

  Data+methods()-Encapsulation

  Before incrementing,we can check whether it's within the range or not(Safety Ensure)


  ! Inheritance

    When a class able to inherit properties & methods from parent class or super class

    * This is important when we are abstracting our program and we are creating lots of different modules or components that all take care of one specific  task

    ? It likely  involves duplication of code in their functionality

    In order to prevent re-writes lots of code

     ? Extends keyword used to implement inheritance feature
 
 * All we need to do is to define things which were different from parent-class in Sub-Class

We just focus on building our custom functionality rather than basic boring things which handled by Flutter SDK


  !PolyMorphism

 Polymorphism nothing but many-forms or changing shapes

 * When we are doing inheritance,we know that we get basically a copy  of what parent class is able to do,

  Some of the methods that you are inheriting,you might need to customize it

  To solve the problems of Method-overriding

  * We can use @override to simply override the parent-method implementation

? There are 2 ways of implementing Polymorphism

  We are able to override our parent behaviour by our own custom behaviour

We can actually take some good parts from our parent-class & adds additional information to it

 * We use super() to call parent-class
 
 We are able to inherit from our parent and also improve it/change it

?  Stateless/Stateful Widgets already has implementation of build(),In our code,we ovveride it & provide our logic


Now we got majority of our functionality down,it's time to put back my icons at the bottom

 * We will checking between userPickedAnswer & correctAnswer


Instead of having print-statements on the console,we can display icons on the fly

* We also have progress-indicator which tells which question got right or wrong



  ! Class-constructors

   *These are the bits of code that we write inside our class in order to be able to create a object from class
   
   ? So if our classes are   blueprint for our objects  what we plan on,Eventually objects have these properties as well as methods to perform

   * Constructor actually turns this blue-print into an actual object

 
  Constructors are work like as builders or engineers who take that map,construct it

   
   ? Properties are simply just instance variables that live inside the class

   ? We got methods which are essentially another word for functions

   These properties and methods are associated with Object

   Constructor has a special bit of  syntax

   * It essentially tells the class what we want to initialize the values of the properties
   
   * We effectively use constructor to create objects for us
   
   These objects has type of class

? At the point of creation,we can tell the class which property values needs to be inittialize using Constructor

We can tap into property values or manipulate property values

 ! Default Constructor takes no arguments

default value for double data type-null

Dart always provide default constructor so you don't need to provide it again

! The argument-names that we use for constructor arguments no need to differs from instance variables

we can use this keyword which refers to instance variables

* Constructor with named parameters,then you need to pass within {} otherwise you can omit

? If you want to learn more about Dart constructors,then Dart-lang tour would be a place to go and learn








*/
