class Group {
  
  //group fields
  String name;
  String country;
  ArrayList<Team> teamsInGroup;
  int as;
  int bs;
  
 //group constructor
  Group(String n, String c) {
    this.name=n;
    this.country=c;
    this.as=0; //team a goals scored
    this.bs=0; //team b goals scored
    teamsInGroup=new ArrayList<Team>();
  }
  
  //group info
  void describeGroup(){
    println(this.name+" is a league based in "+this.country);
    println();
  }
   
  //add teams to group
  void addTeam(Team t) {
    teamsInGroup.add(t);
  }
 
  //print group with all teams
  void printGroup() {
    String z;
    ExtraStuff.printHeader(this.name+" Group"); //nice header
    for (int i=0; i<teamsInGroup.size(); i++) {
      if(teamsInGroup.get(i).teamName=="AC Milan" || teamsInGroup.get(i).teamName=="SSC Napoli"){ //fixing an indenting glitch 
        z="          ";
      }
      else{
        z="";
      }
      println(teamsInGroup.get(i).teamName +"\t",z+teamsInGroup.get(i).teamPoints); //displaying teams and points
    }
    println();

  }
  
  //printing teams against each other and time
  void printGameDay(Team a, Team b) {
    int[]z={1,3,6,9,12};
    int q=int(random(0,5));
    println(a.teamName+" will match up against "+b.teamName+" today at "+z[q]+":00pm EST"); //setting games and times
    int attendence;
    int r=int(random(0,2));
    
    //deciding which team stadium to use
    Venue v;
    if(r==0)
      v=a.stadium;
    else
      v=b.stadium;
      
    //stadium capacity depending on weather
    if(v.weather.equals("rain")){
        attendence=int(v.seatCap*(3.0/4.0));  
        println("This match will be played at "+v.stadium+" because they won the draw. This stadium has a max capacity of "+v.seatCap+", but due to the "+v.weather+", "+attendence+" fans have attended");
        println("This match will be a tough one for the goalkeepers");   
        println();

      }
      
    else if(v.weather.equals("snow")){
      attendence=int(v.seatCap*(2.0/3.0));
      println("This match will be played at "+v.stadium+" because they won the draw. This stadium has a max capacity of "+v.seatCap+", but due to the "+v.weather+", "+attendence+" fans have attended");
      println("These players have to keep themselves moving in order to not get injured");
      println();

    }
    
    else{
      attendence=v.seatCap+350;
      println("This match will be played at "+v.stadium+" because they won the draw. This stadium has a max capacity of "+v.seatCap+", and due to the "+v.weather+", "+attendence+" fans have attended");
      println("What a beautiful day it is on the pitch, these fans must be buzzing to get started, the stadium is practically overflowing!");  
      println();
    }

  }
  
  //simulating games
  void simGame(Team a, Team b) {
    int as=int(random(0,5)); //goals per team
    int bs=int(random(0,5));
    a.teamGoals=as; //putting goals scored in to total team goals
    b.teamGoals=bs;
    println();
    
    //deciding who won
    if (as>bs) {
      a.teamPoints=3;
      println(a.teamName+" have gotten the better of "+b.teamName+", beating them by a score of "+as+"-"+bs);
      println();
    } 
    
    else if (bs>as) {
      b.teamPoints=3;
      println(b.teamName+" have taken 3 points from "+a.teamName+" by a score of "+bs+"-"+as);
      println();
    } 
    
    //penalty shootout for ties
    else {
      int tie=int(random(0, 2));
      if (tie==0) {
        a.teamPoints=3;
        println(a.teamName+" played an intense draw against "+b.teamName+" with a score of "+as+"-"+bs+" but "+a.teamName+" won via a penalty shootout");
        println();
      } 
      
      else {
        b.teamPoints=3;
        println(a.teamName+" tied "+b.teamName+" with a score of "+as+"-"+bs+" but "+b.teamName+" won through the help of a penalty shootout");
        println();
      }
    }
    
    //printing players that scored in game
    ExtraStuff.printHeader("Goalscorers");
    setScorers(a,b,as,bs);
    println();
  }
  
  //removing teams that lost
  void relegateTeam() {
    for (int i=0; i<teamsInGroup.size(); i++) {
      if (teamsInGroup.get(i).teamPoints==0) {
        println(teamsInGroup.get(i).teamName+" have been knocked out due to their poor form and recent loss.");
        println();
        teamsInGroup.remove(i);
      } 
    }
  }

  //picking goal scorers and time they scored for each team
  void setScorers(Team a, Team b, int as, int bs) {
    for (int i=0; i<as; i++) {
      int x=int(random(0, 2)); //who scored
      int y=int(random(0, 92)); //time at which they scored
      if (x==0) {
        println(a.scorer1+" puts one in for "+a.teamName+" in minute "+y);
      } 
      else {
        println(a.scorer2+" scores a magnifiecent strike for "+a.teamName+" in minute "+y);
      }
    }
    for (int i=0; i<bs; i++) {
      int x=int(random(0, 2)); //who scored
      int y=int(random(0, 92)); //time at which they scored
      if (x==0) {
        println(b.scorer1+" places one in the top corner for "+b.teamName+" in minute "+y);
      }
      else {
        println(b.scorer2+" finishes a team effort for "+b.teamName+" in minute "+y);
      }
    }
  }
  
  //printing top 2 teams on screen
  void finalTwo(int y){
    for (int i=0; i<teamsInGroup.size(); i++) { 
      text(teamsInGroup.get(i).teamName,190,y);
      y+=150;
    }
  }
  

}
