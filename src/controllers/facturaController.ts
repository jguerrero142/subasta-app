import { Request, Response } from "express";
import pool from "../database";

class FacturaController {
  //Obtiene todos los facturaS de un USUARIO.
  public async listfacturaUser(req: Request, res: Response) {
    const { id } = req.params;
    const factura = await pool.query("SELECT * FROM factura  WHERE id_user = ?", [
      id,
    ]);
    res.json(factura);
  }

  //CRUD factura
  // Obtiene todos las factura
  public async list(req: Request, res: Response) {
    const factura = await pool.query("SELECT * FROM factura");
    res.json(factura);
  }

  // Obtiene factura x id
  public async getOne(req: Request, res: Response): Promise<any> {
    const { id } = req.params;
    const factura = await pool.query("SELECT * FROM factura WHERE id_factura = ?", [id]);
    if (factura.length > 0) {
      return res.json(factura);
    }
    res.status(404).json({ text: "el factura no existe" });
  }

  //Crear el factura y obtiene el ID
  public async create(req: Request, res: Response) {
    await pool.query("INSERT INTO factura set ?", [req.body]);
    const id_factura = await pool.query(
      "SELECT id_factura FROM factura WHERE estado = 0"
    );
    await pool.query(
      "UPDATE factura set estado = 1 WHERE estado = 0"
    );
    return res.json(id_factura[0]);
  }

  // Elimina los tickets y el factura x id
//   public async delete(req: Request, res: Response): Promise<void> {
//     const { id } = req.params;
//     await pool.query("DELETE FROM ticket WHERE id_factura = ?", [id]);
//     await pool.query("DELETE FROM factura WHERE id_factura = ?", [id]);
//     res.json({ message: "the factura was deleted" });
//   }

  //Actualiza el factura x id
  public async update(req: Request, res: Response): Promise<void> {
    const { id } = req.params;
    await pool.query("UPDATE factura set ? WHERE id_factura =?", [req.body, id]);
    res.json({ text: "el  factura fue actualizado " });
  }
}

const facturaController = new FacturaController();
export default facturaController;
