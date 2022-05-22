"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = require("express");
const indexController_1 = require("../controllers/indexController");
class VotosRoutes {
    constructor() {
        this.router = (0, express_1.Router)();
        this.config();
    }
    config() {
        this.router.get('/allvotos', indexController_1.indexController.index);
        this.router.get('/onevotos/:id', indexController_1.indexController.index);
        this.router.post('/create', indexController_1.indexController.index);
        this.router.delete('/delete', indexController_1.indexController.index);
    }
}
const votosRoutes = new VotosRoutes();
exports.default = votosRoutes.router;
