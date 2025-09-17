import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Denzil Muchangi - Flutter Developer',
      theme: ThemeData(
        fontFamily: 'Segoe UI',
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const ProfilePage(),
    );
  }
}

Widget _buildBadge(String imageUrl, String linkUrl) {
  return GestureDetector(
    onTap: () => launchUrl(Uri.parse(linkUrl)),
    child: Image.network(
      imageUrl,
      height: 28,
      fit: BoxFit.contain,
    ),
  );
}

Widget _buildProjectCard(String title, String description, String repoUrl, List<String> techStack) {
  return Card(
    elevation: 5,
    child: Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFF333333),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            description,
            style: const TextStyle(
              fontSize: 16,
              color: Color(0xFF333333),
              height: 1.5,
            ),
          ),
          const SizedBox(height: 15),
          Wrap(
            spacing: 8,
            children: techStack.map((tech) => Chip(label: Text(tech))).toList(),
          ),
          const SizedBox(height: 15),
          ElevatedButton(
            onPressed: () => launchUrl(Uri.parse(repoUrl)),
            child: const Text('View on GitHub'),
          ),
        ],
      ),
    ),
  );
}

Widget _buildResourceCard(String badgeUrl, String linkUrl, String description) {
  return GestureDetector(
    onTap: () => launchUrl(Uri.parse(linkUrl)),
    child: Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Image.network(badgeUrl, height: 40),
            const SizedBox(height: 10),
            Text(
              description,
              style: const TextStyle(
                fontSize: 14,
                fontStyle: FontStyle.italic,
                color: Color(0xFF333333),
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    ),
  );
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header Section
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(40),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Color(0xFFFF9A9E), Color(0xFFFECFEE)],
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                ),
              ),
              child: const Column(
                children: [
                  Text(
                    '💻 Denzil Muchangi',
                    style: TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Pioneering Flutter Developer | Shaping the Future of Cross-Platform Innovation (2025-2030)',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontStyle: FontStyle.italic,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            // Expertise Section
            Container(
              margin: const EdgeInsets.all(20),
              padding: const EdgeInsets.all(30),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.9),
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 15,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '🌟 Expertise',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF333333),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Mobile Development: Building robust, scalable cross-platform applications with Flutter.\n'
                    'Cloud Solutions: Leveraging Firebase for seamless backend integration.\n'
                    'Database Management: Utilizing MySQL for efficient data handling.',
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFF333333),
                      height: 1.6,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            ),
            // Tech Stack Section
            Container(
              margin: const EdgeInsets.all(20),
              padding: const EdgeInsets.all(30),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.9),
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 15,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '🛠️ Tech Stack',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF333333),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Core Technologies',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF333333),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: [
                      _buildBadge('https://img.shields.io/badge/Flutter-%2302569B.svg?style=for-the-badge&logo=Flutter&logoColor=white', 'https://flutter.dev'),
                      _buildBadge('https://img.shields.io/badge/dart-%230175C2.svg?style=for-the-badge&logo=dart&logoColor=white', 'https://dart.dev'),
                      _buildBadge('https://img.shields.io/badge/firebase-%23039BE5.svg?style=for-the-badge&logo=firebase', 'https://firebase.google.com'),
                      _buildBadge('https://img.shields.io/badge/mysql-4479A1.svg?style=for-the-badge&logo=mysql&logoColor=white', 'https://www.mysql.com'),
                      _buildBadge('https://img.shields.io/badge/Visual%20Studio%20Code-0078d4.svg?style=for-the-badge&logo=visual-studio-code&logoColor=white', 'https://code.visualstudio.com'),
                      _buildBadge('https://img.shields.io/badge/git-%23F05033.svg?style=for-the-badge&logo=git&logoColor=white', 'https://git-scm.com'),
                      _buildBadge('https://img.shields.io/badge/Postman-FF6C37?style=for-the-badge&logo=postman&logoColor=white', 'https://www.postman.com'),
                    ],
                  ),
                  const SizedBox(height: 30),
                  const Text(
                    '🚀 Emerging Technologies (2025-2030)',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF333333),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Peering into the future of Flutter development with cutting-edge tools and integrations',
                    style: TextStyle(
                      fontSize: 16,
                      fontStyle: FontStyle.italic,
                      color: Color(0xFF333333),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    'State Management',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF333333),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: [
                      _buildBadge('https://img.shields.io/badge/Riverpod-000000?style=for-the-badge&logo=flutter&logoColor=white', 'https://riverpod.dev'),
                      _buildBadge('https://img.shields.io/badge/GetX-8B5CF6?style=for-the-badge&logo=flutter&logoColor=white', 'https://pub.dev/packages/get'),
                      _buildBadge('https://img.shields.io/badge/Bloc-42A5F5?style=for-the-badge&logo=flutter&logoColor=white', 'https://bloclibrary.dev'),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'AI/ML & AR/VR & Web3',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF333333),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: [
                      _buildBadge('https://img.shields.io/badge/TensorFlow%20Lite-FF6F00?style=for-the-badge&logo=tensorflow&logoColor=white', 'https://www.tensorflow.org/lite'),
                      _buildBadge('https://img.shields.io/badge/ARCore-4285F4?style=for-the-badge&logo=google&logoColor=white', 'https://developers.google.com/ar'),
                      _buildBadge('https://img.shields.io/badge/WalletConnect-3B99FC?style=for-the-badge&logo=walletconnect&logoColor=white', 'https://walletconnect.com'),
                    ],
                  ),
                ],
              ),
            ),
            // Future Visions Section
            Container(
              margin: const EdgeInsets.all(20),
              padding: const EdgeInsets.all(30),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.9),
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 15,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '🚀 Future Visions (2025-2030)',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF333333),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Center(
                    child: Column(
                      children: [
                        Text(
                          '     /\\\n'
                          '    //\\\\\n'
                          '   ///\\\\\\\n'
                          '  ////\\\\\\\\\n'
                          ' /////\\\\\\\\\\\n'
                          '//////\\\\\\\\\\\\\n'
                          '     |  |\n'
                          '     |  |\n'
                          '    /\\/\\/\\\n'
                          '   /\\/\\/\\/\\\n',
                          style: TextStyle(
                            fontFamily: 'monospace',
                            fontSize: 14,
                            color: Color(0xFF000000),
                            backgroundColor: Color(0x0F000000),
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Embarking on a journey through the technological horizons of tomorrow',
                          style: TextStyle(
                            fontSize: 16,
                            fontStyle: FontStyle.italic,
                            color: Color(0xFF333333),
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'As we venture into the 2025-2030 era, Flutter development is poised to revolutionize mobile experiences through groundbreaking integrations. Here\'s my vision for the future:',
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFF333333),
                      height: 1.6,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    '🤖 AI-Driven Apps',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF333333),
                    ),
                  ),
                  const SizedBox(height: 10),
                  RichText(
                    textAlign: TextAlign.justify,
                    text: TextSpan(
                      style: const TextStyle(
                        fontSize: 16,
                        color: Color(0xFF333333),
                        height: 1.6,
                      ),
                      children: [
                        const TextSpan(text: 'Imagine apps that learn, adapt, and anticipate user needs. Integrating machine learning models directly into Flutter apps for real-time personalization, predictive analytics, and intelligent automation. '),
                        TextSpan(
                          text: 'TensorFlow Lite for Flutter',
                          style: const TextStyle(color: Colors.blue),
                          recognizer: TapGestureRecognizer()..onTap = () => launchUrl(Uri.parse('https://pub.dev/packages/tflite_flutter')),
                        ),
                        const TextSpan(text: ' enables on-device AI, ensuring privacy and performance.'),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    '🕶️ AR/VR Integrations',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF333333),
                    ),
                  ),
                  const SizedBox(height: 10),
                  RichText(
                    textAlign: TextAlign.justify,
                    text: TextSpan(
                      style: const TextStyle(
                        fontSize: 16,
                        color: Color(0xFF333333),
                        height: 1.6,
                      ),
                      children: [
                        const TextSpan(text: 'Blending digital and physical worlds seamlessly. Flutter\'s support for ARCore and ARKit opens doors to immersive experiences in gaming, education, and retail. Explore hands-on examples in the '),
                        TextSpan(
                          text: 'Flutter Samples AR repository',
                          style: const TextStyle(color: Colors.blue),
                          recognizer: TapGestureRecognizer()..onTap = () => launchUrl(Uri.parse('https://github.com/flutter/samples/tree/main/experimental/3d')),
                        ),
                        const TextSpan(text: ' to see the potential.'),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    '🌐 Web3 & Blockchain',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF333333),
                    ),
                  ),
                  const SizedBox(height: 10),
                  RichText(
                    textAlign: TextAlign.justify,
                    text: TextSpan(
                      style: const TextStyle(
                        fontSize: 16,
                        color: Color(0xFF333333),
                        height: 1.6,
                      ),
                      children: [
                        const TextSpan(text: 'Decentralized apps that empower users with true ownership. Integrating blockchain for secure transactions, NFTs, and decentralized identity. Dive into tutorials like '),
                        TextSpan(
                          text: 'Trust Wallet Core',
                          style: const TextStyle(color: Colors.blue),
                          recognizer: TapGestureRecognizer()..onTap = () => launchUrl(Uri.parse('https://github.com/trustwallet/wallet-core')),
                        ),
                        const TextSpan(text: ' for Flutter blockchain integrations, or explore '),
                        TextSpan(
                          text: 'web3dart',
                          style: const TextStyle(color: Colors.blue),
                          recognizer: TapGestureRecognizer()..onTap = () => launchUrl(Uri.parse('https://pub.dev/packages/web3dart')),
                        ),
                        const TextSpan(text: ' for Ethereum interactions.'),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    '⚛️ Quantum Computing Influences',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF333333),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Harnessing quantum algorithms for optimization problems in app logic, cryptography, and simulations. While quantum hardware is emerging, Flutter apps can prepare by adopting quantum-resistant encryption and exploring quantum-inspired algorithms for enhanced performance.',
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFF333333),
                      height: 1.6,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    '🌱 Sustainable Tech',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF333333),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Building eco-conscious applications with low-power optimizations, carbon footprint tracking, and green computing practices. Flutter\'s efficient rendering and cross-platform nature contribute to sustainable development by reducing device energy consumption.',
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFF333333),
                      height: 1.6,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      children: [
                        _buildBadge('https://img.shields.io/badge/AI--Driven-FF6B6B?style=for-the-badge&logo=brain&logoColor=white', '#'),
                        _buildBadge('https://img.shields.io/badge/AR/VR-9C27B0?style=for-the-badge&logo=vr&logoColor=white', '#'),
                        _buildBadge('https://img.shields.io/badge/Web3-627EEA?style=for-the-badge&logo=ethereum&logoColor=white', '#'),
                        _buildBadge('https://img.shields.io/badge/Quantum-00D4FF?style=for-the-badge&logo=atom&logoColor=white', '#'),
                        _buildBadge('https://img.shields.io/badge/Sustainable-4CAF50?style=for-the-badge&logo=leaf&logoColor=white', '#'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // Unique Flutter Innovations Section
            Container(
              margin: const EdgeInsets.all(20),
              padding: const EdgeInsets.all(30),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.9),
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 15,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '🌟 Unique Flutter Innovations',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF333333),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Flutter isn\'t just another framework—it\'s a game-changer redefining cross-platform development for 2025-2030. Discover what makes Flutter uniquely powerful, blending cutting-edge features with future-ready integrations that set it apart in the evolving tech landscape.',
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFF333333),
                      height: 1.6,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    '🔥 Hot Reload: Instant Magic',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF333333),
                    ),
                  ),
                  const SizedBox(height: 10),
                  RichText(
                    textAlign: TextAlign.justify,
                    text: TextSpan(
                      style: const TextStyle(
                        fontSize: 16,
                        color: Color(0xFF333333),
                        height: 1.6,
                      ),
                      children: [
                        const TextSpan(text: 'Experience the thrill of seeing changes in real-time! Flutter\'s hot reload lets you tweak UI, fix bugs, and experiment without restarting your app. This isn\'t just fast—it\'s transformative for rapid prototyping and iterative design. '),
                        const TextSpan(text: 'Example: Modify a button\'s color and watch it update instantly across iOS and Android. Check out the '),
                        TextSpan(
                          text: 'official docs',
                          style: const TextStyle(color: Colors.blue),
                          recognizer: TapGestureRecognizer()..onTap = () => launchUrl(Uri.parse('https://flutter.dev/docs/development/tools/hot-reload')),
                        ),
                        const TextSpan(text: ' for a deep dive.'),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Center(
                    child: Text(
                      'Hot Reload',
                      style: TextStyle(
                        fontSize: 18,
                        color: Color(0xFFFF6B6B),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    '📱 Single Codebase, Multi-Platform Mastery',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF333333),
                    ),
                  ),
                  const SizedBox(height: 10),
                  RichText(
                    textAlign: TextAlign.justify,
                    text: TextSpan(
                      style: const TextStyle(
                        fontSize: 16,
                        color: Color(0xFF333333),
                        height: 1.6,
                      ),
                      children: [
                        const TextSpan(text: 'Write once, deploy everywhere—Flutter compiles to native ARM code for iOS, Android, Web, Desktop, and even embedded systems. This unified approach slashes development time by up to 50% while maintaining pixel-perfect consistency. '),
                        const TextSpan(text: 'Example: Build a chat app that runs seamlessly on mobile, web, and desktop. Explore the '),
                        TextSpan(
                          text: 'Flutter Web Samples',
                          style: const TextStyle(color: Colors.blue),
                          recognizer: TapGestureRecognizer()..onTap = () => launchUrl(Uri.parse('https://github.com/flutter/samples/tree/main/experimental/web')),
                        ),
                        const TextSpan(text: ' repo for inspiration.'),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Center(
                    child: Text(
                      'Single Codebase',
                      style: TextStyle(
                        fontSize: 18,
                        color: Color(0xFF42A5F5),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    '⚡ Native Performance: No Compromises',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF333333),
                    ),
                  ),
                  const SizedBox(height: 10),
                  RichText(
                    textAlign: TextAlign.justify,
                    text: TextSpan(
                      style: const TextStyle(
                        fontSize: 16,
                        color: Color(0xFF333333),
                        height: 1.6,
                      ),
                      children: [
                        const TextSpan(text: 'Flutter apps run at 60fps with native-like speed, thanks to its direct compilation to machine code. Benchmarks show Flutter outperforming hybrid frameworks, making it ideal for demanding apps like games and AR experiences. '),
                        const TextSpan(text: 'Example: Develop a high-performance game with smooth animations. See real-world performance in the '),
                        TextSpan(
                          text: 'Flutter Games repo',
                          style: const TextStyle(color: Colors.blue),
                          recognizer: TapGestureRecognizer()..onTap = () => launchUrl(Uri.parse('https://github.com/flutter/games')),
                        ),
                        const TextSpan(text: '.'),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Center(
                    child: Text(
                      'Native Performance',
                      style: TextStyle(
                        fontSize: 18,
                        color: Color(0xFF4CAF50),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    '🚀 Why Flutter Shines in 2025-2030',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF333333),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'As we embrace AI, AR/VR, and Web3, Flutter\'s adaptability positions it as the ultimate framework for next-gen apps. Its open-source nature, vibrant community, and Google-backed ecosystem ensure continuous innovation, making it the smart choice for developers shaping tomorrow\'s digital world.',
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFF333333),
                      height: 1.6,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      children: [
                        _buildBadge('https://img.shields.io/badge/Future--Proof-00BCD4?style=for-the-badge&logo=future&logoColor=white', '#'),
                        _buildBadge('https://img.shields.io/badge/Open--Source-FF5722?style=for-the-badge&logo=opensource&logoColor=white', '#'),
                        _buildBadge('https://img.shields.io/badge/Google--Backed-4285F4?style=for-the-badge&logo=google&logoColor=white', '#'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // Projects Section
            Container(
              margin: const EdgeInsets.all(20),
              padding: const EdgeInsets.all(30),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.9),
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 15,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '🚀 Featured Projects',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF333333),
                    ),
                  ),
                  const SizedBox(height: 20),
                  _buildProjectCard(
                    'AI-Powered Chat App',
                    'A cross-platform chat application with AI-driven features for smart responses and real-time translation.',
                    'https://github.com/denzil-muchangi/ai-chat-app',
                    ['Flutter', 'Firebase', 'TensorFlow Lite'],
                  ),
                  const SizedBox(height: 20),
                  _buildProjectCard(
                    'AR Shopping Experience',
                    'An augmented reality app for virtual try-ons and immersive shopping experiences.',
                    'https://github.com/denzil-muchangi/ar-shopping',
                    ['Flutter', 'ARCore', 'Bloc'],
                  ),
                  const SizedBox(height: 20),
                  _buildProjectCard(
                    'Web3 Wallet',
                    'A decentralized wallet app supporting multiple cryptocurrencies with NFT integration.',
                    'https://github.com/denzil-muchangi/web3-wallet',
                    ['Flutter', 'WalletConnect', 'web3dart'],
                  ),
                ],
              ),
            ),
            // GitHub Insights Section
            Container(
              margin: const EdgeInsets.all(20),
              padding: const EdgeInsets.all(30),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.9),
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 15,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '📊 GitHub Insights',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF333333),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Wrap(
                    spacing: 20,
                    runSpacing: 20,
                    alignment: WrapAlignment.center,
                    children: [
                      Image.network(
                        'https://github-readme-stats.vercel.app/api?username=denzil-muchangi&theme=transparent&hide_border=false&include_all_commits=true&count_private=true',
                        height: 200,
                      ),
                      Image.network(
                        'https://nirzak-streak-stats.vercel.app/?user=denzil-muchangi&theme=transparent&hide_border=false',
                        height: 200,
                      ),
                      Image.network(
                        'https://github-readme-stats.vercel.app/api/top-langs/?username=denzil-muchangi&theme=transparent&hide_border=false&include_all_commits=true&count_private=true&layout=compact',
                        height: 200,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // Key Resources Section
            Container(
              margin: const EdgeInsets.all(20),
              padding: const EdgeInsets.all(30),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.9),
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 15,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '🔗 Key Flutter Resources (2025-2030)',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF333333),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Center(
                    child: Text(
                      'Explore essential repositories for Flutter development, learning, and community engagement',
                      style: TextStyle(
                        fontSize: 16,
                        fontStyle: FontStyle.italic,
                        color: Color(0xFF333333),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 20),
                  GridView.count(
                    crossAxisCount: 2,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                    children: [
                      _buildResourceCard(
                        'https://img.shields.io/badge/Flutter_Framework-02569B?style=for-the-badge&logo=github&logoColor=white',
                        'https://github.com/flutter/flutter',
                        'Main framework repository for insights and contributions',
                      ),
                      _buildResourceCard(
                        'https://img.shields.io/badge/Flutter_Samples-02569B?style=for-the-badge&logo=github&logoColor=white',
                        'https://github.com/flutter/samples',
                        'Official examples for hands-on learning',
                      ),
                      _buildResourceCard(
                        'https://img.shields.io/badge/Awesome_Flutter-02569B?style=for-the-badge&logo=github&logoColor=white',
                        'https://github.com/Solido/awesome-flutter',
                        'Curated resources and tools for advanced development',
                      ),
                      _buildResourceCard(
                        'https://img.shields.io/badge/Flutter_Community-02569B?style=for-the-badge&logo=github&logoColor=white',
                        'https://github.com/fluttercommunity',
                        'Community-driven tools and networking opportunities',
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // Achievements Section
            Container(
              margin: const EdgeInsets.all(20),
              padding: const EdgeInsets.all(30),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.9),
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 15,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    '🏆 Achievements',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF333333),
                    ),
                  ),
                  SizedBox(height: 20),
                  // Trophy image would go here, but since it's dynamic, we'll skip for now
                  Text(
                    'Showcasing expertise through contributions and community impact',
                    style: TextStyle(
                      fontSize: 16,
                      fontStyle: FontStyle.italic,
                      color: Color(0xFF333333),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                  Text(
                    '🏆 Flutter Framework Contributor - Core development insights\n'
                    '🏆 Sample Apps Innovator - Learning through practical examples\n'
                    '🏆 Resource Curator - Sharing valuable Flutter knowledge\n'
                    '🏆 Community Builder - Fostering developer connections',
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFF333333),
                      height: 1.8,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            // Connect Section
            Container(
              margin: const EdgeInsets.all(20),
              padding: const EdgeInsets.all(30),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.9),
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 15,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    '💬 Let\'s Connect',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF333333),
                    ),
                  ),
                  SizedBox(height: 20),
                  // Email badge
                  Text(
                    'njagidenzil@gmail.com',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Currently exploring advanced Flutter integrations and AR possibilities in mobile apps.',
                    style: TextStyle(
                      fontSize: 16,
                      fontStyle: FontStyle.italic,
                      color: Color(0xFF333333),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            // Inspiration Section
            Container(
              margin: const EdgeInsets.all(20),
              padding: const EdgeInsets.all(30),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.9),
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 15,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    '💡 Inspiration',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF333333),
                    ),
                  ),
                  SizedBox(height: 20),
                  // Quote image would go here
                  Text(
                    '"The best way to predict the future is to create it." - Peter Drucker',
                    style: TextStyle(
                      fontSize: 18,
                      fontStyle: FontStyle.italic,
                      color: Color(0xFF333333),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            // Footer
            Container(
              margin: const EdgeInsets.all(20),
              padding: const EdgeInsets.all(30),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.9),
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 15,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: const Center(
                child: Text(
                  'Thanks for visiting! Let\'s build something amazing together.',
                  style: TextStyle(
                    fontSize: 16,
                    fontStyle: FontStyle.italic,
                    color: Color(0xFF333333),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
