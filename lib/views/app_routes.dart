import 'package:flutter/material.dart';
import 'package:resume_a/Screens/HomePage.dart';
import 'package:resume_a/Screens/build_option_page.dart';
import 'all_options/achivements_page.dart';
import 'all_options/carrier_objective_page.dart';
import 'all_options/contect_info_page.dart';
import 'all_options/declaration_page.dart';
import 'all_options/education_page.dart';
import 'all_options/experiance_page.dart';
import 'all_options/intrest_hobbies_page.dart';
import 'all_options/peronal_details_page.dart';
import 'all_options/projects_page.dart';
import 'all_options/reference_page.dart';
import 'all_options/technical_skils_page.dart';

class AppRoutes {
  static String homepage = '/';
  static String buildOptionPage = 'bulid_Option_Page';

  static String iconpath = "lib/assets/icons/";
  static List<Map<String, dynamic>> allOptions = [
    {
      'icon': "${iconpath}2.png",
      'title': 'Contect info',
      'route': 'Contectinfo_page',
    },
    {
      'icon': "${iconpath}2.png",
      'title': 'Carrier Objective',
      'route': 'Carrier_Objective_page',
    },
    {
      'icon': "${iconpath}2.png",
      'title': 'Pesonal Details',
      'route': 'Pesonal Details',
    },
    {
      'icon': "${iconpath}2.png",
      'title': 'Education',
      'route': 'Education',
    },
    {
      'icon': "${iconpath}2.png",
      'title': 'Experiances',
      'route': 'Experiances',
    },
    {
      'icon': "${iconpath}2.png",
      'title': 'Technicl Skills',
      'route': 'Technicl Skills',
    },
    {
      'icon': "${iconpath}2.png",
      'title': 'Interest/Hobbies',
      'route': 'Interest/Hobbies',
    },
    {
      'icon': "${iconpath}2.png",
      'title': 'Projects',
      'route': 'Projects',
    },
    {
      'icon': "${iconpath}2.png",
      'title': 'Achivements',
      'route': 'Achivements',
    },
    {
      'icon': "${iconpath}2.png",
      'title': 'Refreces',
      'route': 'Refreces',
    },
    {
      'icon': "${iconpath}2.png",
      'title': 'Declaration',
      'route': 'Declaration'
    },
  ];
  static Map<String, Widget Function(BuildContext)> routes = {
    homepage: (context) => const HomePage(),
    buildOptionPage: (context) => const BuildOptionPage(),
    allOptions[0]['route']: (context) => const ContectInfoPage(),
    allOptions[1]['route']: (context) => const CarrierObjective(),
    allOptions[2]['route']: (context) => const PesonalDetails(),
    allOptions[3]['route']: (context) => const EducationPage(),
    allOptions[4]['route']: (context) => const ExperiancePage(),
    allOptions[5]['route']: (context) => const TechnicaSkillsPage(),
    allOptions[6]['route']: (context) => const IntrestAndHobbiesPage(),
    allOptions[7]['route']: (context) => const ProjectsPage(),
    allOptions[8]['route']: (context) => const achievementsPage(),
    allOptions[9]['route']: (context) => const RefrancePage(),
    allOptions[10]['route']: (context) => const Declaration(),
  };
}
