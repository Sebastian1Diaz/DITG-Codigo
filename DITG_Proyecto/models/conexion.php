<?php 


class Conexion {
	
	public function conectar()	{
		$pdo = new PDO("mysql:dbname=ditgv;host=localhost", 'root', '');
		return $pdo;
	}
}
