'use strict';

(function (ng) {

    var app = ng.module('invent', [

        'ngRoute', 'ngAnimate', 'ngSanitize', 'angular-jwt', 'angular-storage', 'ui.bootstrap', 'ngFileUpload',
        'comunModulo', 'admUsuarioModulo', 'inventarioModulo', 'categoriaModulo', 'contaminanteModulo', 'reporteModulo', 'utlListadosModulo'
    ]);

    app.constant('constant', {

        nombre: 'Inventario Emisiones',
        url: '/IVE-web/',
        idSistema: 2,
        idModulo: 3,
        usuarioInvitado: 'user',
        contraseniaInvitado: 'user123'
    }).config(['$routeProvider', '$httpProvider', '$locationProvider', 'jwtInterceptorProvider', 'jwtOptionsProvider', function ($routeProvider, $httpProvider, $locationProvider, jwtInterceptorProvider, jwtOptionsProvider) {

        $httpProvider.defaults.headers.common['X-Requested-With'] = 'XMLHttpRequest';

        jwtOptionsProvider.config({
            unauthenticatedRedirectPath: '/ingresarSistema'
        });

        jwtInterceptorProvider.tokenGetter = function () {
            return localStorage.getItem('ive_token');
        };

        $httpProvider.interceptors.push('jwtInterceptor');

        $routeProvider
            .when('', {
                templateUrl: 'app/comun/vista/comunVista.html',
                controller: 'comunControlador'
            })
            .when('/', {
                templateUrl: 'app/comun/vista/comunVista.html',
                controller: 'comunControlador'
            })

            /*admUsuarioModulo*/
            .when('/ingresarSistema', {
                templateUrl: 'app/adm/vista/ingresarSistemaVista.html',
                controller: 'admUsuarioControlador'
            })
            .when('/registrarUsuario', {
                templateUrl: 'app/adm/vista/registrarUsuarioVista.html',
                controller: 'admUsuarioControlador'
            })
            .when('/modificarUsuario', {
                templateUrl: 'app/adm/vista/consultarUsuarioVista.html',
                controller: 'admUsuarioControlador'
            })
            .when('/actualizarUsuario/:a002codigo', {
                templateUrl: 'app/adm/vista/actualizarUsuarioVista.html',
                controller: 'admUsuarioControlador'
            })

            /*inventarioModulo*/
            .when('/consultarInventario', {
                templateUrl: 'app/ive/vista/consultarInventarioVista.html',
                controller: 'inventarioControlador'
            })
            .when('/registrarInventario', {
                templateUrl: 'app/ive/vista/registrarInventarioVista.html',
                controller: 'inventarioControlador'
            })
            .when('/actualizarInventario/:a003codigo', {
                templateUrl: 'app/ive/vista/actualizarInventarioVista.html',
                controller: 'inventarioControlador'
            })
            .when('/visualizarInventario/:a003codigo', {
                templateUrl: 'app/ive/vista/visualizarInventarioVista.html',
                controller: 'inventarioControlador'
            })

            /*categoriaModulo*/
            .when('/consultarCategoria/:a003codigo', {
                templateUrl: 'app/cat/vista/consultarCategoriaVista.html',
                controller: 'categoriaControlador'
            })
            .when('/registrarCategoria/:a003codigo', {
                templateUrl: 'app/cat/vista/registrarCategoriaVista.html',
                controller: 'categoriaControlador'
            })
            .when('/actualizarCategoria/:a003codigo/:a009codigo', {
                templateUrl: 'app/cat/vista/actualizarCategoriaVista.html',
                controller: 'categoriaControlador'
            })

            /*contaminanteModulo*/
            .when('/consultarContaminante/:a003codigo/:a009codigo', {
                templateUrl: 'app/cont/vista/consultarContaminanteVista.html',
                controller: 'contaminanteControlador'
            })
            .when('/registrarContaminante/:a003codigo/:a009codigo', {
                templateUrl: 'app/cont/vista/registrarContaminanteVista.html',
                controller: 'contaminanteControlador'
            })
            .when('/actualizarContaminante/:a003codigo/:a009codigo/:a013codigo', {
                templateUrl: 'app/cont/vista/actualizarContaminanteVista.html',
                controller: 'contaminanteControlador'
            })

            /*reportes*/
            .when('/consultarReporte', {
                templateUrl: 'app/rpt/vista/consultarReporteVista.html',
                controller: 'reporteControlador'
            })

            /*Inicio*/
            .otherwise('/');

    }]).run(['$rootScope', 'jwtHelper', 'store', '$location', 'authManager', 'comunServicio', function ($rootScope, jwtHelper, store, $location, authManager, comunServicio) {

        //$on 'unauthenticated'
        authManager.redirectWhenUnauthenticated();

        $rootScope.$on('$routeChangeStart', function () {

            comunServicio.obtenerSesion();
        });
    }]);

})(window.angular);