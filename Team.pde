class Team{
  
 //team fields
 String teamName;
 int teamPoints;
 String scorer1;
 String scorer2;
 int yearFounded;
 int europeanTrophies;
 int teamGoals;
 Venue stadium;
 
 //team constructor
 Team(String tn, int p, String s1, String s2, int yf, int et, Venue s){
   this.teamName=tn;
   this.teamPoints=p;
   this.scorer1=s1;
   this.scorer2=s2;
   this.yearFounded=yf;
   this.europeanTrophies=et;
   this.teamGoals=0;
   this.stadium=s;
 }
 
 //team history and info
 void describe(){
   println(this.teamName+" was founded in "+this.yearFounded+" and currently have "+europeanTrophies+" European trophies. Maybe they can improve that soon?");
   println(this.teamName+"'s 2 main goal contributers from last season were "+this.scorer1+" and "+this.scorer2+".");
   println();
 }
 
 //displaying number of team goals in MD1
 void countGoals(){
   String g;
   if(teamGoals==1)
     g="goal";
   else
     g="goals";
   println(this.teamName+" have scored "+teamGoals, g,"in Match Day 1.");
 }
}
