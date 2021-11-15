import { Router } from "express";
import pedidoController from "../controllers/pedidoController";

class PedidoRoutes {
  public router: Router = Router();

  constructor() {
    this.config();
  }

  config(): void {
    this.router.get("/", pedidoController.list);
    this.router.get("/:id", pedidoController.getOne);
    this.router.post("/:id", pedidoController.create);
    this.router.put("/:id", pedidoController.update);
    this.router.delete("/:id", pedidoController.delete);

    //Obtiene los pedidos del USUARIO
    this.router.get("/get/:id", pedidoController.listPedidoUser);
    //Obtiene el estado del PEDIDO
    this.router.get("/state/:id", pedidoController.getState);
  }
}

const pedidoRoutes = new PedidoRoutes();
export default pedidoRoutes.router;
