import socket

alvo = input("Alvo: ")
sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
sock.connect_ex((alvo, 22))
sock.settimeout(20)
print(sock.recv(2048))
socket.close()
