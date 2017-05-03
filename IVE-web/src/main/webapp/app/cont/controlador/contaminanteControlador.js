'use strict';

(function (ng) {

    var app = ng.module('contaminanteModulo', []);

    app.controller('contaminanteControlador', ['$scope', '$rootScope', '$location', '$http', '$routeParams', 'contaminanteServicio', 'categoriaServicio', 'inventarioServicio', 'comunServicio', 'utlListadosServicio', function ($scope, $rootScope, $location, $http, $routeParams, contaminanteServicio, categoriaServicio, inventarioServicio, comunServicio, utlListadosServicio) {

        $scope.idUsuario = comunServicio.esAutenticado() ? comunServicio.obtenerSesion().sub : 0;
        $scope.idInventario = comunServicio.obtenerNumero($routeParams.a003codigo);
        $scope.idCategoria = comunServicio.obtenerNumero($routeParams.a009codigo);
        $scope.idContaminante = comunServicio.obtenerNumero($routeParams.a013codigo);
        $scope.contaminanteOE = {
            'contaminante': {
                'a013codigo': comunServicio.obtenerNumero($scope.idContaminante),
                'a013idcategoriaemision': {'a009codigo': $scope.idCategoria},
                'a013estadoregistro': 'A'
            }, 'idUsuario': $scope.idUsuario
        };
        $scope.enviando = false; 
        $scope.categoriaOE = {'categoria': {'a009codigo': 0, 'a009idinventario': {'a003codigo': $scope.idInventario},}, 'idUsuario': $scope.idUsuario};
        $scope.inventarioOE = {'inventario': {'a003codigo': 0}, 'idUsuario': $scope.idUsuario};
        $scope.busquedaOE = {'palabraClave': '', 'idUsuario': $scope.idUsuario};
        $scope.objetoSalida = {'respuesta': []};
        $scope.Lsta013idcontaminante = [];
        $scope.Lsta013undmedfactoractiv = [];
        $scope.Lsta013undmedfactoremis = [];

        $scope.totalItems = $scope.objetoSalida.respuesta.length;
        $scope.currentPage = 1;
        $scope.itemsPerPage = 5;
        $scope.maxSize = 5;

        $scope.consultarGrilla = function (filtro) {

            contaminanteServicio.consultarGrilla(filtro)
                .then(function successCallback(response) {

                    $scope.objetoSalida.respuesta = [];
                    for (var i = 0; i < response.data.respuesta.length; i++) {
                        if ($scope.obtenerSeleccion(response.data.respuesta[i].ID_CATEGORIA, $scope.idCategoria) && !$scope.obtenerSeleccion(response.data.respuesta[i].A013ESTADOREGISTRO, 'I'))
                            $scope.objetoSalida.respuesta.push(response.data.respuesta[i]);
                    }

                    response.data.respuesta = response.data.respuesta.sort(function (a, b) {
                        return comunServicio.obtenerNumero(a.COD_CONTAMINANTE) - comunServicio.obtenerNumero(b.COD_CONTAMINANTE);
                    });

                    $scope.totalItems = $scope.objetoSalida.respuesta.length;

                    comunServicio.mensajeSalida(response);
                }, function errorCallback(response) {

                    comunServicio.mensajeSalida(response);
                });
        };

        $scope.registrarContaminante = function () {
            $scope.enviando = true; 
            contaminanteServicio.registrarContaminante($scope.contaminanteOE)
                .then(function successCallback(response) {

                    inventarioServicio.cambiarEstadoInventario({
                        'inventario': {
                            'a003codigo': $scope.idInventario,
                            'a003estadoInventario': {'a102codigo': comunServicio.estadosInventario.EN_DILIGENCIAMIENTO},
                            'a003obsRechazo': ''
                        }, 'idUsuario': $scope.idUsuario
                    })
                        .then(function successCallback(response) {

                            comunServicio.mensajeSalida(response);
                            $location.path('/consultarContaminante/' + $scope.idInventario + '/' + $scope.idCategoria);
                        }, function errorCallback(response) {

                            comunServicio.mensajeSalida(response);
                            $scope.enviando = false; 
                        });

                }, function errorCallback(response) {

                    comunServicio.mensajeSalida(response);
                    $scope.enviando = false; 
                });
        };

        $scope.actualizarContaminante = function () {
            $scope.enviando = true; 
            contaminanteServicio.actualizarContaminante($scope.contaminanteOE)
                .then(function successCallback(response) {

                    inventarioServicio.cambiarEstadoInventario({
                        'inventario': {
                            'a003codigo': $scope.idInventario,
                            'a003estadoInventario': {'a102codigo': comunServicio.estadosInventario.EN_DILIGENCIAMIENTO},
                            'a003obsRechazo': ''
                        }, 'idUsuario': $scope.idUsuario
                    })
                        .then(function successCallback(response) {

                            comunServicio.mensajeSalida(response);
                            $location.path('/consultarContaminante/' + $scope.idInventario + '/' + $scope.idCategoria);
                        }, function errorCallback(response) {

                            comunServicio.mensajeSalida(response);
                            $scope.enviando = false; 
                        });

                }, function errorCallback(response) {

                    comunServicio.mensajeSalida(response);
                    $scope.enviando = false; 
                });
        };

        $scope.consultarContaminante = function (a013codigo, a009codigo) {

            $scope.contaminanteOE.contaminante.a013codigo = a013codigo;
            $scope.contaminanteOE.contaminante.a013idcategoriaemision.a009codigo = a009codigo;

            contaminanteServicio.consultarContaminante($scope.contaminanteOE)
                .then(function successCallback(response) {

                    if (response.data.codError == 0) {

                        $scope.contaminanteOE = {
                            'contaminante': {
                                'a013codigo': a013codigo,
                                'a013idcategoriaemision': {'a009codigo': a009codigo},
                                'a013idcontaminante': {'a005codigo': comunServicio.obtenerCadena(response.data.respuesta[0].A013IDCONTAMINANTE)},
                                'a013valorcontaminante': comunServicio.obtenerNumero(response.data.respuesta[0].A013VALORCONTAMINANTE),
                                'a013factoractividad': comunServicio.obtenerNumero(response.data.respuesta[0].A013FACTORACTIVIDAD),
                                'a013undmedfactoractiv': {'a011codigo': comunServicio.obtenerCadena(response.data.respuesta[0].A013UNDMEDFACTORACTIV)},
                                'a013ftemetdfactoractiv': comunServicio.obtenerCadena(response.data.respuesta[0].A013FTEMETDFACTORACTIV),
                                'a013factoremision': comunServicio.obtenerNumero(response.data.respuesta[0].A013FACTOREMISION),
                                'a013undmedfactoremis': {'a012codigo': comunServicio.obtenerCadena(response.data.respuesta[0].A013UNDMEDFACTOREMIS)},
                                'a013ftemetdfactoremis': comunServicio.obtenerCadena(response.data.respuesta[0].A013FTEMETDFACTOREMIS),
                                'a013emisiontotal': comunServicio.obtenerNumero(response.data.respuesta[0].A013EMISIONTOTAL)
                            },
                            'idUsuario': $scope.idUsuario
                        };
                    }

                    comunServicio.mensajeSalida(response);
                }, function errorCallback(response) {

                    comunServicio.mensajeSalida(response);
                });
        };

        $scope.listarContaminantes = function () {

            utlListadosServicio.listarContaminantes({'idUsuario': $scope.idUsuario})
                .then(function successCallback(response) {

                    if (response.data.codError == 0) {

                        $scope.Lsta013idcontaminante = response.data.respuesta;

                    } else {
                        comunServicio.mensajeSalida(response);
                    }
                }, function errorCallback(response) {

                    comunServicio.mensajeSalida(response);
                });
        };

        $scope.listarUnidadMedidaFactorActividad = function () {

            utlListadosServicio.listarUnidadMedidaFactorActividad({'idUsuario': $scope.idUsuario})
                .then(function successCallback(response) {

                    if (response.data.codError == 0) {

                        $scope.Lsta013undmedfactoractiv = response.data.respuesta;

                    } else {
                        comunServicio.mensajeSalida(response);
                    }
                }, function errorCallback(response) {

                    comunServicio.mensajeSalida(response);
                });
        };

        $scope.listarUnidadMedidaFactorEmision = function () {

            utlListadosServicio.listarUnidadMedidaFactorEmision({'idUsuario': $scope.idUsuario})
                .then(function successCallback(response) {

                    if (response.data.codError == 0) {

                        $scope.Lsta013undmedfactoremis = response.data.respuesta;

                    } else {
                        comunServicio.mensajeSalida(response);
                    }
                }, function errorCallback(response) {

                    comunServicio.mensajeSalida(response);
                });
        };

        $scope.eliminarContaminante = function (a013codigo) {

            $scope.contaminanteOE.contaminante.a013codigo = a013codigo;

            contaminanteServicio.eliminarContaminante($scope.contaminanteOE)
                .then(function successCallback(response) {

                    if (response.data.codError == 0) {

                        $scope.consultarGrilla({'palabraClave': '%', 'idUsuario': $scope.idUsuario});
                    }
                    comunServicio.mensajeSalida(response);
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

        $scope.obtenerSeleccionMultiple = function (arg1, arg2) {

            return comunServicio.obtenerSeleccionMultiple(arg1, arg2);
        };

        $scope.consultarInventario = function (a003codigo) {

            $scope.inventarioOE.inventario.a003codigo = a003codigo;

            inventarioServicio.consultarInventario($scope.inventarioOE)
                .then(function successCallback(response) {

                    if (response.data.codError == 0) {

                        $scope.inventarioOE = {
                            'inventario': {
                                'a003codigo': a003codigo,
                                'a003objeto': comunServicio.obtenerCadena(response.data.respuesta[0].A003OBJETO)
                            },
                            'idUsuario': $scope.idUsuario
                        };
                    }
                    comunServicio.mensajeSalida(response);
                }, function errorCallback(response) {

                    comunServicio.mensajeSalida(response);
                });
        };

        $scope.consultarCategoria = function (a009codigo, a003codigo) {

            $scope.categoriaOE.categoria.a009codigo = a009codigo;
            $scope.categoriaOE.categoria.a009idinventario.a003codigo = a003codigo;

            categoriaServicio.consultarCategoria($scope.categoriaOE)
                .then(function successCallback(response) {

                    if (response.data.codError == 0) {

                        $scope.categoriaOE = {
                            'categoria': {
                                'a009codigo': a009codigo,
                                'a009nomcatemision': comunServicio.obtenerCadena(response.data.respuesta[0].A009NOMCATEMISION)
                            },
                            'idUsuario': $scope.idUsuario
                        };
                    }
                    comunServicio.mensajeSalida(response);
                }, function errorCallback(response) {

                    comunServicio.mensajeSalida(response);
                });
        };

        if ($scope.idUsuario > 0) {

            if ($location.path().includes('/consultarContaminante')) {

                $scope.consultarGrilla({'palabraClave': '%', 'idUsuario': $scope.idUsuario});
                $scope.consultarInventario($scope.idInventario);
                $scope.consultarCategoria($scope.idCategoria, $scope.idInventario);

            } else if ($location.path().includes('/registrarContaminante')) {

                $scope.listarContaminantes();
                $scope.listarUnidadMedidaFactorEmision();
                $scope.listarUnidadMedidaFactorActividad();
            } else if ($location.path().includes('/actualizarContaminante')) {

                $scope.listarContaminantes();
                $scope.listarUnidadMedidaFactorEmision();
                $scope.listarUnidadMedidaFactorActividad();
                $scope.consultarContaminante($scope.idContaminante, $scope.idCategoria);
            }
        }
    }]);

})(window.angular);