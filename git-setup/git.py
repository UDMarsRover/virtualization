import sys
from PyQt6.QtWidgets import QApplication, QWidget, QVBoxLayout, QLabel, QLineEdit, QPushButton, QMessageBox, QTextEdit, QHBoxLayout
from PyQt6.QtGui import QClipboard
import os
import subprocess

class GitCredentialsApp(QWidget):
    def __init__(self):
        super().__init__()
        self.initUI()

    def initUI(self):
        self.setWindowTitle('Git Credentials')
        self.setGeometry(100, 100, 300, 400)

        layout = QVBoxLayout()

        self.name_label = QLabel('Name:')
        self.name_input = QLineEdit()
        layout.addWidget(self.name_label)
        layout.addWidget(self.name_input)

        self.email_label = QLabel('Email:')
        self.email_input = QLineEdit()
        layout.addWidget(self.email_label)
        layout.addWidget(self.email_input)

        self.save_button = QPushButton('Save')
        self.save_button.clicked.connect(self.save_credentials)
        layout.addWidget(self.save_button)

        self.ssh_key_label = QLabel('SSH Key:')
        layout.addWidget(self.ssh_key_label)

        ssh_key_layout = QHBoxLayout()
        self.ssh_key_display = QTextEdit()
        self.ssh_key_display.setReadOnly(True)
        ssh_key_layout.addWidget(self.ssh_key_display)

        self.copy_button = QPushButton('Copy')
        self.copy_button.clicked.connect(self.copy_ssh_key)
        ssh_key_layout.addWidget(self.copy_button)

        layout.addLayout(ssh_key_layout)

        self.setLayout(layout)

        self.setStyleSheet("""
            QWidget {
                background-color: #f0f0f0;
                font-family: Arial, sans-serif;
            }
            QLabel {
                font-size: 14px;
                color: #333;
            }
            QLineEdit {
                font-size: 14px;
                padding: 5px;
                border: 1px solid #ccc;
                border-radius: 4px;
                color: #333;
            }
            QPushButton {
                font-size: 14px;
                padding: 10px;
                background-color: #4CAF50;
                color: white;
                border: none;
                border-radius: 4px;
            }
            QPushButton:hover {
                background-color: #45a049;
            }
            QTextEdit {
                font-size: 14px;
                padding: 5px;
                border: 1px solid #ccc;
                border-radius: 4px;
                color: #333;
                background-color: #fff;
            }
        """)

        self.check_ssh_key()

    def save_credentials(self):
        name = self.name_input.text()
        email = self.email_input.text()

        if name and email:
            os.system(f'git config --global user.name "{name}"')
            os.system(f'git config --global user.email "{email}"')
            QMessageBox.information(self, 'Success', 'Credentials saved successfully!')
        else:
            QMessageBox.warning(self, 'Error', 'Please enter both name and email.')

    def check_ssh_key(self):
        ssh_key_path = os.path.expanduser('~/.ssh/id_rsa.pub')
        if not os.path.exists(ssh_key_path):
            self.create_ssh_key()
        self.display_ssh_key()

    def create_ssh_key(self):
        subprocess.run(['ssh-keygen', '-t', 'rsa', '-b', '4096', '-f', os.path.expanduser('~/.ssh/id_rsa'), '-N', ''])

    def display_ssh_key(self):
        ssh_key_path = os.path.expanduser('~/.ssh/id_rsa.pub')
        if os.path.exists(ssh_key_path):
            with open(ssh_key_path, 'r') as file:
                ssh_key = file.read()
                self.ssh_key_display.setText(ssh_key)
        else:
            self.ssh_key_display.setText('No SSH key found.')

    def copy_ssh_key(self):
        clipboard = QApplication.clipboard()
        clipboard.setText(self.ssh_key_display.toPlainText())
        QMessageBox.information(self, 'Copied', 'SSH key copied to clipboard!')

if __name__ == '__main__':
    app = QApplication(sys.argv)
    ex = GitCredentialsApp()
    ex.show()
    sys.exit(app.exec())