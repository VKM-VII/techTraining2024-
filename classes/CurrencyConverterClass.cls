/**
 * @description       : 
 * @author            : vkm
 * @group             : 
 * @last modified on  : 05-12-2024
 * @last modified by  : vkm
**/
public with sharing class CurrencyConverterClass {
    public static Decimal CurrencyConverterINR(Decimal USD) {
        HTTP h = new HTTP();
        HttpRequest req = new HttpRequest();
        req.setEndpoint('https://v6.exchangerate-api.com/v6/c40df438e4495d8852291d76/latest/USD');
        req.setMethod('GET');
        HttpResponse res = h.send(req);
        //system.debug(res.getBody());
        Map<String,object> jsonBody = (Map<String,object>) json.deserializeUntyped(res.getBody());
        //system.debug(jsonBody);
        map<String,object> mMap = (map<String,Object>) jsonBody.get('conversion_rates');
        //system.debug(mMap);
     	Decimal amt = USD * (Decimal) mMap.get('INR');
        return amt;
    }
}