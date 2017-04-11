'use strict';

(function (ng) {

    var app = ng.module('admUsuarioModulo', []);

    app.controller('admUsuarioControlador', ['$scope', '$rootScope', '$location', '$http', '$routeParams', 'jwtHelper', 'store', 'admUsuarioServicio', 'comunServicio', 'utlListadosServicio', 'constant', function ($scope, $rootScope, $location, $http, $routeParams, jwtHelper, store, admUsuarioServicio, comunServicio, utlListadosServicio, constant) {

        $scope.idUsuario = comunServicio.esAutenticado() ? comunServicio.obtenerSesion().sub : 0;
        $scope.usuarioOE = {'usuario': {'a002documento': '', 'a002estadousuario': 'A', 'a002localizacion': {'a105codigo': ''}}, 'idUsuario': $scope.idUsuario};
        $scope.busquedaOE = {'palabraClave': '', 'idUsuario': $scope.idUsuario};
        $scope.confirma = {'a002contrasena': ''};
        $scope.localizacion = {'a002localizacionDepto': '', 'a002localizacionMcpio': ''};
        $scope.objetoSalida = {'respuesta': []};
        $scope.Lsta002tipousuario = [];
        $scope.Lsta002autoridadambiental = [];
        $scope.Lsta002idtipodocumento = [];
        $scope.Lsta002localizacionDepto = [];
        $scope.Lsta002localizacionMcpio = [];

        $scope.totalItems = $scope.objetoSalida.respuesta.length;
        $scope.currentPage = 1;
        $scope.itemsPerPage = 5;
        $scope.maxSize = 5;

        $scope.validarUsuarioInvitado = function () {

            $scope.usuarioOE.usuario.a002usuario = constant.usuarioInvitado;
            $scope.usuarioOE.usuario.a002contrasena = constant.contraseniaInvitado;

            $scope.validarUsuario();
        };

        $scope.validarUsuario = function () {

            admUsuarioServicio.validarUsuario($scope.usuarioOE)
                .then(function successCallback(response) {

                    if (response.data.codError == 0) {

                        store.set('ive_token', response.headers('ive_token'));
                        $location.path('/');
                    } else {

                        comunServicio.cerrarSesion();
                    }
                    comunServicio.mensajeSalida(response);
                }, function errorCallback(response) {

                    comunServicio.mensajeSalida(response);
                });
        };

        $scope.registrarUsuario = function () {

            if ($scope.usuarioOE.usuario.a002contrasena == $scope.confirma.a002contrasena) {

                admUsuarioServicio.registrarUsuario($scope.usuarioOE)
                    .then(function successCallback(response) {

                        comunServicio.mensajeSalida(response);
                        $location.path('/modificarUsuario');
                    }, function errorCallback(response) {

                        comunServicio.mensajeSalida(response);
                    });
            } else {
                comunServicio.mensaje('El campo Contraseña y Confirmar Contraseña deben ser iguales', 'error');
            }
        };

        $scope.consultarUsuario = function (a002codigo) {

            if (a002codigo > 0) {

                $scope.usuarioOE.usuario.a002codigo = a002codigo;

                admUsuarioServicio.consultarUsuario($scope.usuarioOE)
                    .then(function successCallback(response) {

                        if (response.data.codError == 0) {

                            $scope.usuarioOE = {
                                'usuario': {
                                    'a002codigo': a002codigo,
                                    'a002nombre': comunServicio.obtenerCadena(response.data.respuesta[0].A002NOMBRE),
                                    'a002apellido': comunServicio.obtenerCadena(response.data.respuesta[0].A002APELLIDO),
                                    'a002idtipodocumento': {'a102codigo': comunServicio.obtenerCadena(response.data.respuesta[0].A002IDTIPODOCUMENTO)},
                                    'a002documento': comunServicio.obtenerCadena(response.data.respuesta[0].A002DOCUMENTO),
                                    'a002expedidoen': comunServicio.obtenerCadena(response.data.respuesta[0].A002EXPEDIDOEN),
                                    'a002direccioncorresp': comunServicio.obtenerCadena(response.data.respuesta[0].A002DIRECCIONCORRESP),
                                    'a002correoelectronico': comunServicio.obtenerCadena(response.data.respuesta[0].A002CORREOELECTRONICO),
                                    'a002telefono': comunServicio.obtenerCadena(response.data.respuesta[0].A002TELEFONO),
                                    'a002celular': comunServicio.obtenerCadena(response.data.respuesta[0].A002CELULAR),
                                    'a002usuario': comunServicio.obtenerCadena(response.data.respuesta[0].A002USUARIO),
                                    'a002contrasena': comunServicio.obtenerCadena(response.data.respuesta[0].A002CONTRASENA),
                                    'a002tipousuario': {'a102codigo': comunServicio.obtenerCadena(response.data.respuesta[0].A002TIPOUSUARIO)},
                                    'a002autoridadambiental': {'a001codigo': comunServicio.obtenerCadena(response.data.respuesta[0].A002AUTORIDADAMBIENTAL)},
                                    'a002estadousuario': comunServicio.obtenerCadena(response.data.respuesta[0].A002ESTADOUSUARIO),
                                    'a002localizacion': {'a105codigo': ''}
                                },
                                'idUsuario': $scope.idUsuario
                            };
                            $scope.confirma.a002contrasena = comunServicio.obtenerCadena(response.data.respuesta[0].A002CONTRASENA);
                            $scope.localizacion = {
                                'a002localizacionDepto': comunServicio.obtenerCadena(response.data.respuesta[0].A105CODDEPARTAMENTO),
                                'a002localizacionMcpio': comunServicio.obtenerCadena(response.data.respuesta[0].A105CODMUNICIPIO)
                            };
                            $scope.listarDivipolaDepto();
                        }
                        comunServicio.mensajeSalida(response);
                    }, function errorCallback(response) {

                        comunServicio.mensajeSalida(response);
                    });
            }
        };

        $scope.consultarGrilla = function (filtro) {

            admUsuarioServicio.consultarGrilla(filtro)
                .then(function successCallback(response) {

                    $scope.objetoSalida.respuesta = [];
                    for (var i = 0; i < response.data.respuesta.length; i++) {
                        if (!$scope.obtenerSeleccion(response.data.respuesta[i].A002ESTADOUSUARIO, 'I'))
                            $scope.objetoSalida.respuesta.push(response.data.respuesta[i]);
                    }

                    $scope.objetoSalida.respuesta = $scope.objetoSalida.respuesta.sort(function (a, b) {
                        return comunServicio.obtenerNumero(a.A002CODIGO) - comunServicio.obtenerNumero(b.A002CODIGO);
                    });

                    $scope.totalItems = $scope.objetoSalida.respuesta.length;

                    comunServicio.mensajeSalida(response);
                }, function errorCallback(response) {

                    comunServicio.mensajeSalida(response);
                });
        };

        $scope.actualizarUsuario = function () {

            if ($scope.usuarioOE.usuario.a002contrasena == $scope.confirma.a002contrasena) {

                admUsuarioServicio.actualizarUsuario($scope.usuarioOE)
                    .then(function successCallback(response) {

                        comunServicio.mensajeSalida(response);
                        $location.path('/modificarUsuario');
                    }, function errorCallback(response) {

                        comunServicio.mensajeSalida(response);
                    });

            } else {
                comunServicio.mensaje('El campo Contraseña y Confirmar Contraseña deben ser iguales', 'error');
            }
        };

        $scope.eliminarUsuario = function (a002codigo) {

            $scope.usuarioOE.usuario = a002codigo;
            admUsuarioServicio.eliminarUsuario($scope.usuarioOE)
                .then(function successCallback(response) {

                    if (response.data.codError == 0) {

                        $scope.consultarGrilla({'palabraClave': '', 'idUsuario': $scope.idUsuario});
                    }
                    comunServicio.mensajeSalida(response);
                }, function errorCallback(response) {

                    comunServicio.mensajeSalida(response);
                });
        };

        $scope.obtenerAlias = function () {

            $scope.usuarioOE.usuario.a002usuario = 'IVE' + $scope.usuarioOE.usuario.a002documento;
        };

        $scope.listarDivipolaMcpio = function () {

            utlListadosServicio.listarDivipolaMcpio({'idUsuario': $scope.idUsuario, 'a105coddepartamento': $scope.localizacion.a002localizacionDepto})
                .then(function successCallback(response) {

                    if (response.data.codError == 0) {

                        $scope.Lsta002localizacionMcpio = response.data.respuesta;

                        for (var i = 0; i < $scope.Lsta002localizacionMcpio.length; i++) {
                            if ($scope.obtenerSeleccion($scope.Lsta002localizacionMcpio[i].A105CODMUNICIPIO, $scope.localizacion.a002localizacionMcpio)) {
                                $scope.usuarioOE.usuario.a002localizacion.a105codigo = comunServicio.obtenerCadena($scope.Lsta002localizacionMcpio[i].A105CODIGO);
                            }
                        }

                    } else {
                        comunServicio.mensajeSalida(response);
                    }
                }, function errorCallback(response) {

                    comunServicio.mensajeSalida(response);
                });
        };

        $scope.listarDivipolaDepto = function () {

            utlListadosServicio.listarDivipolaDepto({'idUsuario': $scope.idUsuario})
                .then(function successCallback(response) {

                    if (response.data.codError == 0) {

                        $scope.Lsta002localizacionDepto = response.data.respuesta;
                        $scope.listarDivipolaMcpio();
                    } else {
                        comunServicio.mensajeSalida(response);
                    }
                }, function errorCallback(response) {

                    comunServicio.mensajeSalida(response);
                });
        };

        $scope.listarTipoUsuario = function () {

            utlListadosServicio.listarParametricas({'idUsuario': $scope.idUsuario, 'categoria': 'TIPOUSUARIO'})
                .then(function successCallback(response) {

                    if (response.data.codError == 0) {

                        $scope.Lsta002tipousuario = [];

                        if ($scope.esAutorizado(['ADMINISTRADOR_SISTEMA'])) {

                            $scope.Lsta002tipousuario = response.data.respuesta;
                        } else if ($scope.esAutorizado(['FUNCIONARIO_MADS'])) {

                            for (var i = 0; i < response.data.respuesta.length; i++) {
                                if ($scope.obtenerSeleccion(response.data.respuesta[i].IDITEM, comunServicio.permisos['ADMISTRADOR_AUTORIDAD_AMBIENTAL']))
                                    $scope.Lsta002tipousuario.push(response.data.respuesta[i]);
                            }
                        } else if ($scope.esAutorizado(['ADMISTRADOR_AUTORIDAD_AMBIENTAL'])) {

                            for (var i = 0; i < response.data.respuesta.length; i++) {
                                if ($scope.obtenerSeleccion(response.data.respuesta[i].IDITEM, comunServicio.permisos['PUBLICADOR_AUTORIDAD_AMBIENTAL']))
                                    $scope.Lsta002tipousuario.push(response.data.respuesta[i]);
                            }
                        }
                        else {

                            for (var i = 0; i < response.data.respuesta.length; i++) {
                                if ($scope.obtenerSeleccion(response.data.respuesta[i].IDITEM, comunServicio.obtenerSesion().perfil))
                                    $scope.Lsta002tipousuario.push(response.data.respuesta[i]);
                            }
                        }

                    } else {
                        comunServicio.mensajeSalida(response);
                    }
                }, function errorCallback(response) {

                    comunServicio.mensajeSalida(response);
                });
        };

        $scope.listarTipoDocumento = function () {

            utlListadosServicio.listarParametricas({'idUsuario': $scope.idUsuario, 'categoria': 'TIPODOC'})
                .then(function successCallback(response) {

                    if (response.data.codError == 0) {

                        $scope.Lsta002idtipodocumento = response.data.respuesta;
                    } else {
                        comunServicio.mensajeSalida(response);
                    }
                }, function errorCallback(response) {

                    comunServicio.mensajeSalida(response);
                });
        };

        $scope.listarAutoridades = function () {

            utlListadosServicio.listarAutoridades({'idUsuario': $scope.idUsuario})
                .then(function successCallback(response) {

                    if (response.data.codError == 0) {

                        $scope.Lsta002autoridadambiental = [];

                        if ($scope.esAutorizado(['ADMISTRADOR_AUTORIDAD_AMBIENTAL', 'PUBLICADOR_AUTORIDAD_AMBIENTAL'])) {

                            for (var i = 0; i < response.data.respuesta.length; i++) {
                                if ($scope.obtenerSeleccion(response.data.respuesta[i].A001CODIGO, comunServicio.obtenerSesion().car))
                                    $scope.Lsta002autoridadambiental.push(response.data.respuesta[i]);
                            }
                        } else {
                            $scope.Lsta002autoridadambiental = response.data.respuesta;
                        }
                    } else {
                        comunServicio.mensajeSalida(response);
                    }
                }, function errorCallback(response) {

                    comunServicio.mensajeSalida(response);
                });
        };

        $scope.esAutorizado = function (permisos) {

            return comunServicio.esAutorizado(permisos);
        };

        $scope.obtenerSeleccion = function (arg1, arg2) {

            return comunServicio.obtenerSeleccion(arg1, arg2);
        };

        if ($scope.idUsuario > 0) {

            if ($location.path().includes('/modificarUsuario')) {

                $scope.consultarGrilla({'palabraClave': '', 'idUsuario': $scope.idUsuario});
            }
            else if ($location.path().includes('/registrarUsuario')) {

                $scope.listarDivipolaDepto();
                $scope.listarAutoridades();
                $scope.listarTipoDocumento();
                $scope.listarTipoUsuario();
            }
            else if ($location.path().includes('/actualizarUsuario')) {

                $scope.listarDivipolaDepto();
                $scope.listarAutoridades();
                $scope.listarTipoDocumento();
                $scope.listarTipoUsuario();
                $scope.consultarUsuario($routeParams.a002codigo);
            }
        }

    }]);

})(window.angular);