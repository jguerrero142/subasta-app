import {Router} from 'express';
import usuarioController from '../controllers/usuarioController';

class UsuarioRoutes {

    public router: Router = Router();

    constructor(){
        this.config();
        }

    config(): void{
        this.router.get('/get', usuarioController.getUsuarios );
        this.router.post('/get/login', usuarioController.Login );
        this.router.get('/get/:id_user', usuarioController.oneUsuario );
        this.router.post('/create', usuarioController.crearUsuario );
        this.router.delete('/delete/:id_user', usuarioController.deletUsuario );
        
    }
}

const usuarioRoutes = new UsuarioRoutes();
export default usuarioRoutes.router;