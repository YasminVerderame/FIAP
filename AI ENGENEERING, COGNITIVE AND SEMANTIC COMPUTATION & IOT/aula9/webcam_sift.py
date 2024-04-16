import cv2

# Inicializa o objeto SIFT
sift = cv2.SIFT_create()

# Carrega a imagem de referência
img1 = cv2.imread('livros.jpeg', 0)

# Inicializa a captura de vídeo da webcam padrão
cap = cv2.VideoCapture(0)

# Cria a janela com tamanho 1024x768
cv2.namedWindow('Original', cv2.WINDOW_NORMAL)
cv2.resizeWindow('Original', (1024, 768))

while True:
    ret, frame = cap.read()
    
    if not ret:
        break

    # Calcula os keypoints e descritores da imagem de referência
    kp1, des1 = sift.detectAndCompute(img1, None)
    
    # Calcula os keypoints e descritores do frame capturado
    kp2, des2 = sift.detectAndCompute(frame, None)

    # Cria um objeto BFMatcher
    bf = cv2.BFMatcher()

    # Realiza a correspondência dos descritores
    matches = bf.knnMatch(des1, des2, k=2)

    # Aplica o teste de razão de Lowe
    good_matches = []
    for m, n in matches:
        if m.distance < 0.45 * n.distance:
            good_matches.append(m)

    # Desenha os matches encontrados
    img3 = cv2.drawMatches(img1, kp1, frame, kp2, good_matches, None, flags=2)

    # Exibe o frame com os matches
    cv2.imshow('Original', img3)

    # Aguarda a tecla 'q' para sair do loop
    if cv2.waitKey(10) & 0xFF == ord('q'):
        break

# Libera o objeto de captura de vídeo e fecha todas as janelas
cap.release()
cv2.destroyAllWindows()