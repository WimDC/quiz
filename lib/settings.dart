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
    "question": "Uit welke film of reeks komt deze foto?",
    "images": [
      "assets/images/AotC1.jpg",
      "assets/images/AotC2.jpg",
      "assets/images/AotC3.jpg",
    ],
    "correct": "Episode II Attack of the Clones"
  },
  {
    "question": "Uit welke film of reeks komt deze foto?",
    "images": [
      "assets/images/ESB1.jpg",
      "assets/images/ESB2.jpg",
      "assets/images/ESB3.jpg",
    ],
    "correct": "Episode V The Empire Strikes Back"
  },
  {
    "question": "Uit welke film of reeks komt deze foto?",
    "images": [
      "assets/images/FA1.jpg",
      "assets/images/FA2.jpg",
      "assets/images/FA3.jpg",
    ],
    "correct": "Episode VII The Force Awakens"
  },
  {
    "question": "Uit welke film of reeks komt deze foto?",
    "images": [
      "assets/images/LJ1.jpg",
      "assets/images/LJ2.jpg",
      "assets/images/LJ3.jpg",
    ],
    "correct": "Episode VIII The Last Jedi"
  },
];

List<dynamic> movies = [
  {
    "tag": "PM",
    "title": "Episode I The Phantom Menace",
    "director": "George Lucas",
    "year": 1999
  },
  {
    "tag": "AotC",
    "title": "Episode II Attack of the Clones",
    "director": "George Lucas",
    "year": 2002
  },
  {
    "tag": "RotS",
    "title": "Episode III Revenge of the Sith",
    "director": "George Lucas",
    "year": 2005
  },
  {
    "tag": "NH",
    "title": "Episode IV A New Hope",
    "director": "George Lucas",
    "year": 1977
  },
  {
    "tag": "ESB",
    "title": "Episode V The Empire Strikes Back",
    "director": "Irvin Kershner",
    "year": 1980
  },
  {
    "tag": "RotJ",
    "title": "Episode VI Return of the Jedi",
    "director": "Richard Marquand",
    "year": 1983
  },
  {
    "tag": "FA",
    "title": "Episode VII The Force Awakens",
    "director": "J. J. Abrams",
    "year": 2015
  },
  {
    "tag": "LJ",
    "title": "Episode VIII The Last Jedi",
    "director": "Rian Johnson",
    "year": 2017
  },
  {
    "tag": "RoS",
    "title": "Episode IX The Rise of Skywalker",
    "director": "J. J. Abrams",
    "year": 2019
  }
];
