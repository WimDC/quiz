import 'package:flutter/material.dart';
import 'dart:async';

const double margin = 10;
StreamController<bool> restart = StreamController<bool>();

List<dynamic> questions = [
  {
    "question": "Uit welke film of reeks komt deze foto?",
    "image": "assets/images/vraag_1.jpg",
    "answers": ["The Book of Boba Fett", "The Last Jedi", "The Mandalorian"],
    "correct": 2
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
    "image": "assets/images/vraag_4.jpg",
    "answers": [
      "Han Solo",
      "The Clone Wars",
      "The Book of Boba Fett",
      "Rogue One"
    ],
    "correct": 0
  }
];

List<dynamic> movies = [
  {
    "title": "Episode I The Phantom Menace",
    "director": "George Lucas",
    "year": 1999
  },
  {
    "title": "Episode II Attack of the Clones",
    "director": "George Lucas",
    "year": 2002
  },
  {
    "title": "Episode III Revenge of the Sith",
    "director": "George Lucas",
    "year": 2005
  },
  {"title": "Episode IV A New Hope", "director": "George Lucas", "year": 1977},
  {
    "title": "Episode V The Empire Strikes Back",
    "director": "Irvin Kershner",
    "year": 1980
  },
  {
    "title": "Episode VI Return of the Jedi",
    "director": "Richard Marquand",
    "year": 1983
  },
  {
    "title": "Episode VII The Force Awakens",
    "director": "J. J. Abrams",
    "year": 2015
  },
  {
    "title": "Episode VIII The Last Jedi",
    "director": "Rian Johnson",
    "year": 2017
  },
  {
    "title": "Episode IX The Rise of Skywalker",
    "director": "J. J. Abrams",
    "year": 2019
  }
];
