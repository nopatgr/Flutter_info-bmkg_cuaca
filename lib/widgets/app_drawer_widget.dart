import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../providers/theme_provider.dart';
import '../widgets/custom_alert_dialog_widget.dart';

class AppDrawerWidget extends StatelessWidget {
  const AppDrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          ListTile(
            leading: const Icon(
              Icons.info,
            ),
            title: const Text(
              "Tentang Aplikasi",
            ),
            onTap: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return CustomAlertDialogWidget(
                      title: "Tentang Aplikasi",
                      children: [
                        Image.asset(
                          "assets/icons/earthquake.png",
                          width: 60.0,
                          height: 60.0,
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        const Text(
                          "Aplikasi ini dibuat dengan menggunakan Flutter untuk menampilkan informasi mengenai cuaca dan gempa di Indonesia. Data yang digunakan berasal dari website Data Terbuka BMKG",
                          textAlign: TextAlign.left,
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        TextButton(
                          onPressed: () async {
                            await launchUrl(
                              Uri.parse("https://data.bmkg.go.id/"),
                            );
                          },
                          child: const Text("Data Terbuka BMKG"),
                        ),
                      ],
                    );
                  });
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.palette,
            ),
            title: const Text(
              "Tema",
            ),
            onTap: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return CustomAlertDialogWidget(
                      title: "Tema",
                      children: [
                        const Text("Ganti tema yang digunakan?"),
                        const SizedBox(
                          height: 8.0,
                        ),
                        Consumer<ThemeProvider>(
                          builder: ((context, value, child) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                value.isDarkMode
                                    ? const Icon(Icons.dark_mode)
                                    : const Icon(Icons.sunny),
                                IconButton(
                                  onPressed: () async {
                                    await value
                                        .toggleIsDarkMode()
                                        .whenComplete(() {});
                                  },
                                  icon: value.isDarkMode
                                      ? const Icon(Icons.toggle_on)
                                      : const Icon(Icons.toggle_off),
                                ),
                              ],
                            );
                          }),
                        )
                      ],
                    );
                  });
            },
          ),
        ],
      ),
    );
  }
}
