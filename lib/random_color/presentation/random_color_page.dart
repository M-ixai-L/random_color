import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:random_color/random_color/application/entities/random_color_type.dart';
import 'package:random_color/random_color/application/index.dart';

/// Page displaying the random color feature
class RandomColorPage extends StatefulWidget {
  /// Constructor for a page with displaying the random color feature
  const RandomColorPage({Key? key}) : super(key: key);

  @override
  State<RandomColorPage> createState() => _RandomColorPageState();
}

class _RandomColorPageState extends State<RandomColorPage> {
  // ignore: avoid-late-keyword
  late final RandomColorBloc _randomColorBloc;

  @override
  void initState() {
    _randomColorBloc = context.read();
    super.initState();
  }

  Color _invertColor(Color color) {
    return color
        .withBlue(1 - color.blue)
        .withGreen(1 - color.green)
        .withRed(1 - color.red);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RandomColorBloc, RandomColorState>(
      builder: (BuildContext context, state) {
        return GestureDetector(
          onTap: () => _randomColorBloc.add(const ChangeColor()),
          child: Scaffold(
            backgroundColor: state.color,
            body: const Center(
              child: Text('Hey there', style: TextStyle(fontSize: 20)),
            ),
            floatingActionButton: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                TextButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll<Color>(
                      _invertColor(state.color),
                    ),
                  ),
                  onPressed: () => _randomColorBloc
                      .add(const ChangeColor(RandomColorType.materialColor)),
                  child: const Text('Use material colors'),
                ),
                TextButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll<Color>(
                      _invertColor(state.color),
                    ),
                  ),
                  onPressed: () => _randomColorBloc
                      .add(const ChangeColor(RandomColorType.customColor)),
                  child: const Text('Use custom colors'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
