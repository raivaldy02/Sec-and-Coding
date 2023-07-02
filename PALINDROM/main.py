def word():
    charcount=0
    for i in text:
        charcount+=1

#function which return reverse of a string
def isPalindrome(s):
        return s == s[::-1]

from string import ascii_letters
import sys

lagi = True
while lagi : 
    print('Menu')
    print("1. Melalui program")
    print("2. Melalui text file")
    pilihan = input("Masukkan input sesuai dengan pilihan pada layar anda\n")

    if pilihan not in ['1','2'] : 
        print("Mohon masukkan input sesuai dengan pilihan pada layar anda")
        continue

    pilihan = int(pilihan)
    
    if pilihan == 1:
        #minta input dari user dalam bentuk string
        print("Silakan mengetik")
        text = sys.stdin.read()
    elif pilihan == 2:
        file = input("Masukkan nama file\n")
        text = open(file + '.txt',"r")
        text = text.read()
    
    #menghitung jumlah huruf
    jumlahhuruf=0
    for i in text:
        if i in ascii_letters : 
            jumlahhuruf += 1
    
    #menghitung jumlah kata
    res = len(text.split())
    
    #menghitung jumlah kalimat
    jumlahkalimat = text.count(".")
    
    #menghitung paragraf
    jumlahparagraf = list()

    for x in text.splitlines() : 
        if x.strip() != '' :
            jumlahparagraf.append(x)

    jumlahparagraf = len(jumlahparagraf)

    #menghitung jumlah palindrom
    jumlahpalindrom = 0
    for token in text.split():
        if isPalindrome(token):
            jumlahpalindrom += 1
    
    
    print('\n' * 1)
    print("Jumlah huruf =",jumlahhuruf)
    print("Jumlah kata =",str(res))
    print("Jumlah kalimat =",jumlahkalimat)
    print("Jumlah palindrom =",jumlahpalindrom)
    print("Jumlah paragraf =",jumlahparagraf)

    decision = input('Lagi atau tidak ? (Y/N) : ')
    lagi = True if decision.lower() == 'y' else False
    

    