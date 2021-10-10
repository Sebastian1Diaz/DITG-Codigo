
<div class="row">
	<div class="col-6">
		<h3>Estos son los eventos más recientes</h3>
		<div class="col-3">
			<a href="regevento">Evento nuevo</a>
		</div>
	</div>
</div>

<?php 
	$EventoControlador = new EventoControlador();
	$datosEvento = $EventoControlador->consultarEventoControlador();
?>

<div class="row">
	<div class="col">
		<form method="post" class="form">
			<div class="row">
			<div class="col-2">
			<input type="text" name="buscarEvento" class="form-control" style="width: auto;">
			</div>
			<div class="col-6">
			<input type="submit" name="btnBuscarEvento" value="🔍" class="btn btn-primary">
			</div>
			</div>
		</form>
	</div>	
</div>

<div class="row">
	<div>
		<table class="table table-striped">
			<thead>
				<th>Evento</th>
				<th>Hora</th>
				<th>Descripción</th>
				<th>Dirección</th>
				<th>Descripcion</th>
			</thead>
			<br>
			<tbody>
				<?php 
					foreach ($datosEvento as $keyEvento => $valueEvento) {
						print '<tr>';
						print '<td class="consulta">'.$valueEvento['NombreEvento'].'</td>';
						print '<td class="consulta">'.$valueEvento['FechaEvento'].'</td>';
						print '<td class="consulta">'.$valueEvento['HoraEvento'].'</td>';
						print '<td class="consulta">'.$valueEvento['DirecciónEvento'].'</td>';
						print '<td class="consulta">'.$valueEvento['DescripciónEvento'].'</td>';
						print "</tr>"; 
						
					}
				?>				
			</tbody>
		</table>
	</div>
</div>