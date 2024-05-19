public class DynamicQueryAllocation {
    public class WrapperClass{ 
	String fieldApiName;
    String operator;
    Integer value;
    Id dataType;
        public WrapperClass (String fieldApiName, String operator, Integer value, Id dataType){
            this.fieldApiName=fieldApiName;
            this.operator=operator;
			this.value = value;
            this.dataType = dataType;
        }
    }
    
    
}