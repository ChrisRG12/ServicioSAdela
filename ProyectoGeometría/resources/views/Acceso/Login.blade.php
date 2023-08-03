
@extends('Plantillas.LayoutPrincipal')
@section('content')

 @if (session()->has('registrado'))
    {!!"<script>
      Swal.fire
      ('Listo',
      'Se ha registrado con éxito',
      'success')
      </script>"!!}
 @endif

 @if (session()->has('denegado'))
    {!!"<script>
      Swal.fire
      ('Lo sentimos',
      'El usuario y/o contraseña son incorrectos',
      'error')
      </script>"!!}
    <link rel="stylesheet" href="{{ asset('css/Estilos.css') }}">
 @endif



         <div class="card bg-light cuadro" style="margin-left: 26%">
            <div class="card-title titulo">
            	<h3 class="text-center">Inicio de Sesión</h3>
            </div>
            <div class="card-body" style="align-content: center">
               <form method="post" action="{{route('logusuario.login')}}">
                  {!! csrf_field() !!}

                  <div class="form-group">
                     <label>Email:</label>
                     <input type="text" name="emaillog" class="form-control" placeholder="Ingrese su correo" value="{{ old('emaillog') }}">
                     @if ($errors->has('emaillog'))
                         <div class="alert alert-danger" role="alert">
                            {{ $errors->first('emaillog') }}
                         </div>
                      @endif
                  </div>

                  <div class="form-group">
                     <label>Contraseña:</label>
                     <input type="password" name="passlog" id="passlog" class="form-control" placeholder="Ingrese su contraseña">
                     <input type="checkbox" id="passlogin" title="Mostrar contraseña"> &nbsp;Mostrar Contraseña
                     @if ($errors->has('passlog'))
                         <div class="alert alert-danger" role="alert">
                            {{ $errors->first('passlog') }}
                         </div>
                      @endif
                  </div>

                  <button class="btn btn-success btn-lg btn-block"> Ingresar </button>
               </form>
               <br>
               <a href="{{route('Registro')}}" id="a">Si todavía no tienes una cuenta, REGISTRATE AQUÍ</a>
            </div>
         </div>



@endsection
