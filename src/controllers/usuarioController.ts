import { Request, Response } from "express";
import pool from "../database";



class UsuarioController{

    public async getUsuarios(req: Request, res: Response){
      try {
        const usuarios = await pool.query("select * from usuarios");
        return res.json(usuarios);
      }catch(e){
        console.log(e);
      }        
      }

      public async Login(req: Request, res: Response){
        const { email } = req.body
        const usuarios = await pool.query("select * from usuarios where email = ?",[email]);        
        if(usuarios[0]){
          res.json({ message: "usuario existe", status: true });
        }
        else{
          res.json({ message: "usuario no existe", status: false });
        }
      }

      public async oneUsuario(req: Request, res: Response){
        const { id_user } = req.params
        try {
        const usuarios = await pool.query("select * from usuarios where id_user = ?",[id_user]);
        return res.json(usuarios[0]);
      }catch(e){
        console.log(e);
      }      
      }

    public async crearUsuario(req: Request, res: Response) {
      try {
        const usuario = await pool.query("insert into usuarios set ?", [req.body]);
        res.json({ message: "usuario guardado", status: true });
      }catch(e){
      console.log(e);
    }
    }

    public async deletUsuario(req: Request, res: Response) {
        const {id_user} = req.params
      try {
        const usuario = await pool.query("delete from usuarios where id_user = ?", [id_user]);
        res.json({ message: "usuario eliminado"});
      }catch(e){
        console.log(e);
      }          
      }


}

const usuarioController = new UsuarioController();
export default usuarioController;














// class PedidoController {
//   //Obtiene todos los PEDIDOS de un USUARIO.
//   public async listPedidoUser(req: Request, res: Response) {
//     const { id } = req.params;
//     const pedido = await pool.query("SELECT * FROM pedido  WHERE id_user = ? AND pedido_estado = 1 OR pedido_estado = 2", [
//       id,
//     ]);
//     res.json(pedido);
//   }

//   public async getState(req: Request, res: Response){
//     const { id } = req.params;
//     const state = await pool.query("SELECT pedido_estado FROM pedido WHERE id_pedido = ?", [id]);
//     res.json(state[0])
//   }

//   //CRUD PEDIDOS
//   // Obtiene todos los PEDIDOS
//   public async list(req: Request, res: Response) {
//     const pedido = await pool.query("SELECT id_pedido,pedido.id_user, valor, created_at,value_pedido,servicio,estado_valor,pedido_estado,user_update,update_at,user.name FROM pedido INNER JOIN user ON user.id_user = pedido.id_user");
//     res.json(pedido);
//   }

//   // Obtiene PEDIDO x id
//   public async getOne(req: Request, res: Response): Promise<any> {
//     const { id } = req.params;
//     const pedido = await pool.query("SELECT * FROM pedido WHERE id_pedido = ?", [id]);
//     if (pedido.length > 0) {
//       return res.json(pedido);
//     }
//     res.status(404).json({ text: "el pedido no existe" });
//   }

//   //Crear el pedido y obtiene el ID
//   public async create(req: Request, res: Response) {
//     const { id } = req.params;
//     await pool.query("INSERT INTO pedido set ?", [req.body]);
//     const pedido = await pool.query(
//       "SELECT pedido.id_pedido,pedido.id_user, valor, created_at,value_pedido,servicio,estado_valor,pedido_estado,user_update,update_at,user.name FROM pedido INNER JOIN user ON user.id_user = pedido.id_user WHERE value_pedido = true AND pedido.id_user = ?", [id]
//     );
//     await pool.query(
//       "UPDATE pedido set value_pedido = false WHERE value_pedido = true AND id_user = ?", [id]);
//     return res.json(pedido[0]);
//   }

//   // Elimina los tickets y el pedido x id
//   public async delete(req: Request, res: Response): Promise<void> {
//     const { id } = req.params;
//     await pool.query("UPDATE ticket set estado = false WHERE id_pedido = ? ", [id]);
//     await pool.query("UPDATE pedido set pedido_estado = 6 WHERE id_pedido = ?", [id]);
//     res.json({ message: "the pedido was deleted" });
//   }

//   //Actualiza el pedido x id
//   public async update(req: Request, res: Response) {
//     const { id } = req.params;
//     await pool.query("UPDATE pedido set ? WHERE id_pedido = ?", [req.body, id]);
//     const pedido = await pool.query(
//       "SELECT pedido.id_pedido,pedido.id_user, valor, created_at,value_pedido,servicio,estado_valor,metodo_pago, pedido_estado,user_update,update_at,user.name FROM pedido INNER JOIN user ON user.id_user = pedido.id_user WHERE id_pedido = ?", [id]
//     );
//     return res.json(pedido[0]);
//   }
// }

// const pedidoController = new PedidoController();
// export default pedidoController;
