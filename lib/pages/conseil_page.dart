import 'package:flutter/material.dart';

class SymptomDetailPage extends StatelessWidget {
  final String title;
  final String description;
  final String imagePath;

  const SymptomDetailPage({
    required this.title,
    required this.description,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(imagePath),
            const SizedBox(height: 16),
            Text(
              title,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(description),
          ],
        ),
      ),
    );
  }
}

class AdviceDetailPage extends StatelessWidget {
  final String title;
  final String description;
  final String imagePath;

  const AdviceDetailPage({
    required this.title,
    required this.description,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(imagePath),
            const SizedBox(height: 16),
            Text(
              title,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(description),
          ],
        ),
      ),
    );
  }
}

class ConseilPage extends StatelessWidget {
  const ConseilPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pour vivre avec Parkinson'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Symptômes de Parkinson',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SymptomDetailPage(
                      title: "Tremblements",
                      description:
                          "Secousses ou tremblements involontaires, le plus souvent dans les mains. \n  Les tremblements, en particulier dans les mains, sont l'un des symptômes classiques de la maladie de Parkinson. Cependant, il est important de noter que tous les tremblements ne sont pas nécessairement liés à la maladie de Parkinson. Les tremblements peuvent avoir différentes causes, donc un diagnostic médical professionnel est nécessaire pour identifier la cause spécifique des symptômes. En plus des tremblements, d'autres symptômes courants de la maladie de Parkinson comprennent la raideur musculaire, la lenteur des mouvements et les problèmes d'équilibre.",
                      imagePath: "assets/images/symptom1.jpg",
                    ),
                  ),
                );
              },
              child: symptomCardView(
                context,
                "1. Tremblements :",
                "Secousses ou tremblements involontaires, le plus souvent dans les mains.",
                "assets/images/symptom1.jpg",
              ),
            ),
            const SizedBox(height: 16),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SymptomDetailPage(
                      title: "Raideur Musculaire",
                      description:
                          "Les muscles deviennent raides et tendus, entraînant une perte de souplesse. \n La raideur musculaire est en effet l'un des symptômes classiques de la maladie de Parkinson. Cela se produit généralement en raison de la rigidité musculaire, qui est causée par des altérations dans les voies neurologiques qui contrôlent le mouvement. Les personnes atteintes de la maladie de Parkinson peuvent ressentir une raideur musculaire dans diverses parties du corps, notamment les bras, les jambes et le tronc. Cette raideur peut rendre les mouvements difficiles et peut contribuer à la lenteur des mouvements caractéristique de la maladie. Il est important de consulter un médecin si vous présentez des symptômes de Parkinson, y compris la raideur musculaire, afin d'obtenir un diagnostic précis et un plan de traitement approprié.",
                      imagePath: "assets/images/symptom2.jpg",
                    ),
                  ),
                );
              },
              child: symptomCardView(
                context,
                "2. Raideur Musculaire :",
                "Les muscles deviennent raides et tendus, entraînant une perte de souplesse.",
                "assets/images/symptom2.jpg",
              ),
            ),
            const SizedBox(height: 16),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SymptomDetailPage(
                      title: "Bradykinésie",
                      description:
                          "La bradykinésie est un symptôme majeur de la maladie de Parkinson. Elle se caractérise par une lenteur des mouvements volontaires et automatiques, ce qui signifie que les personnes atteintes ont des difficultés à démarrer un mouvement, à le maintenir en cours ou à le terminer. Cela peut se manifester par des gestes lents, des difficultés à accomplir des tâches quotidiennes telles que se habiller ou manger, et une réduction de l'amplitude des mouvements. La bradykinésie est souvent accompagnée d'une raideur musculaire et de tremblements, qui sont également des symptômes courants de la maladie de Parkinson.",
                      imagePath: "assets/images/symptom3.jpg",
                    ),
                  ),
                );
              },
              child: symptomCardView(
                context,
                "3. Bradykinésie :",
                "Ralentissement des mouvements volontaires, ce qui rend les activités quotidiennes difficiles.",
                "assets/images/symptom3.jpg",
              ),
            ),
            const SizedBox(height: 16),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SymptomDetailPage(
                      title: "Instabilité Posturale",
                      description:
                          "Les symptômes de la maladie de Parkinson peuvent varier d'une personne à l'autre, mais l'instabilité posturale est un symptôme courant. Cela se réfère à la difficulté à maintenir une posture stable et à l'équilibre. Les personnes atteintes de la maladie de Parkinson peuvent avoir tendance à se pencher en avant ou en arrière, à vaciller ou à avoir des difficultés à se lever d'une chaise ou à marcher sur des surfaces inégales. L'instabilité posturale peut également augmenter le risque de chutes chez les personnes atteintes de la maladie de Parkinson. Il est important pour les personnes atteintes de cette condition de travailler avec leur équipe médicale pour gérer leurs symptômes et maintenir une qualité de vie aussi élevée que possible..",
                      imagePath: "assets/images/symptom4.jpg",
                    ),
                  ),
                );
              },
              child: symptomCardView(
                context,
                "4. Instabilité Posturale :",
                "Difficulté à maintenir l'équilibre et risque accru de chutes.",
                "assets/images/symptom4.jpg",
              ),
            ),
            const SizedBox(height: 32),
            const Text(
              'Conseils Pour vivre avec Parkinson',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AdviceDetailPage(
                      title: "Rester Actif",
                      description:
                          "Vivre avec la maladie de Parkinson peut être difficile, mais rester actif peut être une partie importante de la gestion de la condition. Voici quelques conseils pour rester actif malgré Parkinson :\nExercices physiques adaptés : Consultez un professionnel de la santé pour élaborer un programme d'exercices adapté à vos besoins et capacités. Les exercices peuvent inclure des activités telles que la marche, la natation, le tai-chi ou le yoga, qui peuvent aider à améliorer la force musculaire, l'équilibre et la flexibilité.\nRoutine d'exercices régulière : Essayez de vous engager dans une routine d'exercices régulière, en planifiant des sessions d'exercices plusieurs fois par semaine. Cela peut aider à maintenir votre niveau de fonctionnement physique et à minimiser les symptômes de Parkinson.\nActivités sociales et communautaires : Restez engagé dans des activités sociales et communautaires qui vous intéressent. Cela peut vous aider à rester mentalement stimulé, émotionnellement connecté et à maintenir un sentiment de bien-être général.\nAdaptations et aides techniques : Explorez les options d'adaptations et d'aides techniques qui peuvent vous aider à rester actif malgré les défis posés par la maladie. Des accessoires tels que des cannes, des déambulateurs ou des dispositifs d'assistance à la mobilité peuvent être utiles pour maintenir votre indépendance et votre sécurité.\nGestion du stress et de l'anxiété : Pratiquez des techniques de gestion du stress et de l'anxiété, telles que la méditation, la respiration profonde ou le biofeedback. Le stress peut aggraver les symptômes de Parkinson, donc en apprenant à le gérer, vous pouvez améliorer votre qualité de vie.\nRestez informé : Informez-vous sur la maladie de Parkinson et sur les différentes façons de la gérer. Plus vous en saurez sur votre condition, plus vous serez capable de prendre des décisions éclairées sur la façon de rester actif et en bonne santé malgré les défis.\nEn restant actif physiquement, mentalement et socialement, vous pouvez améliorer votre qualité de vie et maintenir votre indépendance autant que possible tout en vivant avec la maladie de Parkinson. N'oubliez pas de travailler en étroite collaboration avec votre équipe de soins de santé pour élaborer un plan qui vous convient le mieux.",
                      imagePath: "assets/images/c1.jpg",
                    ),
                  ),
                );
              },
              child: cardView(
                context,
                "1. Rester Actif :",
                "Pratiquez une activité physique régulière comme la marche, la natation...",
                "assets/images/c1.jpg",
              ),
            ),
            const SizedBox(height: 16),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AdviceDetailPage(
                      title: "Gestion des Médicaments",
                      description:
                          "La gestion des médicaments est essentielle pour vivre avec la maladie de Parkinson de manière optimale. Voici quelques conseils pour vous aider à gérer vos médicaments :\n1.Établissez un horaire de prise régulier : Prenez vos médicaments à des heures fixes chaque jour. Cela aide à maintenir des niveaux constants de médicaments dans votre système et à contrôler les symptômes de Parkinson de manière plus efficace.\n2.Utilisez un pilulier ou un système de rappel : Pour éviter d'oublier de prendre vos médicaments, utilisez un pilulier hebdomadaire ou un système de rappel électronique. Ces outils peuvent vous aider à rester organisé et à suivre votre régime de médication.\n3.Communiquez avec votre médecin : Informez votre médecin de tout effet secondaire ou de tout problème que vous rencontrez avec vos médicaments. Ils peuvent ajuster votre dosage ou vous prescrire des médicaments différents pour mieux gérer vos symptômes.\n4.Évitez les interactions médicamenteuses : Assurez-vous que votre médecin est au courant de tous les médicaments que vous prenez, y compris les médicaments en vente libre et les compléments alimentaires. Certains médicaments peuvent interagir avec les médicaments contre la maladie de Parkinson, ce qui peut affecter leur efficacité ou causer des effets secondaires indésirables.\n5.Surveillez les effets de vos médicaments : Gardez un journal de vos symptômes et de la manière dont ils répondent aux médicaments. Cela peut vous aider, ainsi que votre médecin, à ajuster votre traitement pour mieux contrôler la maladie.\n6.Soyez patient : Trouver le bon équilibre de médicaments peut prendre du temps. Soyez patient et continuez à travailler avec votre médecin pour trouver le traitement le plus efficace pour vous.\nEn suivant ces conseils et en travaillant en étroite collaboration avec votre équipe médicale, vous pouvez mieux gérer vos médicaments et améliorer votre qualité de vie avec la maladie de Parkinson.",
                      imagePath: "assets/images/c2.jpg",
                    ),
                  ),
                );
              },
              child: cardView(
                context,
                "2. Gestion des Médicaments :",
                "Prenez les médicaments selon les prescriptions de votre professionnel...",
                "assets/images/c2.jpg",
              ),
            ),
            const SizedBox(height: 16),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AdviceDetailPage(
                      title: "Alimentation Équilibrée",
                      description:
                          "Vivre avec la maladie de Parkinson peut présenter des défis, mais adopter une alimentation équilibrée peut aider à gérer les symptômes et à maintenir une meilleure qualité de vie. Voici quelques conseils pour une alimentation adaptée aux personnes atteintes de la maladie de Parkinson :\n1.Priorité à une alimentation riche en nutriments : Assurez-vous d'inclure une variété d'aliments riches en nutriments essentiels tels que les fruits, les légumes, les grains entiers, les protéines maigres et les sources de graisses saines dans votre alimentation. Les nutriments peuvent aider à soutenir la santé du cerveau et du système nerveux.\n2.Consommation suffisante de fibres : Les fibres alimentaires sont importantes pour la santé digestive. Optez pour des aliments riches en fibres comme les fruits, les légumes, les légumineuses et les céréales complètes pour favoriser le transit intestinal et prévenir la constipation, un symptôme fréquent chez les personnes atteintes de Parkinson.\n3.Contrôle de la constipation : Boire beaucoup d'eau et consommer des aliments riches en fibres peut aider à prévenir et à soulager la constipation. Si nécessaire, parlez à votre médecin pour obtenir des conseils supplémentaires sur la gestion de ce problème.\n4.Maintien d'un poids santé : Un poids santé peut aider à réduire la pression sur les articulations et à améliorer la mobilité, ce qui est particulièrement important pour les personnes atteintes de Parkinson. Adoptez une alimentation équilibrée et restez actif pour maintenir un poids santé.\n5.Gestion de la dysphagie : Certaines personnes atteintes de la maladie de Parkinson peuvent éprouver des difficultés à avaler (dysphagie). Dans ce cas, il peut être utile de consulter un nutritionniste ou un orthophoniste pour obtenir des conseils sur des textures alimentaires appropriées et des techniques pour faciliter la déglutition.\n6.Supplémentation si nécessaire : Parlez à votre médecin ou à un nutritionniste pour déterminer si vous avez besoin de suppléments vitaminiques ou minéraux. Certaines personnes atteintes de Parkinson peuvent avoir des besoins accrus en certains nutriments en raison de la maladie ou de médicaments qu'elles prennent.\n7.Évitez les aliments qui peuvent aggraver les symptômes : Certaines personnes atteintes de Parkinson constatent que certains aliments ou boissons peuvent aggraver leurs symptômes, tels que les aliments riches en sucres ajoutés, les aliments gras, la caféine et l'alcool. Essayez de limiter votre consommation de ces substances et surveillez comment votre corps réagit.\nEn fin de compte, l'alimentation joue un rôle crucial dans la gestion de la maladie de Parkinson. En adoptant une approche axée sur une alimentation équilibrée, vous pouvez aider à soutenir votre santé globale et à atténuer certains des symptômes associés à la maladie. N'oubliez pas de consulter votre équipe médicale pour obtenir des conseils personnalisés en fonction de vos besoins spécifiques.",
                      imagePath: "assets/images/c3.jpg",
                    ),
                  ),
                );
              },
              child: cardView(
                context,
                "3. Alimentation Équilibrée :",
                "Maintenez une alimentation saine et équilibrée en mettant l'accent sur les...",
                "assets/images/c3.jpg",
              ),
            ),
            const SizedBox(height: 16),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AdviceDetailPage(
                      title: "Sommeil Adéquat",
                      description:
                          "Vivre avec la maladie de Parkinson peut être un défi, mais il existe des stratégies pour améliorer la qualité de vie. Un sommeil adéquat est crucial pour la santé physique et mentale, et cela peut être particulièrement vrai pour les personnes atteintes de Parkinson. Voici quelques conseils pour favoriser un sommeil adéquat :\n1.Routine de sommeil régulière : Essayez de vous coucher et de vous lever à la même heure chaque jour, même les weekends. Cela aide à réguler votre horloge biologique.\n2.Créez un environnement propice au sommeil : Assurez-vous que votre chambre est sombre, calme et confortable. Éliminez les distractions telles que la lumière vive, le bruit excessif ou la température inconfortable.\n3.Limitez les stimulants : Évitez la caféine et la nicotine, surtout en fin de journée, car elles peuvent perturber le sommeil.\n4.Faites de l'exercice régulièrement : L'exercice physique régulier peut aider à réguler le sommeil. Essayez de faire de l'exercice pendant la journée, mais évitez les activités trop vigoureuses juste avant le coucher.\n5.Évitez les siestes prolongées : Les siestes trop longues pendant la journée peuvent perturber votre cycle de sommeil nocturne. Si vous avez besoin de faire une sieste, limitez-la à 20-30 minutes et évitez de la faire trop tard dans la journée.\n6.Établissez une routine de relaxation avant le coucher : Pratiquez des techniques de relaxation telles que la méditation, la respiration profonde ou le yoga pour vous aider à vous détendre avant de vous coucher.\n7.Consultez votre médecin : Si vous avez des difficultés persistantes avec le sommeil malgré vos efforts, parlez-en à votre médecin. Ils peuvent évaluer si vos symptômes de Parkinson contribuent à vos problèmes de sommeil et recommander des traitements ou des ajustements de médicaments si nécessaire.\nEn fin de compte, trouver ce qui fonctionne le mieux pour vous peut nécessiter un peu d'expérimentation. Soyez patient avec vous-même et soyez ouvert à essayer différentes stratégies pour améliorer votre sommeil.",
                      imagePath: "assets/images/c4.jpg",
                    ),
                  ),
                );
              },
              child: cardView(
                context,
                "4. Sommeil Adéquat :",
                "Assurez-vous de bénéficier d'un sommeil réparateur chaque nuit...",
                "assets/images/c4.jpg",
              ),
            ),
            const SizedBox(height: 16),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AdviceDetailPage(
                      title: "Bien-Être Émotionnel",
                      description:
                          " il existe des stratégies pour améliorer le bien-être émotionnel malgré les difficultés. Voici quelques conseils :\n1.Acceptation et adaptation : Accepter le diagnostic de la maladie de Parkinson peut être difficile, mais c'est une étape essentielle pour pouvoir s'adapter et trouver des moyens de vivre pleinement malgré la maladie.\n2.Éducation : Apprendre autant que possible sur la maladie de Parkinson peut aider à comprendre ses symptômes, son évolution et les stratégies pour la gérer. Cela peut réduire l'anxiété et renforcer le sentiment de contrôle.\n3.Soutien social : Maintenir des relations positives avec la famille, les amis et d'autres personnes atteintes de la maladie de Parkinson peut offrir un soutien émotionnel crucial. Les groupes de soutien peuvent également fournir un espace pour partager des expériences et des conseils.\n4.Exercice physique : L'exercice régulier, adapté aux capacités individuelles, peut aider à réduire les symptômes de la maladie de Parkinson et à améliorer l'humeur. Cela peut inclure la marche, la natation, le yoga ou d'autres activités qui conviennent à chaque personne.\n5.Gestion du stress : Trouver des techniques de relaxation comme la méditation, la respiration profonde ou le tai-chi peut aider à réduire le stress et l'anxiété associés à la maladie.\n6.Routine quotidienne : Établir une routine régulière peut aider à créer un sentiment de stabilité et de contrôle. Cela peut inclure des horaires de prise de médicaments, des activités planifiées et des moments de repos.\n7.Alimentation saine : Une alimentation équilibrée peut contribuer au bien-être émotionnel en fournissant les nutriments nécessaires au cerveau et au corps. Il est important de consulter un nutritionniste pour élaborer un plan alimentaire adapté aux besoins individuels.\n8.Expression des émotions : Trouver des moyens sains d'exprimer ses émotions, que ce soit par l'art, l'écriture, la musique ou simplement en parlant avec des proches, peut aider à soulager le stress et à favoriser le bien-être émotionnel.\n9.Consultation médicale et suivi régulier : Un suivi médical régulier avec un neurologue spécialisé dans la maladie de Parkinson est essentiel pour ajuster les médicaments et les traitements en fonction de l'évolution de la maladie.\n10.Recherche de soutien professionnel : Parfois, il est nécessaire de consulter un professionnel de la santé mentale, tel qu'un psychologue ou un psychiatre, pour obtenir un soutien supplémentaire en cas de dépression, d'anxiété ou d'autres problèmes émotionnels.\nEn combinant ces différentes stratégies, il est possible d'améliorer le bien-être émotionnel et de mieux vivre avec la maladie de Parkinson. Il est important de se rappeler qu'il n'y a pas de solution unique, et chaque personne peut trouver ce qui fonctionne le mieux pour elle.",
                      imagePath: "assets/images/c5.jpg",
                    ),
                  ),
                );
              },
              child: cardView(
                context,
                "5. Bien-Être Émotionnel :",
                "Restez connecté socialement avec vos amis et votre famille. Envisagez de rejoindre...",
                "assets/images/c5.jpg",
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget symptomCardView(BuildContext context, String text, String description,
          String? image) =>
      Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: 200,
                  width: MediaQuery.of(context).size.width - 33,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(image!),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              text,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(description),
          ],
        ),
      );

  Widget cardView(BuildContext context, String text, String description,
          String? image) =>
      Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: 200,
                  width: MediaQuery.of(context).size.width - 33,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(image!),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              text,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(description),
          ],
        ),
      );
}

void main() {
  runApp(MaterialApp(
    home: ConseilPage(),
  ));
}
