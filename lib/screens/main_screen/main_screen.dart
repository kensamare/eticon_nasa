import 'package:eticon_nasa/screens/main_screen/cubit/main_screen_cubit.dart';
import 'package:eticon_nasa/screens/main_screen/cubit/main_screen_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<bool> _isOpen = [false, false, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text('Eticon NASA'),
          centerTitle: true,
        ),
        body: BlocBuilder<MainScreenCubit, MainScreenState>(
          builder: (context, state) {
            if (state is MainScreenLoadingState) {
              BlocProvider.of<MainScreenCubit>(context).getData();
              return Center(child: CupertinoActivityIndicator());
            }
            if (state is MainScreenErrorState) {
              return Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(state.errorMsg),
                    SizedBox(
                      height: 15,
                    ),
                    GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: () {
                        BlocProvider.of<MainScreenCubit>(context).emit(MainScreenLoadingState());
                      },
                      child: Container(
                        height: 30,
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.black, width: 2),
                        ),
                        child: Center(
                          child: Text(
                            'Retry',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }
            if (state is MainScreenLoadedState) {
              return SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(15),
                  child: Column(
                    children: [
                      Container(
                        height: 200,
                        width: MediaQuery.of(context).size.width,
                        child: Image.network(
                          state.result.url!,
                          fit: BoxFit.contain,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        state.result.title!,
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 22,
                        ),
                      ),
                      SizedBox(height: 20),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 1,
                              color: Colors.black12,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 3),
                            child: Text(
                              'Explanation',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              height: 1,
                              color: Colors.black12,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10,),
                      Container(
                        child: Text(
                          state.result.explanation!,
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 1,
                              color: Colors.black12,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 3),
                            child: Text(
                              'Date: ${state.result.date!}',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              height: 1,
                              color: Colors.black12,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            }
            return Container();
          },
        ));
  }
}
