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
class UserController {
    loginUser(req, res) {
        return __awaiter(this, void 0, void 0, function* () {
            const { id } = req.params;
            const user = yield database_1.default.query("SELECT * FROM user WHERE sub =?", [id]);
            if (user.length > 0) {
                yield database_1.default.query("UPDATE user set ? WHERE sub =?", [req.body, id]);
                const uuser = yield database_1.default.query("SELECT id_user, sub, name, picture, email, roles.id_role, roles.role_user, enterprise.id_enterprise,enterprise.name_enterprise FROM user inner JOIN roles on roles.id_role = user.role inner JOIN enterprise on enterprise.id_enterprise = user.id_empresa WHERE sub = ?", [id]);
                return res.json(uuser[0]);
            }
            yield database_1.default.query("INSERT INTO user set sub = ? ", [id]);
            yield database_1.default.query("UPDATE user set ? WHERE sub =?", [req.body, id]);
            const uuser = yield database_1.default.query("SELECT id_user, sub, name, picture, email, roles.id_role, roles.role_user, enterprise.id_enterprise,enterprise.name_enterprise FROM user inner JOIN roles on roles.id_role = user.role inner JOIN enterprise on enterprise.id_enterprise = user.id_empresa WHERE sub = ?", [id]);
            return res.json(uuser[0]);
        });
    }
    // CRUD user
    //Obtiene todos los usuarios
    list(req, res) {
        return __awaiter(this, void 0, void 0, function* () {
            const user = yield database_1.default.query("SELECT * FROM user ");
            res.json(user);
        });
    }
    //Obtiene ONE usuario
    getOne(req, res) {
        return __awaiter(this, void 0, void 0, function* () {
            const { id } = req.params;
            const user = yield database_1.default.query("SELECT * FROM user WHERE sub =?", [id]);
            if (user.length > 0) {
                return res.json(user[0]);
            }
            res.status(404).json({ text: "el usuario no existe" });
        });
    }
    //Crea usuario
    create(req, res) {
        return __awaiter(this, void 0, void 0, function* () {
            yield database_1.default.query("INSERT INTO user set ? ", [req.body]);
            res.json({ message: "usuario guardados" });
        });
    }
    //Elimina usuario
    delete(req, res) {
        return __awaiter(this, void 0, void 0, function* () {
            const { id } = req.params;
            yield database_1.default.query("DELETE FROM user WHERE id_user = ?", [id]);
            res.json({ message: "the user was deleted" });
        });
    }
    //Actualiza usuario
    update(req, res) {
        return __awaiter(this, void 0, void 0, function* () {
            const { id } = req.params;
            yield database_1.default.query("UPDATE user set ? WHERE sub =?", [req.body, id]);
            res.json({ text: "el  usuario fue actualizado " });
        });
    }
}
const userController = new UserController();
exports.default = userController;
