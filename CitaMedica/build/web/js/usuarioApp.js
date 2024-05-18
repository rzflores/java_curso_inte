//EDITAR
$('.btn-editar').on('click', function (e) {
    e.preventDefault();
    console.log('Se abre Modal Editarrrrrrrrrrr...');
    
     let idUsuario = $(this).data('id');
     let codigo = $(this).data('codigo');
     let rol = $(this).data('rol');
     let nombre = $(this).data('nombre');
     let apepaterno = $(this).data('apepaterno');
     let apematerno = $(this).data('apematerno');
     let correo = $(this).data('correo');
     let tipodoc = $(this).data('tipodoc');
     let activo = $(this).data('activo');
     let telefono = $(this).data('telefono');
     let dni = $(this).data('dni');
    
    console.log(tipodoc);
    $('#idUsuarioEdit').val(idUsuario);
    $('#codigoUsuarioEdit').val(codigo);
    $('#cboRolEdit').val(rol);
    $('#nombreEdit').val(nombre);
    $('#apepaEdit').val(apepaterno);
    $('#apemaEdit').val(apematerno);
    $('#emailEdit').val(correo);
    $('#tipoDocumentoEdit').val(tipodoc);
    $('#cboEstadoEdit').val(activo);
    $('#telefonoEdit').val(telefono);
    $('#dniEdit').val(dni);
    
    
    
    
    $('#modalEditar').modal('show');

    
});

//CREAR
$('.btn-crear').on('click', function (e) {
    e.preventDefault();
    console.log('Se abre Modal Editar..111111111.');
    $('#modalCrear').modal('show');
    
    
});


