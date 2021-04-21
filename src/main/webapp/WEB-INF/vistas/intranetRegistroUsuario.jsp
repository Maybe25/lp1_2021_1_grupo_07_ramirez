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
<div class="container" style="margin-top: 5%"><h4>Registro Usuario</h4></div>

<div class="container" style="margin-top: 1%">
<div class="container">
<h1>Registra Usuario</h1>

	<form id="id_form"> 

			<div class="form-group col-md-6">
				<label class="control-label" for="id_nombre">Nombres</label>
				<input class="form-control" type="text" id="id_nombre" name="nombres" placeholder="Ingrese el nombre" maxlength="40">    
			</div>
			
			<div class="form-group col-md-6">
				<label class="control-label" for="id_apellidos">Apellidos</label>
				<input class="form-control" type="text" id="id_apellidos" name="apellidos" placeholder="Ingrese los Apellidos " maxlength="40">    
			</div>
			
			<div class="form-group col-md-3">
				<label class="control-label" for="id_dni">DNI</label>
				<input class="form-control" type="text" id="id_dni" name="dni" placeholder="Ingrese el DNI" maxlength="8">    
			</div>
			
			<div class="form-group col-md-4">
				<label class="control-label" for="id_login">Login</label>
				<input class="form-control" type="text" id="id_login" name="login" placeholder="Ingrese el login de Usuario" maxlength="100">    
			</div>
			<div class="form-group col-md-5">
				<label class="control-label" for="id_password">Password	</label>
				<input class="form-control" type="password" id="id_password" name="password" placeholder="Ingrese Contraseña de Usuario" maxlength="100">    
			</div>
			
			
			<div class="form-group col-md-6">
				<label class="control-label" for="id_direccion">Direccion	</label>
				<input class="form-control" type="text" id="id_direccion" name="direccion" placeholder="Ingrese la Direccion" maxlength="100">    
			</div>
			
			<div class="form-group col-md-6">
				<label class="control-label" for="id_estado">Estado	</label>
				<select id="id_estado" name="estado" class="form-control">  
				<option value = " "> [Seleccione] </option>
				<option value = "1" > Activo </option>
				<option value = "0" > Inactivo </option>
				</select>
			</div>
			
			<div class="form-group col-md-6">
				<label class="control-label" for="id_ubigeo">Ubicacion Geografica</label>
				<select id="id_ubigeo" name="ubigeo.idUbigeo" class="form-control"> 
				<option value = "" >[Seleccione] </option>
				
				</select>
			</div>
			
			
			
			<div class="form-group col-md-12">
				<button id="id_registrar" type="button" class="btn btn-primary" >Crea Usuario</button>
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
			url: 'insertaUsuario',
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
	$("#id_apellidos").val('');
	$("#id_dni").val('');
	$("#id_login").val('');
	$("#id_passowrd").val('');
	$("#id_direccion").val('');
	$("#id_estado").val(' ');
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
        		nombre:{
                    selector: "#id_nombre",
                    validators:{
                        notEmpty: {
                             message: 'El nombre es obligatorio'
                        },
                        stringLength: {
                            min: 3,
                            max: 40,
                            message: 'El nombre es de 3 a 40 caracteres'
                        },
                    }
                },
                dni:{
                    selector: "#id_dni",
                    validators:{
                        notEmpty: {
                             message: 'El dni es obligatorio'
                        },
                        regexp: {
                            regexp: /^[0-9]{8}$/,
                            message: 'el dni es 8 dígitos'
                        }
                    }
                },
                apellidos:{
                    selector: "#id_apellidos",
                    validators:{
                        notEmpty: {
                             message: 'El apellido es obligatorio'
                        },
                        stringLength: {
                            min: 3,
                            max: 40,
                            message: 'El apellido no es valido'
                        }
                    }
                },
                direccion:{
                    selector: "#id_direccion",
                    validators:{
                        notEmpty: {
                             message: 'La direccion es obligatorio'
                        },
                        stringLength: {
                            min: 5,
                            max: 40,
                            message: 'La direccion no es valido'
                        }
                    }
                },
                
        }   
    });

    
});


</script>   		
</body>
</html>