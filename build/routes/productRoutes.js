"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = require("express");
const productController_1 = __importDefault(require("../controllers/productController"));
class ProductRoutes {
    constructor() {
        this.router = express_1.Router();
        this.config();
    }
    config() {
        this.router.get("/", productController_1.default.list);
        this.router.get("/:id", productController_1.default.getOne);
        this.router.post("/", productController_1.default.create);
        this.router.put("/:id", productController_1.default.update);
        this.router.delete("/:id", productController_1.default.delete);
        //Creadas
        //Obtiene los tipos de los productos
        this.router.get("/tipo/producto/", productController_1.default.tipos);
        //Obtiene todos los productos activos x TIPO productos
        this.router.get("/tipo/producto/:id", productController_1.default.getProductos);
        //Obtiene todos los productos en MENU true
        this.router.get("/store/menu", productController_1.default.getMenu);
    }
}
const productRoutes = new ProductRoutes();
exports.default = productRoutes.router;
