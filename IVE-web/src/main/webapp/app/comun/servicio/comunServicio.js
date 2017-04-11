'use strict';

(function (ng) {

    var app = ng.module('comunModulo');

    app.service('comunServicio', ['$rootScope', '$log', '$location', 'store', 'jwtHelper', 'constant', function ($rootScope, $log, $location, store, jwtHelper, constant) {

        toastr.options = {
            'closeButton': true,
            'debug': false,
            'newestOnTop': false,
            'progressBar': true,
            'positionClass': 'toast-top-right',
            'preventDuplicates': true,
            'onclick': null,
            'showDuration': '300',
            'hideDuration': '1000',
            'timeOut': '5000',
            'extendedTimeOut': '1000',
            'showEasing': 'swing',
            'hideEasing': 'linear',
            'showMethod': 'fadeIn',
            'hideMethod': 'fadeOut'
        };

        this.permisos = {'TODOS': 0, 'FUNCIONARIO_MADS': 7, 'ADMINISTRADOR_SISTEMA': 8, 'ADMISTRADOR_AUTORIDAD_AMBIENTAL': 9, 'PUBLICADOR_AUTORIDAD_AMBIENTAL': 10, 'PUBLICO_GENERAL': 11};

        this.estadosInventario = {'APROBADO': 28, 'EN_DILIGENCIAMIENTO': 25, 'PENDIENTE_APROBACION': 26, 'RECHAZADO': 27};

        this.mensaje = function (mensaje, tipo) {

            $log.log(mensaje);
            toastr[tipo](mensaje, constant.nombre);
        };

        this.mensajeSalida = function (respuesta) {

            $log.log(respuesta);

            var mensaje = respuesta.data.msgError || respuesta.data || respuesta.statusText;

            var tipoMsg = 'success';
            if (respuesta.status != 200)
                tipoMsg = 'error';

            toastr[tipoMsg](mensaje, constant.nombre);
        };

        this.obtenerSesion = function () {

            var sesion = null;
            var token = store.get('ive_token') || null;
            if (!token) {
                this.cerrarSesion();
            }
            else if (jwtHelper.isTokenExpired(token)) {
                this.cerrarSesion();
            }
            else {
                sesion = jwtHelper.decodeToken(token);
            }
            return sesion;
        };

        this.cerrarSesion = function () {

            store.remove('ive_token');
            $location.path('/ingresarSistema');
            return true;
        };

        this.obtenerSeleccion = function (arg1, arg2) {

            return this.obtenerCadena(arg1) == this.obtenerCadena(arg2);
        };

        this.obtenerSeleccionMultiple = function (arg1, arg2) {

            var result = false;
            try {
                if (this.obtenerNumero(arg2.length) > 0) {
                    for (var i = 0; i < arg2.length; i++) {
                        if (this.obtenerSeleccion(arg1, arg2[i])) {
                            result = true;
                            break;
                        }
                    }
                }
            } catch (ex) {
                result = false;
            }
            return result;
        };

        this.obtenerCadena = function (arg1) {

            if (arg1 == null)
                return '';
            if (arg1 == undefined)
                return '';
            else if (arg1 == 'undefined')
                return '';
            else if (arg1 == '')
                return '';
            else
                return String(arg1);
        };

        this.obtenerNumero = function (arg1) {

            if (arg1 == undefined)
                return null;
            else if (arg1 == 'undefined')
                return null;
            else if (arg1 == '')
                return null;
            else if (Number.isNaN(Number(arg1)))
                return null;
            else
                return Number(String(arg1).replace(',', '.'));
        };

        this.esAutenticado = function () {

            return this.obtenerSesion() != null;
        };

        this.esAutorizado = function (permisos) {

            var esAutorizado = false;
            if (this.esAutenticado()) {
                var idPermisoUsuario = this.obtenerSesion().perfil;
                for (var i = 0; i < permisos.length; i++) {
                    var idPermiso = this.permisos[permisos[i]];
                    if (this.obtenerSeleccion(idPermiso, idPermisoUsuario) || idPermiso == 0) {
                        esAutorizado = true;
                    }
                }
            }
            return esAutorizado;
        };

    }]);

})(window.angular);
