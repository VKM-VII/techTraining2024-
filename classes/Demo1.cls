public class Demo1 {
    public enum State{
        Delhi,
        UP,
        AP
    }
	public static void printData(){	
        System.debug(State.Delhi.name());
        /*
        List<String> nameList= new List<String>();
		nameList.add('Sakshi');
		nameList.add('Rupesh');
		nameList.add('Akash');
        System.debug(nameList);
        System.debug(nameList.size());
        System.debug(nameList[1]);
        for(String names : nameList){
            system.debug(names);
        }
        
        */
        Map<Integer,String> mapNames = new Map<Integer,String>();
        for(Integer i=0;i<10;i++){
            MapNames.put(i,'Mirketa' + i);
        }
        /*
        if(MapNames.containsKey(0)){
            MapNames.put(0,'Mirketa');
        }
		*/
        System.debug(mapNames);
        for(Integer index : mapNames.keySet()){
            system.debug('index = '+index);
            system.debug('value = '+mapNames.get(index));
        }
        System.debug(mapNames.keySet());
        System.debug(mapNames.values());
    }
}