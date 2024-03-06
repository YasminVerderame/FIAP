import cv2
import numpy as np

cap = cv2.VideoCapture('Livro.mp4')

# Definir o fator de escala para redimensionar a imagem
escala = 0.5
# Definir o fator de redução da taxa de quadros
fator_fps = 2

while True:
    # Ler o próximo frame do vídeo
    for _ in range(fator_fps):
        ret, frame = cap.read()
    
    if not ret:
        break
    
    # Redimensionar a imagem
    frame = cv2.resize(frame, None, fx=escala, fy=escala, interpolation=cv2.INTER_AREA)
    
    # Convertendo a imagem para o espaço de cores HSV
    frame_hsv = cv2.cvtColor(frame, cv2.COLOR_BGR2HSV)
    
    # Definindo os intervalos de cor para azul
    lower_blue = np.array([90, 50, 50])
    upper_blue = np.array([130, 255, 255])
    
    # Criando uma máscara para a cor azul
    mask = cv2.inRange(frame_hsv, lower_blue, upper_blue)
    
    # Aplicando a máscara na imagem original
    res = cv2.bitwise_and(frame, frame, mask=mask)
    
    # Exibindo a imagem segmentada
    cv2.imshow('Segmentada', res)
    
    
    if cv2.waitKey(25) & 0xFF == ord('q'):
        break

cap.release()
cv2.destroyAllWindows()
