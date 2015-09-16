import org.gicentre.utils.stat.*;
import org.gicentre.geomap.*;
import org.gicentre.utils.colour.*;
 
GeoMap geoMap; 
BarChart barChart;
Table housePricesTable;
String[] boroughNames,boroughCode1;
float[] housePrices, colours;
float maxValue, minValue, sliderPos;
String year;
int sliderWidth, sliderWidthTenth, sliderWidthFifth, id;
HScrollbar hs1;
ColourTable cTable;
PFont graphFont,yearFont;
 
void setup()
{  
  year = "1996";
  //size(1000,630);
  size(1200,640);

  graphFont = loadFont("FZDX--GB1-4-14.vlw"); 
  yearFont = loadFont("FZDX--GB1-4-32.vlw");  
  
  //Load info
  housePricesTable = loadTable("housePrices.csv", "header");
  boroughNames = new String[housePricesTable.getRowCount()];
  housePrices = new float[housePricesTable.getRowCount()]; 
  boroughCode1 = new String[housePricesTable.getRowCount()];
  
  for(int row=0; row<housePricesTable.getRowCount();row++)
  {
    boroughCode1[row] = housePricesTable.getString(row,"ONS Code");     
  }
  
  //Colour table
  colours = new float[housePrices.length];  
  cTable = new ColourTable(); 
  cTable.addDiscreteColourRule(0, 80,80,200,150);
  cTable.addDiscreteColourRule(1, 80,80,200);  
  
  //geoMap = new GeoMap((width/2)-250,height/2,500,300,this);
  geoMap = new GeoMap(width/2+50,(height/2)-150,500,300,this); 
  geoMap.readFile("londonBoroughs");
  
  //X Position, Y Position, Width, Height, Loose
  hs1 = new HScrollbar(0, 8, width/2, 16, 1);
  //hs1 = new HScrollbar(width/2,height-8,width/2,16,1);  
}
 
// Draws the chart in the sketch
void draw()
{    
  background(255);
  scrollBarSetup();  
  tableSetup();
  barChart.draw(15,25,(width/2)-30,height-30);
  
  text("1996",0,30);
  text("2014",(width/2)-28,30);

  textFont(yearFont);
  textSize(32);
  text(year,width-100,50);
  
  String t = "House Prices According to Borough";
  text(t,width-textWidth(t)-35,height-70);
  
  fill(80,80,200,150);
  geoMap.draw();
  mouseover();
}
