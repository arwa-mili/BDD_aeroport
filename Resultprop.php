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
    
    echo '<pre>';
      var_dump($_GET);
      '<pre>';
    $conn = mysqli_connect('127.0.0.1','root','','aeoroport') or die('connection failed');
    
  
    $request = "INSERT INTO `proprietaire` (`id_prop`, `nom_prop`, `num_tel`, `adresse`, `type`) VALUES ('".$_GET['id_prop']."', '".$_GET['nom_prop']."', '".$_GET['num_tel']."', '".$_GET['adress']."', '".$_GET['type']."');";
    $result = mysqli_query($conn,$request);
     if (!$result){
        echo 'error' .mysqli_error($conn);
    }
     else{
       ?>
       <html>
         <body>
         <p> <input type="submit" name="submit" value="Afficher Table" class="btn" onclick="location.href='Tableauprop.php'"></p>
         <p> <input type="submit" name="submit2" value="Retour" class="btn" onclick="location.href='propriétaire.html'" ></p>
             
         </body>
       </html>
       <?php
     }
       
     ?>
</body>
</html>