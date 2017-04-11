'use strict';

(function (ng) {

    var app = ng.module('inventarioModulo');

    app.service('inventarioServicio', ['$http', 'constant', 'Upload', function ($http, constant, Upload) {

        this.registrarInventario = function (objetoEntrada) {
            return $http({
                method: 'POST',
                url: constant.url + 'api/inventario/registrarinventario',
                headers: {'Content-Type': 'application/json'},
                data: JSON.stringify(objetoEntrada)
            });
        };

        this.consultarInventario = function (objetoEntrada) {
            return $http({
                method: 'POST',
                url: constant.url + 'api/inventario/consultarinventario',
                headers: {'Content-Type': 'application/json'},
                data: JSON.stringify(objetoEntrada)
            });
        };

        this.consultarInventarioFuente = function (objetoEntrada) {
            return $http({
                method: 'POST',
                url: constant.url + 'api/inventario/consultarinventariofuente',
                headers: {'Content-Type': 'application/json'},
                data: JSON.stringify(objetoEntrada)
            });
        };

        this.consultarInventarioContaminante = function (objetoEntrada) {
            return $http({
                method: 'POST',
                url: constant.url + 'api/inventario/consultarinventariocontaminante',
                headers: {'Content-Type': 'application/json'},
                data: JSON.stringify(objetoEntrada)
            });
        };

        this.consultarGeometria = function (objetoEntrada) {
            return $http({
                method: 'POST',
                url: constant.url + 'api/inventario/consultargeometria',
                headers: {'Content-Type': 'application/json'},
                data: JSON.stringify(objetoEntrada)
            });
        };

        this.consultarAdjunto = function (objetoEntrada) {
            return $http({
                method: 'POST',
                url: constant.url + 'api/inventario/consultarAdjunto',
                headers: {'Content-Type': 'application/json'},
                data: JSON.stringify(objetoEntrada)
            });
        };

        this.consultarGrilla = function (objetoEntrada) {
            return $http({
                method: 'POST',
                url: constant.url + 'api/inventario/consultargrilla',
                headers: {'Content-Type': 'application/json'},
                data: JSON.stringify(objetoEntrada)
            });
        };

        this.actualizarInventario = function (objetoEntrada) {
            return $http({
                method: 'POST',
                url: constant.url + 'api/inventario/actualizarinventario',
                headers: {'Content-Type': 'application/json'},
                data: JSON.stringify(objetoEntrada)
            });
        };

        this.cambiarEstadoInventario = function (objetoEntrada) {
            return $http({
                method: 'POST',
                url: constant.url + 'api/inventario/cambiarestadoinventario',
                headers: {'Content-Type': 'application/json'},
                data: JSON.stringify(objetoEntrada)
            });
        };

        this.registrarAdjunto = function (codigoInventario, adjunto, idUsuario) {
            return Upload.upload({
                method: 'POST',
                url: constant.url + 'api/inventario/registraradjunto',
                data: {file: adjunto, 'codigoInventario': codigoInventario, 'idUsuario': idUsuario}
            });
        };

    }]);

})(window.angular);
