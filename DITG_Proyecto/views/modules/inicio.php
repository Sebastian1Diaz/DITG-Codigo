<div class="row">
	<div class="col-4">
		<h1>Bienvenido a DITG</h1>
	</div>
</div>
<?php 
	$EventoControlador = new EventoControlador();
	$datosEvento = $EventoControlador->consultarEventoControlador();
?>
<div class="row">
	<div class="col">
		<br>
		<br>
		<h3>Eventos recientes</h1>
	</div>	
</div>

<div class="row">
	<div class="col">
	</div>	
</div>

<div class="row">
	<div class="col-6">
		<table class="consulta">
			<br>
			<tbody>
				<img src="img/eventos.jpg" alt="" width="1000" height="200" align="center" >
				<?php 
					foreach ($datosEvento as $keyEvento => $valueEvento) {
						print '<tr>';
						print '<td class="consulta">'.$valueEvento['NombreEvento'].'</td>';
						print "</tr>"; 
						print '<tr>';
						print '<td class="consulta">'.$valueEvento['FechaEvento'].'</td>';
						print "</tr>"; 
						print '<tr>';
						print '<td class="consulta">'.$valueEvento['HoraEvento'].'</td>';
						print "</tr>"; 
						print '<tr>';
						print '<td class="consulta">'.$valueEvento['DirecciónEvento'].'</td>';
						print "</tr>"; 
						print '<tr>';
						print '<td class="consulta" <p>'.$valueEvento['DescripciónEvento'].'</p> </td>';
						print "</tr>";

					}
				?>				
			</tbody>
		</table>
	</div>
</div>

<?php 
	$lugarControlador = new LugarControlador();
	$datosLugar = $lugarControlador->consultarLugarControlador();
?>


<div class="row">
	<div class="col">
		<h1>Lugares cercanos</h1>
	</div>	
</div>

<div class="row">
	<div class="col">
	</div>	
</div>

<div class="row">
	<div class="col">
		<img src="img/lugares.gif" alt="" width="500" height="300" >
		<table class="table table-striped">
			<thead>
				<th>Lugar</th>
				<th>Direccion</th>
				<th>Contacto</th>
				<th>Descripcion</th>
			</thead>
			<tbody>
				<?php 
					foreach ($datosLugar as $keyLugar => $valueLugar) {
						print '<tr>';
						print '<td>'.$valueLugar['NombreLugar'].'</td>';
						print '<td>'.$valueLugar['DirecciónLugar'].'</td>';
						print '<td>'.$valueLugar['ContactoLugar'].'</td>';
						print '<td>'.$valueLugar['DescripciónLugar'].'</td>';
						print '</tr>';
					}
				?>