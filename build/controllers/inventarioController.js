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
class InventarioController {
    // public async getItems(req: Request, res: Response) {
    // const product = await pool.query("SELECT id_ticket, user_ticket,ticket.producto,ticket.create_at,id_pedido,estado,producto.name, producto.valor, producto.image FROM ticket INNER JOIN producto ON producto.id = ticket.producto WHERE inventario = false");
    // res.json(product);
    // } 
    getItems(req, res) {
        return __awaiter(this, void 0, void 0, function* () {
            const product = yield database_1.default.query('SELECT producto.id, producto.name,producto.valor as valor_unit, count(ticket.id_ticket) as cantidad, SUM(producto.valor) as valor_total FROM ticket INNER JOIN producto ON producto.id = ticket.producto WHERE ticket.estado = true GROUP BY ticket.producto');
            res.json(product);
        });
    }
    create(req, res) {
        return __awaiter(this, void 0, void 0, function* () {
            yield database_1.default.query("INSERT INTO inventario set ?", [req.body]);
            res.json({ message: "inventario guardados" });
        });
    }
    getAll(req, res) {
        return __awaiter(this, void 0, void 0, function* () {
            const product = yield database_1.default.query('SELECT * FROM inventario');
            res.json(product);
        });
    }
}
const inventarioController = new InventarioController();
exports.default = inventarioController;
