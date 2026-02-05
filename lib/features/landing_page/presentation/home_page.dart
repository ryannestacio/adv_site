import 'package:flutter/material.dart';
import 'package:site_adv/core/theme/app_colors.dart';
import 'widgets/area_card.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
                    decoration: BoxDecoration(color: AppColors.navyBlue),
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
                      // Navigator.pushNamed(context, '/sobre');
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.list),
                    title: const Text('Áreas de Atuação'),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: const Icon(Icons.phone),
                    title: const Text('Contato'),
                    onTap: () {},
                  ),
                ],
              ),
            )
          : null,
      appBar: AppBar(
        title: const Text(
          "Vasconcelos Advocacia",
          style: TextStyle(fontSize: 30, fontFamily: 'Prata'),
        ),
        actions: isMobile
            ? []
            : [
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    "Sobre",
                    style: TextStyle(color: Colors.white, fontFamily: 'Lato'),
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    "Áreas",
                    style: TextStyle(color: Colors.white, fontFamily: 'Lato'),
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    "Contato",
                    style: TextStyle(color: Colors.white, fontFamily: 'Lato'),
                  ),
                ),
                const SizedBox(width: 20),
              ],
      ),

      // SingleChildScrollView permite rolar a página para baixo
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeroSection(context),
            const SizedBox(height: 60),
            _buildAreasSection(context),
            const SizedBox(height: 60),
            _buildFooter(),
          ],
        ),
      ),

      // Botão Flutuante do WhatsApp (Essencial para conversão)
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _launchURL("https://wa.me/557998804234");
          print("Abrir WhatsApp");
        },
        backgroundColor: Colors.green,
        //child: const Icon(Icons.chat, color: Colors.white),
        child: const FaIcon(FontAwesomeIcons.whatsapp, color: Colors.white),
      ),
    );
  }

  // --- SEÇÃO 1: HERO (O Topo impactante do site) ---
  Widget _buildHeroSection(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 20),
      decoration: const BoxDecoration(
        color: AppColors.navyBlue,
        // Futuramente colocaremos uma imagem de fundo aqui
      ),
      child: Column(
        children: [
          const Text(
            "Excelência e Ética na Defesa dos Seus Direitos",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: AppColors.white,
              fontFamily: 'Prata',
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            "Soluções jurídicas personalizadas para pessoas e empresas.",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              color: AppColors.offWhite,
              fontFamily: 'Lato',
            ),
          ),
          const SizedBox(height: 40),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
            ),
            child: const Text(
              "FALAR COM UM ESPECIALISTA",
              style: TextStyle(fontFamily: 'Lato'),
            ),
          ),
        ],
      ),
    );
  }

  // --- SEÇÃO 2: ÁREAS DE ATUAÇÃO (Onde usamos seus Cards) ---
  Widget _buildAreasSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          // Título da Seção
          const Text(
            "Nossas Áreas de Atuação",
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: AppColors.navyBlue,
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
          const SizedBox(height: 40),

          // Wrap garante que os cards quebrem linha no celular e fiquem lado a lado no PC
          Wrap(
            spacing: 24, // Espaço horizontal
            runSpacing: 24, // Espaço vertical
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
                icon: Icons.elderly,
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Helper para padronizar o tamanho dos cards
  Widget _buildResponsiveCard({
    required String title,
    required String description,
    required IconData icon,
  }) {
    return SizedBox(
      width: 300, // Largura fixa para ficar bonito no grid
      // Altura fixa opcional, mas deixar solto evita overflow de texto
      child: AreaCard(
        title: title,
        description: description,
        icon: icon,
        onTap: () {},
      ),
    );
  }

  // --- SEÇÃO 3: RODAPÉ SIMPLES ---
  Widget _buildFooter() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(40),
      color: AppColors.royalBlue,
      child: Column(
        children: [
          const Text(
            "Vasconcelos Advocacia",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Text(
            "Rua Exemplo, 123, Centro - Aracaju/SE",
            style: TextStyle(color: Colors.white.withOpacity(0.8)),
          ),
          const SizedBox(height: 20),
          Text(
            "© 2026 Desenvolvido pela AllTech TI",
            style: TextStyle(color: AppColors.gold, fontSize: 12),
          ),
        ],
      ),
    );
  }
}
