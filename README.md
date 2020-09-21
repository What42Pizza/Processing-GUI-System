# Processing GUI System

# THIS IS A WORK IN PROGRESS.

<br />

Last updated 09/21/20

This is a set of classes you can use in Processing that allows you to easily create GUIs. This was designed in Processing 3.5.3, so you should be using at least that. It might work with earier versions, but I don't know.

The main file is GUISystem/GUISystem.pde, which shows how to use the classes. All other files in GUISystem will need to be copied into your own project in order to be used. Not all files have to be copied, though. If you only need some classes, then you can just copy the files for those classes, the files for their super classes, and GUI_Functions.pde (which always needs to be copied).

<br />
<br />

### Classes:

- GUI_Element
  - GUI_Frame

<br />
<br />

### GUI_Element:

This is the most basic class. It doesn't have any use.

<br />

Vars:

- String Name

- float XPos (0 - 1)
- float YPos (0 - 1)
- float XSize (0 - 1)
- float YSize (0 - 1)

- color BackgroundColor
- color EdgeColor
- int EdgeSize

- boolean Draggable (WIP; no functionality)

- ArrayList <GUI_Element> Children

<br />

Functions:

- void AddChild (GUI_Element NewChild)
- GUI_Element Child (String ChildName)
- GUI_Element Decendant (String DecendantName)

<br />

Constructors:

- GUI_Element (String Name)
- GUI_Element (String Name, float XPos, float YPos)
- GUI_Element (String Name, float XPos, float YPos, float XSize, float YSize)
- GUI_Element (String Name, ArrayList <GUI_Element> Children)



<br />
<br />


### GUI_Frame:

GUI_Frame is the only usable class so far. It is used to create a frame in which you will place other GUI elements

No new vars.

No new constructors.

<br />

Functions:

- void Render ()
