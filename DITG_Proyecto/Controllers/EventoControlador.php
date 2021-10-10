<?php 

class EventoControlador {
		
	public function registrarEventoControlador(){
		if(isset($_POST['regEvento'])){
		$datosEvento = array('nombre' => $_POST['nombreEve'], 
			'fecha'=>$_POST['fechaEve'],
			'hora' => $_POST['horaEve'],
			'direccion' => $_POST['direccionEve'],
			'descripcion' => $_POST['descripcionEve']);	
		$eventoModelo = new EventoModelo();
		$respuesta = $eventoModelo->registraEventoModelo($datosEvento);
			
			if($respuesta){
				header('location:index.php?action=ok2');
			}
			else{
				header('location:index.php?action=fa2');
			}
		}
	}

	public function consultarEventoControlador(){
		if (isset($_POST['btnBuscarEvento'])) {
			if (isset($_POST['buscarEvento'])) {
				$buscarEvento = $_POST['buscarEvento'];
			}
		}
		else{
			$buscarEvento = '';

		}
		$eventoModelo = new EventoModelo();
		$datosEvento = $eventoModelo->consultarEventoModelo($buscarEvento);
		return $datosEvento;
	}


	public function consultarEventoIdControlador(){
		if (isset($_GET['id'])) {
			$eventoModelo = new EventoModelo();
			$datosEvento = $eventoModelo->consultarEventoIdModelo($_GET['id']);
			return $datosEvento;
		}
	}

}