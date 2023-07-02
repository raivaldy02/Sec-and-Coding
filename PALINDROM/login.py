def rupiah(uang) : 
    return 'Rp. {:0,.0f}'.format(uang).replace(',','.')

user_name = input('Username : ')
user = 'Lia'
while user_name != user:
     print('Username tidak valid')
     user_name = input('Username : ')

passcode = input('Masukkan Passcode : ')
real_passcode = '221031066'

while passcode != real_passcode:
     print('Kode yang anda masukkan salah!')
     passcode = input('Masukkan Passcode : ')

filename = 'pemasukan.txt'
fileku = open(filename, mode='r')
isi_fileku = list(map(lambda x : int(x), fileku.read().splitlines()))
print('TOTAL PEMASUKAN ', rupiah(sum(isi_fileku)) )