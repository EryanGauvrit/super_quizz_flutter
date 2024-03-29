class Question {
  String question;
  bool response;
  String explanation;
  String imagePath;

  Question({
    required this.question,
    required this.response,
    required this.explanation,
    required this.imagePath
  });

  String getImage() => 'assets/$imagePath';
}
class QuestionData {
  List<Question> questionList = [
    Question(
        question: "L'homme a marché sur la Lune avant d'inventé la valise à roulette",
        response: true,
        explanation: 'Le premier alunissage a eu lieu en 1969 tandis que les premières roulettes sont apparues en 1970',
        imagePath: 'assets/suitcase.jpeg'
    ),
    Question(
        question: "Une cuillère de miel correspond au travail d'une vie de 12 abeilles ?",
        response: true,
        explanation: "Les abeilles sont indispensables et très fragiles ...",
        imagePath: 'assets/honey.webp'
    ),
    Question(
        question: "Les avions volent plus rapidement aujourd'hui qu'avant ?",
        response: false,
        explanation: "Pour des raisons économiques et de carburants, les avions d'aujourd'hui volent moins vite !",
        imagePath: 'assets/airplane.webp'),
    Question(
        question: "L'inventeur des publicités pop-ups s'est excusé pour sa création ?",
        response: true,
        explanation: "Il est vraiment désolé, c'est intentions étaient bonnes ...",
        imagePath: 'assets/web.webp'
    ),
    Question(
        question: "Possédons-nous un peu d'or dans notre corps ?",
        response: true,
        explanation: "Une personne de 70kg possède environ 0.2mg d'or en elle",
        imagePath: 'assets/gold.webp'
    ),
    Question(
        question: "100k, c'est le nombre de combinaisons possibles avec des briques 2x4 de LEGO ?",
        response: false,
        explanation: "915,103,765 combinaisons possibles, c'est le résultat obtenu après une semaine de calcul par le programme du mathématicien Soren Eilers",
        imagePath: 'assets/lego.jpeg'
    ),
    Question(
        question: "Une vache appelée par son nom produira plus de lait qu'une qui ne l'est pas ?",
        response: true,
        explanation: '258L de lait en plus par an pour être exact !',
        imagePath: 'assets/cow.jpeg'
    ),
    Question(
        question: "Le drapeau des Etats-Unis a été créé par un étudiant ?",
        response: true,
        explanation: "Pour un projet de classe, l'étudiant a eu un B puis un A lorsque le congrès l'a choisi comme drapeau national !",
        imagePath: 'assets/america.jpeg'
    ),
    Question(
        question: "Les astronautes peuvent-ils voter depuis l'espace ?",
        response: true,
        explanation: "Même dans l'espace, le devoir d'un citoyen doit être effectué !",
        imagePath: 'assets/astronaut.jpeg'
    ),
    Question(
        question: "Tout le Nutella vendu en 1 an pourrait être étalé sur environ 50 terrains de football",
        response: false,
        explanation: "En realité il pourrait être étalé sur 1000 terrain de football !",
        imagePath: 'assets/nutella.jpeg'
    )
  ];
}