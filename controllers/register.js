var connection = require('./../config');
var requestIp = require('request-ip');
module.exports.register=function(req,res){
    var today = new Date();
    var clientIp = requestIp.getClientIp(req);
    var users={
        "username":req.body.username,
        "email":req.body.email,
        "password":req.body.password,
        "created_at":today,
        "updated_at":today,
        "Rem_virtual_usd":2500000
    }
      connection.query('SELECT *  FROM user WHERE Email= ?',[req.body.email], function (error, results, fields) {
        if (error) {
            res.json({
                status:false,
                message:'error with query'
            })
            console.log(error);
        }
       
       if(results !=""){
            
            res.json({
                status:true,
                message:'Email address already in system!'
            })
        }
      if(results ==""){
          connection.query('INSERT INTO user SET ?',users, function (error, results, fields) {
            if (error) {
            res.json({
                status:false,
                message:'error with query'
            })
            console.log(error);
            }else{
                res.json({
                status:true,
                data:results,
                message:'user registration sucessful'
            })
                console.log(clientIp);
            }
        });
        }
    });
    
}