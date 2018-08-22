var connection = require('./../config');
var get_coins = require('./get_coins.js');
var callunresoved =true;
module.exports.buy_coin=function(req,res){
    var order ={
            "coin":req.body.coin,
            "order_type":"buy",
            "currency":req.body.currency,
            "order_qua":req.body.order_qua,
            "price_per_unit":req.body.price_per_unit,
            "status":req.body.status,
            "userid":req.body.userid
        }
        if (req.body.currency=="USD"){
            var sql ='INSERT INTO user_req SET ?';
        }
        if(req.body.currency=="BTC"){
            var sql ='INSERT INTO user_req SET ?';
        }
    connection.query(sql,order, function (error, results, fields) {
            if (error) {
                console.log(error);
                res.json({
                        status:false,
                        message:'there are some error with query'
                    });            
            }else{
              
                res.json({
                        status:true,
                        message:"Your request sent successfully"
                        });
            }
        });
    }
    //  chech pending status in order_usd table following order type//  
module.exports.compare=function(req,res){
    var order=req.body;
    var sql ='SELECT * FROM user_req WHERE status = "pending" and userid =?';
    connection.query(sql,order.userid, function (error, results, fields) {
            if (error) {
         
                res.json({
                        status:false,
                        message:'error with query'
                    });            
            }if(results.length>0){
                order.coins.forEach(function(element) {
                   results.forEach(function(recod){
                       if((element.coins == recod.coin)&&(element.info.lastpriceUSD==recod.price_per_unit)&&(recod.currency=="USD") ){
                           var sql ="UPDATE user_req SET status = 'published' WHERE currency='USD' and coin =? and userid =?";
                            connection.query(sql,[recod.coin, order.userid], function (error, results, fields) {
                            if(error){
                                return res.json({"err":"some sql error"});
                            }
                            else{
                                return res.json({"res":"Your "+recod.coin+"   "+recod.order_type+" successfully puplished ","action":"publish"});
                            }
                        });
                       }
                       if((element.coins == recod.coin)&&(element.info.lastpriceBTC==recod.price_per_unit)&&(recod.currency=="BTC") ){
                           var sql ="UPDATE user_req SET status = 'published' WHERE currency='USD' and coin =? and userid =?";
                            connection.query(sql,[recod.coin, order.userid], function (error, results, fields) {
                            if(error){
                                return res.json({"err":"some sql error"});
                            }
                            else{
                                return res.json({"res":"Your "+recod.coin+"   "+recod.order_type+" successfully puplished ","action":"publish"});
                            }
                        });
                       }
                       if((element.coins == recod.coin)&&(element.info.last_price!=recod.price_per_unit) ){
                           return res.send({"res":"Your "+recod.coin+" coin  "+recod.order_type+" request not puplished yet!","action":"notpublish"});
                       }
                   })
                }, this);
            }
            else{
                return res.json({"res":"Your request will publish next time"});
            }
        });
    }