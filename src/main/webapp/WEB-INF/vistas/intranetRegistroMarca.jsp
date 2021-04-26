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
<div class="container" style="margin-top: 5%"><h4>Registro Marca</h4></div>

<div class="container" style="margin-top: 1%">
<div class="container">
<h1>Registra Marca</h1>

<form id="id_form" method="post">
<div class="col-md-12" style="margin-top: 2%">
            <div class="row">
				<div class="form-group col-md-6">
					<label class="control-label" for="id_nombre">Nombre</label>
					<input class="form-control" type="text" id="id_nombre" name="nombre" placeholder="Ingrese Nombre" maxlength="20">    
				</div>
				
				<div class="form-group col-md-3">
				<label class="control-label" for="id_estado">Estado</label>
				<select id="id_estado" name="estado" class="form-control"> 
				<option value = "" >[Seleccione] </option>
				<option value = "1" >Activo </option>
				<option value = "0" >Inactivo</option>
				
				</select>
			    </div>
			
			<div class="form-group col-md-3">
				<label class="control-label" for="id_pais">Pais</label>
				<select id="id_pais" name="pais.idPais" class="form-control"> 
				<option value = " " >[Seleccione] </option>
				</select>
			</div>
		</div>
		  <div class="row"> 	
			<div class="form-group col-md-12" align="center">
				<button id="id_registrar" type="button" class="btn btn-primary" >Registrar</button>
			</div>
		  </div>
	</div>	  
 </form> 
</div>		

</div>
<script type="text/javascript">
$.getJSON("listaPais",{},function(data){
  $.each(data,function(index,item){
	  $("#id_pais").append("<option value="+item.idPais+">"+ item.nombre +"</option>");
  });
	
});


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
	$("#id_estado").val('');
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
        		nombre:{
                    selector: "#id_nombre",
                    validators:{
                        notEmpty: {
                             message: 'El nombre es un campo obligatorio'
                        },
                        stringLength: {
                            message: 'El nombre es de 5 a 100 caracteres',
                        	min: 5,
                            max: 100
                           
                        }
                    }
                },
                estado:{
                    selector: "#id_estado",
                    validators:{
                        notEmpty: {
                             message: 'El nombre de estado es obligatorio'
                        },
                     }
                },
                pais:{
                    selector: "#id_pais",
                    validators:{
                        notEmpty: {
                             message: 'El estado es un campo obligatorio'
                        },
                     }
                },
        }
});
    
</script>   		
</body>
</html>