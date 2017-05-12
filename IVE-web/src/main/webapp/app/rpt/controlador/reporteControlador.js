'use strict';

(function (ng) {

    var app = ng.module('reporteModulo', []);

    app.controller('reporteControlador', ['$scope', '$rootScope', '$location', '$http', '$routeParams', 'inventarioServicio', 'reporteServicio', 'comunServicio', 'utlListadosServicio', 'constant', function ($scope, $rootScope, $location, $http, $routeParams, inventarioServicio, reporteServicio, comunServicio, utlListadosServicio, constant) {

        $scope.idUsuario = comunServicio.esAutenticado() ? comunServicio.obtenerSesion().sub : 0;
        $scope.inventarioOE = {
            'inventario': {'a003codigo': 0, 'a003estadoregistro': 'A', 'a003iddivipola': {'a105codigo': ''}, 'ivetT016InventcontaminaList': [], 'ivetT007InventariofuenteList': []},
            'geometria': '',
            'adjunto': '',
            'idUsuario': $scope.idUsuario
        };
        $scope.busquedaOE = {'palabraClave': '', 'idUsuario': $scope.idUsuario};
        $scope.objetoSalida = {'respuesta': []};

        $scope.lstaReporte = {};
        $scope.idReporte = null;
        $scope.seleccionTodos = false;
        $scope.inventariosSeleccionados = {};

        $scope.totalItems = $scope.objetoSalida.respuesta.length;
        $scope.currentPage = 1;
        $scope.itemsPerPage = 5;
        $scope.maxSize = 5;

        utlListadosServicio.listarParametricas({'idUsuario': $scope.idUsuario, 'categoria': 'REPORTE'})
            .then(function successCallback(response) {

                if (response.data.codError == 0) {

                    $scope.lstaReporte = response.data.respuesta;

                } else {
                    comunServicio.mensajeSalida(response);
                }
            }, function errorCallback(response) {

                comunServicio.mensajeSalida(response);
            });

        $scope.consultarGrilla = function (filtro) {
            if(filtro.palabraClave=="")
            {
                filtro.palabraClave="%";
            }
            inventarioServicio.consultarGrilla(filtro)
                .then(function successCallback(response) {

                    $scope.objetoSalida.respuesta = response.data.respuesta.sort(function (a, b) {
                        return comunServicio.obtenerNumero(a.A003CODIGO) - comunServicio.obtenerNumero(b.A003CODIGO);
                    });
                    $scope.totalItems = $scope.objetoSalida.respuesta.length;

                    comunServicio.mensajeSalida(response);
                }, function errorCallback(response) {

                    comunServicio.mensajeSalida(response);
                });
        };

        $scope.generarReporteInventario = function () {

            reporteServicio.generarReporteInventario($scope.obtenerInventariosSeleccionados());
        };

        $scope.obtenerInventariosSeleccionados = function () {

            var seleccion = "?idUsuario=" + $scope.idUsuario + "&idReporte=" + $scope.idReporte;
            var inventariosSeleccionados = Object.keys($scope.inventariosSeleccionados);
            for (var i = 0; i < inventariosSeleccionados.length; i++) {
                if ($scope.inventariosSeleccionados[inventariosSeleccionados[i]]) {
                    seleccion += '&ci=' + inventariosSeleccionados[i];
                }
            }
            return seleccion;
        };

        $scope.seleccionarTodosInventarios = function () {

            for (var i = 0; i < $scope.objetoSalida.respuesta.length; i++) {
                $scope.inventariosSeleccionados[$scope.objetoSalida.respuesta[i].A003CODIGO.toString()] = $scope.seleccionTodos;
            }
        };

        $scope.consultarGrilla({'palabraClave': '%', 'idUsuario': $scope.idUsuario});

    }]);

})(window.angular);