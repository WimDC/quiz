import 'package:flutter/material.dart';
import 'dart:async';

const double margin = 10;
StreamController<bool> restart = StreamController<bool>();

List<dynamic> questions = [
  {
    "question": "Uit welke film of reeks komt deze foto?",
    "image": "assets/images/vraag_1.jpg",
    "answers": [
      "The Book of Boba Fett",
      "The Last Jedi",
      "A New Hope",
      "The Mandalorian"
    ],
    "correct": 3
  },
  {
    "question": "Uit welke film of reeks komt deze foto?",
    "image": "assets/images/vraag_2.jpg",
    "answers": [
      "The Empire Strikes Back",
      "The Last Jedi",
      "A New Hope",
      "Return of the Jedi"
    ],
    "correct": 0
  },
  {
    "question": "Uit welke film of reeks komt deze foto?",
    "image": "assets/images/vraag_3.jpg",
    "answers": [
      "Revenge of the Sith",
      "Rogue One",
      "Attack of the Clones",
      "The Phantom Menace"
    ],
    "correct": 0
  },
  {
    "question": "Uit welke film of reeks komt deze foto?",
    "image": "assets/images/vraag_3.jpg",
    "answers": [
      "Han Solo",
      "The Clone Wars",
      "The Book of Boba Fett",
      "Rogue One"
    ],
    "correct": 0
  }
];

List<dynamic> randomQuestions = [
  {
    "tag": "AotC",
    "questions": [
      "Uit welke film of reeks komt deze foto?",
      "In welk jaar is deze film geproduceerd?",
      "Wie heeft deze film geregisseerd?",
    ],
    "images": [
      "assets/images/AotC1.jpg",
      "assets/images/AotC2.jpg",
      "assets/images/AotC3.jpg",
    ],
    "correct": ""
  },
  {
    "tag": "ESB",
    "questions": [
      "Uit welke film of reeks komt deze foto?",
      "In welk jaar is deze film geproduceerd?",
      "Wie heeft deze film geregisseerd?",
    ],
    "images": [
      "assets/images/ESB1.jpg",
      "assets/images/ESB2.jpg",
      "assets/images/ESB3.jpg",
    ],
    "correct": ""
  },
  {
    "tag": "FA",
    "questions": [
      "Uit welke film of reeks komt deze foto?",
      "In welk jaar is deze film geproduceerd?",
      "Wie heeft deze film geregisseerd?",
    ],
    "images": [
      "assets/images/FA1.jpg",
      "assets/images/FA2.jpg",
      "assets/images/FA3.jpg",
    ],
    "correct": ""
  },
  {
    "tag": "LJ",
    "questions": [
      "Uit welke film of reeks komt deze foto?",
      "In welk jaar is deze film geproduceerd?",
      "Wie heeft deze film geregisseerd?",
    ],
    "images": [
      "assets/images/LJ1.jpg",
      "assets/images/LJ2.jpg",
      "assets/images/LJ3.jpg",
    ],
    "correct": ""
  },
];

List<dynamic> randomQuestion = [
  {
    "questions": [
      "Uit welke film of reeks komt deze foto?",
      "In welk jaar is deze film geproduceerd?",
      "Wie heeft deze film geregisseerd?",
    ],
  }
];

List<dynamic> movies = [
  {
    "tag": "PM",
    "title": "Episode I The Phantom Menace",
    "director": "George Lucas",
    "year": "1999",
    "images": [
      "assets/images/PM1.jpg",
      "assets/images/PM2.jpg",
      "assets/images/PM3.jpg",
    ],
  },
  {
    "tag": "AotC",
    "title": "Episode II Attack of the Clones",
    "director": "George Lucas",
    "year": "2002",
    "images": [
      "assets/images/AotC1.jpg",
      "assets/images/AotC2.jpg",
      "assets/images/AotC3.jpg",
    ],
  },
  {
    "tag": "RotS",
    "title": "Episode III Revenge of the Sith",
    "director": "George Lucas",
    "year": "2005",
    "images": [
      "assets/images/RotS1.jpg",
      "assets/images/RotS2.jpg",
      "assets/images/RotS3.jpg",
    ],
  },
  {
    "tag": "NH",
    "title": "Episode IV A New Hope",
    "director": "George Lucas",
    "year": "1977",
    "images": [
      "assets/images/NH1.jpg",
      "assets/images/NH2.jpg",
      "assets/images/NH3.jpg",
    ],
  },
  {
    "tag": "ESB",
    "title": "Episode V The Empire Strikes Back",
    "director": "Irvin Kershner",
    "year": "1980",
    "images": [
      "assets/images/ESB1.jpg",
      "assets/images/ESB2.jpg",
      "assets/images/ESB3.jpg",
    ],
  },
  {
    "tag": "RotJ",
    "title": "Episode VI Return of the Jedi",
    "director": "Richard Marquand",
    "year": "1983",
    "images": [
      "assets/images/RotJ1.jpg",
      "assets/images/RotJ2.jpg",
      "assets/images/RotJ3.jpg",
    ],
  },
  {
    "tag": "FA",
    "title": "Episode VII The Force Awakens",
    "director": "J. J. Abrams",
    "year": "2015",
    "images": [
      "assets/images/FA1.jpg",
      "assets/images/FA2.jpg",
      "assets/images/FA3.jpg",
    ],
  },
  {
    "tag": "LJ",
    "title": "Episode VIII The Last Jedi",
    "director": "Rian Johnson",
    "year": "2017",
    "images": [
      "assets/images/LJ1.jpg",
      "assets/images/LJ2.jpg",
      "assets/images/LJ3.jpg",
    ],
  },
  {
    "tag": "RoS",
    "title": "Episode IX The Rise of Skywalker",
    "director": "J. J. Abrams",
    "year": "2019",
    "images": [
      "assets/images/RoS1.jpg",
      "assets/images/RoS2.jpg",
      "assets/images/RoS3.jpg",
    ],
  }
];
