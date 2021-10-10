<?php 
///////CONTROLADORES /////////////////////
require_once("Controllers/TemplateControlador.php");
require_once("Controllers/LugarControlador.php");
require_once("Controllers/EventoControlador.php");


///////////MODELOS ///////////////////////
require_once("Models/TemplateModelo.php");
require_once("Models/LugarModelo.php");
require_once("Models/EventoModelo.php");


$templateControlador = new templateControlador();
$templateControlador->cargarTemplate();

?>