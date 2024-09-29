# Live Coding

En este proyecto nos hemos encargado de crear una canción con el programa de Sonic pi, en el cual mediante líneas de código y en directo eres capaz de crear tu propias canciones.

## Herramientas

En nuestro caso hemos utilizado dos herramienta aparte del Sonic pi, las cuales son:
  Splice: es la bliblioteca online de la que hemos descargado todos los sonidos que aparecen en nuestra canción.
  Fl  Studio: es un sofware de producción musical en el que hemos editado los sonidos anteriormente mencionados para crear loops y cambiar el tono de los mismos.

## Como utilizar nuestro codigo

```rashberry
drums_playing = false
cowbell1_playing = false
cowbell2_playing = false

#punchinchinpumchin
drums2_playing = false
bass1_playing = false
stabs_playing = false
cowbell3_playing = false

#punchinchinpumchin2
drop_playing = false

#PUMCHINCHINPUMCHIN
dynamis_playing = true
```
La parte del codigo que aparece arriba es la que utilizamos para controlar los loops del los distintos soniidos, para que un loop funcione tiene que estar en true y para que deje de sonar tuene que estar en false

## Variables de tiempo
```rashberry
use_bpm 125
compas_duration = 16
```
Tal y como se ve en el código de la parte superior, los beats por minuto estan definidos a 125.
los compases estan definidos a 16.
```rashberry
live_loop :tempo do
  cue :compas  
  sleep compas_duration  
end
```
Este loop se utliza para contralar en que momento se introducen nuevos sonidos en la canción, esto nos permite que al cambiar una variable de true a false esta no se meta inmediatamente, sino que tenga que esperar a que termine el loop para que suene.
## Loops

```rashberry
live_loop :drums do
  sync :compas
  if drums_playing  
    sample path, "drums 1", amp: 1, finish: 1.0
  end
  sleep compas_duration
end

live_loop :cowbell1 do
  sync :compas  
  if cowbell1_playing  
    sample path, "cowbell 1", amp: 1, finish: 1.0
  end
  sleep compas_duration
end

live_loop :cowbell do
  sync :compas 
  if cowbell2_playing  # Solo reproduce si cowbell2_playing es true
    sample path, "cowbell 2", amp: 0, finish: 1.0
    sleep 7
    control amp: 1, amp_slide: 9
  end
  sleep compas_duration
end

live_loop :drop do
  sync :compas 
  if drop_playing  
    sample path, "drop 1", amp: 1, finish: 1.0  
    sleep sample_duration(path, "drop 1") 
  else
    sleep compas_duration  
  end
end

live_loop :dynamis do
  sync :compas  
  if dynamis_playing 
    sample path, "DYNAMIS,HXDES- DEMO", amp: 1, finish: 1.0  
    sleep sample_duration(path, "DYNAMIS,HXDES- DEMO") 
  else
    sleep compas_duration 
  end
end

live_loop :drums2 do
  sync :compas  # Sincronizado al compás
  if drums2_playing 
    sample path, "drums 2", amp: 0.7, finish: 1.0 
    sleep sample_duration(path, "drums 2") 
  else
    sleep compas_duration  
  end
end

live_loop :bass1 do
  sync :compas  
  if bass1_playing  
    sample path, "bass1", amp: 0.7, finish: 1.0  
    sleep sample_duration(path, "bass1")  
  else
    sleep compas_duration  
  end
end

live_loop :stabs do
  sync :compas  
  if stabs_playing  
    sample path, "stabs", amp: 0.7, finish: 1.0  
    sleep sample_duration(path, "stabs")  
  else
    sleep compas_duration 
  end
end

live_loop :cowbell3 do
  sync :compas  
  if cowbell3_playing 
    sample path, "cowbell 3", amp: 0.7, finish: 1.0 
    sleep sample_duration(path, "cowbell 3")  
  else
    sleep compas_duration  
  end
end
```
Estos son los sonidos que aparecen en nuestra canción.
