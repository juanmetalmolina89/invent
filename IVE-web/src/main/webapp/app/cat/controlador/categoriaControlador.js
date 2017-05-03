'use strict';

(function (ng) {

    var app = ng.module('categoriaModulo', []);

    app.controller('categoriaControlador', ['$scope', '$rootScope', '$location', '$http', '$routeParams', 'categoriaServicio', 'inventarioServicio', 'comunServicio', 'utlListadosServicio', 'constant', function ($scope, $rootScope, $location, $http, $routeParams, categoriaServicio, inventarioServicio, comunServicio, utlListadosServicio, constant) {

        $scope.idUsuario = comunServicio.esAutenticado() ? comunServicio.obtenerSesion().sub : 0;
        $scope.idInventario = comunServicio.obtenerNumero($routeParams.a003codigo);
        $scope.idCategoria = comunServicio.obtenerNumero($routeParams.a009codigo);
        $scope.categoriaOE = {
            'categoria': {
                'a009codigo': 0,
                'a009idinventario': {'a003codigo': $scope.idInventario},
                'a009estadoregistro': 'A',
                'ivetT010CategcombustibleList': [],
                'ivetT017CatgemisCiiuList': []
            }, 'idUsuario': $scope.idUsuario
        };
        $scope.enviando = false; 
        $scope.inventarioOE = {'inventario': {'a003codigo': 0}, 'idUsuario': $scope.idUsuario};
        $scope.busquedaOE = {'palabraClave': '', 'idUsuario': $scope.idUsuario};
        $scope.objetoSalida = {'respuesta': []};
        $scope.fuentesCategoria = {'FUENTES_MOVILES': 12, 'FUENTES_DE_AREA': 13, 'FUENTES_NATURALES': 14, 'FUENTES_FIJAS': 15};
        $scope.mutipleList = {'codigociiuList': [], 'categcombustible': []};
        $scope.Lsta009idtipocatemision = [];
        $scope.LstivetT010CategcombustibleList = [];
        $scope.LstivetT017CatgemisCiiuList = [];
        $scope.Lsta009idmetodoemision = [];

        $scope.totalItems = $scope.objetoSalida.respuesta.length;
        $scope.currentPage = 1;
        $scope.itemsPerPage = 5;
        $scope.maxSize = 5;

        $scope.filterValue = function($event){
            if(isNaN(String.fromCharCode($event.keyCode))){
                $event.preventDefault();
            }
        };
        $scope.consultarGrilla = function (filtro) {

            categoriaServicio.consultarGrilla(filtro)
                .then(function successCallback(response) {

                    $scope.objetoSalida.respuesta = [];
                    for (var i = 0; i < response.data.respuesta.length; i++) {
                        if ($scope.obtenerSeleccion(response.data.respuesta[i].A009IDINVENTARIO, $scope.idInventario) && !$scope.obtenerSeleccion(response.data.respuesta[i].A009ESTADOREGISTRO, 'I'))
                            $scope.objetoSalida.respuesta.push(response.data.respuesta[i]);
                    }

                    response.data.respuesta = response.data.respuesta.sort(function (a, b) {
                        return comunServicio.obtenerNumero(a.A009CODIGO) - comunServicio.obtenerNumero(b.A009CODIGO);
                    });

                    $scope.totalItems = $scope.objetoSalida.respuesta.length;

                    comunServicio.mensajeSalida(response);
                }, function errorCallback(response) {

                    comunServicio.mensajeSalida(response);
                });
        };

        $scope.registrarCategoria = function () {

            $scope.seleccionarCategoriaTipoCombustible();
            $scope.seleccionarCategoriaCodigoCIIU();

            if ($scope.esFuente($scope.categoriaOE.categoria.a009idtipocatemision.a102codigo, ['FUENTES_DE_AREA', 'FUENTES_NATURALES'])) {

                $scope.categoriaOE.categoria.ivetT017CatgemisCiiuList = [];
                $scope.categoriaOE.categoria.ivetT010CategcombustibleList = [];
                $scope.categoriaOE.categoria.a009cilindraje = 0;
                $scope.categoriaOE.categoria.a009aniomodelo = 0;
            } else if ($scope.esFuente($scope.categoriaOE.categoria.a009idtipocatemision.a102codigo, ['FUENTES_FIJAS'])) {

                $scope.categoriaOE.categoria.a009cilindraje = 0;
                $scope.categoriaOE.categoria.a009aniomodelo = 0;
            } else if ($scope.esFuente($scope.categoriaOE.categoria.a009idtipocatemision.a102codigo, ['FUENTES_MOVILES'])) {

                $scope.categoriaOE.categoria.ivetT017CatgemisCiiuList = [];
            }
            
            $scope.enviando = true; 
            categoriaServicio.registrarCategoria($scope.categoriaOE)
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
                            $location.path('/consultarCategoria/' + $scope.idInventario);
                        }, function errorCallback(response) {
                            $scope.enviando = false; 
                            comunServicio.mensajeSalida(response);
                        });

                }, function errorCallback(response) {

                    comunServicio.mensajeSalida(response);
                    $scope.enviando = false; 
                });
        };

        $scope.actualizarCategoria = function () {

            $scope.seleccionarCategoriaTipoCombustible();
            $scope.seleccionarCategoriaCodigoCIIU();

            if ($scope.esFuente($scope.categoriaOE.categoria.a009idtipocatemision.a102codigo, ['FUENTES_DE_AREA', 'FUENTES_NATURALES'])) {

                $scope.categoriaOE.categoria.ivetT017CatgemisCiiuList = [];
                $scope.categoriaOE.categoria.ivetT010CategcombustibleList = [];
                $scope.categoriaOE.categoria.a009cilindraje = 0;
                $scope.categoriaOE.categoria.a009aniomodelo = 0;
            } else if ($scope.esFuente($scope.categoriaOE.categoria.a009idtipocatemision.a102codigo, ['FUENTES_FIJAS'])) {

                $scope.categoriaOE.categoria.a009cilindraje = 0;
                $scope.categoriaOE.categoria.a009aniomodelo = 0;
            } else if ($scope.esFuente($scope.categoriaOE.categoria.a009idtipocatemision.a102codigo, ['FUENTES_MOVILES'])) {

                $scope.categoriaOE.categoria.ivetT017CatgemisCiiuList = [];
            }
            
            $scope.enviando = true; 

            categoriaServicio.actualizarCategoria($scope.categoriaOE)
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
                            $location.path('/consultarCategoria/' + $scope.idInventario);
                        }, function errorCallback(response) {

                            comunServicio.mensajeSalida(response);
                            $scope.enviando = false; 
                        });

                }, function errorCallback(response) {

                    comunServicio.mensajeSalida(response);
                    $scope.enviando = false; 
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
                                'a009idinventario': {'a003codigo': a003codigo},
                                'a009nomcatemision': comunServicio.obtenerCadena(response.data.respuesta[0].A009NOMCATEMISION),
                                'a009idtipocatemision': {'a102codigo': comunServicio.obtenerCadena(response.data.respuesta[0].A009IDTIPOCATEMISION)},
                                'a009desccatemision': comunServicio.obtenerCadena(response.data.respuesta[0].A009DESCCATEMISION),
                                'a009cilindraje': comunServicio.obtenerNumero(response.data.respuesta[0].A009CILINDRAJE),
                                'a009aniomodelo': comunServicio.obtenerNumero(response.data.respuesta[0].A009ANIOMODELO),
                                'a009nrofuentes': comunServicio.obtenerNumero(response.data.respuesta[0].A009NROFUENTES),
                                'a009detmetodfuentes': comunServicio.obtenerCadena(response.data.respuesta[0].A009DETMETODFUENTES),
                                'a009idmetodoemision': {'a008codigo': comunServicio.obtenerCadena(response.data.respuesta[0].A009IDMETODOEMISION)},
                                'a009observacion': comunServicio.obtenerCadena(response.data.respuesta[0].A009OBSERVACION),
                                'a009totalemision': comunServicio.obtenerNumero(response.data.respuesta[0].A009TOTALEMISION)
                            },
                            'idUsuario': $scope.idUsuario
                        };

                        $scope.consultarCategoriaTipoCombustible();
                        $scope.consultarCategoriaCodigoCIIU();
                    }
                    comunServicio.mensajeSalida(response);
                }, function errorCallback(response) {

                    comunServicio.mensajeSalida(response);
                });
        };

        $scope.listarTipoCategoria = function () {

            utlListadosServicio.listarParametricas({'idUsuario': $scope.idUsuario, 'categoria': 'TIPOCATEMISION'})
                .then(function successCallback(response) {

                    if (response.data.codError == 0) {

                        $scope.Lsta009idtipocatemision = response.data.respuesta;

                    } else {
                        comunServicio.mensajeSalida(response);
                    }
                }, function errorCallback(response) {

                    comunServicio.mensajeSalida(response);
                });
        };

        $scope.listarMetodoEmision = function () {

            utlListadosServicio.listarMetodoEmision({'idUsuario': $scope.idUsuario})
                .then(function successCallback(response) {

                    if (response.data.codError == 0) {

                        $scope.Lsta009idmetodoemision = response.data.respuesta;

                    } else {
                        comunServicio.mensajeSalida(response);
                    }
                }, function errorCallback(response) {

                    comunServicio.mensajeSalida(response);
                });
        };

        $scope.listarTipoCombustible = function () {

            utlListadosServicio.listarParametricas({'idUsuario': $scope.idUsuario, 'categoria': 'TIPOCOMBUSTIBLE'})
                .then(function successCallback(response) {

                    if (response.data.codError == 0) {

                        $scope.LstivetT010CategcombustibleList = response.data.respuesta;

                    } else {
                        comunServicio.mensajeSalida(response);
                    }
                }, function errorCallback(response) {

                    comunServicio.mensajeSalida(response);
                });
        };

        $scope.listarCodigoCIIU = function () {

            utlListadosServicio.listarCodigoCIIU({'idUsuario': $scope.idUsuario})
                .then(function successCallback(response) {

                    if (response.data.codError == 0) {

                        $scope.LstivetT017CatgemisCiiuList = response.data.respuesta;

                    } else {
                        comunServicio.mensajeSalida(response);
                    }
                }, function errorCallback(response) {

                    comunServicio.mensajeSalida(response);
                });
        };

        $scope.seleccionarCategoriaTipoCombustible = function () {

            $scope.categoriaOE.categoria.ivetT010CategcombustibleList = [];
            for (var i = 0; i < $scope.mutipleList.categcombustible.length; i++) {
                $scope.categoriaOE.categoria.ivetT010CategcombustibleList.push({
                    'a010codigo': $scope.mutipleList.categcombustible[i]
                });
            }
        };

        $scope.seleccionarCategoriaCodigoCIIU = function () {

            $scope.categoriaOE.categoria.ivetT017CatgemisCiiuList = [];
            for (var i = 0; i < $scope.mutipleList.codigociiuList.length; i++) {
                $scope.categoriaOE.categoria.ivetT017CatgemisCiiuList.push({
                    'a017codigo': $scope.mutipleList.codigociiuList[i]
                });
            }
        };

        $scope.consultarCategoriaTipoCombustible = function () {

            categoriaServicio.consultarCategoriaTipoCombustible($scope.categoriaOE)
                .then(function successCallback(response) {

                    $scope.mutipleList.categcombustible = [];
                    for (var i = 0; i < response.data.respuesta.length; i++) {
                        if (!$scope.obtenerSeleccion(response.data.respuesta[i].A010ESTADOREGISTRO, 'I'))
                            $scope.mutipleList.categcombustible.push(comunServicio.obtenerCadena(response.data.respuesta[i].A010IDTIPOCOMBUSTIBLE));
                    }

                    comunServicio.mensajeSalida(response);
                }, function errorCallback(response) {

                    comunServicio.mensajeSalida(response);
                });
        };

        $scope.consultarCategoriaCodigoCIIU = function () {

            categoriaServicio.consultarCategoriaCodigoCIIU($scope.categoriaOE)
                .then(function successCallback(response) {

                    $scope.mutipleList.codigociiuList = [];
                    for (var i = 0; i < response.data.respuesta.length; i++) {
                        if (!$scope.obtenerSeleccion(response.data.respuesta[i].A017ESTADOREGISTRO, 'I'))
                            $scope.mutipleList.codigociiuList.push(comunServicio.obtenerCadena(response.data.respuesta[i].A017IDCODCIIU));
                    }

                    comunServicio.mensajeSalida(response);
                }, function errorCallback(response) {

                    comunServicio.mensajeSalida(response);
                });
        };

        $scope.esFuente = function (id, fuentes) {

            var esFuente = false;
            try {
                for (var i = 0; i < fuentes.length; i++) {
                    var idFuente = this.fuentesCategoria[fuentes[i]];
                    if (this.obtenerSeleccion(idFuente, id) || idFuente == 0) {
                        esFuente = true;
                    }
                }
            } catch (ex) {
                esFuente = false;
            }

            return esFuente;
        };

        $scope.eliminarCategoria = function (a009codigo) {

            $scope.categoriaOE.categoria.a009codigo = a009codigo;

            categoriaServicio.eliminarCategoria($scope.categoriaOE)
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

        if ($scope.idUsuario > 0) {

            if ($location.path().includes('/consultarCategoria')) {

                $scope.consultarGrilla({'palabraClave': '%', 'idUsuario': $scope.idUsuario});
                $scope.consultarInventario($scope.idInventario);
            } else if ($location.path().includes('/registrarCategoria')) {

                $scope.listarTipoCategoria();
                $scope.listarTipoCombustible();
                $scope.listarCodigoCIIU();
                $scope.listarMetodoEmision();
            } else if ($location.path().includes('/actualizarCategoria')) {

                $scope.listarTipoCategoria();
                $scope.listarTipoCombustible();
                $scope.listarCodigoCIIU();
                $scope.listarMetodoEmision();
                $scope.consultarCategoria($scope.idCategoria, $scope.idInventario);
            }
        }
    }]);

})(window.angular);