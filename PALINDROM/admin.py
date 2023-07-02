import os
import time
from prettytable import PrettyTable

validasi = {
    'username' : 'Besse', 
    'password' : '221011062'
}

while True : 
    username = input('Masukkan Nama-mu : ') 
    password = input('Masukkan NPM-mu : ')
    pilih = ''

    if username == validasi.get('username') and password == validasi.get('password') : 
        while True :
            os.system('clear || cls')
            print(f"""Selamat datang Admin : {username}""")
            print("""1. Lihat Pendapatan
2. Exit
            """)
            pilih = input('Silahkan pilih menu : ')
            try: 
                if pilih.isdigit() and int(pilih) in range(1,3) : 
                    break
            except : 
                pass
            else :
                print('Maaf Menu Tidak Dikenal Silahkan Coba Lagi ...')
                time.sleep(3)
    
    else : 
        print('Maaf kredensial tidak dikenal silahkan coba lagi ...')
        time.sleep(3)
        os.system('clear || cls')
        continue
        
    if pilih == '1' : 
        with open('income.txt', 'r+') as income : 
            rincianIncome = PrettyTable()
            rincianIncome.field_names = ['No', 'Pendapatan']

            incomeText = income.read().splitlines()
            total = 0

            for x in range(len(incomeText)) : 
                total += int(incomeText[x])
                rincianIncome.add_row([f'transaksi ke - {x + 1}', 'Rp. {:0,.0f}'.format(int(incomeText[x])).replace(',','.')])

            rincianIncome.add_row(['Total : ', "Rp. {:0,.0f}".format(total).replace(',','.')])

            print(rincianIncome)
            
    if pilih == '2' : 
        belum = input('Mau balik ke menu lagi jawab [ya/tidak] ? ')   

        if belum.lower() != 'ya' : 
            input('tekan Enter pada keyboard untuk mengakhiri\n')
            break    