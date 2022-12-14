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

    $request = "INSERT INTO `pilote` (`id_pilote`, `nom_pilote`, `n_brevet`, `num_tel`, `adresse`) VALUES ('".$_GET['id_pil']."','".$_GET['nom_pil']."','".$_GET['num_brevet']."','".$_GET['num_tel']."','".$_GET['adress']."'
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
         <p> <input type="submit" name="submit12" value="Afficher Table" class="btn" onclick="location.href='Tableaupilote.php'"></p>
         <p> <input type="submit" name="submit22" value="Retour" class="btn" onclick="location.href='piloteshabilités.html'" ></p>
             
         </body>
       </html>
       <?php
     }
       
     ?>
</body>
</html>