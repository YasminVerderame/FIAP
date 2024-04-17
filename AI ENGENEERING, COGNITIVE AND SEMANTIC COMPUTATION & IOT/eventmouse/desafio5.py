import cv2
import numpy as np

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

        key = cv2.waitKey(1) & 0xFF
        if key == ord('s') and len(points) == 2:
            # Seleciona a região definida pelos pontos
            (x1, y1), (x2, y2) = points
            roi = clone[y1:y2, x1:x2]

            # Exibe a região recortada em uma nova janela
            cv2.imshow(roi)

            # Salva a região selecionada como 'cropped_image.jpg' se a tecla "s" for pressionada novamente
            key = cv2.waitKey(0) & 0xFF
            if key == ord('s'):
                cv2.imwrite('cropped_image.jpg', roi)
                print("Imagem recortada salva como 'cropped_image.jpg'")

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
