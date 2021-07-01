<?php
function TranslateString($Str)
{
	echo "Исходная строка: ".$Str."\n";
	$Cindx = strpos($Str,"-");
	$Pos = strpos($Str,"_");
	if(($Pos != false && $Cindx > $Pos) || $Cindx === false) {
		$Cindx = $Pos;
	}
	$SubStr = substr($Str,0,$Cindx);
	$Trans = array("-" => "", "_" => "");
	$Str = ucwords($Str, "-_");
	for($i = 0; $i < $Cindx; $i++) {
		$Str[$i] = $SubStr[$i];
	}	
	echo "Измененная строка: ".strtr($Str, $Trans)."\n\n";
}
TranslateString('hello_world-hello');
TranslateString('get-books-count');
TranslateString('Set_Currency_Value');
TranslateString('False-true_False');
?>