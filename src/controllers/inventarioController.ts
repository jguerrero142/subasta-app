import { Request, Response } from "express";
import pool from "../database";

class InventarioController {



    // public async getItems(req: Request, res: Response) {
    // const product = await pool.query("SELECT id_ticket, user_ticket,ticket.producto,ticket.create_at,id_pedido,estado,producto.name, producto.valor, producto.image FROM ticket INNER JOIN producto ON producto.id = ticket.producto WHERE inventario = false");
    // res.json(product);
    // } 

    public async getItems(req: Request, res: Response) {
        const product = await pool.query('SELECT producto.id, producto.name,producto.valor as unitario, count(ticket.id_ticket) as cantidad, SUM(producto.valor) as total FROM ticket INNER JOIN producto ON producto.id = ticket.producto WHERE ticket.estado = true GROUP BY ticket.producto');
        res.json(product);
        }

    public async create(req: Request, res: Response): Promise<void> {
        await pool.query("INSERT INTO inventario set ?", [req.body]);
        res.json({ message: "inventario guardados" });
        }



//   //Funciones Creadas
//   //Obtiene los tipos de los productos
//   public async tipos(req: Request, res: Response) {
//     const product = await pool.query("SELECT * FROM tipo_producto");
//     res.json(product);
//   }

//   //Obtiene todos los productos activos x TIPO productos
//   public async getProductos(req: Request, res: Response): Promise<any> {
//     const { id } = req.params;
//     const product = await pool.query(
//       "SELECT * FROM producto WHERE producto_tipo = ? AND active = true",
//       [id]
//     );
//     return res.json(product);
//   }

//   //Obtiene todos los productos en MENU true
//   public async getMenu(req: Request, res: Response): Promise<any> {
//     const menu = await pool.query("SELECT * FROM producto WHERE menu = 1");
//     return res.json(menu);
//   }

//   //CRUD Productos

//   //Obtiene todos los productos
//   public async list(req: Request, res: Response) {
//     const product = await pool.query("SELECT * FROM producto");
//     res.json(product);
//   }

//   //Obtiene todos ONE producto
//   public async getOne(req: Request, res: Response): Promise<any> {
//     const { id } = req.params;
//     const product = await pool.query(
//       "SELECT * FROM producto WHERE id_producto = ?",
//       [id]
//     );
//     if (product.length > 0) {
//       return res.json(product[0]);
//     }
//     res.status(404).json({ text: "el producto no existe" });
//   }

//   //Crea los productos
//   public async create(req: Request, res: Response): Promise<void> {
//     await pool.query("INSERT INTO producto set ?", [req.body]);
//     res.json({ message: "producto guardados" });
//   }

//   //Elimina producto x id
//   public async delete(req: Request, res: Response): Promise<void> {
//     const { id } = req.params;
//     await pool.query("DELETE FROM producto WHERE id_producto = ?", [id]);
//     res.json({ message: "the producto was deleted" });
//   }

//   //Actualiza productos
//   public async update(req: Request, res: Response): Promise<void> {
//     const { id } = req.params;
//     await pool.query("UPDATE producto set ? WHERE id_producto =?", [
//       req.body,
//       id,
//     ]);
//     res.json({ text: "el  producto fue actualizado " });
//   }
}

const inventarioController = new InventarioController();
export default inventarioController;
