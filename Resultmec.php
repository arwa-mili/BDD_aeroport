<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script> src="/buttons.js" </script>
</head>
<body>
    <?php
    
    
    $conn = mysqli_connect('127.0.0.1','root','','aeoroport') or die('connection failed');

    $request = "INSERT INTO `mecanicien` (`id_mec`, `nom_mec`, `adresse`, `num_tel`) VALUES ('".$_GET['id_mec']."','".$_GET['num']."','".$_GET['adress']."','".$_GET['tel']."'
           );
           ";
     $result = mysqli_query($conn,$request);
     if (!$result){
        echo 'error' .mysqli_error($conn);
    }
     else{
       ?>
       <html>
         <body>
         <p> <input type="submit" name="submit" value="Afficher Table" class="btn" onclick="location.href='Tableaumec.php'"></p>
         <p> <input type="submit" name="submit2" value="Retour" class="btn" onclick="location.href='mec.html'" ></p>
             
         </body>
       </html>
       <?php
     }
       
     ?>
</body>
</html>