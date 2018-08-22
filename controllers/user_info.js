var connection = require('./../config');
module.exports.userinfo=function(req,res){
    var userid=req.query.userid;
    var sql ="SELECT *  FROM user   LEFT JOIN user_req   ON user_req.userid = user.userid  WHERE user.userid = ?"
    connection.query(sql,[userid], function (error, results, fields) {
      if (error) {
          res.json({
            status:false,
            message:'error with query'
            })
      }else{
        if(results.length >0){
          results[0].userid=req.query.userid;
             console.log(results);
            if(results){
                res.render("sim_app", {userdata:results});
            }else{
                res.json({
                  status:false,
                  message:"authentication failure"
                 });
            }
        }
        else{
          res.json({
            status:false,    
            message:"Email not valid"
          });
        }
      }
    });
}