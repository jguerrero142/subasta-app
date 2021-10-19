import {Request, Response} from 'express';
import pool from '../database';

class ConfigController {

   public async list  (req: Request, res: Response){ 
    const config = await pool.query('SELECT * FROM config');
    res.json(config);  
    }
    
}

const configController = new ConfigController();
export default configController;