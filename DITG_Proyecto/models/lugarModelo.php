<?php 
require_once("Conexion.php");

class LugarModelo extends Conexion {
	private $tabla = "lugar";
	public function registrarLugarModelo($datosLugar) {
		$sql = "INSERT INTO $this->tabla (NombreLugar, DirecciónLugar, ContactoLugar, DescripciónLugar) VALUES (?,?,?,?)";
		
		try {
			$conn = new Conexion();
			$stmt = $conn->conectar()->prepare($sql);
			$stmt->bindParam(1, $datosLugar['nombre'], PDO::PARAM_STR);
			$stmt->bindParam(2, $datosLugar['direccion'], PDO::PARAM_STR);
			$stmt->bindParam(3, $datosLugar['contacto'], PDO::PARAM_STR);
			$stmt->bindParam(4, $datosLugar['descripcion'], PDO::PARAM_STR);
			if ($stmt->execute()) {
				return true;
			}
			else{
				return false;
			}
			$stmt->close();
		} catch (PDOException $e) {
			print_r($e->getMessage());
		}
	}

	public function consultarLugarModelo($datoBusqueda){
		
		$datoBusqueda = '%'.$datoBusqueda.'%';

		$sql = "SELECT * FROM $this->tabla WHERE NombreLugar LIKE ?";
		try {
			$conn = new Conexion();
			$stmt = $conn->conectar()->prepare($sql);
			$stmt->bindParam(1, $datoBusqueda, PDO::PARAM_STR);
			if ($stmt->execute()) {
				return $stmt->fetchAll();
			}
			else{
				[];
			}
			$stmt->close();

		} catch (PDOException $e) {
			print_r($e->getMessage());
		}
	}


	public function consultarLugarIdModelo($id){
		$sql = "SELECT * FROM $this->tabla WHERE idLugar = ?";
		try {
			$conn = new Conexion();
			$stmt = $conn->conectar()->prepare($sql);
			$stmt->bindParam(1, $id, PDO::PARAM_INT);
			if ($stmt->execute()) {
				return $stmt->fetchAll();
			}
			else{
				[];
			}
		} catch (PDOException $e) {
			print_r($e->getMessage());
		}
	}

}