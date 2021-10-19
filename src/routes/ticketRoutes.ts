import { Router } from "express";
import ticketController from "../controllers/ticketController";

class TicketRoutes {
  public router: Router = Router();

  constructor() {
    this.config();
  }

  config(): void {
    this.router.get("/", ticketController.list);
    this.router.get("/:id", ticketController.getOne);
    this.router.post("/", ticketController.create);
    this.router.put("/:id", ticketController.update);
    this.router.delete("/:id", ticketController.delete);

    //Routes creadas

    //Obtiene todos los TICKETS de USUARIO
    this.router.get("/user/:id", ticketController.getTickets);
  }
}

const ticketRoutes = new TicketRoutes();
export default ticketRoutes.router;
