
class AppGlobalStrings {
  static const String appTitle = 'Litterflow';
  static const String homeButton = 'Accueuil';
  static const String scanButton = 'Signalez';
  static const String helpButton = 'Aide';
}

class SlidesStrings {

  static const String skipButton = 'Passer';

  // First Slide
  static const String slide1Title = 'Appuyez sur le\nboutton SCAN';
  static const String slide1Subtitle = 'Prenez votre Photo';
  static const String slide1Subtitle2 = 'Et encadrez le differents déchets présents dans la photo';
  static const String slide1Subtitle3 = 'Enfin, sauvegardez la photo!';

  // Second Slide
  static const String slide2Title =
      'Indiquer le type des\ndéchets pris en\nphoto';
  static const String slide2Subtitle =
      'Indiquer la quantité des déchets pris en photo';
  static const String slide2Hint =
      'Indiquer le type et la quantité des déchets\nnous aidera à mieux entamer la collecte';

  // Third Slide
  static const String slide3Title =
      'N’hésitez pas de nous laisser une note qui nous aidera dans nos collectes';
  static const String slide3Subtitle =
      'Et c’est tout, vous êtes prêt à utiliser LitteFlow!';
  static const String goButton = 'Go!';

  // Last Slide
  static const String lastSlideTitle = 'Sur la photo prise vous\npouvez encadrez les\ndéchets ';
  static const String lastSlideSubtitle = 'L’encadrements des déchets\naidera le système à reconnaître\nles types des déchets\nautomatiquement dans le futur';
}

class HomeStrings {

  static const String title = 'Notre Impact';
  static const String quantity = 'Quantité Collectée';
  static const String alertes = 'Nombre d\'alertes';
  // First Carousel
  static const String carousel1Title = 'Qui sommes nous?';
  static const String carousel1Subtitle =
      'LitterFlow est une startup\nengagée dans la\npréservation des\nécosystèmes marins.\n\nNous fusionnons la\ntechnologie avec la\nparticipation citoyenne.';

  // Second Carousel
  static const String carousel2Title = 'Qui sommes nous?';
  static const String carousel2Subtitle =
      'En permettant aux\ncitoyens de signaler les\ndéchets flottants dans les\nports.\nNotre équipe intervient\nensuite pour les collecter\net sensibiliser le public à la\npréservation de\nl’environnement marin.';

  // Third Carousel
  static const String carousel3Title = 'Pourquoi contribuer?';
  static const String carousel3Subtitle =
      'Votre action dans la lutte\ncontre les déchets\nflottants contribue\ndirectement à la\nprotection de la\nbiodiversité côtière et à la\nsauvegarde de nos\nécosystèmes marins pour\nles générations futures.';

  // Fourth Carousel
  static const String carousel4Title = 'Pourquoi contribuer?';
  static const String carousel4Subtitle =
      'La préservation de nos\nports est essentiel pour\nmaintenir un\nenvironnement côtier\npropre et préserver la vie\nmarine.\nRejoignez-nous pour un\nimpact positif et durable\nsur nos côtes.';

  // Fifth Carousel
  static const String carousel5Title = 'Comment contribuer?';
  static const String carousel5Subtitle =
      'Agissez pour un Port\nPropre en contribuant à la\nlutte contre les déchets\nflottants.\nSignalez leur présence\nfacilement en prenant une\nphoto via notre application\nmobile en un simple clic\nsur le bouton d\'en bas.';
}

class ScanStrings {
  static const String scanTitle =
      'Appuyez sur l\'obturateur lorsque le scan est terminé';

  static const String rotateRightButton = 'Droite';
  static const String rotateLeftButton = 'Gauche';
  static const String cancelButton = 'Effacer';
  static const String backButton = 'Annuler';
  static const String saveButton = 'Enregistrer';
  static const String continueButton = 'Suivant';
  static const String sendButton = 'Envoyer';

  // Garbage Type
  static const String typeTitle = 'Type des déchets:';
  static const String typeSubTitle =
      'Veuillez indiquer les types des dechets contenus dans la photo';

  // Garbage Quantity
  static const String quantityTitle = 'Quantité des déchets:';
  static const String quantitySubTitle =
      'Veuillez indiquer la quantité des dechets contenus dans la photo';

  // Garbage Note
  static const String noteTitle = 'Ajoutez une note:';
  static const String noteSubTitle =
      'Vous pouvez nous laisser une petite note/commentaire si vous pensez que ça nous aidera dans la collecte';

  // Thanks message
  static const String thanksMessageTitle = 'Merci!';
  static const String thanksMessageSubTitle =
      'Merci pour avoir signalé les déchets.\nVotre contribution\ncompte beaucoup pour\nnous!';
}

class HelpStrings {
  static const String helpTitle = '?FaQ?';

  // Questions and Answers
  static const List<Map<String, String>> questionAnswers = [
    {
      'question':
          'Comment fonctionne l’application de détection manuelle des déchets flottants ?',
      'answer':
          'L\'application vous permet de signaler et d\'identifier manuellement les déchets flottants que vous repérez sur la surface de l\'eau. Vous prenez une photo de l\'objet et fournissez des détails sur le type de déchet.'
    },
    {
      'question':
          'Quels types de déchets puis-je signaler avec l\'application ?',
      'answer':
          'Vous pouvez signaler une variété de déchets, tels que les plastiques, les débris de papier, le bois flottant et d\'autres objets non naturels trouvés à la surface de l\'eau.'
    },
    {
      'question': 'Les signalements fonctionnent-ils hors ligne ?',
      'answer':
          'Certaines fonctionnalités de l\'application peuvent fonctionner hors ligne, mais pour une utilisation optimale, il est recommandé d\'avoir une connexion internet pour transmettre les signalements.'
    },
    {
      'question': 'Comment protéger la confidentialité de mes informations tout en signalant des déchets ?',
      'answer':
      'L’application vous permet de signaler et d’identifier manuellement les déchets flottants que vous repérez sur la surface de l’eau. Vous prenez une photo de l’objet et fournissez des détails sur le type de déchet.'
    },
    {
      'question':
          'Comment puis-je en savoir plus sur l\'impact de ma participation ?',
      'answer':
          'Nous fournirons régulièrement des mises à jour sur les résultats de la collecte de données citoyennes.'
    },
    {
      'question': 'Est-ce que l\'application est gratuite ?',
      'answer':
          'Oui, l\';application de base est gratuite à télécharger et à utiliser pour permettre aux citoyens de signaler les déchets flottants.'
    },
  ];

  // Help Footer
  static const String helpFooter = 'Besoin d’aide pour signaler les déchets?';
  static const String helpFooterButton = 'voir le guide';
  static const String email = 'litterflow@gmail.com';
  static const String phoneNumber = '+213 657 159 986';
}
