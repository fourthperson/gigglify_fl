import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gigglify_fl/blocs/history/history_bloc.dart';
import 'package:gigglify_fl/config/theme.dart';
import 'package:gigglify_fl/data/db/schemas.dart';
import 'package:gigglify_fl/l10n/generated/l10n.dart';
import 'package:intl/intl.dart';
import 'package:ionicons/ionicons.dart';

class HistoryModal extends StatefulWidget {
  const HistoryModal({super.key});

  @override
  State<HistoryModal> createState() => _HistoryModalState();
}

class _HistoryModalState extends State<HistoryModal> {
  late DateFormat dateFormat;

  @override
  void initState() {
    BlocProvider.of<HistoryBloc>(context).add(LoadHistoryEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    S strings = S.of(context);

    final format = DateFormat.yMd(Localizations.localeOf(context).languageCode);
    bool is24h = MediaQuery.of(context).alwaysUse24HourFormat;
    dateFormat = DateFormat(
      '${format.pattern} ${is24h ? 'HH:mm:ss' : 'h:m:s a'}',
    );

    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 10),
          Center(
            child: Text(
              strings.history,
              style: textBold.copyWith(fontSize: 20),
            ),
          ),
          SizedBox(height: 10),
          BlocBuilder<HistoryBloc, HistoryState>(
            builder: (BuildContext context, HistoryState state) {
              if (state is HistoryLoadingState) {
                return SizedBox(
                  height: 150,
                  child: Center(
                    child: Platform.isIOS
                        ? CupertinoActivityIndicator()
                        : CircularProgressIndicator(),
                  ),
                );
              } else if (state is HistoryLoadedState) {
                List<SavedJoke> history = state.jokesList;
                return history.isEmpty
                    ? _Info(
                        iconData: Ionicons.cube_outline,
                        iconColor: Colors.black,
                        message: strings.history_empty,
                      )
                    : SingleChildScrollView(
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: history.length,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            SavedJoke joke = history[index];
                            return _HistoryItem(
                              joke: joke,
                              dateFormat: dateFormat,
                              onTap: () {
                                BlocProvider.of<HistoryBloc>(context).add(
                                  ShareHistoryEvent(joke: joke),
                                );
                              },
                            );
                          },
                        ),
                      );
              } else {
                return _Info(
                  iconData: Ionicons.warning_outline,
                  iconColor: Colors.red,
                  message: strings.history_error,
                );
              }
            },
          ),
        ],
      ),
    );
  }
}

class _Info extends StatelessWidget {
  final IconData iconData;
  final Color iconColor;
  final String message;

  const _Info({
    required this.iconData,
    required this.iconColor,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              iconData,
              color: iconColor,
            ),
            Text(
              message,
              style: textRegular.copyWith(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}

class _HistoryItem extends StatelessWidget {
  final SavedJoke joke;
  final Function() onTap;
  final DateFormat? dateFormat;

  const _HistoryItem({
    required this.joke,
    required this.onTap,
    this.dateFormat,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              joke.joke,
              style: textMedium.copyWith(fontSize: 16),
            ),
            Row(
              children: [
                Text(
                  joke.category,
                  style: textRegular.copyWith(fontSize: 12),
                ),
                const Spacer(),
                Text(
                  dateFormat == null
                      ? joke.time.toString()
                      : dateFormat!.format(
                          DateTime.fromMillisecondsSinceEpoch(joke.time),
                        ),
                  style: textRegular.copyWith(fontSize: 12),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
