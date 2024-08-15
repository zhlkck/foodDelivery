class UnboardingContent {
  String image;
  String title;
  String description;
  UnboardingContent({
    required this.description,
    required this.image,
    required this.title,
  });
}

List<UnboardingContent> contents = [
  UnboardingContent(
      description: 'Yemeğinizi menümüzden seçin\n' '35 kereden fazla',
      image: "assets/screen1.png",
      title: 'Menümüzden yemeğinizi seçin\n    En iyi menü'),
  UnboardingContent(
      description:
          'Teslimatta nakit ödeme yapabilirsiniz ve\n         Kartla ödeme mevcuttur',
      image: "assets/screen2.png",
      title: 'Kolay ve Online ödeme'),
  UnboardingContent(
      description: 'Yemeğinizi kapınıza teslim edelim',
      image: "assets/screen3.png",
      title: 'Hızlı teslimatla kapınızda')
];
