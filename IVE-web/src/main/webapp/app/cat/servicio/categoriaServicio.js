'use strict';

(function (ng) {

    var app = ng.module('categoriaModulo');

    app.service('categoriaServicio', ['$http', 'constant', 'Upload', function ($http, constant, Upload) {

        this.consultarGrilla = function (objetoEntrada) {
            return $http({
                method: 'POST',
                url: constant.url + 'api/categoria/consultarGrillaCat',
                headers: {'Content-Type': 'application/json'},
                data: JSON.stringify(objetoEntrada)
            });
        };

        this.registrarCategoria = function (objetoEntrada) {
            return $http({
                method: 'POST',
                url: constant.url + 'api/categoria/registrarCategoria',
                headers: {'Content-Type': 'application/json'},
                data: JSON.stringify(objetoEntrada)
            });
        };

        this.actualizarCategoria = function (objetoEntrada) {
            return $http({
                method: 'POST',
                url: constant.url + 'api/categoria/actualizarCategoria',
                headers: {'Content-Type': 'application/json'},
                data: JSON.stringify(objetoEntrada)
            });
        };

        this.consultarCategoria = function (objetoEntrada) {
            return $http({
                method: 'POST',
                url: constant.url + 'api/categoria/consultarCategoriaId',
                headers: {'Content-Type': 'application/json'},
                data: JSON.stringify(objetoEntrada)
            });
        };

        this.consultarCategoriaTipoCombustible = function (objetoEntrada) {
            return $http({
                method: 'POST',
                url: constant.url + 'api/categoria/consultarcategoriatipocombustible',
                headers: {'Content-Type': 'application/json'},
                data: JSON.stringify(objetoEntrada)
            });
        };

        this.consultarCategoriaCodigoCIIU = function (objetoEntrada) {
            return $http({
                method: 'POST',
                url: constant.url + 'api/categoria/consultarcategoriacodigociiu',
                headers: {'Content-Type': 'application/json'},
                data: JSON.stringify(objetoEntrada)
            });
        };

        this.eliminarCategoria = function (objetoEntrada) {
            return $http({
                method: 'POST',
                url: constant.url + 'api/categoria/eliminarcategoria',
                headers: {'Content-Type': 'application/json'},
                data: JSON.stringify(objetoEntrada)
            });
        };

    }]);

})(window.angular);
