import {Router} from 'express';
import configController from '../controllers/config';


class ConfigRoutes {

    public router: Router = Router();

    constructor(){
        this.config();
        }

    config(): void{
        
        this.router.get('/', configController.list);
        
    }
}

const configRoutes = new ConfigRoutes();
export default configRoutes.router;