<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
<table border="1" width="100%" >
            <tr>
                <td>id_mecanicien</td>
                <td>nom_mecanicien</td>
                <td>adresse</td>
                <td>tel</td>

            </tr>
            <?php 
            $conn = mysqli_connect('127.0.0.1','root','','aeoroport') or die('connection failed');

             $request = "SELECT * FROM `mecanicien` WHERE 1";
             $result = mysqli_query($conn,$request);
             while( $ligne = mysqli_fetch_array($result)){?>
            <tr>
                <td><?php echo $ligne['id_mec']?></td>
                <td><?php echo $ligne['nom_mec']?></td>
                <td><?php echo $ligne['adresse']?></td>
                <td><?php echo $ligne['num_tel']?></td>
            </tr>
            <?php } ?> 
        </table>
</body>
</html>
