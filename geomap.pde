void mouseover()
{  
  // Find the borough at mouse position and draw in different colour.
  id = geoMap.getID(mouseX, mouseY);  
  if (id != -1)
  {           
    redraw();
    
    String name = geoMap.getAttributes().getString(id, 2);
    String code = geoMap.getAttributes().getString(id, 3);
        
    String price = housePricesTable.getString(id,3);
    
    fill(0);
    
    TableRow result = housePricesTable.findRow(code, "ONS Code");
    String otherCode = result.getString("ONS Code");  
    
    textSize(20);
    if(otherCode.equals(code))
    {
      text(name, mouseX+5, mouseY-5);
    }        
  }
}

void redraw()
{
  fill(80,80,200);      // Highlighted land colour.
  geoMap.draw(id);
}
