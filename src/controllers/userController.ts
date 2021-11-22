import { Request, Response } from "express";
import pool from "../database";

class UserController {


  public async loginUser(req: Request, res: Response): Promise<any> {
    const { id } = req.params;
    const user = await pool.query("SELECT * FROM user WHERE sub =?", [id]);
    if (user.length > 0) {
      await pool.query("UPDATE user set ? WHERE sub =?", [req.body, id]);
      const uuser = await pool.query("SELECT id_user, sub, name, picture, email, roles.id_role, roles.role_user, enterprise.id_enterprise,enterprise.name_enterprise, contacto FROM user inner JOIN roles on roles.id_role = user.role inner JOIN enterprise on enterprise.id_enterprise = user.id_empresa WHERE sub = ?", [id]);
      return res.json(uuser[0]);
    }
    await pool.query("INSERT INTO user set sub = ? ", [id]);
    await pool.query("UPDATE user set ? WHERE sub =?", [req.body, id]);
    const uuser = await pool.query("SELECT id_user, sub, name, picture, email, roles.id_role, roles.role_user, enterprise.id_enterprise,enterprise.name_enterprise FROM user inner JOIN roles on roles.id_role = user.role inner JOIN enterprise on enterprise.id_enterprise = user.id_empresa WHERE sub = ?", [id]);
    return res.json(uuser[0]);
  }


  // CRUD user
  //Obtiene todos los usuarios
  public async list(req: Request, res: Response) {
    const user = await pool.query("SELECT * FROM user ");
    res.json(user);
  }

  //Obtiene ONE usuario
  public async getOne(req: Request, res: Response): Promise<any> {
    const { id } = req.params;
    const user = await pool.query("SELECT * FROM user WHERE sub =?", [id]);
    if (user.length > 0) {
      return res.json(user[0]);
    }
    res.status(404).json({ text: "el usuario no existe" });
  }

  //Crea usuario
  public async create(req: Request, res: Response): Promise<void> {
    await pool.query("INSERT INTO user set ? ", [req.body]);
    res.json({ message: "usuario guardados" });
  }

  //Elimina usuario
  public async delete(req: Request, res: Response): Promise<void> {
    const { id } = req.params;
    await pool.query("DELETE FROM user WHERE id_user = ?", [id]);
    res.json({ message: "the user was deleted" });
  }

  //Actualiza usuario
  public async update(req: Request, res: Response): Promise<void> {
    const { id } = req.params;
    await pool.query("UPDATE user set ? WHERE sub =?", [req.body, id]);
    res.json({ text: "el  usuario fue actualizado " });
  }
}

const userController = new UserController();
export default userController;
