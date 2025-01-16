import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gigglify_fl/blocs/category/category_bloc.dart';
import 'package:gigglify_fl/config/theme.dart';
import 'package:gigglify_fl/l10n/generated/l10n.dart';

class PreferenceModal extends StatefulWidget {
  const PreferenceModal({super.key});

  @override
  State<PreferenceModal> createState() => _PreferenceModalState();
}

class _PreferenceModalState extends State<PreferenceModal> {
  late List<String> categoryTexts = [];

  @override
  void initState() {
    BlocProvider.of<CategoryBloc>(context).add(LoadCategoryEvent());
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
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 10),
                Center(
                  child: Text(
                    strings.preferences,
                    style: textBold.copyWith(fontSize: 20),
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  strings.allowed_categories,
                  style: textRegular.copyWith(fontSize: 16),
                ),
                SizedBox(height: 10),
                BlocBuilder<CategoryBloc, CategoryState>(
                  builder: (BuildContext context, CategoryState state) {
                    if (state is CategoriesLoadedState) {
                      List<bool> categories = state.categories;

                      void onChanged(bool? checked, int index) {
                        if (checked == null) return;
                        BlocProvider.of<CategoryBloc>(context).add(
                          CategoryChangeEvent(
                            index: index,
                            value: checked,
                          ),
                        );
                      }

                      return ListView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        itemCount: categories.length,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (BuildContext context, int index) {
                          return ListTile(
                            onTap: () => onChanged(!categories[index], index),
                            leading: Platform.isIOS
                                ? CupertinoCheckbox(
                                    value: categories[index],
                                    onChanged: (c) => onChanged(
                                      c ?? false,
                                      index,
                                    ),
                                    activeColor: Colors.purple,
                                  )
                                : Checkbox(
                                    value: categories[index],
                                    onChanged: (c) => onChanged(
                                      c ?? false,
                                      index,
                                    ),
                                    activeColor: Colors.purple,
                                  ),
                            title: Text(
                              categoryTexts[index],
                              style: textBold,
                            ),
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
