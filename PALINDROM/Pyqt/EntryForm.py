from PyQt5.QtWidgets import (QDialog, QGridLayout, QHBoxLayout, QLabel, QLineEdit, QPushButton)
from PyQt5.QtCore import QRegularExpression
from PyQt5 .QtGui import  QDoubleValidator, QIntValidator,QRegularExpressionValidator

class EntryForm(QDialog):
    def __init__(self):
        super().__init__()
        self.setupUi()
        
    def setupUi(self):
        self.resize(300, 100)
        self.move(191, 300)
        self.setWindowTitle('Tambah/Ubah Kontak')
        
        self.okButton = QPushButton('OK')
        self.cancelButton = QPushButton('Batal')
        
        hbox = QHBoxLayout()
        hbox.addWidget(self.okButton)
        hbox.addWidget(self.cancelButton)
        
        self.label1 = QLabel("Nama Lengkap : ")
        self.nameLineEdit = QLineEdit()
        self.label2 = QLabel("Nomor HP : ")
        self.phoneLineEdit = QLineEdit()
        
        #validator agar nama tidak bisa input angka dan no telp tidak bisa dimasukkan huruf
        self.nameLineEdit.setValidator(QRegularExpressionValidator(QRegularExpression('[^\d]+')))
        self.phoneLineEdit.setValidator(QRegularExpressionValidator(QRegularExpression('[\d]+')))
        # self.phoneLineEdit.setValidator(QIntValidator())
        
        layout = QGridLayout()
        layout.addWidget(self.label1, 0, 0)
        layout.addWidget(self.nameLineEdit, 0, 1)
        layout.addWidget(self.label2, 1, 0)
        layout.addWidget(self.phoneLineEdit, 1, 1)
        layout.addLayout(hbox, 2, 1)
        self.setLayout(layout)
        
        self.okButton.clicked.connect(self.accept)
        self.cancelButton.clicked.connect(self.reject)
