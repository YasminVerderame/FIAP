from tkinter import filedialog
import cv2
import numpy as np
import os


# Função de callback do mouse
def mouse_click(event, x, y, flags, param):
    global points, cropping
    
    if event == cv2.EVENT_LBUTTONDOWN:
        points = [(x, y)]
        cropping = True

    elif event == cv2.EVENT_LBUTTONUP:
        points.append((x, y))
        cropping = False

        # Desenha o retângulo na imagem original
        cv2.rectangle(img, points[0], points[1], (0, 255, 0), 2)
        cv2.imshow('image', img)
        (x1, y1), (x2, y2) = points
        roi = clone[y1:y2, x1:x2]
        cv2.imshow('corte', roi)
        
        
        k = cv2.waitKey(0)
        if k == ord("s"): 
            file_path = filedialog.asksaveasfilename(defaultextension=".png")
            if file_path:  # verifica se o usuário selecionou um local válido
                cv2.imwrite(file_path, roi)
                print(f"Região recortada salva em '{file_path}'")


        
        #     cv2.imwrite("regiao_recortada.png", roi)
        #     print("Região recortada salva como 'regiao_recortada.png'")

        

# Carrega a imagem
img = cv2.imread('admiravelmundonovo.jpg')

# Copia da imagem para exibir retângulo
clone = img.copy()

# Inicializa as variáveis globais
points = []
cropping = False

# Exibe a imagem
cv2.imshow('image', img)

# Configura a função de callback do mouse
cv2.setMouseCallback('image', mouse_click)

# Aguarda até que o usuário pressione 'ESC' para sair
cv2.waitKey(0)
cv2.destroyAllWindows()
