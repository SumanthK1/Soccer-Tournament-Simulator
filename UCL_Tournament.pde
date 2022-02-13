//background
PImage background;

//creating both groups so they are global variables that can be used in void draw()
Group epl=new Group("The Premier League","England");
Group ser=new Group("Serie A","Italy");

void setup(){
  size(950,950);
  background = loadImage("groupStage.png");

  //intro
  ExtraStuff.printMessage("Good evening everyone, and welcome to our live coverage of the UEFA Champions League qualifiers 2021/2022. Now as you are all aware, a global pandemic \nhas pushed forward the completion of all domestic leagues. To combat this as well as appeal to the fans, we will hold 4 games spread across 2 groups \nto find out who will qualify for this prestigious tournament. Today, on MatchDay 1, we will cover 4 sets of rival teams playing each other to fight \nfor a qualifying spot. This round will be quite intense as each team only plays ONE game against their rivals and the home stadium is picked through \na coin toss. A win gives a team 3 points, which will qualify them to the next round. But a loss will give them 0 points and eliminate them from the \ngroup with no second chances. The 2 winning teams from England and Italy will qualify today. May the best teams move on!");
  
  //creating each teams stadium and team info
  Venue tots=new Venue("THFC Stadium","rain",65370); Team tot=new Team("Tottenham Hotspur",0,"Kane","Son",1882,0, tots); 
  Venue livs=new Venue("Anfield","snow",35470); Team liv=new Team("Liverpool FC",0,"Jota","Salah",1892,6,livs); 
  Venue muns=new Venue("Old Trafford","sunny conditions",72350); Team mun=new Team("Manchester United",0,"Pogba","Fernandes",1878,3,muns); 
  Venue mcis=new Venue("The Ethiad","snow",45000); Team mci=new Team("Manchester City",0,"Aguero","Sterling",1880,0,mcis); 
 
  Venue juvs=new Venue("Allianz Stadium","sunny conditions",60500); Team juv=new Team("Juventus FC",0,"Ronaldo","Morata",1863,3,juvs); 
  Venue mils=new Venue("Giuseppe Meazza","sunny conditions",43700); Team mil=new Team("Inter Milan",0,"Lukaku","Sanchez",1860,2,mils); 
  Venue acms=new Venue("San Siro","rain",55800); Team acm=new Team("AC Milan",0,"Ibrahimovich","Diaz",1870,7,acms); 
  Venue naps=new Venue("San Paolo","sunny conditions",32500); Team nap=new Team("SSC Napoli",0,"Mertens","Lozano",1875,0,naps); 
    
  //background info on teams in Group 1
  ExtraStuff.printHeader("Team History and Information");
  tot.describe();
  liv.describe();
  mun.describe();
  mci.describe();
 
  //adding teams into group
  epl.addTeam(tot);
  epl.addTeam(liv);
  epl.addTeam(mun);
  epl.addTeam(mci);
  
  //group info
  epl.describeGroup();
  
  epl.printGroup();
  
  //game info
  epl.printGameDay(tot,liv);
  epl.printGameDay(mun,mci);

  //simulating games
  epl.simGame(tot,liv);
  epl.simGame(mun,mci);

  epl.printGroup(); //showing teams with points
  epl.relegateTeam(); //removing teams with 0 points
  epl.relegateTeam();
  epl.printGroup(); //print updated group  
  
  println("************-New Geographic Location-************");
  println();
  
  //same thing for next group
  ExtraStuff.printHeader("Team History and Information");
  juv.describe();
  mil.describe();
  acm.describe();
  nap.describe();
 
  ser.addTeam(juv);
  ser.addTeam(mil);
  ser.addTeam(acm);
  ser.addTeam(nap);
  
  ser.describeGroup();
  
  ser.printGroup();
  
  ser.printGameDay(juv,nap);
  ser.printGameDay(acm,mil);


  ser.simGame(juv,nap);
  ser.simGame(acm,mil);

  ser.printGroup();
  ser.relegateTeam();
  ser.relegateTeam();
  ser.printGroup();   
  
  //total goals scored by team
  ExtraStuff.printHeader("Let's take a look at how clinical these teams were with taking their chances");
  println();

  tot.countGoals();
  liv.countGoals();
  mun.countGoals();
  mci.countGoals();
  juv.countGoals();
  acm.countGoals();
  mil.countGoals();
  nap.countGoals();
    
  //outro
  ExtraStuff.printMessage("Well! Here comes the end of an outstanding MatchDay. Each game had goals, drama, and surprises. We hope you enjoyed our live coverage of the UEFA \nChampions League 2021/2022 Qualifying stages for England and Italy. Stay tuned for qualifiers for teams based in France, Spain, Germany and the \nNetherlands in upcoming days. That's all for tonight, goodbye!");
 
  ExtraStuff.printMessage("On screen, we can see an image of the top 2 qualifying teams from Italy and England placed in their new group");
}

//showing top 4 teams from England and Italy
void draw(){
  textSize(60);
  image(background,0,0);
  epl.finalTwo(300);
  ser.finalTwo(600);
  noLoop();
  
}
