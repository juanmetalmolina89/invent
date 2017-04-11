'use strict';

(function (ng) {

    var app = ng.module('reporteModulo');

    app.service('reporteServicio', ['$http', 'constant', '$window', function ($http, constant, $window) {

        this.generarReporteInventario = function (objetoEntrada) {

            $window.open(constant.url + 'api/reporte/generarreporteinventario' + objetoEntrada, '_blank');
        };

    }]);

})(window.angular);
