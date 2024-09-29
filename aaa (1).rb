use_bpm 125

# Define el path a tus samples (asegúrate de que sea correcto y accesible)
path = "C:/Users/jesus/Desktop/uni/"

# Duración de los compases (16 segundos en tu caso)
compas_duration = 16

# Variables de control para detener los loops
#tolontolon
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


# Loop de reloj (controla el tempo pero no genera sonido)
live_loop :tempo do
  cue :compas  # Envía la señal de sincronización en cada compás
  sleep compas_duration  # Espera el tiempo de un compás antes de repetir
end

# Loop de drums (sincronizado al reloj)
live_loop :drums do
  sync :compas  # Espera la señal del loop de tempo para comenzar
  if drums_playing  # Solo reproduce si drums_playing es true
    sample path, "drums 1", amp: 1, finish: 1.0
  end
  sleep compas_duration
end

# Loop de cowbell 1 (sincronizado al reloj)
live_loop :cowbell1 do
  sync :compas  # Espera la señal del loop de tempo para comenzar
  if cowbell1_playing  # Solo reproduce si cowbell1_playing es true
    sample path, "cowbell 1", amp: 1, finish: 1.0
  end
  sleep compas_duration
end

# Loop de cowbell 2 (el buildup con volumen progresivo desde el segundo 7)
live_loop :cowbell do
  sync :compas  # Espera la señal del loop de tempo para comenzar
  if cowbell2_playing  # Solo reproduce si cowbell2_playing es true
    # Comienza a reproducir el audio con un volumen inicial de 0
    sample path, "cowbell 2", amp: 0, finish: 1.0
    
    # Espera hasta el segundo 7, antes de comenzar el buildup
    sleep 7
    
    # Incrementa el volumen de 0 a 1 en los últimos 9 segundos del audio
    control amp: 1, amp_slide: 9
  end
  sleep compas_duration
end

# Loop independiente para el audio "drop 1.wav" (sincronizado al compás)
live_loop :drop do
  sync :compas  # Sincronizado al compás
  if drop_playing  # Solo reproduce si drop_playing es true
    sample path, "drop 1", amp: 1, finish: 1.0  # Reproduce el archivo drop 1.wav
    sleep sample_duration(path, "drop 1")  # Espera a que el sample termine antes de repetir
  else
    sleep compas_duration  # Si drop_playing es false, solo espera el compás
  end
end

# Loop independiente para el audio "DYNAMIS,HXDES- DEMO.wav" (sincronizado al compás)
live_loop :dynamis do
  sync :compas  # Sincronizado al compás
  if dynamis_playing  # Solo reproduce si dynamis_playing es true
    sample path, "DYNAMIS,HXDES- DEMO", amp: 1, finish: 1.0  # Reproduce el archivo DYNAMIS,HXDES- DEMO.wav
    sleep sample_duration(path, "DYNAMIS,HXDES- DEMO")  # Espera a que el sample termine antes de repetir
  else
    sleep compas_duration  # Si dynamis_playing es false, solo espera el compás
  end
end

# Loop independiente para el audio "drums 2.wav" (sincronizado al compás, -1 dB)
live_loop :drums2 do
  sync :compas  # Sincronizado al compás
  if drums2_playing  # Solo reproduce si drums2_playing es true
    sample path, "drums 2", amp: 0.7, finish: 1.0  # Reproduce el archivo drums 2.wav a -1 dB
    sleep sample_duration(path, "drums 2")  # Espera a que el sample termine antes de repetir
  else
    sleep compas_duration  # Si drums2_playing es false, solo espera el compás
  end
end

# Loop independiente para el audio "bass1.wav" (sincronizado al compás, -1 dB)
live_loop :bass1 do
  sync :compas  # Sincronizado al compás
  if bass1_playing  # Solo reproduce si bass1_playing es true
    sample path, "bass1", amp: 0.7, finish: 1.0  # Reproduce el archivo bass1.wav a -1 dB
    sleep sample_duration(path, "bass1")  # Espera a que el sample termine antes de repetir
  else
    sleep compas_duration  # Si bass1_playing es false, solo espera el compás
  end
end

# Loop independiente para el audio "stabs.wav" (sincronizado al compás, -1 dB)
live_loop :stabs do
  sync :compas  # Sincronizado al compás
  if stabs_playing  # Solo reproduce si stabs_playing es true
    sample path, "stabs", amp: 0.7, finish: 1.0  # Reproduce el archivo stabs.wav a -1 dB
    sleep sample_duration(path, "stabs")  # Espera a que el sample termine antes de repetir
  else
    sleep compas_duration  # Si stabs_playing es false, solo espera el compás
  end
end

# Loop independiente para el audio "cowbell 3.wav" (sincronizado al compás, -1 dB)
live_loop :cowbell3 do
  sync :compas  # Sincronizado al compás
  if cowbell3_playing  # Solo reproduce si cowbell3_playing es true
    sample path, "cowbell 3", amp: 0.7, finish: 1.0  # Reproduce el archivo cowbell 3.wav a -1 dB
    sleep sample_duration(path, "cowbell 3")  # Espera a que el sample termine antes de repetir
  else
    sleep compas_duration  # Si cowbell3_playing es false, solo espera el compás
  end
end
