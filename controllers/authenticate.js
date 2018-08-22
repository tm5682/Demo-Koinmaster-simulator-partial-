var connection = require('./../config');
module.exports.authenticate=function(req,res){
    var email=req.body.email;
    var password=req.body.password;
    connection.query('SELECT * FROM user WHERE email = ? or username=?',[email, email], function (error, results, fields) {
      if (error) {
          res.json({
            status:false,
            message:'error detected with query'
            })
      }else{
        if(results.length >0){
            if(password==results[0].password){
                res.json({
                    status:true,
                    userid:results[0].userid,
                    message:'successfully authenticated'
                })
                console.log(results);
            }else{
                res.json({
                  status:false,
                  message:"failed to authenticate"
                 });
            }
        }
        else{
          res.json({
            status:false,    
            message:"Email not found in the system"
          });
        }
      }
    });
}