import os
import time

menu = '=' * 50 + '''
 SELAMAT DATANG DI RENTAL MOBIL \n''' +  '=' * 50 + '''
 Pilihan Jenis Mobil
 1. Kijang Inova Reborn         : Rp. 500.000
 2. Avanza                      : Rp. 350.000
 3. Honda Hrv                   : Rp. 400.000  \n '''

mobil = {
    'jenis mobil' : [
        {
            'nama' : 'Kijang Inova Reborn',
            'harga' : 500000,  
        },
        {
            'nama' : 'Avanza',
            'harga' : 350000,
        },
        {
            'nama' : 'Honda Hrv',
            'harga' : 400000
        },
    ],
}

def rupiah(uang) : 
    return 'Rp. {:0,.0f}'.format(uang).replace(',','.')

subtotal = []
def fungsi_mobil() : 
    while True : 
        os.system('cls || clear')
        print('='*50)
        print('Silahkan Pilih Mobil'.center(50))
        print(menu)
        try:
            nomor = int(input('Masukkan pilihan mobil: ')) - 1
            hari = int(input('Berapa hari: '))
            if nomor in range(len(mobil.get('jenis mobil'))) : 

                total = hari * mobil.get('jenis mobil')[nomor]['harga']
                nama_mobil = mobil.get('jenis mobil')[nomor]['nama']

                subtotal.append(total)
                print(f'Biaya peminjaman {nama_mobil}: {rupiah(total)}' )
                break
            else:
                print('Pilihan tidak ada, silahkan ulang program ...')
                time.sleep(3)
                continue
        except : 
            print('Masukkan input bertipe data integer ...')
            time.sleep(3)

def hitung_total():
    global total
    total = sum(subtotal)

i = 1
while True : 
    try :
        os.system('cls || clear')
        jumlah_rental = int(input('Masukkan jumlah rental mobil: '))
        break
    except : 
        print('Masukkan input bertipe data integer ...')
        time.sleep(3)
        continue

while i <= jumlah_rental:
    fungsi_mobil()
    if i == jumlah_rental:
        break
    i += 1

print('='*50)
hitung_total()
print('Total bayar : ', rupiah(total))

filename = 'pemasukan.txt'
fileku = open(filename, mode='a')
isi_fileku = fileku.write(f'{total}\n')
fileku.close()