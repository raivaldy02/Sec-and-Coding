import os
import time
import importlib
import subprocess

importlib.find_loader('prettytable')
print('found')
time.sleep(3000)

if importlib.util.find_spec("prettytable") is None : 
    subprocess.run('pip install PTable', shell = True)
    print('Instalasi Sukses')
    from prettytable import PrettyTable
else : 
    from prettytable import PrettyTable

barangBelanja = []
totalharga = 0

def rupiah(uang) : 
    return 'Rp. {:0,.0f}'.format(uang).replace(',','.')

def baca_laporan():
    with open("laporan_belanjatani.txt", "r") as file:
        data = file.read()
        return data

def tulis_laporan():
    with open("laporan_belanjatani.txt", "w") as file:
        kosong = []
        data = file.write(file)
        return kosong 

def belanja() : 
    while True : 
        try : 
            os.system('cls')
            print('''Kategori
1. Pupuk 
2. Bibit
3. Menu Sebelumnya <<
''')
            pilihan = int(input('Masukkan pilihan menu diinginkan (No) : '))
            print('-'*50)
                
            if pilihan == 1 : 
                pupuk()
                break
            elif pilihan == 2 : 
                bibit()
                break
            elif pilihan == 3 : 
                menuUtama()
            else : 
                print('Maaf Menu Tidak Dikenal Silahkan Coba Lagi ...')
                time.sleep(3)
                continue

        except : 
            print('Masukkan input bertipe data integer ...')
            time.sleep(3)
            continue

def pupuk () : 
    listPupuk = [
        [
            'Kandang Setia Tani', 
            34000, 
            '> dari kotoran hewan\n> memperbaiki kesuburan dan struktur tanah\n> perbaikan struktur tanah\n> penyediaan unsur hara'
        ],

        [
            'Digrow Hijau', 
            43000, 
            '> dari tumbuhan\n> menambah unsur hara tanah, terutama nitrogen\n> perbaikan sifat fisik, kimia dan biologi tanah\n> ketahanan tanah terhadap erosi'
        ],

        [
            'Kompos Bokhasi',
            21000,
            '> dari sisa bahan organik: tumbuhan, hewan, dan limbah organik secara alami dengan cara dekomposisi atau fermentasi\n> memberikan nutrisi pada tanaman.\n> meningkatkan Kapasitas Tukar Kation (KTK)\n> mampu meningkatkan pH tanah pada tanah asam.\n> meningkatkan ketersediaan unsur mikro.'
        ],

        [
            'Hayati Organik Micorin',
            27000, 
            '> pupuk mikrobiologis (biofertilizer)\n> membantu memperbaiki struktur tanah\n> memproduksi nutrisi bagi tanah dan tanaman\n> memangkas pertumbuhan parasit bagi tanaman'
        ],

        [
            'Humic Acid Humus', 
            68000, 
            '> dari pelapukan daun-daunan dan ranting tanaman yang membusuk\n> membantu meningkatkan kadar air tanah\n> mencegah erosi\n> mempercepat proses penghancuran senyawa beracun dalam tanah'
        ] 
    ]

    while True : 
        try : 
            os.system('cls')  
            print(f'''Beberapa Produk teratas dari kami : ''',end='\n' * 2)
            for x in range(len(listPupuk)) : 
                print(f'''{x + 1}. Pupuk {listPupuk[x][0]}''',end=' ')
                print(f'({rupiah(listPupuk[x][1])},-)')
                # print(listPupuk[x][2])
            print(f'''{len(listPupuk) + 1}. Deskripsi Pupuk''')    
            print(f'''{len(listPupuk) + 2}. Menu Sebelumnya <<''')

            pilihan = int(input('\nMasukkan Pupuk yang ingin dibeli (No) : '))
            if pilihan in range(1,len(listPupuk) + 1) : 
                os.system('cls')
                pilihan -= 1
                namaPupuk = 'Pupuk ' + listPupuk[pilihan][0]
                hargaPupuk = listPupuk[pilihan][1]

                print(f'''{pilihan + 1}. {namaPupuk} ({rupiah(hargaPupuk)},-)''')

                jumlahPupuk = int(input('Masukkan jumlah : '))
                totalBayarPupuk = jumlahPupuk * hargaPupuk

                barangBelanja.append([namaPupuk, jumlahPupuk, totalBayarPupuk])
                continue

            elif pilihan == 6 : 
                os.system('cls')
                print('Deskripsi Pupuk', end='\n' * 2)
                for x in range(len(listPupuk)) : 
                    print(f'''{x + 1}. Pupuk {listPupuk[x][0]}''',end=' ')
                    print(f'({rupiah(listPupuk[x][1])},-)')
                    print(listPupuk[x][2])
                    print()
                pilihan = int(input('Kembali ke menu sebelumnya\ntekan 7 pada keyboard lalu enter : '))
                if pilihan == 7 : 
                    continue

            elif pilihan == 7 : 
                belanja()   

            else : 
                print('Maaf Menu Tidak Dikenal Silahkan Coba Lagi ...')
                time.sleep(3)
                continue

        except : 
            print('Masukkan input bertipe data integer ...')
            time.sleep(3)
            continue


