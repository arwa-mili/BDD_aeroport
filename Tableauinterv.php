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
                <td>num_immatricule</td>
                <td>id_mec</td>
                <td>objet</td>
                <td>date</td>
                <td>durée</td>

            </tr>
            <?php 
            $conn = mysqli_connect('127.0.0.1','root','','aeoroport') or die('connection failed');

             $request = "SELECT * 
             FROM `intervention_verification`
             UNION 
             SELECT *
             FROM `intervention_reparation`
             ";
             $result = mysqli_query($conn,$request);
             while( $ligne = mysqli_fetch_array($result)){?>
            <tr>
                <td><?php echo $ligne['num_immatricule']?></td>
                <td><?php echo $ligne['id_mec']?></td>
                <td><?php echo $ligne['objet']?></td>
                <td><?php echo $ligne['date']?></td>
                <td><?php echo $ligne['duree']?></td>
            </tr>
            <?php } ?> 
        </table>
</body>
</html>
