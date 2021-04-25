<jsp:include page="intranetValida.jsp" />
<!DOCTYPE html>
<html lang="esS" >
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="Expires" content="-1" />
<meta http-equiv="Cache-Control" content="private" />
<meta http-equiv="Cache-Control" content="no-store" />
<meta http-equiv="Pragma" content="no-cache" />

<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="js/dataTables.bootstrap.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/bootstrapValidator.js"></script>
<script type="text/javascript" src="js/global.js"></script>

<link rel="stylesheet" href="css/bootstrap.css"/>
<link rel="stylesheet" href="css/dataTables.bootstrap.min.css"/>
<link rel="stylesheet" href="css/bootstrapValidator.css"/>

<title>Intranet</title>
</head>
<body>
<jsp:include page="intranetCabecera.jsp" />
<div class="container" style="margin-top: 5%"><h4>Registro Producto</h4></div>

<div class="container" style="margin-top: 1%">
<!-- Agregar aquí -->

<div class="container">
<form id="id_form"> 

<!-- PARA CAMPO NOMBRE -->
<div class="form-group col-md-6">
	<label class="control-label" for="id_nombre">NOMBRE</label>
	<input class="form-control" type="text" id="id_nombre" name="nombres" placeholder="Ingrese el nombre" maxlength="40">    
			</div>

<!-- PARA CAMPO SERIE -->
<div class="form-group col-md-6">
	<label class="control-label" for="id_serie">SERIE</label>
	<input class="form-control" type="text" id="id_serie" name="serie" placeholder="Ingrese Serie" maxlength="40">    
			</div>
			
<!-- PARA CAMPO PRECIO -->
<div class="form-group col-md-3">
	<label class="control-label" for="id_precio">PRECIO</label>
	<input class="form-control" type="text" id="id_precio" name="precio" placeholder="Ingrese el Precio" maxlength="8">    
			</div>

<!-- PARA CAMPO STOCK -->
<div class="form-group col-md-3">
	<label class="control-label" for="id_stock">STOCK</label>
	<input class="form-control" type="text" id="id_stock" name="stock" placeholder="Ingrese el Stock" maxlength="8">    
			</div>
			

<!-- PARA LLAVES FORANEAS -->	
                         <!-- PARA CAMPO PAIS -->
<div class="form-group col-md-6">
				<label class="control-label" for="id_pais">PAIS</label>
				<select id="id_pais" name="pais.idPais" class="form-control"> 
				<option value = "" >[Seleccione] </option>
				
				</select>
			</div>
			
                          <!-- PARA CAMPO MARCA -->
<div class="form-group col-md-6">
				<label class="control-label" for="id_Marca">MARCA</label>
				<select id="id_Marca" name="marca.idMarca" class="form-control"> 
				<option value = "" >[Seleccione] </option>
				
				</select>
			</div>

<!-- CAMPO PARA BOTON -->	
<div class="form-group col-md-12">
				<button id="id_registrar" type="button" class="btn btn-primary" >REGISTRA PRODUCTO</button>
			</div>

</form>
</div>
</div>

<script type="text/javascript">
<!-- Agregar aquí -->

$.getJSON("listaPais", {}, function(data){
	$.each(data, function(index,item){
		$("#id_pais").append("<option value="+item.idPais +">"+ item.nombre +"</option>");
	});
});

<!-- REGISTRANDO LA VALIDACION -->


$("#id_registrar").click(function (){ 

	var validator = $('#id_form').data('bootstrapValidator');
	validator.validate();

	if (validator.isValid()){
		$.ajax({
			type: 'POST',  
			data: $("#id_form").serialize(),
			url: 'insertarMarca',
			success: function(data){
				mostrarMensaje(data.MENSAJE);
				limpiar();
				validator.resetForm();
			},
			error: function(){
				mostrarMensaje(MSG_ERROR);
			}
		});
	}
	
});

function limpiar(){
	$("#id_nombre").val('');
	$("#id_serie").val('');
	$("#id_precio").val('');
	$("#id_stock").val('');
	$("#id_pais").val('');
}


$(document).ready(function() {
    $('#id_form').bootstrapValidator({
        message: 'This value is not valid',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
        		NOMBRE:{
                    selector: "#id_nombre",
                    validators:{
                        notEmpty: {
                             message: 'EL CAMPO NOMBRE NO ESTA LLENO'
                        },
                        stringLength: {
                            min: 3,
                            max: 40,
                            message: 'EL NOMBRE INCLUYE DE 3 A 40 CARACTERES'
                        },
                    }
                },
                
                //PARA SERIE 
                SERIE:{
                    selector: "#id_serie",
                    validators:{
                        notEmpty: {
                             message: 'EL CAMPO SERIE NO ESTA LLENO'
                        },
                        stringLength: {
                            min: 1,
                            max: 10,
                            message: 'LA SERIE SOLO CONTIENE 10 CARACTERES'
                        },
                    }
                },
                
                //PARA PRECIO
                PRECIO:{
                    selector: "#id_precio",
                    validators:{
                        notEmpty: {
                             message: 'EL CAMPO PRECIO NO ESTA LLENO'
                        },
                        stringLength: {
                            min: 3,
                            max: 40,
                            message: 'EL PRECIO NO ES VALIDO'
                        }
                    }
                },
                
                //PARA STOCK
                STOCK:{
                    selector: "#id_stock",
                    validators:{
                        notEmpty: {
                             message: 'EL CAMPO STOCK NO ESTA LLENO'
                        },
                        stringLength: {
                            min: 5,
                            max: 60,
                            message: 'EL STOCK NO ES VALIDO'
                        }
                    }
                },
                
              //PARA PAIS
                PAIS:{
                    selector: "#id_pais",
                    validators:{
                        notEmpty: {
                             message: 'EL CAMPO PAIS NO ESTA LLENO'
                        },
                        
                    }
                },
                
        }   
    });

    
});


</script>   		
</body>
</html>