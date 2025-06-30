// Editado por Viasulnet LTDA.
function showMenu (evt) { 
  if (document.all) { 
    document.all.contextMenu.style.pixelLeft = event.clientX; 
    document.all.contextMenu.style.pixelTop = event.clientY; 
    document.all.contextMenu.style.visibility = 'visible'; 
    return false; 
  } 
  else if (document.layers) { 
    if (evt.which == 3) { 
      document.contextMenu.left = evt.x; 
      document.contextMenu.top = evt.y; 
      document.contextMenu.onmouseout = 
        function (evt) { this.visibility = 'hide'; }; 
      document.contextMenu.visibility = 'show'; 
      return false; 
    } 
  } 
  return true; 
} 
if (document.all) 
//  document.oncontextmenu = showMenu; 
if (document.layers) { 
//  document.captureEvents(Event.MOUSEDOWN); 
//  document.onmousedown = showMenu; 
} 
