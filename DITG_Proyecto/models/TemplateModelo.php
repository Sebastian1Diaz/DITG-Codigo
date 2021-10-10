<?php 


class TemplateModelo {
	
	public function validarEnlacesModelo($archivo) {
		$enlace = "Views/modules/".$archivo.".php";
		if (!file_exists($enlace)) {
			$enlace = "Views/modules/inicio.php";
		}

		///////// VALIDACION DE PERSONAS //////
		if ($archivo == 'ok1' || $archivo == 'fa1') {
			$enlace = "Views/modules/reglugar.php";
		}
		elseif ($archivo == 'ok2' || $archivo == 'fa2') {
			$enlace = "Views/modules/regevento.php";
		}
		elseif ($archivo == 'ok3' || $archivo == 'fa3') {
			$enlace = "Views/modules/frmConPersona.php";
		}
	
		return $enlace;

	}
}