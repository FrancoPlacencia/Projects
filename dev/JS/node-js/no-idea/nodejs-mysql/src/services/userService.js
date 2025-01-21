
class UserService {


    createUser(){
        console.log('creating user');
    }
    readUser(){
        console.log('reading user');
    }
    updateUser(){
        console.log('updating user');
    }
    deleteUser(){
        console.log('deleting user');
    }
}

module.exports = new UserService();