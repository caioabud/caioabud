import socket
alvo = input("Alvo: ")
portas = [21, 22, 80, 443, 53, 23, 8080]
for porta in portas:
    sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    sock.settimeout(1)
    resultado = sock.connect_ex((alvo,porta))
    sock.close()
    if (resultado == 0):
        print(porta)