/**
 * @description       : 
 * @author            : vkm
 * @group             : 
 * @last modified on  : 05-11-2024
 * @last modified by  : vkm
**/
public class DynamicQueryWrapper {
	public class WrapperClass{ 
	String fieldApiName;
    String operator;
    Object value;
    String dataType;
        public WrapperClass (String fieldApiName, String operator, Object value, String dataType){
            this.fieldApiName=fieldApiName;
            this.operator=operator;
			this.value = value;
            this.dataType = dataType;
        }
    }
    
    public static List<Id> queryRecords(String objectName, List<WrapperClass> conditions){
        Map<String, Object> nameBind  = new Map<String, Object>();
        String StrQuery = 'SELECT Id FROM ' + objectName + ' WHERE ';
        for(Integer i=0;i<conditions.size();i++){
            StrQuery  = StrQuery + conditions[i].fieldApiName + ' ' + conditions[i].operator + ' ' + ':nBind'+i;
            if(i < conditions.size() - 1){
                StrQuery += ' AND ';
            }
            nameBind.put('nBind'+i , conditions[i].value);
        }
        system.debug(StrQuery);
        system.debug(nameBind);
        List<Sobject> queriedRecords = Database.queryWithBinds(StrQuery, nameBind , AccessLevel.USER_MODE);
        List<Id> objId = new List<Id>();
        for(Sobject i : queriedRecords){
            objId.add(i.Id);
        }
        //system.debug(objId);
        return objId;
    }
}