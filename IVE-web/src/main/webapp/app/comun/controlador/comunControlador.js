'use strict';

(function (ng) {

    var app = ng.module('comunModulo', []);

    app.controller('comunControlador', ['$scope', '$rootScope', '$location', '$http', '$routeParams', 'comunServicio', function ($scope, $rootScope, $location, $http, $routeParams, comunServicio) {

        $scope.obtenerSesion = function () {

            return comunServicio.obtenerSesion();
        };

        $scope.cerrarSesion = function () {

            return comunServicio.cerrarSesion();
        };

        $scope.esAutorizado = function (permisos) {

            return comunServicio.esAutorizado(permisos);
        };

        $scope.esAutenticado = function () {

            return comunServicio.esAutenticado();
        };
    }]);

})(window.angular);