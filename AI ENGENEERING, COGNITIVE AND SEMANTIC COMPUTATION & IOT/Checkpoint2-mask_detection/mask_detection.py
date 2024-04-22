import cv2
import numpy as np
from tensorflow.keras.preprocessing.image import img_to_array
from tensorflow.keras.models import load_model
from tensorflow.keras.applications.mobilenet_v2 import preprocess_input

# Carregar o classificador de faces pré-treinado
faceCascade = cv2.CascadeClassifier("haarcascade_frontalface_default.xml")

# Carregar o modelo treinado para reconhecimento de máscar
model = load_model("mask_recog.h5")

# Inicializar a captura de vídeo da webcam
cap = cv2.VideoCapture(0)

# Função para detectar máscaras em rostos
def face_mask_detector(frame):
    # Converter a imagem para escala de cinza
    gray = cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY)
    
    # Detectar rostos na imagem
    faces = faceCascade.detectMultiScale(gray,
                                          scaleFactor=1.1,
                                          minNeighbors=5,
                                          minSize=(60, 60),
                                          flags=cv2.CASCADE_SCALE_IMAGE)
    
    # Lista para armazenar os rostos detectados
    faces_list = []
    
    # Iterar sobre cada rosto detectado
    for (x, y, w, h) in faces:
        # Recortar a região do rosto da imagem
        face_frame = frame[y:y+h, x:x+w]
        
        # Pré-processar a imagem para o formato esperado pelo modelo
        face_frame = cv2.cvtColor(face_frame, cv2.COLOR_BGR2RGB)
        face_frame = cv2.resize(face_frame, (224, 224))
        face_frame = img_to_array(face_frame)
        face_frame = preprocess_input(face_frame)
        
        # Adicionar o rosto pré-processado à lista de rostos
        faces_list.append(face_frame)
    
    # Se houver rostos na lista
    if len(faces_list) > 0:
        preds = model.predict(np.array(faces_list))
        
        # Iterar sobre cada previsão e desenhar caixas e texto no frame original
        for i, pred in enumerate(preds):
            (mask, withoutMask) = pred
            label = "Mask" if mask > withoutMask else "No Mask"
            color = (0, 255, 0) if label == "Mask" else (0, 0, 255)
            label = "{}: {:.2f}%".format(label, max(mask, withoutMask) * 100)
            (x, y, w, h) = faces[i]
            cv2.putText(frame, label, (x, y - 10),
                        cv2.FONT_HERSHEY_SIMPLEX, 1, color, 2)
            cv2.rectangle(frame, (x, y), (x + w, y + h), color, 3)
    
    return frame

# Loop para capturar e processar cada frame da webcam
while True:
    ret, frame = cap.read()
    if not ret:
        break
    
    # Aplicar a detecção de máscara ao frame atual
    output = face_mask_detector(frame)

    # Exibir o frame com a detecção de máscara na janela "Output"
    cv2.imshow('Output', output)
    
    if cv2.waitKey(1) & 0xFF == ord('q'):
        break

cap.release()
cv2.destroyAllWindows()
