<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="facture.css">
    <script src="jquery-3.1.1.min.js"></script>
    <title>Envoyer</title>
</head>
<body>
    <div class="navbar">
        <p class="logo">KALPÉBI </p>
        <ul>
            <li><a href="banque.jsp">Consulter solde</a></li>
            <li><a href="">Transactions</a></li>
            <li><a href="">envoie</a></li>
            <li><a href="">déconnexion</a></li>
        </ul>
    </div>
   <div class="fieldset">
       <div class="box1"> <a href="#"></a></div><br>
       <p class="paiement">Paiement Frais extrait</p> <br>
       <div class="box2"></div><br>
       <p class="paiement">Paiement Location voiture</p>
   </div>
   <fieldset class="fieldset1">
       <br><br>
       Payement extrait
<br>
    <form action="" method="post"><br><br>
    <input type="text" class="champs" placeholder="numéro"><br><br> <br>
    <input type="password" class="champs" placeholder="mot de passe"><br><br><br>
    <input type="hidden" class="champs" value="775430473">
    <input type="submit" class="btn" value="valider">
</form>

   </fieldset>
   <div class="cross2">X</div>
   <fieldset class="fieldset2">
    <br><br>
    Payement Location voiture
<br>
 <form action="" method="post"><br><br>
 <input type="text" class="champs" placeholder="numéro"><br><br> <br>
 <input type="password" class="champs" placeholder="mot de passe"><br><br><br>
 <input type="hidden" class="champs" value="776550432">
 <input type="submit" class="btn" value="valider">
</form>
<div class="cross1">X</div>
</fieldset>
   <script>
       $(".fieldset1").hide();
       $(".fieldset2").hide();
       $(".cross2").hide();
       $(".box1").click(function(){
        $(".fieldset1").show();
        $(".fieldset").hide();
        $(".cross2").show();
       });
       $(".box2").click(function(){
        $(".fieldset2").show();
        $(".fieldset").hide();
        $(".cross1").show();
       });
       $(".cross2").click(
           function(){
            $(".fieldset1").hide();
            $(".fieldset2").hide();  
            $(".fieldset").show();
            $(".cross2").hide();
           }
       )
       $(".cross1").click(
           function(){
            $(".fieldset1").hide();
            $(".fieldset2").hide();  
            $(".fieldset").show();
            $(".cross1").hide();
           }
       )

   </script>
</body>
</html>