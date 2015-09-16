void tableSetup()
{
  barChart = new BarChart(this);
  
  for (int row=0; row<housePricesTable.getRowCount(); row++)
  {
    minValue = min(minValue,housePricesTable.getFloat(row,year));
    maxValue = max(maxValue,housePricesTable.getFloat(row,year));
    housePrices[row] = housePricesTable.getFloat(row,year);
  }  
  
  barChart.setData(housePrices);
     
  // Scaling    
  barChart.setMinValue(0);
  barChart.setMaxValue(1200000);
   
  // Axis appearance
  textFont(graphFont);
   
  barChart.showValueAxis(true);
  barChart.setValueFormat("###,###");
  
  //Setting borough names
  for (int row=0; row<housePricesTable.getRowCount(); row++)
  {
    boroughNames[row] = housePricesTable.getString(row,"Area");   
  }                
              
  barChart.setBarLabels(boroughNames);
  
  barChart.showCategoryAxis(true);
 
  // Bar colours and appearance
  barChart.setBarColour(colours,cTable);
  barChart.setBarGap(4);
   
  // Bar layout
  barChart.transposeAxes(true); 
  
}

void mouseMoved()
{
  // Reset all colours to non-highlighted
  for (int i=0; i<housePrices.length; i++)
  {
    colours[i] = 0;    
  }
   
  // See if mouse is over a bar.
  PVector dataUnderMouse = barChart.getScreenToData(new PVector(mouseX,mouseY));
 
  if (dataUnderMouse != null)
  {
    //noLoop();
    //Altered because axis has been flipped    
    int selectedBar = (housePrices.length-1)-(int(dataUnderMouse.x));
    
    float dataValue = dataUnderMouse.y;
     
    TableRow r; 
    if (selectedBar != 0 && dataValue < housePrices[selectedBar])
    {
      colours[selectedBar] = 1;      
      r = housePricesTable.getRow(selectedBar);
      id = r.getInt("ID");
      redraw();
      
      String y = r.getString(year);
      String a = r.getString("Area");
      String c = "House price in " + a + ": " + y;
      textSize(24);
      text(c,width-textWidth(c)-28,100);
    }
  }
  //loop();    // Redraw whenever the mouse is moved.
}

//The year will change depending on the slider position
void setYear()
{
  //<5% 
  if(sliderPos <= sliderWidthFifth)
  {
    year = "1996";
  }
  //5-10%
  else if(sliderWidthFifth < sliderPos && sliderPos <= sliderWidthTenth)
  {
    year = "1997"; 
  }
  //10-15%
  else if(sliderWidthTenth < sliderPos && sliderPos <= (sliderWidthFifth*3))
  {
    year = "1998";
  }
  //15-20%
  else if ((sliderWidthFifth*3) < sliderPos && sliderPos <= (sliderWidthTenth*2))
  {
    year = "1999";
  }
  //20-25%
  else if((sliderWidthTenth*2) < sliderPos && sliderPos <= (sliderWidthFifth*5))
  {
    year = "2000";
  }  
  //25-30%
  else if ((sliderWidthFifth*5) < sliderPos && sliderPos <= (sliderWidthTenth*3))
  {
    year = "2001";
  }  
  //30-35%
  else if((sliderWidthTenth*3) < sliderPos && sliderPos <= (sliderWidthFifth*7))
  {
    year = "2002";
  }
  //35-40%  
  else if((sliderWidthFifth*7) < sliderPos && sliderPos <= (sliderWidthTenth*4))
  {
    year = "2003";
  }
  //40-45%
  else if((sliderWidthTenth*4) < sliderPos && sliderPos <= (sliderWidthFifth*9))
  {
    year = "2004"; 
  }
  //45-50%
  else if((sliderWidthFifth*9) < sliderPos && sliderPos <= (sliderWidthTenth*5))
  {
    year = "2005";
  }
  //50-55%
  else if((sliderWidthTenth*5) < sliderPos && sliderPos <= (sliderWidthFifth*11))
  {
   year = "2006"; 
  }
  //55-60%
  else if((sliderWidthFifth*11) < sliderPos && sliderPos <= (sliderWidthTenth*6))
  {
    year = "2007"; 
  }
  //60-65%
  else if((sliderWidthTenth*6) < sliderPos && sliderPos <= (sliderWidthFifth*13))
  {
    year = "2008"; 
  }
  //65-70%
  else if((sliderWidthFifth*13) < sliderPos && sliderPos <= (sliderWidthTenth*7))
  {
    year = "2009"; 
  }
  //70-75%
  else if((sliderWidthTenth*7) < sliderPos && sliderPos <= (sliderWidthFifth*15))
  {
    year = "2010";
  }
  //75-80%
  else if((sliderWidthFifth*15) < sliderPos && sliderPos <= (sliderWidthTenth*8))
  {
    year = "2011"; 
  }
  //80-85%
  else if((sliderWidthTenth*8) < sliderPos && sliderPos <= (sliderWidthFifth*17))
  {
    year = "2012"; 
  }  
  //85-90%
  else if((sliderWidthFifth*17) < sliderPos && sliderPos <= (sliderWidthTenth*9))
  {
     year = "2013"; 
  }
  else if((sliderWidthTenth*9) < sliderPos && sliderPos <= sliderWidth)
  {
     year = "2014"; 
  }
  else
  {
     year = "1996"; 
  } 
}
