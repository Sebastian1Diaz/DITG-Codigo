<?php 

	$lugarControlador = new LugarControlador();
	$lugarControlador->registrarLugarControlador();

 ?>


<h1> Aquí registraras el lugar</h1>

<div class="row">
	<div class="col-3"></div>
	<div class="col-6 mt-5 mb-5">
		<form class="form" method="post">
			<label for="" class="form-label">Nombres Del Establecimiento</label>
			<input type="text" name="nombre" class="form-control">
			<label for="" class="form-label">Direccion Del Establecimiento</label>
			<input type="text" name="direccion" class="form-control">
			<label for="" class="form-label">Contacto Del Establecimiento</label>
			<input type="text" name="contacto" class="form-control">
			<label for="" class="form-label">Descripcion Del Establecimiento</label>
			<input type="text" name="descripcion" class="form-control">
		
			<!-- Tabla tipoLugar↓

			<label for="" class="form-label"><h4>Categorias</h4></label>
			<br>
			<input type="radio" name="genero" value="Resturante">
			<label for="" class="label-form">Restaurante</label>
			<input type="radio" name="genero" value="Hotel">
			<label for="" class="label-form">Hotel</label>
			<input type="radio" name="genero" value="Supermercado">
			<label for="" class="label-form">Super mercado</label>
			<br>--> 
			<button type="submit" name="regLugar" class="btn btn-primary mt-5">Registrar</button>
		</form>
		<?php 
		if (isset($_GET['action'])) {
			if($_GET['action'] == 'ok1'){
				print "Lugar Registrado Correctamente";
			}
			elseif($_GET['action'] == 'fa1'){
				print "Ocurrio un Error. Intentelo Nuevamente";
			}
		}

		?>
		<a href="lugar">Volver</a>
	</div>
	<div class="col-3"></div>
</div>