def bibit () :  
    listBibit = [
        [
            'Padi', 
            34000, 
            'mengandung lempung, pasir, dan debu.'
        ],

        [
            'Jagung', 
            47000, 
            'andosol (berasal dari gunung berapi), latosol, grumosol, tanah berpasir.'
        ],

        [
            'Kubis',
            49000,
            'kaya nutrisi dan berdrainase baik.'
        ],

        [
            'Cabai',
            98000, 
            'memiliki bahan dasar berupa endapan debu atau liat'
        ],

        [
            'Terong', 
            51000, 
            'berlempung pasir dengan kisaran pH 6,5-7'
        ] 
    ]

    while True : 
        try : 
            os.system('cls')  
            print(f'''Beberapa Produk teratas dari kami : ''',end='\n' * 2)

            for x in range(len(listBibit)) : 
                print(f'''{x + 1}. Bibit {listBibit[x][0]}''',end=' ')
                print(f'({rupiah(listBibit[x][1])},-)')

            print(f'''{len(listBibit) + 1}. Deskripsi Bibit''')    
            print(f'''{len(listBibit) + 2}. Menu Sebelumnya <<''')

            pilihan = int(input('\nMasukkan Bibit yang ingin dibeli (No) : '))

            if pilihan in range(1,len(listBibit) + 1) : 
                os.system('cls')
                pilihan -= 1
                namaBibit = 'Bibit ' + str(listBibit[pilihan][0])
                hargaBibit = listBibit[pilihan][1]


                print(f'''{pilihan + 1}. {namaBibit} ({rupiah(hargaBibit)},-)''')

                jumlahBibit = int(input('Masukkan jumlah : '))
                totalBayarBibit = jumlahBibit * hargaBibit

                barangBelanja.append([namaBibit, jumlahBibit, totalBayarBibit])
                continue

            elif pilihan == 6 : 
                os.system('cls')
                print('Deskripsi Bibit', end='\n' * 2)
                for x in range(len(listBibit)) : 
                    print(f'''{x + 1}. Bibit {listBibit[x][0]}''',end=' ')
                    print(f'({rupiah(listBibit[x][1])},-)')
                    print(listBibit[x][2])
                    print()
                pilihan = int(input('Kembali ke menu sebelumnya\ntekan 7 pada keyboard lalu enter : '))
                if pilihan == 7 : 
                    continue

            elif pilihan == 7 : 
                belanja()   

            else : 
                print('Maaf Menu Tidak Dikenal Silahkan Coba Lagi ...')
                time.sleep(3)
                continue
            
        except : 
            print('Masukkan input bertipe data integer ...')
            time.sleep(3)
            continue

def checkout() : 
    while True : 
        try : 
            os.system('cls')
            global barangBelanja
            # barangBelanja = [
            #     ['Pupuk Sani', 12, 13000],
            #     ['Pupuk Lagi', 12, 13000]
            # ]
            print('List barang yang akan dibeli: \n')

            listPembayaran = PrettyTable()
            listPembayaran.field_names = ['No', 'Nama', 'Jumlah', 'Bayar']
            total = 0

            for x in range(len(barangBelanja)) : 
                total += barangBelanja[x][2]
                listPembayaran.add_row([f'{x + 1}.', barangBelanja[x][0], barangBelanja[x][1], rupiah(barangBelanja[x][2]) + ',-'])
            listPembayaran.add_row(['','','Total : ', rupiah(total) + ',-'])

            print(listPembayaran)
            print()
            print('''Apakah anda yakin ? 
1. Ya
2. Tidak, Kembali ke Menu Awal\n''')

            pilihan = int(input('Masukkan pilihan menu diinginkan (No) : '))
            if pilihan == 1 : 
                print('Terimakasih Silahkan membayar dengan nominal sebesar ',rupiah(total) + ',-')
                time.sleep(3)
                break
            elif pilihan == 2 : 
                listPembayaran = []
                menuUtama()
            else : 
                print('Maaf Menu Tidak Dikenal Silahkan Coba Lagi ...')
                time.sleep(3)
                continue
        except : 
            print('Masukkan input bertipe data integer ...')
            time.sleep(3)
            continue
        

def menuUtama() : 
    belum = 'ya'
    while belum != 'tidak' : 
        try : 
            os.system('cls')
            print ( f"""Selamat Datang {nama}
Silahkan Pilih Menu 
Menu:\n1. Belanja Tani \n2. Laporan Pembelian\n3. Exit\n""") 
            pilihan = int(input('Masukkan pilihan menu diinginkan (No) : '))
            print('-'*50)
            
            if pilihan == 1 : 
                belanja()
            elif pilihan == 2 : 
                checkout()
            elif pilihan == 3 : 
                belum = input('Mau balik ke menu lagi jawab [ya/tidak] ? ')

                if belum.lower() != 'ya' : 
                    input('tekan Enter pada keyboard untuk mengakhiri\n')
                    belum = 'tidak'    
            else : 
                print('Maaf Menu Tidak Dikenal Silahkan Coba Lagi ...')
                time.sleep(3)
                continue
        except : 
            print('Masukkan input bertipe data integer ...')
            time.sleep(3)
            continue
        
    

print ( ' Selamat Datang di Tanipedia '.center(50,'-') ) 
# nama =  input ( "Silakan Masukkan Nama Anda : " ) 
nama = 'valdy'
menuUtama()