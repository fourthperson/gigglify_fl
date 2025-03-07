import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gigglify_fl/l10n/generated/l10n.dart';
import 'package:gigglify_fl/presentation/blocs/blocs_export.dart';
import 'package:gigglify_fl/presentation/theme/theme.dart';

class PreferenceModal extends StatefulWidget {
  const PreferenceModal({super.key});

  @override
  State<PreferenceModal> createState() => _PreferenceModalState();
}

class _PreferenceModalState extends State<PreferenceModal> {
  late List<String> categoryTexts = [];

  @override
  void initState() {
    BlocProvider.of<PreferenceBloc>(context).add(LoadPreferenceEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    S strings = S.of(context);

    categoryTexts = [
      strings.category_any,
      strings.category_dark,
      strings.category_pun,
      strings.category_spooky,
      strings.category_christmas,
      strings.category_programming,
      strings.category_misc,
    ];

    return SafeArea(
      child: RawScrollbar(
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 10),
                Center(
                  child: Text(
                    strings.preferences,
                    style: textBold.copyWith(fontSize: 20),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  strings.allowed_categories,
                  style: textRegular.copyWith(fontSize: 16),
                ),
                const SizedBox(height: 10),
                BlocBuilder<PreferenceBloc, PreferenceState>(
                  builder: (BuildContext context, PreferenceState state) {
                    if (state is PreferenceLoadedState) {
                      List<bool> categories = List.from(
                        state.categories,
                        growable: false,
                      );

                      return ListView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        itemCount: categories.length,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (BuildContext context, int index) {
                          return _CategoryItem(
                            checked: categories[index],
                            label: categoryTexts[index],
                            onTap: (bool? checked) {
                              categories[index] = checked ?? false;
                              BlocProvider.of<PreferenceBloc>(context).add(
                                PreferenceChangeEvent(choices: categories),
                              );
                            },
                          );
                        },
                      );
                    } else {
                      return SizedBox(
                        height: 150,
                        child: Center(
                          child: Platform.isIOS
                              ? CupertinoActivityIndicator()
                              : CircularProgressIndicator(),
                        ),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _CategoryItem extends StatelessWidget {
  final bool checked;
  final String label;
  final void Function(bool?) onTap;

  const _CategoryItem({
    required this.checked,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => onTap(!checked),
      leading: Platform.isIOS
          ? CupertinoCheckbox(
              value: checked,
              onChanged: (c) => onTap(c ?? false),
              activeColor: Colors.purple,
            )
          : Checkbox(
              value: checked,
              onChanged: (c) => onTap(c ?? false),
              activeColor: Colors.purple,
            ),
      title: Text(
        label,
        style: textBold,
      ),
    );
  }
}
