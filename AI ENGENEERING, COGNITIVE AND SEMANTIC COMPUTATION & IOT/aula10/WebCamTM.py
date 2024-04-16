import cv2
from matplotlib import pyplot as plt
import numpy as np

#Lê a imagem template - T
template = cv2.imread('face1.JPG',0)
w, h = template.shape[::-1]
#Quanto menor, mais sensível a ruídos..
limiar_detec = 0.20

cap = cv2.VideoCapture(0) #Webcam Capture

while(True):
    #imagem a ser analisada - A)
    ret, frame = cap.read()
    gray = cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY)
    #efetua o casamento de padrões 
    res = cv2.matchTemplate(gray,template,cv2.TM_CCORR_NORMED)
    
    min_val, max_val, min_loc, max_loc = cv2.minMaxLoc(res)
    print(res.max())
    
    if res.max() > limiar_detec:
        top_left = max_loc
        bottom_right = (top_left[0] + w, top_left[1] + h)
        cv2.rectangle(frame,top_left, bottom_right, (255, 0, 0), 2)
        cv2.putText(frame, 'Face Detectada : ', (top_left[0],top_left[1]-10), 
    	cv2.FONT_HERSHEY_PLAIN, 1.5, (0,0,255), thickness=2)
    
    cv2.imshow('Resultado do template matching',frame)
    
    if cv2.waitKey(1) == 27: break

cap.release()
cv2.destroyAllWindows()	