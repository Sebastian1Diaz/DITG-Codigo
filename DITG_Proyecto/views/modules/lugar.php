<h1> Aqui podrás ver la informacion de los lugares</h1>
<?php 
	$lugarControlador = new LugarControlador();
	$datosLugar = $lugarControlador->consultarLugarControlador();
?>


<div class="row">
	<div class="col">
		<h1>¡Lugares De Girardot!</h1>
	</div>	
</div>

<div class="row">
	<div class="col">
		<form method="post" class="form">
			<div class="row">
			<div class="col-2">
			<input type="text" name="datoBusqueda" class="form-control" style="width: auto;">
			</div>
			<div class="col-6">
			<input type="submit" name="btnBuscarLugar" value="🔍" class="btn btn-primary">
			</div>
			</div>
		</form>
	</div>	
</div>

<div class="row">
	<div class="col">
		<table class="table table-striped">
			<thead>
				<th>Lugar</th>
				<th>Direccion</th>
				<th>Contacto</th>
				<th>Descripcion</th>
				<th colspan="2">Opciones</th>
			</thead>
			<tbody>
				<?php 
					foreach ($datosLugar as $keyLugar => $valueLugar) {
						print '<tr>';
						print '<td>'.$valueLugar['NombreLugar'].'</td>';
						print '<td>'.$valueLugar['DirecciónLugar'].'</td>';
						print '<td>'.$valueLugar['ContactoLugar'].'</td>';
						print '<td>'.$valueLugar['DescripciónLugar'].'</td>';

						print '<td><a href="index.php?action=frmEditLugar&id='.$valueLugar['idLugar'].'">Editar</a></td>';
						print '<td><a href="index.php?action=frmDelLugar&id='.$valueLugar['idLugar'].'">Eliminar</a></td>';
						print "</tr>";
					}
				?>				
			</tbody>
		</table>
	</div>
</div>