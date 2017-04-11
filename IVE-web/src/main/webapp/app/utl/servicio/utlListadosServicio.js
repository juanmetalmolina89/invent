'use strict';

(function (ng) {

    var app = ng.module('utlListadosModulo', []);

    app.service('utlListadosServicio', ['$http', 'constant', function ($http, constant) {

        this.listarParametricas = function (objetoEntrada) {
            return $http({
                method: 'POST',
                url: constant.url + 'api/utllistados/listarparametricas',
                headers: {'Content-Type': 'application/json'},
                data: JSON.stringify(objetoEntrada)
            });
        };

        this.listarContaminantes = function (objetoEntrada) {
            return $http({
                method: 'POST',
                url: constant.url + 'api/utllistados/listarcontaminantes',
                headers: {'Content-Type': 'application/json'},
                data: JSON.stringify(objetoEntrada)
            });
        };

        this.listarFuentes = function (objetoEntrada) {
            return $http({
                method: 'POST',
                url: constant.url + 'api/utllistados/listarfuentes',
                headers: {'Content-Type': 'application/json'},
                data: JSON.stringify(objetoEntrada)
            });
        };

        this.listarCodigoCIIU = function (objetoEntrada) {
            return $http({
                method: 'POST',
                url: constant.url + 'api/utllistados/listarcodigociiu',
                headers: {'Content-Type': 'application/json'},
                data: JSON.stringify(objetoEntrada)
            });
        };

        this.listarMetodoEmision = function (objetoEntrada) {
            return $http({
                method: 'POST',
                url: constant.url + 'api/utllistados/listarmetodoemision',
                headers: {'Content-Type': 'application/json'},
                data: JSON.stringify(objetoEntrada)
            });
        };

        this.listarAutoridades = function (objetoEntrada) {
            return $http({
                method: 'POST',
                url: constant.url + 'api/utllistados/listarautoridades',
                headers: {'Content-Type': 'application/json'},
                data: JSON.stringify(objetoEntrada)
            });
        };

        this.listarDivipolaDepto = function (objetoEntrada) {
            return $http({
                method: 'POST',
                url: constant.url + 'api/utllistados/listardivipoladepto',
                headers: {'Content-Type': 'application/json'},
                data: JSON.stringify(objetoEntrada)
            });
        };

        this.listarDivipolaMcpio = function (objetoEntrada) {
            return $http({
                method: 'POST',
                url: constant.url + 'api/utllistados/listardivipolamcpio',
                headers: {'Content-Type': 'application/json'},
                data: JSON.stringify(objetoEntrada)
            });
        };

        this.listarUnidadMedidaFactorActividad = function (objetoEntrada) {
            return $http({
                method: 'POST',
                url: constant.url + 'api/utllistados/listarUnidadMedidaFactorActividad',
                headers: {'Content-Type': 'application/json'},
                data: JSON.stringify(objetoEntrada)
            });
        };

        this.listarUnidadMedidaFactorEmision = function (objetoEntrada) {
            return $http({
                method: 'POST',
                url: constant.url + 'api/utllistados/listarUnidadMedidaFactorEmision',
                headers: {'Content-Type': 'application/json'},
                data: JSON.stringify(objetoEntrada)
            });
        };
    }]);

})(window.angular);