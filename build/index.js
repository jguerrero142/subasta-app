"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = __importDefault(require("express"));
const morgan_1 = __importDefault(require("morgan"));
const cors_1 = __importDefault(require("cors"));
const votosRoutes_1 = __importDefault(require("./routes/votosRoutes"));
const usuarioRoutes_1 = __importDefault(require("./routes/usuarioRoutes"));
class Server {
    //cuando instanciamos la clase ejecuta los metodos.
    constructor() {
        this.app = (0, express_1.default)();
        this.config();
        this.routes();
    }
    //configuramos el servidor.
    config() {
        this.app.set('port', process.env.PORT || 3000);
        // vemos las peticiones enviando el comando dev
        this.app.use((0, morgan_1.default)('dev'));
        // conexion de datos con angular para ejecutar las peticiones
        this.app.use((0, cors_1.default)());
        // express permite leer los archivos .json
        this.app.use(express_1.default.json());
        // permite enlazar formulario html
        this.app.use(express_1.default.urlencoded({ extended: false }));
    }
    //configuramos las rutas de la app
    routes() {
        this.app.use('/api/votos/', votosRoutes_1.default);
        this.app.use('/api/usuario', usuarioRoutes_1.default);
    }
    //configuramos la inicializacion del servicio por el puerto 3000
    start() {
        this.app.listen(this.app.get('port'), () => {
            console.log('server in port', this.app.get('port'));
        });
    }
}
// guardamos en la constante server la nueva clase
const server = new Server();
server.start();
