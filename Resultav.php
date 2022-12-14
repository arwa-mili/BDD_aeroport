<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    
</head>
<body>
    <?php
    $conn = mysqli_connect('127.0.0.1','root','','aeoroport') or die('connection failed');

    $request = "INSERT INTO `avion` (`num_immatricule`, `Date_achat`, `nom_type`, `id_propr`) VALUES ('".$_GET['num_imm']."', '".$_GET['date_achat']."', '".$_GET['type_av']."', '".$_GET['id_prop']."');";
     $result = mysqli_query($conn,$request);
     if (!$result){
        echo 'error' .mysqli_error($conn);
    }
     else{
       ?>
       <html>
         <body>
         <p> <input type="submit" name="submit52" value="Afficher Table" class="btn" onclick="location.href='Tableauav.php'"></p>
         <p> <input type="submit" name="submit25" value="Retour" class="btn" onclick="location.href='avion.html'" ></p>
             
         </body>
       </html>
       <?php
     }
       
     ?>
</body>
</html>