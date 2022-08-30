class OnBoardModel {
  String img;
  String text;
  String desc;
  String lisc;

  OnBoardModel({
    required this.img,
    required this.text,
    required this.desc,
    required this.lisc,
  });
}

List<OnBoardModel> onboardingContents = [
  OnBoardModel(
    img: 'assets/images/png1.jpg',
    lisc: 'Designed by vectorpouch / Freepik',
    text: "Welcome to Reader App",
    desc:
        "Reader App was designed for those of you who want to open and read document files on your mobile device.",
  ),
  OnBoardModel(
    img: 'assets/images/png2.png',
    lisc: 'Designed by vectorjuice / Freepik',
    text: "Easy & Simple",
    desc:
        "You can select from a variety of documents, which are Word, PDF, PowerPoint, Excel, and Text. You can read your documents easily, whichever document you want.",
  ),
  OnBoardModel(
    img: 'assets/images/png2.png',
    lisc: '',
    text: "TERMS & CONDITIONS",
    desc: "lore",
  ),
];
