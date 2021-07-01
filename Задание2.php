<?php

$ConDb = new mysqli("localhost","root","root","library");
echo $ConDb->connect_error;

$Str="SELECT DISTINCT books.AuthorID, books.AuthorsName, authors.BookCount 
FROM `books` INNER JOIN `authors` ON `books`.`AuthorID`=`authors`.`ID` 
WHERE authors.BookCount < 6 ";

$Res=mysqli_query($ConDb,$Str);
for($i = 0; $i < $Res->num_rows; $i++) {
	$ResStr=$Res->fetch_assoc();
	echo $i.": ".$ResStr[AuthorsName]."\n";
}
exec('mysqldump --no-data --user=root --password=root --host=localhost library > '.__DIR__.'dumpstruct' . date('Y-m-d') . '.sql');
mysqli_close($ConDb);
?>
