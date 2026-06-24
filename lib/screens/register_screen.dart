import 'package:flutter/material.dart';
import 'login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> with TickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  final _fullNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;
  bool _acceptTerms = false;
  bool _isLoading = false;
  int _currentStep = 0;
  
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );
    
    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: const Interval(0.0, 0.6, curve: Curves.easeOut),
    ));
    
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: const Interval(0.3, 1.0, curve: Curves.easeOut),
    ));
    
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _fullNameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  Future<void> _handleRegister() async {
    if (!_formKey.currentState!.validate()) return;
    if (!_acceptTerms) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('لطفاً شرایط و قوانین را بپذیرید'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    setState(() {
      _isLoading = true;
    });

    // Simulate registration process
    await Future.delayed(const Duration(seconds: 3));

    setState(() {
      _isLoading = false;
    });

    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('ثبت‌نام با موفقیت انجام شد!'),
          backgroundColor: Colors.green,
        ),
      );
      
      // Navigate back to login
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
    }
  }

  void _nextStep() {
    if (_currentStep < 2) {
      setState(() {
        _currentStep++;
      });
    }
  }

  void _prevStep() {
    if (_currentStep > 0) {
      setState(() {
        _currentStep--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isDesktop = size.width > 768;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF7C3AED),
              Color(0xFF8B5CF6),
              Color(0xFF2563EB),
            ],
          ),
        ),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(isDesktop ? 32 : 24),
              child: FadeTransition(
                opacity: _fadeAnimation,
                child: SlideTransition(
                  position: _slideAnimation,
                  child: Container(
                    constraints: BoxConstraints(
                      maxWidth: isDesktop ? 500 : double.infinity,
                    ),
                    child: Card(
                      elevation: 20,
                      shadowColor: Colors.black.withOpacity(0.3),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: Container(
                        padding: EdgeInsets.all(isDesktop ? 40 : 32),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24),
                          color: Colors.white.withOpacity(0.95),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            // Back Button
                            Row(
                              children: [
                                IconButton(
                                  onPressed: () => Navigator.pop(context),
                                  icon: const Icon(
                                    Icons.arrow_forward,
                                    color: Color(0xFF7C3AED),
                                  ),
                                ),
                                const Spacer(),
                              ],
                            ),
                            
                            // Header
                            _buildHeader(),
                            const SizedBox(height: 32),
                            
                            // Progress Indicator
                            _buildProgressIndicator(),
                            const SizedBox(height: 32),
                            
                            // Registration Form
                            _buildRegistrationForm(),
                            const SizedBox(height: 24),
                            
                            // Navigation Buttons
                            _buildNavigationButtons(),
                            const SizedBox(height: 24),
                            
                            // Login Link
                            _buildLoginLink(),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFF7C3AED), Color(0xFF2563EB)],
            ),
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF7C3AED).withOpacity(0.3),
                blurRadius: 20,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: const Icon(
            Icons.person_add,
            size: 40,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 24),
        const Column(
          children: [
            Text(
              'عضویت در سیستم',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1F2937),
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 8),
            Text(
              'ابر مالی بازرگانی نوین اکس',
              style: TextStyle(
                fontSize: 16,
                color: Color(0xFF7C3AED),
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16),
            Text(
              'حساب کاربری جدید ایجاد کنید',
              style: TextStyle(
                fontSize: 16,
                color: Color(0xFF6B7280),
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildProgressIndicator() {
    return Column(
      children: [
        Row(
          children: [
            _buildStepIndicator(0, 'اطلاعات شخصی', Icons.person),
            Expanded(
              child: Container(
                height: 2,
                color: _currentStep > 0 ? const Color(0xFF7C3AED) : Colors.grey.shade300,
              ),
            ),
            _buildStepIndicator(1, 'اطلاعات حساب', Icons.account_circle),
            Expanded(
              child: Container(
                height: 2,
                color: _currentStep > 1 ? const Color(0xFF7C3AED) : Colors.grey.shade300,
              ),
            ),
            _buildStepIndicator(2, 'تأیید نهایی', Icons.check_circle),
          ],
        ),
        const SizedBox(height: 16),
        Text(
          'مرحله ${_currentStep + 1} از ۳',
          style: const TextStyle(
            color: Color(0xFF6B7280),
            fontSize: 14,
          ),
        ),
      ],
    );
  }

  Widget _buildStepIndicator(int step, String title, IconData icon) {
    final isActive = _currentStep >= step;
    final isCompleted = _currentStep > step;
    
    return Column(
      children: [
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: isActive ? const Color(0xFF7C3AED) : Colors.grey.shade300,
            shape: BoxShape.circle,
            boxShadow: isActive ? [
              BoxShadow(
                color: const Color(0xFF7C3AED).withOpacity(0.3),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ] : null,
          ),
          child: Icon(
            isCompleted ? Icons.check : icon,
            color: isActive ? Colors.white : Colors.grey.shade600,
            size: 24,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          title,
          style: TextStyle(
            fontSize: 12,
            color: isActive ? const Color(0xFF7C3AED) : Colors.grey.shade600,
            fontWeight: isActive ? FontWeight.w600 : FontWeight.normal,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildRegistrationForm() {
    return Form(
      key: _formKey,
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: _currentStep == 0 ? _buildPersonalInfoStep() :
               _currentStep == 1 ? _buildAccountInfoStep() :
               _buildConfirmationStep(),
      ),
    );
  }

  Widget _buildPersonalInfoStep() {
    return Column(
      key: const ValueKey('personal'),
      children: [
        TextFormField(
          controller: _fullNameController,
          textAlign: TextAlign.right,
          decoration: _buildInputDecoration(
            labelText: 'نام و نام خانوادگی',
            hintText: 'نام کامل خود را وارد کنید',
            prefixIcon: Icons.person_outline,
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'لطفاً نام و نام خانوادگی را وارد کنید';
            }
            return null;
          },
        ),
        const SizedBox(height: 20),
        
        TextFormField(
          controller: _emailController,
          textAlign: TextAlign.right,
          keyboardType: TextInputType.emailAddress,
          decoration: _buildInputDecoration(
            labelText: 'ایمیل',
            hintText: 'example@email.com',
            prefixIcon: Icons.email_outlined,
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'لطفاً ایمیل را وارد کنید';
            }
            if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
              return 'لطفاً ایمیل معتبر وارد کنید';
            }
            return null;
          },
        ),
        const SizedBox(height: 20),
        
        TextFormField(
          controller: _phoneController,
          textAlign: TextAlign.right,
          keyboardType: TextInputType.phone,
          decoration: _buildInputDecoration(
            labelText: 'شماره تلفن',
            hintText: '09123456789',
            prefixIcon: Icons.phone_outlined,
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'لطفاً شماره تلفن را وارد کنید';
            }
            if (!RegExp(r'^09\d{9}$').hasMatch(value)) {
              return 'لطفاً شماره تلفن معتبر وارد کنید';
            }
            return null;
          },
        ),
      ],
    );
  }

  Widget _buildAccountInfoStep() {
    return Column(
      key: const ValueKey('account'),
      children: [
        TextFormField(
          controller: _usernameController,
          textAlign: TextAlign.right,
          decoration: _buildInputDecoration(
            labelText: 'نام کاربری',
            hintText: 'نام کاربری دلخواه خود را انتخاب کنید',
            prefixIcon: Icons.account_circle_outlined,
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'لطفاً نام کاربری را وارد کنید';
            }
            if (value.length < 3) {
              return 'نام کاربری باید حداقل ۳ کاراکتر باشد';
            }
            return null;
          },
        ),
        const SizedBox(height: 20),
        
        TextFormField(
          controller: _passwordController,
          textAlign: TextAlign.right,
          obscureText: !_isPasswordVisible,
          decoration: _buildInputDecoration(
            labelText: 'رمز عبور',
            hintText: 'رمز عبور قوی انتخاب کنید',
            prefixIcon: Icons.lock_outline,
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  _isPasswordVisible = !_isPasswordVisible;
                });
              },
              icon: Icon(
                _isPasswordVisible ? Icons.visibility_off : Icons.visibility,
                color: Colors.grey.shade600,
              ),
            ),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'لطفاً رمز عبور را وارد کنید';
            }
            if (value.length < 8) {
              return 'رمز عبور باید حداقل ۸ کاراکتر باشد';
            }
            return null;
          },
        ),
        const SizedBox(height: 20),
        
        TextFormField(
          controller: _confirmPasswordController,
          textAlign: TextAlign.right,
          obscureText: !_isConfirmPasswordVisible,
          decoration: _buildInputDecoration(
            labelText: 'تکرار رمز عبور',
            hintText: 'رمز عبور را مجدداً وارد کنید',
            prefixIcon: Icons.lock_outline,
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
                });
              },
              icon: Icon(
                _isConfirmPasswordVisible ? Icons.visibility_off : Icons.visibility,
                color: Colors.grey.shade600,
              ),
            ),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'لطفاً تکرار رمز عبور را وارد کنید';
            }
            if (value != _passwordController.text) {
              return 'رمز عبور و تکرار آن یکسان نیستند';
            }
            return null;
          },
        ),
      ],
    );
  }

  Widget _buildConfirmationStep() {
    return Column(
      key: const ValueKey('confirmation'),
      children: [
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: const Color(0xFF7C3AED).withOpacity(0.1),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: const Color(0xFF7C3AED).withOpacity(0.2),
            ),
          ),
          child: Column(
            children: [
              const Icon(
                Icons.check_circle_outline,
                size: 48,
                color: Color(0xFF7C3AED),
              ),
              const SizedBox(height: 16),
              const Text(
                'اطلاعات شما بررسی شد',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1F2937),
                ),
              ),
              const SizedBox(height: 16),
              _buildInfoRow('نام:', _fullNameController.text),
              _buildInfoRow('ایمیل:', _emailController.text),
              _buildInfoRow('تلفن:', _phoneController.text),
              _buildInfoRow('نام کاربری:', _usernameController.text),
            ],
          ),
        ),
        const SizedBox(height: 24),
        
        Row(
          children: [
            Checkbox(
              value: _acceptTerms,
              onChanged: (value) {
                setState(() {
                  _acceptTerms = value ?? false;
                });
              },
              activeColor: const Color(0xFF7C3AED),
            ),
            const Expanded(
              child: Text(
                'شرایط و قوانین استفاده از سیستم را مطالعه کرده و آن را می‌پذیرم',
                style: TextStyle(
                  color: Color(0xFF6B7280),
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            value,
            style: const TextStyle(
              color: Color(0xFF374151),
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            label,
            style: const TextStyle(
              color: Color(0xFF6B7280),
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  InputDecoration _buildInputDecoration({
    required String labelText,
    required String hintText,
    required IconData prefixIcon,
    Widget? suffixIcon,
  }) {
    return InputDecoration(
      labelText: labelText,
      hintText: hintText,
      prefixIcon: Icon(prefixIcon),
      suffixIcon: suffixIcon,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: Colors.grey.shade300),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: Colors.grey.shade300),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: Color(0xFF7C3AED), width: 2),
      ),
      filled: true,
      fillColor: Colors.grey.shade50,
      contentPadding: const EdgeInsets.all(20),
    );
  }

  Widget _buildNavigationButtons() {
    return Row(
      children: [
        if (_currentStep > 0)
          Expanded(
            child: OutlinedButton(
              onPressed: _prevStep,
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Color(0xFF7C3AED)),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              child: const Text(
                'مرحله قبل',
                style: TextStyle(
                  color: Color(0xFF7C3AED),
                  fontSize: 16,
                ),
              ),
            ),
          ),
        
        if (_currentStep > 0) const SizedBox(width: 16),
        
        Expanded(
          child: ElevatedButton(
            onPressed: () {
              if (_currentStep < 2) {
                if (_formKey.currentState!.validate()) {
                  _nextStep();
                }
              } else {
                _handleRegister();
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF7C3AED),
              foregroundColor: Colors.white,
              elevation: 8,
              shadowColor: const Color(0xFF7C3AED).withOpacity(0.3),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              padding: const EdgeInsets.symmetric(vertical: 16),
            ),
            child: _isLoading
                ? const SizedBox(
                    height: 24,
                    width: 24,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    ),
                  )
                : Text(
                    _currentStep == 2 ? 'ثبت‌نام' : 'مرحله بعد',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
          ),
        ),
      ],
    );
  }

  Widget _buildLoginLink() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const LoginScreen()),
            );
          },
          child: const Text(
            'ورود',
            style: TextStyle(
              color: Color(0xFF7C3AED),
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
        ),
        const Text(
          'قبلاً ثبت‌نام کرده‌اید؟',
          style: TextStyle(
            color: Color(0xFF6B7280),
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}