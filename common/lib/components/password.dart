import 'package:common/common.dart';
import 'package:flutter/material.dart';


class BatPassword extends StatefulWidget {
  final int size;
  final bool onlyNumbers;
  final Color color;
  final IconData notShowPassword;
  final IconData showPassword;

  BatPassword({
    @required this.size,
    @required this.onlyNumbers,
    this.color = Colors.white,
    this.notShowPassword = Icons.visibility_off,
    this.showPassword = Icons.visibility
  });

  State<BatPassword> createState() => _BatPasswordState();
}

class _BatPasswordState extends State<BatPassword> {
  int _size;
  bool _onlyNumbers;
  Color _color;
  String _password;
  PasswordService _passwordService;
  bool _showPassword = false;
  IconData _showPasswordIcon, _notShowPasswordIcon;

  @override
  void initState() {
    super.initState();
    _size = widget.size;
    _onlyNumbers = widget.onlyNumbers;
    _color = widget.color;
    _notShowPasswordIcon = widget.notShowPassword;
    _showPasswordIcon = widget.showPassword;
    _passwordService = PasswordService();
    _passwordService.setController(_onlyNumbers, _size);
    _password = _passwordService.password.text;
    _passwordService.password.addListener(() {
      setState(() {
        _password = _passwordService.password.text;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.max,
        children: [
          _getPassword(),
          _getSpacer(),
          _getIcon()
        ]
      ),
    );
  }

  Widget _getPassword() {
    final List<Widget> digits = List<Widget>();
    for (int index = 0; index < _size; index++) {
      if (_password.length > index) {
        if (_showPassword) {
          digits.add(Container(
            width: 12.0,
            child: Text(
              _password[index],
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w500,
                color: _color
              ),
            ),
          ));
        } else {
          digits.add(Container(
            width: 12.0,
            height: 12.0,
            decoration: BoxDecoration(
              color: _color,
              borderRadius: BorderRadius.circular(90)
            ),
          ));
        }
      } else {
        digits.add(Container(
          width: 12.0,
          height: 12.0,
          decoration: BoxDecoration(
            border: Border.all(width: 1.0, color: _color),
            borderRadius: BorderRadius.circular(90)
          ),
        ));
      }
    }
    return Flexible(
      flex: 7,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: digits,
      ),
    );
  }

  Widget _getSpacer() => Flexible(
    flex: 3,
    child: Container(
    ),
  );

  Widget _getIcon() => GestureDetector(
    onTap: () {
      setState(() {
        _showPassword = !_showPassword;
      });
    },
    child: Container(
      width: 40.0,
      height: 30.0,
      child: Align(
        alignment: Alignment.centerRight,
        child: Icon(
          _showPassword ? _showPasswordIcon : _notShowPasswordIcon,
          color: _color,
          size: 24.0,
        ),
      ),
    ),
  );
}