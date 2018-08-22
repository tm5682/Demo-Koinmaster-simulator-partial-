// var poloniex = require('./poloniex');
module.exports.get_ticker=function(req,res){
     var market =[{ "coins":"XRP","info": {"lastpriceUSD":"122","lastpriceBTC":"0.0013","ask":"0.0023","bid":"0.0013"}},
                {"coins":"LTP","info": {"lastpriceUSD":"1000","lastpriceBTC":"0.00131","ask":"0.00213","bid":"0.00113"}},
                {"coins":"ETC","info": {"lastpriceUSD":"1111","lastpriceBTC":"0.0012","ask":"0.00232","bid":"0.00123"}},
                {"coins":"MON","info": {"lastpriceUSD":"2000","lastpriceBTC":"0.00113","ask":"0.00223","bid":"0.00113"}},
                {"coins":"ZTC","info": {"lastpriceUSD":"1200","lastpriceBTC":"0.00132","ask":"0.0023","bid":"0.001333"}}];
    return res.json(market);
}
