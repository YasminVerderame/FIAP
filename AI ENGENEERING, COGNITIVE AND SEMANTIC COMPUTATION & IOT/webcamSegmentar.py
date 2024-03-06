import cv2
import numpy as np

def filtrar_imagem(img):
    """
    Filtra a imagem da webcam para destacar uma cor
    """
    # Convertendo a imagem para o espaço de cores HSV
    hsv = cv2.cvtColor(img, cv2.COLOR_BGR2HSV)
    
    # Definindo os intervalos de cor para azul
    lower_blue = np.array([90, 50, 50])
    upper_blue = np.array([130, 255, 255])
    
    # Criando uma máscara para a cor azul
    mask = cv2.inRange(hsv, lower_blue, upper_blue)
    
    # Aplicando a máscara na imagem original
    res = cv2.bitwise_and(img, img, mask=mask)

    return res, mask

def main():
    cv2.namedWindow("preview")
    vc = cv2.VideoCapture(0)

    if not vc.isOpened(): # Tenta obter o primeiro quadro
        print("Erro ao abrir a câmera.")
        return

    while True:
        rval, frame = vc.read()
        if not rval:
            print("Erro ao capturar a imagem.")
            break

        img_segmentada, mask = filtrar_imagem(frame)

        # Calcular os momentos da região azul
        momentos = cv2.moments(mask)
        if momentos["m00"] != 0:
            centro_x = int(momentos["m10"] / momentos["m00"])
            centro_y = int(momentos["m01"] / momentos["m00"])

            # Desenhar a cruz vermelha no centro de massa
            cv2.circle(img_segmentada, (centro_x, centro_y), 5, (0, 0, 255), -1)
            cv2.line(img_segmentada, (centro_x - 10, centro_y), (centro_x + 10, centro_y), (0, 0, 255), 2)
            cv2.line(img_segmentada, (centro_x, centro_y - 10), (centro_x, centro_y + 10), (0, 0, 255), 2)

        # Exibir a imagem original da webcam e a imagem segmentada com o centro de massa
        cv2.imshow("Original", frame)
        cv2.imshow("Segmentada", img_segmentada)

        key = cv2.waitKey(20)
        if key == 27: # Sai ao pressionar ESC
            break

    cv2.destroyWindow("preview")
    vc.release()

if __name__ == "__main__":
    main()
