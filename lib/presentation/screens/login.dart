import 'package:clase2/class/user.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController userController = TextEditingController();
    final TextEditingController passController = TextEditingController();
    List<User> users = [
      User("asd@hotmail.com","Pablo","asd123"),
      User("qwe@hotmail.com","Martin","asd124"),
      User("zxc@hotmail.com","Tobi","asd125"),
    ];

       
    bool areCredentialsValid(User loginAtempt){
      bool validMail = false;
      bool validPass = false;
      User? userAtDb = users.firstWhere((user) => user.email == loginAtempt.email, orElse: () => User('','',''));

      if(userAtDb.email != ''){
        validMail = true;
        if(userAtDb.passMatch(loginAtempt.password)){
          validPass = true;

        };
      };
      

      return validMail & validPass;

    };



    
    
      

    
    return Scaffold(
      appBar : AppBar(
        title : Text("Login"),


      ),
      body :  SafeArea(
        child : Center(child:Column(
          children: [
        TextField(
        controller : userController,
        decoration: InputDecoration(
          hintText: "Ingresar Email",          
          
        ),
        
        ),  
        TextField(
        controller : passController,
        decoration: InputDecoration(
          hintText: "Ingresar Contraseña",          
          
        ),
        
        ),
        

         ElevatedButton(
        onPressed: () {
          String errorMsg="";
          if (userController.text.isEmpty) {
           errorMsg = "El email no puede estar vacio";
            ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(errorMsg)),
           );
          };
          if (passController.text.isEmpty) {
           errorMsg = "La contraseña no puede estar vacia";
            ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(errorMsg)),
           );
          };

          User loginUser=User(userController.text,"",passController.text);

          if (!areCredentialsValid(loginUser)) {
           errorMsg = "Usuario o contraseña invalidos";
            ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(errorMsg)),
           );
          }
          else{
           
           User? userAtDb2 = users.firstWhere((user) => user.email == loginUser.email, orElse: () => User('','',''));
           
           context.go("/home", extra: userAtDb2.username);
          

          };

           
          
          

          // Find the ScaffoldMessenger in the widget tree
          // and use it to show a SnackBar.
         
        },
        child: const Text('Iniciar Sesion'),
      ),                
        

      ]
        )
      
        
      ),
      )
      
      
      


    );
  }
}