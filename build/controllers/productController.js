"use strict";
var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    function adopt(value) { return value instanceof P ? value : new P(function (resolve) { resolve(value); }); }
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : adopt(result.value).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const database_1 = __importDefault(require("../database"));
class ProductController {
    //Funciones Creadas
    //Obtiene los tipos de los productos
    tipos(req, res) {
        return __awaiter(this, void 0, void 0, function* () {
            const product = yield database_1.default.query("SELECT * FROM tipo_producto");
            res.json(product);
        });
    }
    //Obtiene todos los productos activos x TIPO productos
    getProductos(req, res) {
        return __awaiter(this, void 0, void 0, function* () {
            const { id } = req.params;
            const product = yield database_1.default.query("SELECT * FROM producto WHERE producto_tipo = ? AND active = true", [id]);
            return res.json(product);
        });
    }
    //Obtiene todos los productos en MENU true
    getMenu(req, res) {
        return __awaiter(this, void 0, void 0, function* () {
            const menu = yield database_1.default.query("SELECT * FROM producto WHERE menu = 1");
            return res.json(menu);
        });
    }
    //CRUD Productos
    //Obtiene todos los productos
    list(req, res) {
        return __awaiter(this, void 0, void 0, function* () {
            const product = yield database_1.default.query("SELECT * FROM producto");
            res.json(product);
        });
    }
    //Obtiene todos ONE producto
    getOne(req, res) {
        return __awaiter(this, void 0, void 0, function* () {
            const { id } = req.params;
            const product = yield database_1.default.query("SELECT * FROM producto WHERE id_producto = ?", [id]);
            if (product.length > 0) {
                return res.json(product[0]);
            }
            res.status(404).json({ text: "el producto no existe" });
        });
    }
    //Crea los productos
    create(req, res) {
        return __awaiter(this, void 0, void 0, function* () {
            yield database_1.default.query("INSERT INTO producto set ?", [req.body]);
            res.json({ message: "producto guardados" });
        });
    }
    //Elimina producto x id
    delete(req, res) {
        return __awaiter(this, void 0, void 0, function* () {
            const { id } = req.params;
            yield database_1.default.query("DELETE FROM producto WHERE id_producto = ?", [id]);
            res.json({ message: "the producto was deleted" });
        });
    }
    //Actualiza productos
    update(req, res) {
        return __awaiter(this, void 0, void 0, function* () {
            const { id } = req.params;
            yield database_1.default.query("UPDATE producto set ? WHERE id_producto =?", [
                req.body,
                id,
            ]);
            res.json({ text: "el  producto fue actualizado " });
        });
    }
}
const productController = new ProductController();
exports.default = productController;
