var connection = require('./../config');
module.exports.sell_coin=function(req,res){
        var order=req.body.coin;
        var order_type=req.body.order_type;
        //here we will compate data with poloniex live data//
        var price =123; 
    
                 var order ={
                    "coin":req.body.coin,
                    "order_type":"sell",
                    "order_qua":req.body.order_qua,
                    "price_per_unit":req.body.price_per_unit,
                    "status":req.body.status,
                    "userid":req.body.userid,
                    "currency":req.body.currency
                }  
        if (req.body.currency=="USD"){
            var sql ='INSERT INTO order_usd SET ?'
        }
        if(req.body.currency=="BTC"){
            var sql ='INSERT INTO order_btc SET ?'
        }
        connection.query(sql,order, function (error, results, fields) {
        if (error) {
            console.log(error);
            res.json({
                    status:false,
                    message:'error with query'
                });
            
        }else{
            res.json({
                    status:true,
                    message:"Your request sent successfully"
                    });
                }
        });
}