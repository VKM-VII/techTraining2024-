trigger ProductTrigger on Product2 (after insert) {
    List<New_Product_Entry__e> npeList = new  List<New_Product_Entry__e>();
    for(Product2 prod : trigger.new){
        New_Product_Entry__e npe = new New_Product_Entry__e();
        npe.Product_Name__c = 'New Perfume';
        npe.Product_Id__c = prod.Id;
        npe.Product_Price__c =130;
        npe.Product_Category__c ='Perfumes and Fragrance';
        npeList.add(npe);
        //insert npe;
    }
    
    System.debug('--npeList'+npeList);
    List<Database.SaveResult> results = EventBus.publish(npeList);
}