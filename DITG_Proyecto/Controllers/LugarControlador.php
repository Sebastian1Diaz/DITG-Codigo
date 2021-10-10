<?php 

class LugarControlador {
	
	public function registrarLugarControlador() {
		if(isset($_POST['regLugar'])){
			$datosLugar = array('nombre' => $_POST['nombre'], 
				'direccion'=>$_POST['direccion'],
				'contacto' => $_POST['contacto'],
				'descripcion' => $_POST['descripcion']);
			$lugarModelo = new LugarModelo();
			$respuesta = $lugarModelo->registrarLugarModelo($datosLugar);
			

			if($respuesta){
				header('location:index.php?action=ok1');
			}else{
				header('location:index.php?action=fa1');
			}
		}
	}

	public function consultarLugarControlador(){
		if (isset($_POST['btnBuscarLugar'])) {
			if (isset($_POST['datoBusqueda'])) {
				$datoBusqueda = $_POST['datoBusqueda'];
			}
		}
		else{
			$datoBusqueda = '';
		}

		$lugarModelo = new LugarModelo();
		$datosLugar = $lugarModelo->consultarLugarModelo($datoBusqueda);
		return $datosLugar;
	}


	public function consultarLugarIdControlador(){
		if (isset($_GET['id'])) {
			$lugarModelo = new LugarModelo();
			$datosLugar = $lugarModelo->consultarLugarIdModelo($_GET['id']);
			return $datosLugar;
		}
	}

}