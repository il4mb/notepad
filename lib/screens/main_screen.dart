import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:notepad/constants/color_scheme.dart';
import '../constants/constant.dart';
import 'input_screen.dart';
import 'pages/notes_page.dart';
import 'pages/todos_page.dart';

class MainScreen extends StatefulWidget{
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late PageController _pageController;
  int _currentPageIndex = 0;

  Future _refresh() async{
    setState(() {

    });
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: _refresh,
        child: SafeArea(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () => _pageController.animateToPage(
                          0,
                          duration: defaultDuration,
                          curve: Curves.easeInOut
                      ),
                      icon: SvgPicture.asset(
                        'assets/icons/notes.svg',
                        width: 26,
                        color: _currentPageIndex == 0 ? primaryColor : greyColor,
                      ),
                    ),
                    const SizedBox(width: 56),
                    IconButton(
                      onPressed: () => _pageController.animateToPage(
                          1,
                          duration: defaultDuration,
                          curve: Curves.easeInOut
                      ),
                      icon: SvgPicture.asset(
                        'assets/icons/todos.svg',
                        width: 26,
                        color: _currentPageIndex == 1 ? primaryColor : greyColor,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                  child: PageView(
                    controller: _pageController,
                    onPageChanged: (index) {
                      setState(() {
                        _currentPageIndex = index;
                      });
                    },
                    children: [
                      NotesPage(),
                      TodosPage(),
                    ],
                  ))
            ],
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (builder){
            return InputScreen();
          }));
        },
        child: Icon(Icons.add),
        backgroundColor: primaryColor,
      ),
    );
  }
}