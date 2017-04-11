'use strict';

(function (ng) {

    var app = ng.module('inventarioModulo', []);

    app.controller('inventarioControlador', ['$scope', '$rootScope', '$location', '$http', '$routeParams', '$window', 'inventarioServicio', 'comunServicio', 'utlListadosServicio', 'constant', function ($scope, $rootScope, $location, $http, $routeParams, $window, inventarioServicio, comunServicio, utlListadosServicio, constant) {

        $scope.idUsuario = comunServicio.esAutenticado() ? comunServicio.obtenerSesion().sub : 0;
        $scope.inventarioOE = {
            'inventario': {'a003codigo': 0, 'a003estadoregistro': 'A', 'a003iddivipola': {'a105codigo': ''}, 'ivetT016InventcontaminaList': [], 'ivetT007InventariofuenteList': []},
            'geometria': '',
            'adjunto': '',
            'idUsuario': $scope.idUsuario
        };
        $scope.busquedaOE = {'palabraClave': '', 'idUsuario': $scope.idUsuario};
        $scope.localizacion = {'a003iddivipolaDepto': '', 'a003iddivipolaMcpio': ''};
        $scope.mutipleList = {'inventcontaminaList': [], 'inventariofuenteList': []};
        $scope.objetoSalida = {'respuesta': []};
        $scope.LstivetT016InventcontaminaList = [];
        $scope.LstivetT007InventariofuenteList = [];
        $scope.Lsta003estadoInventario = [];
        $scope.Lsta003iddivipolaDepto = [];
        $scope.Lsta003iddivipolaMcpio = [];
        $scope.LstivetT014AdjuntoList = [];
        $scope.urlGeo = '';
        $scope.url = constant.url;
        $scope.esVisualizar = false;

        $scope.totalItems = $scope.objetoSalida.respuesta.length;
        $scope.currentPage = 1;
        $scope.itemsPerPage = 5;
        $scope.maxSize = 5;

        $scope.consultarGrilla = function (filtro) {

            inventarioServicio.consultarGrilla(filtro)
                .then(function successCallback(response) {

                    $scope.objetoSalida.respuesta = [];
                    for (var i = 0; i < response.data.respuesta.length; i++) {
                        if (!$scope.obtenerSeleccion(response.data.respuesta[i].A003ESTADOREGISTRO, 'I')) {

                            if ($scope.esAutorizado(['ADMINISTRADOR_SISTEMA', 'FUNCIONARIO_MADS', 'PUBLICO_GENERAL'])) {

                                $scope.objetoSalida.respuesta.push(response.data.respuesta[i]);
                            } else {
                                if ($scope.esAutorizado(['ADMISTRADOR_AUTORIDAD_AMBIENTAL', 'PUBLICADOR_AUTORIDAD_AMBIENTAL'])) {

                                    if ($scope.obtenerSeleccion(response.data.respuesta[i].A002AUTORIDADAMBIENTAL, comunServicio.obtenerSesion().car)) {
                                        $scope.objetoSalida.respuesta.push(response.data.respuesta[i]);
                                    }
                                }
                            }
                        }
                    }

                    $scope.objetoSalida.respuesta = $scope.objetoSalida.respuesta.sort(function (a, b) {
                        return comunServicio.obtenerNumero(a.A003CODIGO) - comunServicio.obtenerNumero(b.A003CODIGO);
                    });
                    $scope.totalItems = $scope.objetoSalida.respuesta.length;

                    comunServicio.mensajeSalida(response);
                }, function errorCallback(response) {

                    comunServicio.mensajeSalida(response);
                });
        };

        $scope.registrarInventario = function () {

            if ($scope.inventarioOE.inventario.a003fechaFinal <= $scope.inventarioOE.inventario.a003fechaInicial) {

                comunServicio.mensaje('La Fecha Final del inventario debe ser mayor a la Fecha Inicial', 'error');
            } else {

                if ($scope.obtenerSeleccion($scope.inventarioOE.geometria, '')) {

                    comunServicio.mensaje('Debe indicar la ubicación (geometría) del inventario', 'error');
                } else {

                    if ($scope.obtenerSeleccion($scope.inventarioOE.adjunto, '')) {

                        comunServicio.mensaje('Por favor adjunte el documento del soporte del informe', 'error');
                    } else {

                        $scope.seleccionarInventarioContaminante();
                        $scope.seleccionarInventarioFuente();

                        inventarioServicio.registrarInventario($scope.inventarioOE)
                            .then(function successCallback(response) {

                                var a003codigo = response.data.respuesta[0].A003CODIGO;

                                inventarioServicio.cambiarEstadoInventario({
                                    'inventario': {
                                        'a003codigo': a003codigo,
                                        'a003estadoInventario': {'a102codigo': comunServicio.estadosInventario.EN_DILIGENCIAMIENTO},
                                        'a003obsRechazo': ''
                                    }, 'idUsuario': $scope.idUsuario
                                })
                                    .then(function successCallback(response) {

                                        inventarioServicio.registrarAdjunto(a003codigo, $scope.inventarioOE.adjunto, $scope.idUsuario)
                                            .then(function successCallback(response) {

                                                comunServicio.mensajeSalida(response);
                                                $location.path('/consultarInventario');
                                            }, function errorCallback(response) {

                                                comunServicio.mensajeSalida(response);
                                            });

                                    }, function errorCallback(response) {

                                        comunServicio.mensajeSalida(response);
                                    });

                            }, function errorCallback(response) {

                                comunServicio.mensajeSalida(response);
                            });
                    }
                }
            }
        };

        $scope.actualizarInventario = function () {

            if ($scope.inventarioOE.inventario.a003fechaFinal <= $scope.inventarioOE.inventario.a003fechaInicial) {

                comunServicio.mensaje('La Fecha Final del inventario debe ser mayor a la Fecha Inicial', 'error');
            } else {

                if ($scope.obtenerSeleccion($scope.inventarioOE.geometria, '')) {

                    comunServicio.mensaje('Debe indicar la ubicación (geometría) del inventario', 'error');
                } else {

                    $scope.seleccionarInventarioContaminante();
                    $scope.seleccionarInventarioFuente();

                    inventarioServicio.actualizarInventario($scope.inventarioOE)
                        .then(function successCallback(response) {

                            var a003codigo = response.data.respuesta[0].A003CODIGO;

                            inventarioServicio.cambiarEstadoInventario({
                                'inventario': {
                                    'a003codigo': a003codigo,
                                    'a003estadoInventario': {'a102codigo': comunServicio.estadosInventario.EN_DILIGENCIAMIENTO},
                                    'a003obsRechazo': ''
                                }, 'idUsuario': $scope.idUsuario
                            })
                                .then(function successCallback(response) {

                                    if (!$scope.obtenerSeleccion($scope.inventarioOE.adjunto, '')) {

                                        inventarioServicio.registrarAdjunto(a003codigo, $scope.inventarioOE.adjunto, $scope.idUsuario)
                                            .then(function successCallback(response) {

                                                comunServicio.mensajeSalida(response);
                                                $location.path('/consultarInventario');
                                            }, function errorCallback(response) {

                                                comunServicio.mensajeSalida(response);
                                            });
                                    }

                                    comunServicio.mensajeSalida(response);
                                    $location.path('/consultarInventario');

                                }, function errorCallback(response) {

                                    comunServicio.mensajeSalida(response);
                                });

                        }, function errorCallback(response) {

                            comunServicio.mensajeSalida(response);
                        });
                }
            }
        };

        $scope.consultarInventario = function (a003codigo) {

            $scope.inventarioOE.inventario.a003codigo = a003codigo;

            inventarioServicio.consultarInventario($scope.inventarioOE)
                .then(function successCallback(response) {

                    if (response.data.codError == 0) {

                        $scope.inventarioOE = {
                            'inventario': {
                                'a003codigo': a003codigo,
                                'a003objeto': comunServicio.obtenerCadena(response.data.respuesta[0].A003OBJETO),
                                'a003fechaInicial': new Date(comunServicio.obtenerNumero(response.data.respuesta[0].A003FECHA_INICIAL)),
                                'a003fechaFinal': new Date(comunServicio.obtenerNumero(response.data.respuesta[0].A003FECHA_FINAL)),
                                'a003descripcionTerritorio': comunServicio.obtenerCadena(response.data.respuesta[0].A003DESCRIPCION_TERRITORIO),
                                'a003estadoInventario': {'a102codigo': comunServicio.obtenerCadena(response.data.respuesta[0].A003ESTADO_INVENTARIO)},
                                'a003iddivipola': {'a105codigo': comunServicio.obtenerCadena(response.data.respuesta[0].A003IDDIVIPOLA)}
                            },
                            'idUsuario': $scope.idUsuario
                        };
                        $scope.localizacion = {
                            'a003iddivipolaDepto': comunServicio.obtenerCadena(response.data.respuesta[0].A105CODDEPARTAMENTO),
                            'a003iddivipolaMcpio': comunServicio.obtenerCadena(response.data.respuesta[0].A105CODMUNICIPIO)
                        };

                        $scope.consultarInventarioFuente();
                        $scope.consultarInventarioContaminante();
                        $scope.listarDivipolaDepto();
                        $scope.consultarGeometria();
                    }
                    comunServicio.mensajeSalida(response);
                }, function errorCallback(response) {

                    comunServicio.mensajeSalida(response);
                });
        };

        $scope.listarDivipolaMcpio = function () {

            utlListadosServicio.listarDivipolaMcpio({'idUsuario': $scope.idUsuario, 'a105coddepartamento': $scope.localizacion.a003iddivipolaDepto})
                .then(function successCallback(response) {

                    if (response.data.codError == 0) {

                        $scope.Lsta003iddivipolaMcpio = response.data.respuesta;

                        for (var i = 0; i < $scope.Lsta003iddivipolaMcpio.length; i++) {
                            if ($scope.obtenerSeleccion($scope.Lsta003iddivipolaMcpio[i].A105CODMUNICIPIO, $scope.localizacion.a003iddivipolaMcpio)) {
                                $scope.inventarioOE.inventario.a003iddivipola.a105codigo = comunServicio.obtenerCadena($scope.Lsta003iddivipolaMcpio[i].A105CODIGO);
                            }
                        }

                    } else {
                        comunServicio.mensajeSalida(response);
                    }
                }, function errorCallback(response) {

                    comunServicio.mensajeSalida(response);
                });
        };

        $scope.cargarGeometria = function () {

            $('#geomertria').modal('show');

            if ($scope.inventarioOE.inventario.a003codigo > 0) {

                try {
                    $scope.urlGeo = './geometria/index.html?divipola=' + $scope.inventarioOE.inventario.a003iddivipola.a105codigo + '&idModulo=' + constant.idModulo + '&idSistema=' + constant.idSistema;

                    var ctrlGeo = document.getElementById('ctrlGeo');
                    if (ctrlGeo) {

                        inventarioServicio.consultarGeometria($scope.inventarioOE)
                            .then(function successCallback(response) {

                                var geometria = {};
                                if ($scope.obtenerSeleccion(response.data.respuesta[0].A004GEOMETRIA, '')) {

                                    geometria = {
                                        'type': 'Feature',
                                        'properties': {
                                            'name': 'Feature de prueba'
                                        },
                                        'geometry': {
                                            'type': 'Point',
                                            'coordinates': [-74.2478957, 4.6482837]
                                        }
                                    };
                                } else {

                                    geometria = JSON.parse(response.data.respuesta[0].A004GEOMETRIA);
                                }

                                setTimeout(function () {
                                    (ctrlGeo.contentWindow || ctrlGeo.contentDocument).establecerGeometria(geometria);
                                }, 3000);

                                comunServicio.mensajeSalida(response);
                            }, function errorCallback(response) {

                                comunServicio.mensajeSalida(response);
                            });
                    }
                } catch (e) {
                    comunServicio.mensaje('No se puede cargar la geometría del inventario, intente de nuevo<br><br>' + e.message, 'error');
                    $scope.inventarioOE.geometria = e.message;
                }
            } else {

                for (var i = 0; i < $scope.Lsta003iddivipolaMcpio.length; i++) {
                    if ($scope.obtenerSeleccion($scope.Lsta003iddivipolaMcpio[i].A105CODIGO, $scope.inventarioOE.inventario.a003iddivipola.a105codigo)) {
                        $scope.urlGeo = './geometria/index.html?divipola=' + $scope.Lsta003iddivipolaMcpio[i].A105CODDIVIPOLADM + '&idModulo=' + constant.idModulo + '&idSistema=' + constant.idSistema;
                    }
                }
            }
        };

        $scope.obtenerGeometria = function () {

            try {

                var ctrlGeo = document.getElementById('ctrlGeo');
                if (ctrlGeo) {
                    $scope.inventarioOE.geometria = (ctrlGeo.contentWindow || ctrlGeo.contentDocument).obtenerGeometria();
                    $('#geomertria').modal('hide');
                }
            } catch (e) {

                comunServicio.mensaje('No se puede seleccionar la geometría del inventario, intente de nuevo<br><br>' + e.message, 'error');
                $scope.inventarioOE.geometria = e.message;
            }
        };

        $scope.calcularColorRegistro = function (id) {

            var result = '';
            switch (comunServicio.obtenerNumero(id)) {
                case comunServicio.estadosInventario.APROBADO:
                    result = 'success';
                    break;
                case comunServicio.estadosInventario.RECHAZADO:
                    result = 'danger';
                    break;
                case comunServicio.estadosInventario.EN_DILIGENCIAMIENTO:
                    result = 'info';
                    break;
                case comunServicio.estadosInventario.PENDIENTE_APROBACION:
                    result = 'warning';
                    break;
            }

            return result;
        };

        $scope.calcularEstadoRegistro = function (id) {

            var result = 'N/A';
            for (var i = 0; i < $scope.Lsta003estadoInventario.length; i++) {
                if ($scope.obtenerSeleccion($scope.Lsta003estadoInventario[i].IDITEM, id))
                    result = $scope.Lsta003estadoInventario[i].VALORITEM;
            }
            return result;
        };

        $scope.esEstado = function (id, estados) {

            var esEstado = false;
            for (var i = 0; i < estados.length; i++) {
                var idEstado = comunServicio.estadosInventario[estados[i]];
                if (this.obtenerSeleccion(idEstado, id) || idEstado == 0) {
                    esEstado = true;
                }
            }

            return esEstado;
        };

        $scope.esRechazado = function (id) {

            return $scope.esEstado(id, ['RECHAZADO']);
        };

        $scope.esRechazadoAprobado = function (opcion) {

            return $scope.esEstado(opcion.IDITEM, ['RECHAZADO', 'APROBADO']);
        };

        $scope.observacionesRechazo = function (motivo) {

            var result = 'N/A';
            if (!$scope.obtenerSeleccion(motivo, '')) {
                result = motivo;
            }
            return result;
        };

        $scope.mostrarMotivoRechazoInventario = function (id) {

            $('#motivoRechazo' + id).modal('show');
        };

        $scope.mostrarAprobarRechazarInventario = function (id) {

            $('#aprobarRechazarInventario' + id).modal('show');
        };

        $scope.solicitarAprobacionInventario = function (a003codigo) {

            swal({
                    title: '¿Está seguro de enviar la solicitud de ' + $scope.calcularEstadoRegistro(comunServicio.estadosInventario.PENDIENTE_APROBACION) + '?',
                    type: 'warning',
                    showCancelButton: true,
                    confirmButtonText: 'Confirmar',
                    cancelButtonText: 'Cancelar',
                    closeOnConfirm: true
                },
                function (esConfirmacion) {
                    if (esConfirmacion) {
                        inventarioServicio.cambiarEstadoInventario({
                            'inventario': {'a003codigo': a003codigo, 'a003estadoInventario': {'a102codigo': comunServicio.estadosInventario.PENDIENTE_APROBACION}, 'a003obsRechazo': ''},
                            'idUsuario': $scope.idUsuario
                        })
                            .then(function successCallback(response) {

                                comunServicio.mensajeSalida(response);
                                $scope.consultarGrilla({'palabraClave': '%', 'idUsuario': $scope.idUsuario});
                            }, function errorCallback(response) {

                                comunServicio.mensajeSalida(response);
                            });
                    }
                });
        };

        $scope.enviarAprobarRechazarInventario = function (a003codigo) {

            $scope.inventarioOE.inventario.a003codigo = a003codigo;

            swal({
                    title: '¿Está seguro de enviar la solicitud de ' + $scope.calcularEstadoRegistro($scope.inventarioOE.inventario.a003estadoInventario.a102codigo) + '?',
                    type: 'warning',
                    showCancelButton: true,
                    confirmButtonText: 'Confirmar',
                    cancelButtonText: 'Cancelar',
                    closeOnConfirm: true
                },
                function (esConfirmacion) {
                    if (esConfirmacion) {
                        inventarioServicio.cambiarEstadoInventario($scope.inventarioOE)
                            .then(function successCallback(response) {

                                comunServicio.mensajeSalida(response);
                                $('#aprobarRechazarInventario' + $scope.inventarioOE.inventario.a003codigo).modal('hide');
                                $window.location.reload();
                            }, function errorCallback(response) {

                                comunServicio.mensajeSalida(response);
                            });
                    }
                });
        };

        $scope.consultarAdjunto = function () {

            inventarioServicio.consultarAdjunto($scope.inventarioOE)
                .then(function successCallback(response) {

                    comunServicio.mensajeSalida(response);
                }, function errorCallback(response) {

                    comunServicio.mensajeSalida(response);
                });
        };

        $scope.listarDivipolaDepto = function () {

            utlListadosServicio.listarDivipolaDepto({'idUsuario': $scope.idUsuario})
                .then(function successCallback(response) {

                    if (response.data.codError == 0) {

                        $scope.Lsta003iddivipolaDepto = response.data.respuesta;
                        $scope.listarDivipolaMcpio();
                    } else {
                        comunServicio.mensajeSalida(response);
                    }
                }, function errorCallback(response) {

                    comunServicio.mensajeSalida(response);
                });
        };

        $scope.listarFuentes = function () {

            utlListadosServicio.listarFuentes({'idUsuario': $scope.idUsuario})
                .then(function successCallback(response) {

                    if (response.data.codError == 0) {

                        $scope.LstivetT007InventariofuenteList = response.data.respuesta;

                    } else {
                        comunServicio.mensajeSalida(response);
                    }
                }, function errorCallback(response) {

                    comunServicio.mensajeSalida(response);
                });
        };

        $scope.listarContaminantes = function () {

            utlListadosServicio.listarContaminantes({'idUsuario': $scope.idUsuario})
                .then(function successCallback(response) {

                    if (response.data.codError == 0) {

                        $scope.LstivetT016InventcontaminaList = response.data.respuesta;

                    } else {
                        comunServicio.mensajeSalida(response);
                    }
                }, function errorCallback(response) {

                    comunServicio.mensajeSalida(response);
                });
        };

        $scope.listarEstados = function () {

            utlListadosServicio.listarParametricas({'idUsuario': $scope.idUsuario, 'categoria': 'ESTADOINVENTARIO'})
                .then(function successCallback(response) {

                    if (response.data.codError == 0) {

                        $scope.Lsta003estadoInventario = response.data.respuesta;

                    } else {
                        comunServicio.mensajeSalida(response);
                    }
                }, function errorCallback(response) {

                    comunServicio.mensajeSalida(response);
                });
        };

        $scope.consultarInventarioFuente = function () {

            inventarioServicio.consultarInventarioFuente($scope.inventarioOE)
                .then(function successCallback(response) {

                    $scope.mutipleList.inventariofuenteList = [];
                    for (var i = 0; i < response.data.respuesta.length; i++) {
                        if (!$scope.obtenerSeleccion(response.data.respuesta[i].A007ESTADOREGISTRO, 'I'))
                            $scope.mutipleList.inventariofuenteList.push(comunServicio.obtenerCadena(response.data.respuesta[i].A007IDFUENTE));
                    }

                    comunServicio.mensajeSalida(response);
                }, function errorCallback(response) {

                    comunServicio.mensajeSalida(response);
                });
        };

        $scope.consultarInventarioContaminante = function () {

            inventarioServicio.consultarInventarioContaminante($scope.inventarioOE)
                .then(function successCallback(response) {

                    $scope.mutipleList.inventcontaminaList = [];
                    for (var i = 0; i < response.data.respuesta.length; i++) {
                        if (!$scope.obtenerSeleccion(response.data.respuesta[i].A016ESTADOREGISTRO, 'I'))
                            $scope.mutipleList.inventcontaminaList.push(comunServicio.obtenerCadena(response.data.respuesta[i].A016IDCONTAMINANTE));
                    }

                    comunServicio.mensajeSalida(response);
                }, function errorCallback(response) {

                    comunServicio.mensajeSalida(response);
                });
        };

        $scope.consultarGeometria = function () {

            $scope.inventarioOE.geometria = '';

            inventarioServicio.consultarGeometria($scope.inventarioOE)
                .then(function successCallback(response) {

                    $scope.inventarioOE.geometria = JSON.parse(response.data.respuesta[0].A004GEOMETRIA);

                    comunServicio.mensajeSalida(response);
                }, function errorCallback(response) {

                    comunServicio.mensajeSalida(response);
                });
        };

        $scope.seleccionarInventarioContaminante = function () {

            $scope.inventarioOE.inventario.ivetT016InventcontaminaList = [];
            for (var i = 0; i < $scope.mutipleList.inventcontaminaList.length; i++) {
                $scope.inventarioOE.inventario.ivetT016InventcontaminaList.push({
                    'a016codigo': $scope.mutipleList.inventcontaminaList[i]
                });
            }
        };

        $scope.seleccionarInventarioFuente = function () {

            $scope.inventarioOE.inventario.ivetT007InventariofuenteList = [];
            for (var i = 0; i < $scope.mutipleList.inventariofuenteList.length; i++) {
                $scope.inventarioOE.inventario.ivetT007InventariofuenteList.push({
                    'a007codigo': $scope.mutipleList.inventariofuenteList[i]
                });
            }
        };

        $scope.esAutorizado = function (permisos) {

            return comunServicio.esAutorizado(permisos);
        };

        $scope.obtenerSeleccion = function (arg1, arg2) {

            return comunServicio.obtenerSeleccion(arg1, arg2);
        };

        $scope.obtenerSeleccionMultiple = function (arg1, arg2) {

            return comunServicio.obtenerSeleccionMultiple(arg1, arg2);
        };

        if ($scope.idUsuario > 0) {

            if ($location.path().includes('/consultarInventario')) {

                $scope.listarEstados();
                $scope.consultarGrilla({'palabraClave': '%', 'idUsuario': $scope.idUsuario});

            } else if ($location.path().includes('/registrarInventario')) {

                $scope.listarEstados();
                $scope.listarDivipolaDepto();
                $scope.listarFuentes();
                $scope.listarContaminantes();
            } else if ($location.path().includes('/actualizarInventario')) {

                $scope.listarEstados();
                $scope.listarDivipolaDepto();
                $scope.listarFuentes();
                $scope.listarContaminantes();
                $scope.consultarInventario($routeParams.a003codigo);
            } else if ($location.path().includes('/visualizarInventario')) {

                $scope.listarEstados();
                $scope.listarDivipolaDepto();
                $scope.listarFuentes();
                $scope.listarContaminantes();
                $scope.consultarInventario($routeParams.a003codigo);
                $scope.esVisualizar = true;
            }
        }
    }]);

})(window.angular);