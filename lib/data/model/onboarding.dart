class OnBoarding {
  final String title;
  final String image;

  OnBoarding({
    required this.title,
    required this.image,
  });
}

List<OnBoarding> onboardingContents = [
  OnBoarding(
    title: 'SELAMAT DATANG DI WALLETO',
    image: 'assets/onboarding1.svg',
  ),
  OnBoarding(
    title: 'TABUNGAN BERJANGKA DENGAN BERBAGAI KATEGORI',
    image: 'assets/onboarding2.svg',
  ),
  OnBoarding(
    title: 'PANTAU TERUS PROGRESS MENABUNGMU!',
    image: 'assets/onboarding3.svg',
  ),
];
