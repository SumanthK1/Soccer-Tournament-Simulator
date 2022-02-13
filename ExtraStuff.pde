static class ExtraStuff {
  
    //asthetic titles
    static void printHeader( String title ) { 
      String starRow = "";
  
      for(int i=0; i< title.length(); i++){ 
        starRow += "*";
      }    
       println(title);
       println(starRow);
    }
    
    //intro and outro
    static void printMessage(String text){
      String nice="";
    for(int i=0; i<150; i++){ 
        nice += "*";
    }
      println();
      println(nice);      
      println(text);
      println(nice);
      println();
    }
    
}
