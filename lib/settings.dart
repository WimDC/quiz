import 'package:flutter/material.dart';
import 'dart:async';

const double margin = 10;
StreamController<bool> restart = StreamController<bool>();

List<Map<String, dynamic>> questions = [
  {
    "question": "Uit welke film of reeks komt deze foto?",
    "image": "assets/images/vraag_1.jpg",
    "correctMovie": {},
    "incorrectMovie": [],
  },
  {
    "question": "Uit welke film of reeks komt deze foto?",
    "image": "assets/images/vraag_2.jpg",
    "correctMovie": {},
    "incorrectMovie": [],
  },
  {
    "question": "Uit welke film of reeks komt deze foto?",
    "image": "assets/images/vraag_3.jpg",
    "correctMovie": {},
    "incorrectMovie": [],
  },
  {
    "question": "Uit welke film of reeks komt deze foto?",
    "image": "assets/images/vraag_4.jpg",
    "correctMovie": {},
    "incorrectMovie": [],
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
