'use strict';

(function (ng) {

    var app = ng.module('admUsuarioModulo');

    app.service('admUsuarioServicio', ['$http', 'constant', function ($http, constant) {

        this.validarUsuario = function (objetoEntrada) {
            return $http({
                method: 'POST',
                url: constant.url + 'api/admusuario/validarusuario',
                skipAuthorization: true,
                headers: {'Content-Type': 'application/json'},
                data: JSON.stringify(objetoEntrada)
            });
        };

        this.registrarUsuario = function (objetoEntrada) {
            return $http({
                method: 'POST',
                url: constant.url + 'api/admusuario/registrarusuario',
                headers: {'Content-Type': 'application/json'},
                data: JSON.stringify(objetoEntrada)
            });
        };

        this.consultarUsuario = function (objetoEntrada) {
            return $http({
                method: 'POST',
                url: constant.url + 'api/admusuario/consultarusuario',
                headers: {'Content-Type': 'application/json'},
                data: JSON.stringify(objetoEntrada)
            });
        };

        this.consultarGrilla = function (objetoEntrada) {
            return $http({
                method: 'POST',
                url: constant.url + 'api/admusuario/consultargrilla',
                headers: {'Content-Type': 'application/json'},
                data: JSON.stringify(objetoEntrada)
            });
        };

        this.actualizarUsuario = function (objetoEntrada) {
            return $http({
                method: 'POST',
                url: constant.url + 'api/admusuario/actualizarusuario',
                headers: {'Content-Type': 'application/json'},
                data: JSON.stringify(objetoEntrada)
            });
        };

        this.eliminarUsuario = function (objetoEntrada) {
            return $http({
                method: 'POST',
                url: constant.url + 'api/admusuario/eliminarusuario',
                headers: {'Content-Type': 'application/json'},
                data: JSON.stringify(objetoEntrada)
            });
        };

    }]);

})(window.angular);
