import cv2
# import numpy as np

# class ResizeImg:
def resizeImg(imgSrc):
    inputImg = cv2.imread(imgSrc)
    oriH, oriW = inputImg.shape[:2]
    # if oriH>1000 or oriW>600:
    resizedImg = cv2.resize(inputImg, (int(oriW * 0.3), int(oriH * 0.3)), interpolation=cv2.INTER_AREA)
    cv2.imwrite(imgSrc, resizedImg)

# def test():
#     imgTitle = "test2.JPG"
#     imgSrc = '../image/test1.JPG'
#     inputImg = cv2.imread(imgSrc)
#     oriH, oriW = inputImg.shape[:2]
#     if oriH > 1000 or oriW > 600:
#         resizedImg = cv2.resize(inputImg, (int(oriW * 0.5), int(oriH * 0.5)), interpolation=cv2.INTER_AREA)
#         cv2.imshow("oriImg", inputImg)
#         cv2.imshow("resizedImg", resizedImg)
#         cv2.imwrite(imgTitle, resizedImg)
#         cv2.waitKey(0)
#         cv2.destroyAllWindows()

# test()