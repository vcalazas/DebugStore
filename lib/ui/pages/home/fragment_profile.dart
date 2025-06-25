import 'package:flutter/material.dart';

class FragmentProfile extends StatefulWidget {
  const FragmentProfile({super.key});

  @override
  State<FragmentProfile> createState() => _FragmentProfileState();
}

class _FragmentProfileState extends State<FragmentProfile> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.all(20),
            child: Icon(Icons.account_circle, size: 150,),
          ),

          Text("Usuário de teste", style: Theme.of(context).textTheme.titleLarge,),

          ListOption(icon: Icons.file_present, text: "Dados da conta",),
          ListOption(icon: Icons.shopping_cart_outlined, text: "Meus pedidos",),
          ListOption(icon: Icons.favorite_border, text: "Meus favoritos",),
          ListOption(icon: Icons.settings, text: "Configurações",),
          ListOption(icon: Icons.help_outline, text: "Ajuda",),
          ListOption(icon: Icons.logout, text: "Sair",),
        ],
      ),
    );
  }
}

class ListOption extends StatelessWidget {

  final IconData icon;
  final String text;
  final VoidCallback? onPressed;

  const ListOption({super.key, required this.icon, required this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      child: GestureDetector(
        onTap: onPressed,
        child: Card(
          child: Container(
            padding: EdgeInsets.all(5),
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.all(10),
                  child: Icon(icon),
                ),
                Text(text),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

