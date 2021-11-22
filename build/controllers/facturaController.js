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
class FacturaController {
    //Obtiene todos los facturaS de un USUARIO.
    listfacturaUser(req, res) {
        return __awaiter(this, void 0, void 0, function* () {
            const { id } = req.params;
            const factura = yield database_1.default.query("SELECT factura.id_factura, factura.id_pedido, factura.id_user, factura.valor, factura.id_metodo, factura.estado_valor,factura.estado_factura, factura.user_update, factura.create_at, factura.update_at, factura.observacion, user.name FROM factura INNER JOIN user ON user.id_user = factura.id_user WHERE factura.id_user = ?", [
                id,
            ]);
            res.json(factura);
        });
    }
    //Obtiene todos los Metodos de Pago.
    listMetodoPago(req, res) {
        return __awaiter(this, void 0, void 0, function* () {
            const { id } = req.params;
            const factura = yield database_1.default.query("SELECT *  FROM metodo_pago");
            res.json(factura);
        });
    }
    //CRUD factura
    // Obtiene todos las factura
    list(req, res) {
        return __awaiter(this, void 0, void 0, function* () {
            const factura = yield database_1.default.query("SELECT factura.id_factura, factura.id_pedido, factura.id_user, factura.valor, factura.id_metodo, factura.estado_valor,factura.estado_factura, factura.user_update, factura.create_at, factura.update_at, factura.observacion, user.name FROM factura INNER JOIN user ON user.id_user = factura.id_user WHERE estado_factura < 5");
            res.json(factura);
        });
    }
    // Obtiene factura x id
    getOne(req, res) {
        return __awaiter(this, void 0, void 0, function* () {
            const { id } = req.params;
            const factura = yield database_1.default.query("SELECT * FROM factura WHERE id_factura = ?", [id]);
            if (factura.length > 0) {
                return res.json(factura);
            }
            res.status(404).json({ text: "el factura no existe" });
        });
    }
    //Crear el factura y obtiene el ID
    create(req, res) {
        return __awaiter(this, void 0, void 0, function* () {
            const { id } = req.params;
            yield database_1.default.query("INSERT INTO factura set ?", [req.body]);
            const factura = yield database_1.default.query("SELECT factura.id_factura, factura.id_pedido, factura.id_user, factura.valor, factura.id_metodo, factura.estado_valor,factura.estado_factura, factura.user_update, factura.create_at, factura.update_at, factura.observacion, user.name FROM factura INNER JOIN user ON user.id_user = factura.id_user WHERE estado = 0 AND factura.id_user = ?", [id]);
            yield database_1.default.query("UPDATE factura set estado = 1 WHERE estado = 0 AND id_user = ?", [id]);
            return res.json(factura[0]);
        });
    }
    // Elimina los tickets y el factura x id
    //   public async delete(req: Request, res: Response): Promise<void> {
    //     const { id } = req.params;
    //     await pool.query("DELETE FROM ticket WHERE id_factura = ?", [id]);
    //     await pool.query("DELETE FROM factura WHERE id_factura = ?", [id]);
    //     res.json({ message: "the factura was deleted" });
    //   }
    //Actualiza el factura x id
    update(req, res) {
        return __awaiter(this, void 0, void 0, function* () {
            const { id } = req.params;
            yield database_1.default.query("UPDATE factura set ? WHERE id_factura =?", [req.body, id]);
            res.json({ text: "el  factura fue actualizado " });
        });
    }
}
const facturaController = new FacturaController();
exports.default = facturaController;
