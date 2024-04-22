import cv2
import numpy as np

# Variáveis globais
clicks = 0
coordinates = []

# Criando uma imagem preta
img = np.zeros((480, 640, 3), dtype="uint8")

# Exibindo a imagem
cv2.imshow('image', img)

# Função para resetar o estado do programa
def reset():
    global clicks, coordinates
    img[:, :] = 0
    clicks = 0
    coordinates = []


# Função para calcular o ângulo entre três pontos
def calculate_angle(points):
    p1, p2, p3 = points
    v1 = np.array(p1) - np.array(p2)
    v2 = np.array(p3) - np.array(p2)
    dot_product = np.dot(v1, v2)
    norm_v1 = np.linalg.norm(v1)
    norm_v2 = np.linalg.norm(v2)
    cos_theta = dot_product / (norm_v1 * norm_v2)
    angle_radians = np.arccos(cos_theta)
    angle_degrees = np.degrees(angle_radians)
    return angle_degrees

# Função para desenhar o texto na imagem
def draw_text(image, text, pos, font=cv2.FONT_HERSHEY_SIMPLEX, font_scale=0.5, color=(255, 255, 255), thickness=1):
    cv2.putText(image, text, pos, font, font_scale, color, thickness, cv2.LINE_AA)

# Função para desenhar um triângulo na imagem
def draw_triangle(image, points, color=(0, 255, 0), thickness=1):
    cv2.polylines(image, [np.array(points)], isClosed=True, color=color, thickness=thickness)

# Função de callback do mouse
def mouse_click(event, x, y, flags, param):
    global clicks, coordinates
    
    if clicks < 3:
        if event == cv2.EVENT_LBUTTONDBLCLK:
            clicks += 1
            coordinates.append([x, y])
            cv2.circle(img, (x, y), 2, (0, 255, 0), -1)
            if clicks > 1:
                cv2.line(img, tuple(coordinates[-2]), tuple(coordinates[-1]), (0, 255, 0), 1)
            cv2.imshow('image', img)
            if clicks == 3:
                angle = calculate_angle(coordinates)
                draw_triangle(img, coordinates)
                draw_text(img, "Angulo: {:.2f} graus".format(angle), (10, 30))
                cv2.imshow('image', img)
    else:
        if event == cv2.EVENT_RBUTTONDOWN:
            reset()
            cv2.imshow('image', img)


# Configurando a função de callback do mouse
cv2.setMouseCallback('image', mouse_click)

cv2.waitKey(0)
cv2.destroyAllWindows()
