import {Router} from 'express';
import {indexController} from '../controllers/indexController';

class VotosRoutes {

    public router: Router = Router();

    constructor(){
        this.config();
        }

    config(): void{
        this.router.get('/allvotos', indexController.index);
        this.router.get('/onevotos/:id', indexController.index);
        this.router.post('/create', indexController.index);
        this.router.delete('/delete', indexController.index);
    }
}

const votosRoutes = new VotosRoutes();
export default votosRoutes.router;