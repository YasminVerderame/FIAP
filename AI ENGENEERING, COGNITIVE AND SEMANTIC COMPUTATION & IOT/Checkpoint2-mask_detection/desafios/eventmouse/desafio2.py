import cv2
import numpy as np
 
# Carrega uma imagem
img = cv2.imread('admiravelmundonovo.jpg')
img2 = np.zeros((100, 100, 3), dtype="uint8")

# Exibe a imagem
cv2.imshow('image', img)
# cv2.imshow('mostrar', img2)

# Função de callback, quando ocorre um evento do mouse, essa função é chamada
def mouse_click(event, x, y, flags, param):
    
    # Se foi o botão esquerdo do mouse  
    if event == cv2.EVENT_LBUTTONDOWN:
        
        # Realiza função... 
        #blue = img[y,x,0]
        #green = img[y,x,1]
        #red = img[y,x,2]
        # blue, green, red = img[y,x]
        # #print (red, green, blue)
        # msg = "R:" + str(red) + ", G:" + str(green) + ", B:" +str(blue)
        # cv2.putText(img,msg,(x,y),cv2.FONT_HERSHEY_COMPLEX,1.5,(255,255,255),2)
        red, green, blue = img[y,x]
        img2[:,:] = [red, green, blue]


        cv2.imshow('image', img)
        cv2.imshow('mostrar', img2)
       
        
    # if event == cv2.EVENT_RBUTTONDOWN:
        
        

    

# Seta a função de callback que será chamada 
# Evento 'image', função callback mouse_click  
cv2.setMouseCallback('image', mouse_click)
# cv2.setMouseCallback('mostrar', mouse_click)
   
cv2.waitKey(0)
  
# fecha a janela.
cv2.destroyAllWindows()