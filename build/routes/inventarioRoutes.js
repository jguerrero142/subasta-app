"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = require("express");
const inventarioController_1 = __importDefault(require("../controllers/inventarioController"));
class InventarioRoutes {
    constructor() {
        this.router = (0, express_1.Router)();
        this.config();
    }
    config() {
        //this.router.get("/", inventarioController);
        this.router.get("/", inventarioController_1.default.getAll);
        this.router.get("/getitem", inventarioController_1.default.getItems);
        this.router.post("/create", inventarioController_1.default.create);
        //     this.router.get("/:id", facturaController.getOne);
        //     this.router.post("/:id", facturaController.create);
        //     this.router.put("/:id", facturaController.update);
        //     //Obtiene los pedidos del USUARIO
        //     this.router.get("/get/:id", facturaController.listfacturaUser);
        //     this.router.get("/metodo-pago/get", facturaController.listMetodoPago);
        //     this.router.get("/closed/up", facturaController.closeBox);
    }
}
const inventarioRoutes = new InventarioRoutes();
exports.default = inventarioRoutes.router;
