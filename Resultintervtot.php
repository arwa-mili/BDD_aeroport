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
                
                <td>objet</td>
                <td>durée</td>
                <td>date</td>

            </tr>
            <?php 
            $nom= $_GET['nom_mec'];
            $deb = $_GET['date_deb'];
            $fin = $_GET['date_fin'];

            
            $conn = mysqli_connect('127.0.0.1','root','','aeoroport') or die('connection failed');

             $request = "SELECT `objet`,`duree`,`date` FROM `intervention_verification` 
             INNER JOIN `mecanicien` ON mecanicien.id_mec = intervention_verification.id_mec 
             WHERE (mecanicien.nom_mec='$nom') 
             AND (intervention_verification.date>='$deb') 
             AND (intervention_verification.date<'$fin') 
             UNION SELECT `objet`,`duree`,`date` FROM `intervention_reparation` 
             INNER JOIN `mecanicien` ON mecanicien.id_mec = intervention_reparation.id_mec 
             WHERE (mecanicien.nom_mec='$nom') 
             AND (intervention_reparation.date>='$deb') 
             AND (intervention_reparation.date<'$fin')";
             $result = mysqli_query($conn,$request);
             $request2 = "SELECT 
             
             SUM(TIME_TO_SEC(duree)) AS somme_tot
             FROM($request)as sub
             ";
             while( $ligne = mysqli_fetch_array($result)){?>
            <tr>
                <td><?php echo $ligne['objet']?></td>
                <td><?php echo $ligne['duree']?></td>
                <td><?php echo $ligne['date']?></td>
                
            </tr>
            
            <?php } ?> 
        </table>
        <h4> La durée totale des interventions de <?php echo $nom ?> est :
        <em style = 'color:red'> 
        <?php
            $result2 = mysqli_query($conn,$request2); 
            $ligne = mysqli_fetch_array($result2,1);
            $hours = floor($ligne['somme_tot'] / 3600);
            $ligne['somme_tot'] -= $hours * 3600;
            $minutes = floor($ligne['somme_tot'] / 60);
            $ligne['somme_tot'] -= $minutes * 60;
            $secondes = $ligne['somme_tot'];
            echo " $hours heures  $minutes  minutes $secondes  secondes";
            ?> </em>
         </h4>

</body>
</html>
