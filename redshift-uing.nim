# affiche des boutons pour changer la température d'écran avec redshift
# nim c -d:danger --opt:speed --app:gui 

import uing
import std/osproc

proc redshift(cmd:string):int =
    execCmd("redshift -P -O" & cmd)

proc main =
  let window = newWindow("RedShift", 320, 240)
  window.margined = true

  let grid = newGrid(true)
  window.child = grid
  
  let
      b3KButton = newButton("3000K") do (_: Button):
        discard redshift("3000")
      b6KButton = newButton("Day (6500K)") do (_: Button):
        discard redshift("6500")
      b45KButton = newButton("Night (4500K)") do (_: Button):
        discard redshift("4500")
      b4KButton = newButton("4000K") do (_: Button):
        discard redshift("4000")
      b25KButton = newButton("2500K") do (_: Button):
        discard redshift("2500")  
      b2KButton = newButton("2000K") do (_: Button):
        discard redshift("2000")
      b1KButton = newButton("1000K") do (_: Button):
        discard redshift("1000")
      bExit = newButton("Exit") do (_: Button):
        window.destroy() #ça fait un memory leak sinon
        uing.quit()
  # add(grid, widget, left,top, x column to span, y colum to span, true to expand hozizontaly, horizontal align, true to expand vertically, vertical align of widget)
#AlignFill fill area ; AlignStart place at start ; Align Center ; -End place at end

  grid.add(b6KButton, 0, 0, 1, 1, true, AlignFill, true, AlignFill)
  grid.add(b45KButton, 0, 1, 1, 1, true, AlignFill, true, AlignFill)
  grid.add(b4KButton, 0, 2, 1, 1, true, AlignFill, true, AlignFill)
  grid.add(b3KButton, 0, 3, 1, 1, true, AlignFill, true, AlignFill)
  grid.add(b25KButton, 0, 4, 1, 1, true, AlignFill, true, AlignFill)
  grid.add(b2KButton, 0, 5, 1, 1, true, AlignFill, true, AlignFill)
  grid.add(b1KButton, 0, 6, 1, 1, true, AlignFill, true, AlignFill)
  grid.add(bExit, 0, 7, 1, 1, true, AlignFill, true, AlignEnd)
  

  show window
  mainLoop()

init()
main()
