'use strict';

(function (ng) {

    var app = ng.module('contaminanteModulo');

    app.service('contaminanteServicio', ['$http', 'constant', function ($http, constant) {

        this.consultarGrilla = function (objetoEntrada) {
            return $http({
                method: 'POST',
                url: constant.url + 'api/categoria/consultarGrillaCon',
                headers: {'Content-Type': 'application/json'},
                data: JSON.stringify(objetoEntrada)
            });
        };

        this.registrarContaminante = function (objetoEntrada) {
            return $http({
                method: 'POST',
                url: constant.url + 'api/categoria/registrarContaminante',
                headers: {'Content-Type': 'application/json'},
                data: JSON.stringify(objetoEntrada)
            });
        };

        this.consultarContaminante = function (objetoEntrada) {
            return $http({
                method: 'POST',
                url: constant.url + 'api/categoria/consultarContaminanteId',
                headers: {'Content-Type': 'application/json'},
                data: JSON.stringify(objetoEntrada)
            });
        };

        this.actualizarContaminante = function (objetoEntrada) {
            return $http({
                method: 'POST',
                url: constant.url + 'api/categoria/actualizarContaminante',
                headers: {'Content-Type': 'application/json'},
                data: JSON.stringify(objetoEntrada)
            });
        };

        this.eliminarContaminante = function (objetoEntrada) {
            return $http({
                method: 'POST',
                url: constant.url + 'api/categoria/eliminarcontaminante',
                headers: {'Content-Type': 'application/json'},
                data: JSON.stringify(objetoEntrada)
            });
        };
    }]);

})(window.angular);
