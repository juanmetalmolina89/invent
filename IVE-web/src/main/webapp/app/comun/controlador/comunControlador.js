'use strict';

(function (ng) {

    var app = ng.module('comunModulo', []);

    app.controller('comunControlador', ['$scope', '$rootScope', '$location', '$http', '$routeParams', 'comunServicio','store', function ($scope, $rootScope, $location, $http, $routeParams, comunServicio,store) {
    /**************************************************************/ 
        /* Si llega desde vital */ 
        var token = $routeParams.tkn;   
        if (token) 
        {
            store.set('ive_token', token);
            $location.path('/');
        }

        /**************************************************************/
        /* Si llega desde vital */
        if($location.path().substr(5,5)=='token')
        {
            store.set('ive_token', $location.path().substr(11));
            $location.path('/');
        }

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