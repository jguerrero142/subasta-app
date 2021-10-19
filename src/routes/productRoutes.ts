import { Router } from "express";
import productController from "../controllers/productController";

class ProductRoutes {
  public router: Router = Router();

  constructor() {
    this.config();
  }

  config(): void {
    this.router.get("/", productController.list);
    this.router.get("/:id", productController.getOne);
    this.router.post("/", productController.create);
    this.router.put("/:id", productController.update);
    this.router.delete("/:id", productController.delete);

    //Creadas
    //Obtiene los tipos de los productos
    this.router.get("/tipo/producto/", productController.tipos);

    //Obtiene todos los productos activos x TIPO productos
    this.router.get("/tipo/producto/:id", productController.getProductos);

    //Obtiene todos los productos en MENU true
    this.router.get("/store/menu", productController.getMenu);
  }
}

const productRoutes = new ProductRoutes();
export default productRoutes.router;
