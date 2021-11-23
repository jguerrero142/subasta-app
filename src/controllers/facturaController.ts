import { Request, Response } from "express";
import pool from "../database";

class FacturaController {
  //Obtiene todos los facturaS de un USUARIO.
  public async listfacturaUser(req: Request, res: Response) {
    const { id } = req.params;
    const factura = await pool.query("SELECT factura.id_factura, factura.id_pedido, factura.id_user, factura.valor, factura.id_metodo, factura.estado_valor,factura.estado_factura, factura.user_update, factura.create_at, factura.update_at, factura.observacion, user.name FROM factura INNER JOIN user ON user.id_user = factura.id_user WHERE factura.id_user = ?", [
      id,
    ]);
    res.json(factura);
  }

  //Obtiene todos los Metodos de Pago.
  public async listMetodoPago(req: Request, res: Response) {
    const { id } = req.params;
    const factura = await pool.query("SELECT *  FROM metodo_pago");
    res.json(factura);
  }

  // Actualiza las FACTURAS a FINALIZADAS
  public async closeBox(req: Request, res: Response){
    const  id  = 4;
    await pool.query("UPDATE factura set estado_factura = 4");
    res.json({ text: "el  factura fue actualizado " });
  }

  //CRUD factura
  // Obtiene todos las factura
  public async list(req: Request, res: Response) {
    const factura = await pool.query("SELECT factura.id_factura, factura.id_pedido, factura.id_user, factura.valor, factura.id_metodo, factura.estado_valor,factura.estado_factura, factura.user_update, factura.create_at, factura.update_at, factura.observacion, user.name FROM factura INNER JOIN user ON user.id_user = factura.id_user WHERE estado_factura < 5");
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
    const { id } = req.params;
    await pool.query("INSERT INTO factura set ?", [req.body]);
    const factura = await pool.query(
      "SELECT factura.id_factura, factura.id_pedido, factura.id_user, factura.valor, factura.id_metodo, factura.estado_valor,factura.estado_factura, factura.user_update, factura.create_at, factura.update_at, factura.observacion, user.name FROM factura INNER JOIN user ON user.id_user = factura.id_user WHERE estado = 0 AND factura.id_user = ?", [id]
    );
    
    await pool.query(
      "UPDATE factura set estado = 1 WHERE estado = 0 AND id_user = ?",[id]);
    return res.json(factura[0]);
  }

  // Elimina los tickets y el factura x id
//   public async delete(req: Request, res: Response): Promise<void> {
//     const { id } = req.params;
//     await pool.query("DELETE FROM ticket WHERE id_factura = ?", [id]);
//     await pool.query("DELETE FROM factura WHERE id_factura = ?", [id]);
//     res.json({ message: "the factura was deleted" });
//   }

  //Actualiza el factura x id
  public async update(req: Request, res: Response){
    const { id } = req.params;
    await pool.query("UPDATE factura set ? WHERE id_factura =?", [req.body, id]);
    res.json({ text: "el  factura fue actualizado " });
  }
}

const facturaController = new FacturaController();
export default facturaController;
