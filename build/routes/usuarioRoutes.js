"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = require("express");
const usuarioController_1 = __importDefault(require("../controllers/usuarioController"));
class UsuarioRoutes {
    constructor() {
        this.router = (0, express_1.Router)();
        this.config();
    }
    config() {
        this.router.get('/get', usuarioController_1.default.getUsuarios);
        this.router.post('/get/login', usuarioController_1.default.Login);
        this.router.get('/get/:id_user', usuarioController_1.default.oneUsuario);
        this.router.post('/create', usuarioController_1.default.crearUsuario);
        this.router.delete('/delete/:id_user', usuarioController_1.default.deletUsuario);
    }
}
const usuarioRoutes = new UsuarioRoutes();
exports.default = usuarioRoutes.router;
