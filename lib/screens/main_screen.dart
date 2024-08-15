import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_ina7/bloc/kelipatan/kelipatan_bloc.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  KelipatanBloc kelipatanBloc = KelipatanBloc();
  final TextEditingController inputNCtrl = TextEditingController();

  void btnOnPressed(int btnNumber) {
    kelipatanBloc.add(KelipatanButtonPressed(
        btnNumber: btnNumber, inputN: int.parse(inputNCtrl.text)));
  }

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(final BuildContext context) => BlocProvider(
        create: (context) => kelipatanBloc,
        child: BlocListener<KelipatanBloc, KelipatanState>(
          listener: (context, state) {
            // TODO: implement listener
            if (state is KelipatanSuccess) {
              print(state.numbers);
            }
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
            ),
            child: ListView(
              children: <Widget>[
                TextField(
                  controller: inputNCtrl,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    labelText: 'Input N',
                    focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      borderSide:
                          BorderSide(color: Colors.black), //<-- SEE HERE
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8)),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                GridView(
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 32,
                    mainAxisSpacing: 32,
                  ),
                  children: <Widget>[
                    ElevatedButton(
                      style: ButtonStyle(),
                      onPressed: () => btnOnPressed(
                        1,
                      ),
                      child: Text('1'),
                    ),
                    ElevatedButton(
                      onPressed: () => btnOnPressed(
                        2,
                      ),
                      child: Text('2'),
                    ),
                    ElevatedButton(
                      onPressed: () => btnOnPressed(
                        3,
                      ),
                      child: Text('3'),
                    ),
                    ElevatedButton(
                      onPressed: () => btnOnPressed(
                        4,
                      ),
                      child: Text('4'),
                    )
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                const Text('Result'),
                BlocBuilder<KelipatanBloc, KelipatanState>(
                  builder: (context, state) {
                    if (state is KelipatanSuccess) {
                      return Text('${state.numbers}');
                    }
                    return const SizedBox();
                  },
                )
              ],
            ),
          ),
        ),
      );
}
