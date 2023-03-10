import 'package:ardrive_ui/ardrive_ui.dart';
import 'package:flutter/material.dart';
import 'package:storybook/src/accordion.dart';
import 'package:storybook/src/button.dart';
import 'package:storybook/src/checkbox.dart';
import 'package:storybook/src/click_area.dart';
import 'package:storybook/src/fab.dart';
import 'package:storybook/src/image.dart';
import 'package:storybook/src/progress_bar.dart';
import 'package:storybook/src/radio_button.dart';
import 'package:storybook/src/shadows.dart';
import 'package:storybook/src/tab_view.dart';
import 'package:storybook/src/table.dart';
import 'package:storybook/src/text_field.dart';
import 'package:storybook/src/toggle.dart';
import 'package:widgetbook/widgetbook.dart';

import 'card.dart';
import 'colors.dart';
import 'drop_area.dart';
import 'modals.dart';
import 'overlay.dart';

class StoryBook extends StatelessWidget {
  const StoryBook({super.key});

  @override
  Widget build(BuildContext context) {
    return ArDriveApp(
      builder: (context) => Widgetbook.material(
          devices: [
            Apple.iPhone12,
            Apple.iPhone13,
            Apple.macBook14Inch,
            Apple.iMacRetina27Inch,
            Desktop.desktop1080p,
            Desktop.desktop1440p,
            Desktop.desktop4k,
          ],
          themes: [
            WidgetbookTheme(
              name: 'Dark',
              data: darkMaterialTheme(),
            ),
            WidgetbookTheme(
              name: 'Light',
              data: lightMaterialTheme(),
            ),
          ],
          appInfo: AppInfo(name: 'ArDrive StoryBook'),
          categories: [
            toggle(),
            textField(),
            getColors(),
            shadows(),
            button(),
            card(),
            table(),
            modals(),
            radioButton(),
            dropArea(),
            tabView(),
            progressBar(),
            overlay(),
            accordion(),
            image(),
            checkBox(),
            fab(),
            clickArea(),
          ]),
    );
  }
}
