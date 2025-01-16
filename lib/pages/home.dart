import 'dart:io';

import 'package:auto_route/annotations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gigglify_fl/blocs/category/category_bloc.dart';
import 'package:gigglify_fl/blocs/history/history_bloc.dart';
import 'package:gigglify_fl/blocs/joke/joke_bloc.dart';
import 'package:gigglify_fl/config/theme.dart';
import 'package:gigglify_fl/data/api/joke.dart';
import 'package:gigglify_fl/di/dependency_injector.dart';
import 'package:gigglify_fl/l10n/generated/l10n.dart';
import 'package:gigglify_fl/pages/modal/history.dart';
import 'package:gigglify_fl/pages/modal/preferences.dart';
import 'package:ionicons/ionicons.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    BlocProvider.of<JokeBloc>(context).add(LoadJokeEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    S strings = S.of(context);

    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<JokeBloc, JokeState>(
          builder: (BuildContext context, JokeState state) {
            if (state is JokeLoadingSate) {
              return Center(
                child: Platform.isIOS
                    ? CupertinoActivityIndicator()
                    : CircularProgressIndicator(),
              );
            } else if (state is JokeLoadedSate) {
              Joke joke = state.joke;
              bool isTwoPart = joke.type == 'twopart';

              return GestureDetector(
                onTap: () {
                  BlocProvider.of<JokeBloc>(context).add(LoadJokeEvent());
                },
                behavior: HitTestBehavior.opaque,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(height: 10),
                      Center(
                        child: Text(
                          joke.category,
                          style: textBold.copyWith(fontSize: 18),
                        ),
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              isTwoPart ? joke.setup ?? '' : joke.joke ?? '',
                              textAlign: TextAlign.center,
                              style: textMedium.copyWith(
                                fontSize: 18,
                              ),
                            ),
                            SizedBox(height: isTwoPart ? 10 : 0),
                            isTwoPart
                                ? Text(
                                    joke.delivery ?? '',
                                    textAlign: TextAlign.center,
                                    style: textMedium.copyWith(
                                      fontSize: 18,
                                    ),
                                  )
                                : SizedBox.shrink(),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            _ActionButton(
                              iconData: Ionicons.settings_outline,
                              onTap: () {
                                _categoriesModal();
                              },
                            ),
                            _ActionButton(
                              iconData: Ionicons.share_social_outline,
                              iconSize: 42,
                              color: Colors.purple,
                              onTap: () {
                                BlocProvider.of<JokeBloc>(context).add(
                                  ShareJokeEvent(joke: joke),
                                );
                              },
                            ),
                            _ActionButton(
                              iconData: Ionicons.time_outline,
                              onTap: () {
                                _historyModal();
                              },
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      Center(
                        child: Text(
                          strings.usage_description,
                          style: textBold.copyWith(fontSize: 12),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            } else {
              return GestureDetector(
                onTap: () =>
                    BlocProvider.of<JokeBloc>(context).add(LoadJokeEvent()),
                behavior: HitTestBehavior.opaque,
                child: Center(
                  child: Text(
                    strings.usage_description1,
                    style: textBold.copyWith(
                      fontSize: 16,
                    ),
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }

  void _historyModal() {
    final Widget content = Material(
      child: BlocProvider(
        create: (BuildContext context) => HistoryBloc(
          DependencyInjector.instance.jokeRepo,
        ),
        child: HistoryModal(),
      ),
    );

    if (Platform.isIOS) {
      showCupertinoModalBottomSheet(
        context: context,
        builder: (_) => content,
      );
    } else {
      showMaterialModalBottomSheet(
        context: context,
        builder: (_) => content,
      );
    }
  }

  void _categoriesModal() {
    final Widget content = Material(
      child: BlocProvider(
        create: (BuildContext context) => CategoryBloc(
          DependencyInjector.instance.categoryRepo,
        ),
        child: PreferenceModal(),
      ),
    );

    if (Platform.isIOS) {
      showCupertinoModalBottomSheet(
        context: context,
        builder: (_) => content,
      );
    } else {
      showMaterialModalBottomSheet(
        context: context,
        builder: (_) => content,
      );
    }
  }
}

class _ActionButton extends StatelessWidget {
  final IconData iconData;
  final double iconSize;
  final Color color;
  final Function() onTap;

  const _ActionButton({
    required this.iconData,
    required this.onTap,
    this.iconSize = 32,
    this.color = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      customBorder: const CircleBorder(),
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Icon(
          iconData,
          size: iconSize,
          color: color,
        ),
      ),
    );
  }
}
