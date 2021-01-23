import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pr0gramm/service/preferences_service.dart';
import 'package:pr0gramm_api/pr0gramm_api.dart';

class Pr0grammDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PreferencesService, PreferencesState>(
      cubit: Modular.get<PreferencesService>(),
      builder: (context, state) {
        return Drawer(
          child: ListView(
            children: [
              Card(
                child: Row(
                  children: [
                    Text("orange"),
                    Radio<int>(
                      value: 0,
                      groupValue: state.theme.index,
                      onChanged: (value) {
                        Modular.get<PreferencesService>().setTheme(Pr0grammTheme.values[value]);
                      },
                    ),
                  ],
                ),
              ),
              Card(
                child: Row(
                  children: [
                    Text("green"),
                    Radio<int>(
                      value: 1,
                      groupValue: state.theme.index,
                      onChanged: (value) {
                        Modular.get<PreferencesService>().setTheme(Pr0grammTheme.values[value]);
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
