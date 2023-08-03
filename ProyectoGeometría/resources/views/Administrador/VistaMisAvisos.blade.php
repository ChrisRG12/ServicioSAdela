@extends('Plantillas.LayoutAdministrador')
@section('content')
@if(session()->has('mensaje'))
   {!!"<script>Swal.fire('Listo', 'Se ha registrado tu aviso', 'success')</script>"!!}
@endif
@if(session()->has('actualizado'))
   {!!"<script>Swal.fire('Listo', 'Se ha actualizado tu aviso', 'success')</script>"!!}
@endif
@if(session()->has('eliminado'))
   {!!"<script>Swal.fire('Listo', 'Se ha eliminado tu aviso', 'success')</script>"!!}
@endif

<div class="contenedorP">

	<div class="table-responsive contenedorTabla">
		<div class="card tituloTabla"><h3 class="card-title">Avisos cargados</h5></div>
		<table class="table table-striped table-bordered tablas" id="tabla_misavisos" >
			<thead>
		      <tr>
				 <th>Título <i class="fa fa-header" aria-hidden="true"></i> </th>
				 <th>Descripción <i class="fa fa-file-text" aria-hidden="true"></i> </th>
				 <th>Imagen <i class="fa fa-picture-o" aria-hidden="true"></i>  </th>
				 <th>Acciones </th>
			  </tr>
		   </thead>
		   <tbody>
		   	@foreach($consulta as $aviso)
		      <tr>
				<td>{{$aviso->titulo}}</td>
				<td>{{$aviso->descripcion}}</td>
				<td><img src="../../../subido/{{$aviso->imagen}}" class="img_tabla"></td>
				<td>
                        <!-- Button trigger modal -->
                        <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#modalActualizarAviso{{$aviso->id_aviso}}">
                            Launch demo modal
                        </button>


                    <button type="button" class="btn btn-danger btn_eliminar_aviso"
                    data-toggle="modal" data-placement="top" data-bs-target="#modalEliminarAviso{{$aviso->id_aviso}}"
                    title="Eliminar aviso" data-id="{{$aviso->id_aviso}}"
                    data-nombre="{{$aviso->titulo}}">
                    <i class="fa fa-trash" aria-hidden="true"></i> se borra </button></td>
			  </tr>

		   </tbody>
           @endforeach
		</table>

		</table>
	</div>

</div>

{{-- <!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
          ...
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
          <button type="button" class="btn btn-primary">Save changes</button>
        </div>
      </div>
    </div>
  </div> --}}



<!-- Modal Actualizar Aviso-->
<div class="modal fade" id="modalActualizarAviso{{$aviso->id_aviso}}" tabindex="-1" role="dialog" aria-labelledby="modalActualizarAviso" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h3 class="modal-title" id="exampleModalLongTitle">Formulario para actualizar un aviso</h3>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">

        <form method="post" action="{{route('actualizarAviso')}}" enctype="multipart/form-data">
            @csrf
            {!!method_field('put')!!}

              <div class="form-group">
                 <label>Título:</label>
                 <input type="text" placeholder="No mayor a 80 caracteres" value="{{old('titulo')}}" id="titulo" name="titulo" class="form-control" data-toggle="tooltip" data-placement="top" title="No mayor a 80 caracteres">
                 <small id="passwordHelpBlock" class="form-text text-muted">
                     Si no desea actualizar este campo, dejelo como está
                 </small>
                 @if($errors->has('titulo'))
                    <div class="alert alert-danger" role="alert">
                       {{ $errors->first('titulo') }}
                    </div>
                 @endif
              </div>
              <div class="form-group">
                 <label>Descripción:</label>
                 <textarea name="descripcion" id="descripcion" rows="2" placeholder="No mayor a 150 caracteres" class="form-control" >{{old('descripcion')}}</textarea>
                 <small id="passwordHelpBlock" class="form-text text-muted">
                     Si no desea actualizar este campo, dejelo como está
                 </small>
                 @if($errors->has('descripcion'))
                    <div class="alert alert-danger" role="alert">
                       {{ $errors->first('descripcion') }}
                    </div>
                 @endif
              </div>
              <div class="form-group">
                 <label>Imagen:</label>
                 <input type="file" class="form-control-file" name="imagen">
                 <small id="passwordHelpBlock" class="form-text text-muted">
                        La opción de actualizar la imagen es opcional.
                 </small>
                 @if($errors->has('imagen'))
                    <div class="alert alert-danger" role="alert">
                       {{ $errors->first('imagen') }}
                    </div>
                 @endif
              </div>
              <input type="hidden" name="id_aviso" class="id_aviso" value="{{old('id_aviso')}}">
              <input type="hidden" name="id_user" class="id_user" value="{{old('id_user')}}">
              <button class="btn btn-primary btn-block"><i class="fa fa-refresh" aria-hidden="true"></i>
 Actualizar</button>
           </form>
      </div>
      <div class="modal-footer">
        <div class="botones">
          <button type="button" data-bs-dismiss="modal" class="btn btn-danger btn-block" data-dismiss="modal"><i class="fa fa-times" aria-hidden="true"></i> Cerrar</button>
        </div>
      </div>
    </div>
  </div>
</div>

{{-- @if (count($errors) > 0)
    <script type="text/javascript">
        $( document ).ready(function() {
             $('#modalActualizarAviso').modal('show');
        });
    </script>
  @endif --}}


{{-- <!-- Modal Eliminar Aviso-->
<div class="modal fade" id="modalEliminarAviso{{$aviso->id_aviso}}" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h3 class="modal-title" id="exampleModalLongTitle">Eliminar aviso</h3>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <h3>¿Desea eliminar este aviso?</h3>
        <h5 id="titulo_eliminar"></h5>
        <form method="post" action="{{route('eliminarAviso')}}" >
           	{!! csrf_field() !!}
              <input type="hidden" name="id_aviso" class="id_aviso" value="{{old('id_aviso')}}">
              <input type="hidden" name="id_user" class="id_user" value="{{old('id_user')}}">
              <button class="btn btn-danger btn-block"><i class="fa fa-trash" aria-hidden="true"></i>
 Eliminar</button>
           </form>
      </div>
      <div class="modal-footer">
        <div class="botones">
            <button type="button" class="btn btn-secondary btn-block" data-dismiss="modal"><i class="fa fa-times" aria-hidden="true"></i> Cancelar</button>
        </div>
      </div>
    </div>
  </div>
</div> --}}

@endsection
