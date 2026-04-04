import 'package:flutter/material.dart';
import 'package:site_adv/core/theme/app_colors.dart';
import '../widgets/area_card.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:site_adv/features/landing_page/presentation/widgets/authority_section.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();

  // Os Rastreadores (GPS) para cada seção
  final GlobalKey _homeKey = GlobalKey();
  final GlobalKey _areasKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();

  @override
  void dispose() {
    _scrollController.dispose(); // Sempre limpe a bagunça ao sair
    super.dispose();
  }

  // A Função Mágica que faz rolar
  void _scrollToSection(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      // Isso diz ao Flutter: "Faça este widget ficar visível na tela"
      Scrollable.ensureVisible(
        context,
        duration: const Duration(seconds: 1),
        curve: Curves.easeInOut,
      );
    }
  }

  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw '$url não encontrada.';
    }
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    final bool isMobile = width < 800;

    return Scaffold(
      backgroundColor: AppColors.offWhite,

      drawer: isMobile
          ? Drawer(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  const DrawerHeader(
                    decoration: BoxDecoration(color: AppColors.darkGreen),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.gavel, size: 50, color: AppColors.gold),
                        SizedBox(height: 10),
                        Text(
                          "Menu",
                          style: TextStyle(color: Colors.white, fontSize: 24),
                        ),
                      ],
                    ),
                  ),
                  ListTile(
                    leading: const Icon(Icons.info),
                    title: const Text('Sobre'),
                    onTap: () {
                      _scrollToSection(_homeKey);
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.list),
                    title: const Text('Áreas de Atuação'),
                    onTap: () {
                      _scrollToSection(_areasKey);
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.phone),
                    title: const Text('Contato'),
                    onTap: () {
                      _scrollToSection(_contactKey);
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            )
          : null,
      appBar: AppBar(
        title: isMobile
            ? const Text(
                "Soares Vasconcelos",
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'Prata',
                  fontWeight: FontWeight.w600,
                ),
              )
            : const Text(
                "Soares Vasconcelos Advocacia",
                style: TextStyle(
                  fontSize: 28,
                  fontFamily: 'Prata',
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.5,
                ),
              ),
        actions: isMobile
            ? []
            : [
                TextButton(
                  onPressed: () => _scrollToSection(_homeKey),
                  child: const Text(
                    "Home",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Lato',
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.3,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () => _scrollToSection(_areasKey),
                  child: const Text(
                    "Áreas",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Lato',
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.3,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () => _scrollToSection(_contactKey),
                  child: const Text(
                    "Contato",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Lato',
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.3,
                    ),
                  ),
                ),
                const SizedBox(width: 24),
              ],
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [AppColors.darkGreen, Color(0xFF1C4A3A)],
            ),
          ),
        ),
        elevation: 1,
      ),

      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            Container(key: _homeKey, child: _buildHeroSection(context)),

            const SizedBox(height: 60),

            Container(key: _areasKey, child: _buildAreasSection(context)),

            const SizedBox(height: 60),

            Container(key: _contactKey, child: _buildFooter()),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _launchURL("https://wa.me/557998804234");
          print("Abrir WhatsApp");
        },
        backgroundColor: Colors.green,
        child: const FaIcon(FontAwesomeIcons.whatsapp, color: Colors.white),
      ),
    );
  }

  Widget _buildHeroSection(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 20),
      decoration: const BoxDecoration(
        color: AppColors.darkGreen,
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [AppColors.darkGreen, Color(0xFF1C4A3A)],
        ),
      ),
      child: Column(
        children: [
          const Text(
            "Excelência e Ética na Defesa dos Seus Direitos",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 44,
              fontWeight: FontWeight.bold,
              color: AppColors.white,
              fontFamily: 'Prata',
              height: 1.2,
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            "Soluções jurídicas personalizadas para pessoas e empresas. Com experiência e dedicação, transformamos desafios legais em oportunidades.",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              color: AppColors.offWhite,
              fontFamily: 'Lato',
              height: 1.5,
            ),
          ),
          const SizedBox(height: 48),
          ElevatedButton(
            onPressed: () {
              _launchURL("https://wa.me/557998804234");
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
              backgroundColor: AppColors.gold,
              foregroundColor: AppColors.darkGreen,
            ),
            child: const Text(
              "FALAR COM UM ESPECIALISTA",
              style: TextStyle(
                fontFamily: 'Lato',
                fontWeight: FontWeight.bold,
                fontSize: 14,
                letterSpacing: 0.5,
              ),
            ),
          ),
          const SizedBox(height: 80),
          AuthoritySection(),
        ],
      ),
    );
  }

  Widget _buildAreasSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          const Text(
            "Nossas Áreas de Atuação",
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: AppColors.darkGreen,
              fontFamily: 'Prata',
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            "Entenda como podemos ajudar no seu caso",
            style: TextStyle(
              fontSize: 16,
              color: AppColors.grey,
              fontFamily: 'Lato',
            ),
          ),
          const SizedBox(height: 50),

          Wrap(
            spacing: 24,
            runSpacing: 24,
            alignment: WrapAlignment.center,
            children: [
              _buildResponsiveCard(
                title: "Direito Civil",
                description:
                    "Contratos, família, sucessões e responsabilidade civil.",
                icon: Icons.balance,
              ),
              _buildResponsiveCard(
                title: "Direito Trabalhista",
                description:
                    "Defesa de empregados e consultoria preventiva para empresas.",
                icon: Icons.work,
              ),
              _buildResponsiveCard(
                title: "Direito Criminal",
                description:
                    "Atuação em inquéritos policiais e processos judiciais.",
                icon: Icons.gavel,
              ),
              _buildResponsiveCard(
                title: "Direito Previdenciário",
                description:
                    "Aposentadorias, auxílios e revisões junto ao INSS.",
                icon: Icons.card_membership,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildResponsiveCard({
    required String title,
    required String description,
    required IconData icon,
  }) {
    return SizedBox(
      width: 300,
      child: AreaCard(
        title: title,
        description: description,
        icon: icon,
        onTap: () {},
      ),
    );
  }

  Widget _buildFooter() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(40),
      color: AppColors.forestGreen,
      child: Stack(
        children: [
          Column(
            children: [
              // Seção de Serviços e Informações
              const SizedBox(height: 20),
              const Text(
                "Soares Vasconcelos Advocacia",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  fontFamily: "Prata",
                ),
              ),
              const SizedBox(height: 30),

              // Grid de informações (desktop) ou coluna (mobile)
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Wrap(
                  alignment: WrapAlignment.spaceEvenly,
                  spacing: 40,
                  runSpacing: 40,
                  children: [
                    // Serviços
                    _buildFooterSection(
                      title: "SERVIÇOS",
                      items: const [
                        "Direito Civil",
                        "Direito Trabalhista",
                        "Direito Criminal",
                        "Direito Previdenciário",
                      ],
                    ),

                    // Contato
                    _buildFooterSection(
                      title: "CONTATO",
                      items: const [
                        "(79) 3556-4234",
                        "soaresvasconcelos@email.com",
                        "Aracaju, SE",
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 50),
              Divider(color: Colors.white.withOpacity(0.2), thickness: 1),
              const SizedBox(height: 30),

              Text(
                "© 2026 Soares Vasconcelos Advocacia. Todos os direitos reservados.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white.withOpacity(0.7),
                  fontSize: 12,
                ),
              ),
            ],
          ),

          // Seção "Desenvolvido por" com logo no canto inferior esquerdo
          Positioned(
            bottom: 5,
            left: 40,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Desenvolvido por:",
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.8),
                    fontSize: 12,
                    fontFamily: 'Lato',
                    letterSpacing: 0.5,
                  ),
                ),
                const SizedBox(width: 5),
                GestureDetector(
                  onTap: () {
                    _launchURL("http://ryanestaciodev.web.app");
                  },
                  child: MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: Image.asset(
                      'lib/core/assets/images/RE-logo-branca.png',
                      height: 55,
                      width: 55,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFooterSection({
    required String title,
    required List<String> items,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: AppColors.gold,
            fontWeight: FontWeight.bold,
            fontSize: 12,
            letterSpacing: 1,
          ),
        ),
        const SizedBox(height: 15),
        ...items.map(
          (item) => Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Text(
              item,
              style: TextStyle(
                color: Colors.white.withOpacity(0.8),
                fontSize: 13,
                fontFamily: 'Lato',
              ),
            ),
          ),
        ),
      ],
    );
  }
}
