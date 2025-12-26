import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/app_colors.dart';
import '../constants/app_strings.dart';
import '../widgets/animated_button.dart';
import '../widgets/custom_card.dart';
import 'login_page.dart';
import 'registration_page.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeIn),
    );
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _animationController, curve: Curves.easeOut));
    
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildNavBar(context),
            _buildHeroSection(context),
            _buildFeaturesSection(context),
            _buildStatsSection(context),
            _buildCTASection(context),
            _buildFooter(context),
          ],
        ),
      ),
    );
  }

  Widget _buildNavBar(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: AppColors.shadowSmall,
      ),
      child: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth < 800) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildLogo(),
                  PopupMenuButton<String>(
                    icon: const Icon(Icons.menu),
                    onSelected: (value) {
                      if (value == 'login') {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginPage()));
                      } else if (value == 'register') {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const RegistrationPage()));
                      }
                    },
                    itemBuilder: (context) => [
                      _buildMenuItem(AppStrings.navHome),
                      _buildMenuItem(AppStrings.navMedicine),
                      _buildMenuItem(AppStrings.navLabTests),
                      _buildMenuItem(AppStrings.navFeatures),
                      _buildMenuItem(AppStrings.navAboutUs),
                      _buildMenuItem(AppStrings.navContact),
                      const PopupMenuDivider(),
                      const PopupMenuItem(value: 'login', child: Text(AppStrings.navLogin, style: TextStyle(fontWeight: FontWeight.w600, color: AppColors.primary))),
                      const PopupMenuItem(value: 'register', child: Text('Register', style: TextStyle(fontWeight: FontWeight.w600))),
                    ],
                  ),
                ],
              );
            }
            
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildLogo(),
                Row(
                  children: [
                    _buildNavItem(AppStrings.navHome),
                    _buildNavItem(AppStrings.navMedicine),
                    _buildNavItem(AppStrings.navLabTests),
                    _buildNavItem(AppStrings.navFeatures),
                    _buildNavItem(AppStrings.navAboutUs),
                    _buildNavItem(AppStrings.navContact),
                    const SizedBox(width: 16),
                    TextButton(
                      onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginPage())),
                      child: Text('Login', style: GoogleFonts.poppins(fontWeight: FontWeight.w600, color: AppColors.primary)),
                    ),
                    const SizedBox(width: 8),
                    AnimatedButton(
                      text: 'Get Started',
                      onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const RegistrationPage())),
                      height: 42,
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildLogo() {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            gradient: AppColors.primaryGradient,
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Icon(Icons.medical_services, color: Colors.white, size: 24),
        ),
        const SizedBox(width: 12),
        Text(AppStrings.appName, style: GoogleFonts.poppins(fontSize: 24, fontWeight: FontWeight.bold, color: AppColors.primary)),
      ],
    );
  }

  Widget _buildHeroSection(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColors.primary.withOpacity(0.05), AppColors.primaryLight.withOpacity(0.1)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 80),
      child: FadeTransition(
        opacity: _fadeAnimation,
        child: SlideTransition(
          position: _slideAnimation,
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Column(
                children: [
                  Text(
                    'Your Health, Our Priority',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      fontSize: constraints.maxWidth < 600 ? 32 : 48,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textPrimary,
                      height: 1.2,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Access quality healthcare services anytime, anywhere.\nBook appointments, order medicines, and manage your health records.',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      fontSize: constraints.maxWidth < 600 ? 14 : 18,
                      color: AppColors.textSecondary,
                      height: 1.6,
                    ),
                  ),
                  const SizedBox(height: 40),
                  Wrap(
                    spacing: 16,
                    runSpacing: 16,
                    alignment: WrapAlignment.center,
                    children: [
                      AnimatedButton(
                        text: 'Get Started',
                        icon: Icons.arrow_forward,
                        onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const RegistrationPage())),
                        width: 180,
                        height: 56,
                      ),
                      AnimatedButton(
                        text: 'Learn More',
                        onPressed: () {},
                        isOutlined: true,
                        width: 180,
                        height: 56,
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildFeaturesSection(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 60),
      child: Column(
        children: [
          Text('Our Services', style: GoogleFonts.poppins(fontSize: 32, fontWeight: FontWeight.bold, color: AppColors.textPrimary)),
          const SizedBox(height: 12),
          Text('Comprehensive healthcare solutions at your fingertips', style: GoogleFonts.poppins(fontSize: 16, color: AppColors.textSecondary)),
          const SizedBox(height: 40),
          LayoutBuilder(
            builder: (context, constraints) {
              int crossAxisCount = constraints.maxWidth < 600 ? 1 : (constraints.maxWidth < 900 ? 2 : 3);
              return Wrap(
                spacing: 20,
                runSpacing: 20,
                children: [
                  _buildFeatureCard('Doctor Consultation', 'Connect with experienced doctors', Icons.medical_services, AppColors.doctorColor),
                  _buildFeatureCard('Lab Tests', 'Book lab tests at home', Icons.science, AppColors.labTestColor),
                  _buildFeatureCard('Pharmacy', 'Order medicines online', Icons.medication, AppColors.pharmacyColor),
                  _buildFeatureCard('Nurse at Home', 'Professional nursing care', Icons.health_and_safety, AppColors.nurseColor),
                  _buildFeatureCard('Health Records', 'Manage medical documents', Icons.folder_shared, AppColors.profileColor),
                  _buildFeatureCard('Emergency', 'Quick ambulance service', Icons.emergency, AppColors.ambulanceColor),
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureCard(String title, String description, IconData icon, Color color) {
    return SizedBox(
      width: 320,
      child: CustomCard(
        onTap: () {},
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, size: 32, color: color),
            ),
            const SizedBox(height: 16),
            Text(title, style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w600, color: AppColors.textPrimary)),
            const SizedBox(height: 8),
            Text(description, style: GoogleFonts.poppins(fontSize: 14, color: AppColors.textSecondary)),
          ],
        ),
      ),
    );
  }

  Widget _buildStatsSection(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 60),
      decoration: const BoxDecoration(
        gradient: AppColors.primaryGradient,
      ),
      child: Wrap(
        spacing: 40,
        runSpacing: 40,
        alignment: WrapAlignment.spaceEvenly,
        children: [
          _buildStatItem('10,000+', 'Happy Patients'),
          _buildStatItem('500+', 'Expert Doctors'),
          _buildStatItem('50+', 'Locations'),
          _buildStatItem('24/7', 'Support'),
        ],
      ),
    );
  }

  Widget _buildStatItem(String number, String label) {
    return Column(
      children: [
        Text(number, style: GoogleFonts.poppins(fontSize: 36, fontWeight: FontWeight.bold, color: Colors.white)),
        const SizedBox(height: 8),
        Text(label, style: GoogleFonts.poppins(fontSize: 16, color: Colors.white.withOpacity(0.9))),
      ],
    );
  }

  Widget _buildCTASection(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 60),
      child: CustomCard(
        gradient: LinearGradient(
          colors: [AppColors.primary.withOpacity(0.1), AppColors.primaryLight.withOpacity(0.2)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        padding: const EdgeInsets.all(40),
        child: Column(
          children: [
            Text('Ready to Get Started?', style: GoogleFonts.poppins(fontSize: 28, fontWeight: FontWeight.bold, color: AppColors.textPrimary)),
            const SizedBox(height: 12),
            Text('Join thousands of users managing their health with Drepto', style: GoogleFonts.poppins(fontSize: 16, color: AppColors.textSecondary)),
            const SizedBox(height: 32),
            AnimatedButton(
              text: 'Create Account',
              icon: Icons.person_add,
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const RegistrationPage())),
              width: 200,
              height: 56,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFooter(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
      color: AppColors.textPrimary,
      child: Column(
        children: [
          Text('© 2025 Drepto Healthcare. All rights reserved.', style: GoogleFonts.poppins(fontSize: 14, color: Colors.white.withOpacity(0.7))),
          const SizedBox(height: 8),
          Text('Made with ❤️ for better healthcare', style: GoogleFonts.poppins(fontSize: 12, color: Colors.white.withOpacity(0.5))),
        ],
      ),
    );
  }

  Widget _buildNavItem(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: TextButton(
        onPressed: () {},
        child: Text(title, style: GoogleFonts.poppins(fontSize: 15, fontWeight: FontWeight.w500, color: AppColors.textPrimary)),
      ),
    );
  }

  PopupMenuItem<String> _buildMenuItem(String title) {
    return PopupMenuItem(value: title.toLowerCase(), child: Text(title));
  }
}
