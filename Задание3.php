<?php

$Collection=array();

class Circle
{
    private $Radius;
	private $Area;
	
	public static function RandObj()
    {
	  new Circle(rand(0, 100));
    }
	
    public function __construct(int $Radius)
    {
        $this->Radius = $Radius;
		$this->Area = 2 * pi() * pow($Radius, 2);
		global $Collection;
		$Collection[] = $this;
    }
	
	public function __get($Property)
	{
		if (!strcmp($Property, "Area") && property_exists($this, $Property)) 
		{
			return $this->$Property;
		}
	}
}

class Triangle 
{
	private $Height;
	private $Base;
	private $Area;
	
	public static function RandObj()
	{
		new Triangle(rand(0, 100), rand(0, 100));
	}
	
	public function __construct(int $Height, int $Base)
	{
 
		$this->Height = $Height;
		$this->Base = $Base;
		$this->Area =($this->Height * $this->Base)/2;
		global $Collection;
		$Collection[] = $this;
	}
	
	public function __get($Property)
	{
		if (!strcmp($Property, "Area") && property_exists($this, $Property)) 
		{
			return $this->$Property;
		}
	}
}

class Rectangle
{
    private $Width;
    private $Height;
	private $Area;
	
	public static function RandObj()
	{
		new Rectangle(rand(0, 100), rand(0, 100));
	}
	
    public function __construct(int $Width, int $Height)
    {
        $this->Width = $Width;
        $this->Height = $Height;
		$this->Area = $this->Width * $this->Height;
		global $Collection;
		$Collection[] = $this;
    }
	
	public function __get($Property)
	{
		if (!strcmp($Property, "Area") && property_exists($this, $Property)) 
		{
			return $this->$Property;
		}
	}
}

function FileWrite($Name, $Data)
{
	$File = fopen($Name, 'w');
	fwrite($File, serialize($Data));
}

function FileRead($Name)
{
	if(file_exists($Name)) {
		$File = fopen($Name, 'r');
		$Obj = unserialize(fgets($File));
	}
}

for($i = 1;$i <= 3;$i++) {
	Circle::RandObj();
	Triangle::RandObj();
	Rectangle::RandObj();
}

foreach ($Collection as $Value) {
	$SortArray[] = $Value->Area;
}
rsort($SortArray);

foreach($SortArray as $Value) {
	echo $Value."\n";
}

?>