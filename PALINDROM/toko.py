from prettytable import PrettyTable
import time
import os

listAlatTulis= [
    {
        'Buku Tulis' : 3000,
        'Pulpen' : 2000,
        'Pensil' : 1500,
        'Correction Pen' : 3000,
        'Penghapus' : 2000,
        'Peraut' : 2500,
        'Penggaris' : 4000,
        'Stabilo' : 3500,
        'Sticky Notes' : 3000,
        'Spidol' : 7000,
        'Paper Clip' : 4500,
        'Lem Kertas' : 8000,
        'Selotip' : 5000
    }
]

display = PrettyTable()
display.field_names = ['No','Nama alat tulis','Harga alat tulis','Satuan']

[ display.add_row([ list(listAlatTulis[0].keys()).index(x[0]) + 1 ,x[0], "Rp. {:0,.0f}".format(x[1]).replace(',','.'), 'pcs']) for x in listAlatTulis[0].items() ]


listBeli = []

def hitungPembelian(arr) : 
    rincian = PrettyTable()
    rincian.field_names = ['No','Nama alat tulis', 'Jumlah', 'Harga']
    total = 0

    print(' ' * 10, 'Rincian Pembayaran',' ' * 10)
    for x in range(len(arr)) : 
        nama = list(listAlatTulis[0].keys())[ arr[x][0] ]
        jumlah = arr[x][1]
        harga = list(listAlatTulis[0].values())[ arr[x][0] ] * jumlah
        total += harga

        rincian.add_row([x + 1, nama, f'{jumlah} (pcs)', "Rp. {:0,.0f}".format(harga).replace(',','.') ] )
    rincian.add_row([' ',' ',' ',' '])

    rincian.add_row([' ',' ','Total : ',"Rp. {:0,.0f}".format(total).replace(',','.')])
    print(rincian)
    
    with open('income.txt', 'a') as income : 
        income.write(str(total) + '\n')
        income.close()

while True : 
    print("""Toko Mawar (Perlengkapan alat tulis)

Daftar harga alat tulis""")
    print(display)
    beli = input('Mau beli alat tulis apa (No ) : ') + ' '
    beli += input('Jumlahnya berapa (pcs) : ')
    
    if beli.replace(' ','').isdigit() and int(beli.split()[0]) in range(1,len(listAlatTulis[0]) + 1) : 
        # beli = list(map(lambda x : int(x) ,beli.split()))
        beli = beli.split()
        beli = list([ int(beli[0]) - 1, int(beli[1]) ])
        listBeli.append(beli)
    else : 
        os.system('clear || cls')
        print('Mohon Masukkan Angka dan pastikan \nnomor alat tulis sesuai daftar ...')
        time.sleep(5)
        continue
    
    belum = input('Mau tambah pesanan lagi jawab [ya/tidak] ? ')   

    if belum.lower() != 'ya' : 
        hitungPembelian(listBeli)
        input('tekan Enter pada keyboard untuk mengakhiri\n')
        break

# hitungPembelian([[1,12], [1,12]])