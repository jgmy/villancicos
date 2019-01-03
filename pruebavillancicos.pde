Table mitabla;
int cuentacolumna[]=new int[26];
int cuentasubcolumna[]=new int[26];
int indice[], aleat[];
int versousado[];
String titulos[];
String frases[][];
int primerarima=0;
int tercerverso=0;
void setup(){
  size(1024,768);
  String linea;
  mitabla=loadTable("tablavillancicos.tsv.txt", "header,tsv");
  titulos=new String[mitabla.getColumnCount()];
  indice=new int[mitabla.getColumnCount()];
  aleat=new int[mitabla.getColumnCount()];
  frases=new String[mitabla.getColumnCount()][];
  for (int f=0;f<mitabla.getColumnCount();f++){
    titulos[f]=mitabla.getColumnTitle(f);
    if (titulos[f].equals("E")) primerarima=f;
    if (titulos[f].equals("F")) tercerverso=f;
    println("Columna:"+ titulos[f]);
    frases[f]=mitabla.getStringColumn(titulos[f]);
    linea="";
    indice[f]=0;
    for (int g=0; g<frases[f].length; g++){
      if (trim(frases[f][g]).equals("")) break;
      linea=linea+frases[f][g]+",";
      indice[f]++;
    }
    println(linea);
  }
}

void draw(){
  String verso[]=new String [4];
  String rima;
  
  background(128,128,128);
  
  if ((frameCount==0) || ((frameCount % 100)==0)){
    for (int f=0; f<aleat.length;f++){
      // try at most 10 times to find a nonempty random value
      // (instead of using a do... loop, wich could cause
      // an infinite loop if dataset is wrong)
      for (int w=0; w<10;w++){
         aleat[f]=int(random(0,0.0+indice[f]));
         if (!frases[f][aleat[f]].equals("")) break;
        }
    }
  }
  
  verso[0]="";
  for (int f=0;f<3;f++) verso[0]+=frases[f][aleat[f]]+" ";
  verso[0]=trim(verso[0]);
  
  verso[1]=frases[3][aleat[3]];
  rima=frases[4][aleat[4]];
  for (int i=5;i<titulos.length;i++){
    if (titulos[i].equals(rima)){
      verso[1]+=" "+frases[i][aleat[i]];
      break;
    }
  }
  
  
  verso[2]=frases[tercerverso][aleat[tercerverso]]; 
  verso[2]+=" "+frases[tercerverso+1][aleat[tercerverso+1]];    

  verso[3]=frases[tercerverso+2][aleat[tercerverso+2]];
  rima=trim(titulos[tercerverso+3]+rima.substring(1,rima.length()));
  boolean found=false;
  for (int i=tercerverso;i<titulos.length;i++){
    if (trim(titulos[i]).equals(rima)){
      verso[3]+=" "+frases[i][aleat[i]];
      found=true;
      break;
    }
  }
  if (!found) 
     println("RIMA NO ENCONTRADA: "+rima); //<>//
  
  stroke(60);
  fill(0);
  textAlign(CENTER);
  textSize(32);
  for (int f=0;f<4;f++){
      text (verso[f],width/2,height/2-((2-f)*32));
   }

}
