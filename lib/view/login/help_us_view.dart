import 'package:book_grocer/common/color_extenstion.dart';
import 'package:book_grocer/view/main_tab/main_tab_view.dart';
import 'package:flutter/material.dart';

class HelpUsView extends StatefulWidget {
  const HelpUsView({super.key});

  @override
  State<HelpUsView> createState() => _HelpUsViewState();
}

class _HelpUsViewState extends State<HelpUsView> {
  // List of genres and their selected state
  final Map<String, bool> topGenres = {
    "Fantasy": false,
    "Adventure": false,
    "Fairy Tales": false,
    "Mystery": false,
    "Bedtime Stories": false,
    "Science Fiction": false
  };
  final Map<String, bool> otherGenres = {
    "Romance": false,
    "Horror": false,
    "Non-Fiction": false,
    "Biography": false,
    "History": false,
    "Thriller": false,
  };
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: TColor.primary,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Help Us To Help You",
                style: TextStyle(
                    color: TColor.text,
                    fontSize: 24,
                    fontWeight: FontWeight.w700),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Tell us what kind of stories you like.",
                style: TextStyle(color: TColor.subTitle, fontSize: 15),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                "Based on what you like to read, we will suggest stories created by community members.",
                style: TextStyle(color: TColor.subTitle, fontSize: 15),
              ),
              const SizedBox(
                height: 15,
              ),
              const Text("Top Genres"),
              const SizedBox(
                height: 15,
              ),
              // List of genre checkboxes arranged horizontally
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: topGenres.keys.map((genre) {
                  return Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () {
                          setState(() {
                            topGenres[genre] = !topGenres[genre]!;
                          });
                        },
                        icon: Icon(
                          topGenres[genre]!
                              ? Icons.check_box
                              : Icons.check_box_outline_blank,
                          color: topGenres[genre]!
                              ? TColor.primary
                              : TColor.subTitle.withOpacity(0.3),
                        ),
                      ),
                      Text(
                        genre,
                        style: TextStyle(
                          color: TColor.text,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  );
                }).toList(),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text("Other Genres"),
              const SizedBox(
                height: 15,
              ),
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: otherGenres.keys.map((genre) {
                  return Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () {
                          setState(() {
                            otherGenres[genre] = !otherGenres[genre]!;
                          });
                        },
                        icon: Icon(
                          otherGenres[genre]!
                              ? Icons.check_box
                              : Icons.check_box_outline_blank,
                          color: otherGenres[genre]!
                              ? TColor.primary
                              : TColor.subTitle.withOpacity(0.3),
                        ),
                      ),
                      Text(
                        genre,
                        style: TextStyle(
                          color: TColor.text,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  );
                }).toList(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MainTabView()));
                    },
                    child: Text(
                      "Skip",
                      style: TextStyle(color: TColor.primary),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
