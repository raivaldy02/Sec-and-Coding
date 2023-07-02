import time
import os

try : 
    from prettytable import PrettyTable
except : 
    os.system("pip install prettytable")
    from prettytable import PrettyTable


def lihat_nilai() : 
    if 'nilai.txt' not in os.listdir() : 
        with open('nilai.txt') as f : 
            f.close()

    with open('nilai.txt','r') as f : 
        data = f.read()
        if not data : 
            data = 'Data Kosong'
            print(data)
        else : 
            rincianNilai = PrettyTable()
            rincianNilai.field_names = ['No', 'Nama', 'NIM', 'Nilai Tugas', 'Nilai UTS', 'Nilai UAS', 'Rata-Rata']

            for num, val in enumerate(data.splitlines()) : 
                isi = val.split(',')
                rincianNilai.add_row([num + 1, isi[0], isi[1], isi[2], isi[3], isi[4], isi[5]])
            print(rincianNilai)

    input('Tekan Enter Untuk Kembali <ENTER> : ')
    
def input_nilai() : 
    nama = input('Masukkan Nama Mahasiswa : ')
    NIM = input('Masukkan NIM Mahasiswa : ')
    NTugas = input('Masukkan Nilai Tugas Mahasiswa : ')
    NUTS  = input('Masukkan Nilai UTS Mahasiswa : ')
    NUAS = input('Masukkan Nilai UAS Mahasiswa : ')
    avg = str((int(NTugas) + int(NUTS) + int(NUAS)) / 3)
    content = ','.join([nama, NIM, NTugas, NUTS, NUAS, avg])

    with open('nilai.txt','a+') as f : 
        f.write('\n' + content)
        f.close()
    
        
def hapus_nilai() : 
    target = input('Berapa nomor NIM yang akan dihapus ? : ')
    with open('nilai.txt','r') as f : 
        data = f.read()
        if not data or target not in data.split(',') : 
            data = 'Data Kosong'
        else : 
            newData = ''
            for num, val in enumerate(data.splitlines()) : 
                if val.split(',')[1] == target : 
                    continue
                newData += val 
            with open('nilai.txt','w') as a : 
                data = 'Data Sukses Dihapus'
                a.write(newData)
                a.close()
        f.close()
                
    print(data)
    input('Tekan Enter Untuk Kembali <ENTER> : ')



if __name__ == "__main__":  
    while True : 
        os.system("cls || clear")
        print("""Penilaian
1. Lihat Nilai
2. Input Nilai
3. Hapus Nilai
4. Exit""")
        pilih = input('Mau pilih no berapa (No ) : ')
        
        if pilih.replace(' ','').isdigit() and int(pilih.split()[0]) in range(1,5) : 
            if pilih == '1' : 
                os.system("cls || clear")
                lihat_nilai()
            elif pilih == '2' : 
                os.system("cls || clear")
                input_nilai()
            elif pilih == '3' :  
                os.system("cls || clear")
                hapus_nilai()
            else : 
                break

        else : 
            os.system('cls || clear')
            print('Mohon Masukkan Angka dan pastikan \npilihan sesuai daftar ...')
            time.sleep(5)
            continue