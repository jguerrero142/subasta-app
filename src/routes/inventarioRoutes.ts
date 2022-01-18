import { Router } from "express";
import inventarioController from "../controllers/inventarioController";

class InventarioRoutes {
  public router: Router = Router();

  constructor() {
     this.config();
  }

config(): void {
//this.router.get("/", inventarioController);
this.router.get("/getitem", inventarioController.getItems);
this.router.post("/create", inventarioController.create);
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
export default inventarioRoutes.router;