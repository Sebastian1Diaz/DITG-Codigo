<?php 

require_once("Conexion.php");

class EventoModelo extends Conexion {
	private $tabla = "evento";
	


	public function registraEventoModelo($datosEvento) {
		var_dump($datosEvento);
		$sql = "INSERT INTO $this->tabla (NombreEvento, FechaEvento, HoraEvento, DirecciónEvento, DescripciónEvento) VALUES (?,?,?,?,?)";
		try {
			$conn = new Conexion();
			$stmt = $conn->conectar()->prepare($sql);
			$stmt->bindParam(1, $datosEvento['nombre'], PDO::PARAM_STR);
			$stmt->bindParam(2, $datosEvento['fecha'], PDO::PARAM_INT);
			$stmt->bindParam(3, $datosEvento['hora'], PDO::PARAM_STR);
			$stmt->bindParam(4, $datosEvento['direccion'], PDO::PARAM_STR);
			$stmt->bindParam(5, $datosEvento['descripcion'], PDO::PARAM_STR);
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


	public function consultarEventoModelo($buscarEvento){
		
		$buscarEvento = '%'.$buscarEvento.'%';

		$sql = "SELECT * FROM $this->tabla WHERE NombreEvento LIKE ?";
		try {
			$conn = new Conexion();
			$stmt = $conn->conectar()->prepare($sql);
			$stmt->bindParam(1, $buscarEvento, PDO::PARAM_STR);
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


	public function consultarEventoIdModelo($id){
		$sql = "SELECT * FROM $this->tabla WHERE idEvento = ?";
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


	public function actualizarRolModelo($datosRol){
		$sql = "UPDATE $this->tabla SET rolNombre=? WHERE idRol=?";
		try {
			$stmt = $this->conn->conectar()->prepare($sql);
			$stmt->bindParam(1, $datosRol['nombrePerfil'], PDO::PARAM_STR);
			$stmt->bindParam(2, $datosRol['id'], PDO::PARAM_INT);
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

	public function eliminarRolModelo($id) {
		$sql= "DELETE FROM $this->tabla WHERE idRol = ?";
		try {
			$stmt = $this->conn->conectar()->prepare($sql);
			$stmt->bindParam(1,$id, PDO::PARAM_INT);
			if ($stmt->execute()) {
				return true;
			} else { 
				return false;
			}
		} catch (PDOException $e) {
			print_r($e->getMessage());
		}
	}
}