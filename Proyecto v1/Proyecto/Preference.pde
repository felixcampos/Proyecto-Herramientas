class Preference {
  
  StringDict PreferencesDict = new StringDict();      
  String preferencesFileName = "Preferences.txt";
  
  Preference() {
    
  }
  
  void setText(String _key, String _value, boolean saveItToDiskNow) {
    PreferencesDict.set(_key, _value);                                              
    
    if(saveItToDiskNow) {                                                           
      savePref();
    }
  }
  
  void setNumber(String _key, float _value, boolean saveItToDiskNow) {
    PreferencesDict.set(_key, str(_value));                                         
    
    if(saveItToDiskNow) {                                                          
      savePref();
    }
  }
  
  String getText(String _key) {
    return PreferencesDict.get(_key);                                              
  }
  
  float getFloat(String _key) {
    return float(PreferencesDict.get(_key));                                       
  }
  
  int getInt(String _key) {
    return int(PreferencesDict.get(_key));                                         
  }
  
  void loadPref() {
    String lines[] = loadStrings(preferencesFileName);      
    for (int i = 1 ; i < lines.length; i++) {                                   
      String[] PreferencesLoadLineArr = split(lines[i], "=");                      
      if(PreferencesLoadLineArr.length == 2) {                                      
        PreferencesDict.set(PreferencesLoadLineArr[0],PreferencesLoadLineArr[1]);  
      }
    }
    
    //println(PreferencesDict);                                
  }
  
  void savePref() {
    String[] preferencesFileContent = {"Preferences:"};                         
    
    for (String k : PreferencesDict.keys()) {                               
      String appendString = k + "=" + PreferencesDict.get(k);                        
      preferencesFileContent = append(preferencesFileContent, appendString);       
    }
    
    saveStrings(preferencesFileName, preferencesFileContent);                        
    
    //println(PreferencesDict);                                                        
    
  }
  
}
