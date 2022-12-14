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
                <td>Nom types</td>
                <td>Pilotes habiles</td>
                

            </tr>
            <?php 
            $conn = mysqli_connect('127.0.0.1','root','','aeoroport') or die('connection failed');

             $request = "SELECT `num_type`, GROUP_CONCAT(`nom_pilote` SEPARATOR ',') AS list_pilotes
             FROM `habilite`
             INNER JOIN `pilote`
             ON habilite.id_pilote = pilote.id_pilote
             GROUP BY num_type
             ";
             $result = mysqli_query($conn,$request);
             while( $ligne = mysqli_fetch_array($result)){?>
            <tr>
                <td><?php echo $ligne['num_type']?></td>
                <td><?php echo $ligne['list_pilotes']?></td>
            
            </tr>
            <?php } ?> 
        </table>
</body>
</html>
