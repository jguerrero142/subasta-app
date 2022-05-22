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
class VotosController {
    crearVoto(req, res) {
        return __awaiter(this, void 0, void 0, function* () {
            const { id } = req.params;
            const votos = yield database_1.default.query("insert into voto (active, id_sufragante, id_candidato , id_mesa)  values (true, 2, 1 , 1)", [
                id,
            ]);
            res.json(votos);
        });
    }
    getVotos() {
        return __awaiter(this, void 0, void 0, function* () {
        });
    }
}
class PedidoController {
    //Obtiene todos los PEDIDOS de un USUARIO.
    listPedidoUser(req, res) {
        return __awaiter(this, void 0, void 0, function* () {
            const { id } = req.params;
            const pedido = yield database_1.default.query("SELECT * FROM pedido  WHERE id_user = ? AND pedido_estado = 1 OR pedido_estado = 2", [
                id,
            ]);
            res.json(pedido);
        });
    }
    getState(req, res) {
        return __awaiter(this, void 0, void 0, function* () {
            const { id } = req.params;
            const state = yield database_1.default.query("SELECT pedido_estado FROM pedido WHERE id_pedido = ?", [id]);
            res.json(state[0]);
        });
    }
    //CRUD PEDIDOS
    // Obtiene todos los PEDIDOS
    list(req, res) {
        return __awaiter(this, void 0, void 0, function* () {
            const pedido = yield database_1.default.query("SELECT id_pedido,pedido.id_user, valor, created_at,value_pedido,servicio,estado_valor,pedido_estado,user_update,update_at,user.name FROM pedido INNER JOIN user ON user.id_user = pedido.id_user");
            res.json(pedido);
        });
    }
    // Obtiene PEDIDO x id
    getOne(req, res) {
        return __awaiter(this, void 0, void 0, function* () {
            const { id } = req.params;
            const pedido = yield database_1.default.query("SELECT * FROM pedido WHERE id_pedido = ?", [id]);
            if (pedido.length > 0) {
                return res.json(pedido);
            }
            res.status(404).json({ text: "el pedido no existe" });
        });
    }
    //Crear el pedido y obtiene el ID
    create(req, res) {
        return __awaiter(this, void 0, void 0, function* () {
            const { id } = req.params;
            yield database_1.default.query("INSERT INTO pedido set ?", [req.body]);
            const pedido = yield database_1.default.query("SELECT pedido.id_pedido,pedido.id_user, valor, created_at,value_pedido,servicio,estado_valor,pedido_estado,user_update,update_at,user.name FROM pedido INNER JOIN user ON user.id_user = pedido.id_user WHERE value_pedido = true AND pedido.id_user = ?", [id]);
            yield database_1.default.query("UPDATE pedido set value_pedido = false WHERE value_pedido = true AND id_user = ?", [id]);
            return res.json(pedido[0]);
        });
    }
    // Elimina los tickets y el pedido x id
    delete(req, res) {
        return __awaiter(this, void 0, void 0, function* () {
            const { id } = req.params;
            yield database_1.default.query("UPDATE ticket set estado = false WHERE id_pedido = ? ", [id]);
            yield database_1.default.query("UPDATE pedido set pedido_estado = 6 WHERE id_pedido = ?", [id]);
            res.json({ message: "the pedido was deleted" });
        });
    }
    //Actualiza el pedido x id
    update(req, res) {
        return __awaiter(this, void 0, void 0, function* () {
            const { id } = req.params;
            yield database_1.default.query("UPDATE pedido set ? WHERE id_pedido = ?", [req.body, id]);
            const pedido = yield database_1.default.query("SELECT pedido.id_pedido,pedido.id_user, valor, created_at,value_pedido,servicio,estado_valor,metodo_pago, pedido_estado,user_update,update_at,user.name FROM pedido INNER JOIN user ON user.id_user = pedido.id_user WHERE id_pedido = ?", [id]);
            return res.json(pedido[0]);
        });
    }
}
const pedidoController = new PedidoController();
exports.default = pedidoController;
