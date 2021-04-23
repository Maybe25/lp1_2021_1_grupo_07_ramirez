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
<div class="container" style="margin-top: 5%"><h4>Registro Proveedor</h4></div>

<div class="container" style="margin-top: 1%">
<div class="container">
<h1>Registra Proveedor</h1>

<form id="id_form"> 

			<div class="form-group col-md-6">
				<label class="control-label" for="id_razon">Razon</label>
				<input class="form-control" type="text" id="id_razon" name="razones" placeholder="Ingrese Razon Social" maxlength="40">    
			</div>
			
			<div class="form-group col-md-6">
				<label class="control-label" for="id_ruc">Ruc</label>
				<input class="form-control" type="text" id="id_ruc" name="rucn" placeholder="Ingrese su Ruc " maxlength="40">    
			</div>
			
			<div class="form-group col-md-3">
				<label class="control-label" for="id_direccion">Direccion</label>
				<input class="form-control" type="text" id="id_direccion" name="direcciones" placeholder="Ingrese su Direccion" maxlength="40">    
			</div>
			
			<div class="form-group col-md-4">
				<label class="control-label" for="id_telefono">Telefono</label>
				<input class="form-control" type="text" id="id_telefono" name="telefonos" placeholder="Ingrese su telefono fijo" maxlength="15">    
			</div>
			<div class="form-group col-md-5">
				<label class="control-label" for="id_celular">Celular</label>
				<input class="form-control" type="text" id="id_celular" name="celulares" placeholder="Ingrese su numero celular" maxlength="15">    
			</div>
			
			
			<div class="form-group col-md-6">
				<label class="control-label" for="id_contacto">Contacto</label>
				<input class="form-control" type="text" id="id_contacto" name="contactos" placeholder="Ingrese nombre de contacto" maxlength="100">    
			</div>
			
			
			<div class="form-group col-md-6">
				<label class="control-label" for="id_ubigeo">Ubicacion Geografica</label>
				<select id="id_ubigeo" name="ubigeo.idUbigeo" class="form-control"> 
				<option value = "" >[Seleccione] </option>
				
				</select>
			</div>
			
			<div class="form-group col-md-12">
				<button id="id_registrar" type="button" class="btn btn-primary" >Crea Proveedor</button>
			</div>
	</form> 
			</div>
	
</div>

<script type="text/javascript">
$.getJSON("listaUbigeo", {}, function(data){
	$.each(data, function(index,item){
		$("#id_ubigeo").append("<option value="+item.idUbigeo +">"+ item.departamento +" | "+item.provincia+" | "+item.distrito+ "</option>");
	});
});


$("#id_registrar").click(function (){ 

	var validator = $('#id_form').data('bootstrapValidator');
	validator.validate();

	if (validator.isValid()){
		$.ajax({
			type: 'POST',  
			data: $("#id_form").serialize(),
			url: 'insertaProveedor',
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
	$("#id_razon").val('');
	$("#id_ruc").val('');
	$("#id_direccion").val('');
	$("#id_telefono").val('');
	$("#id_celular").val('');
	$("#id_contacto").val('');
	$("#id_id_ubigeo").val(' ');
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
        		razones:{
                    selector: "#id_razon",
                    validators:{
                        notEmpty: {
                             message: 'La razon social es obligatoria'
                        },
                        stringLength: {
                            min: 10,
                            max: 40,
                            message: 'El nombre es de 10 a 40 caracteres'
                        },
                    }
                },
                rucn:{
                    selector: "#id_ruc",
                    validators:{
                        notEmpty: {
                             message: 'El ruc  es obligatorio'
                        },
                        regexp: {
                            regexp: /^[0-9]{11}$/,
                            message: 'el ruc es de 11 digitos'
                        }
                    }
                },
                direcciones:{
                    selector: "#id_direccion",
                    validators:{
                        notEmpty: {
                             message: 'La direccion es obligatorio'
                        },
                        stringLength: {
                            min: 10,
                            max: 50,
                            message: 'La direccion no es valido'
                        }
                    }
                },
                telefonos:{
                    selector: "#id_telefono",
                    validators:{
                        notEmpty: {
                             message: 'El numero de telefono es obligatorio'
                        },
                        sregexp: {
                            regexp: /^[0-9]$/,
                            message: 'el telefono  es invalido'
                        }
                    }
                },
                
                 celulares:{
                    selector: "#id_celular",
                    validators:{
                        notEmpty: {
                             message: 'El numero de celular es obligatorio'
                        },
                        sregexp: {
                            regexp: /^[0-9]$/,
                            message: 'el celular  es invalido'
                        }
                    }
                },
                
                 contactos:{
                    selector: "#id_contacto",
                    validators:{
                        notEmpty: {
                             message: 'El nombre de contacto  obligatorio'
                        },
                        stringLength: {
                            min: 10,
                            max: 50,
                            message: 'El nombre no es valido'
                        }
                    }
                },
                
        }   
    });

    
});


	
</script>   		
</body>
</html>