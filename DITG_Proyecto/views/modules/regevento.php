<?php 

	$eventoControlador = new EventoControlador();
	$eventoControlador->registrarEventoControlador();

 ?> 


<h1> Aquí registraras el evento</h1>

<div class="row">
	<div class="col-3"></div>
	<div class="col-6 mt-5 mb-5">
		<form class="form" method="post">
			<label for="" class="form-label">Nombres Del Evento</label>
			<input type="text" name="nombreEve" class="form-control">
			<label for="" class="form-label">Fecha Del Evento</label>
			<input type="date" name="fechaEve" class="form-control">
			<label for="" class="form-label">Hora Del Evento</label>
			<input type="text" name="horaEve" class="form-control">
			<label for="" class="form-label">Direccion Del Evento</label>
			<input type="text" name="direccionEve" class="form-control">
			<label for="" class="form-label">Descripcion Del Evento</label>
			<input type="text" name="descripcionEve" class="form-control">
			<button type="submit" name="regEvento" class="btn btn-primary mt-5">Registrar Evento</button>
		</form>
		<?php 
		if (isset($_GET['action'])) {
			if($_GET['action'] == 'ok2'){
				print "Evento Registrado Correctamente";
			}
			elseif($_GET['action'] == 'fa2'){
				print "Ocurrio un Error. Intentelo Nuevamente";
			}
		}

		?>
		<a href="inicio">Volver</a>
	</div>
	<div class="col-3"></div>
</div>