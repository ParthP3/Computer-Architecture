import os
import random
import time

time1=[]

for i in range(6,12):
    print(i)
    a=pow(2,i)
    for k in range(int(2048/a)):
        print(f"k = {k}")
        f = open("matrix.txt", 'w')
        f.write(str(a)+"\n")
        f.write(str(a)+"\n")
        f.write(str(a)+"\n")
        f.write(str(a)+"\n")
        for j in range(2*a*a):
            f.write(str(random.randint(0, 1000))+"\n")
        t1=time.time()
        os.system("./matrix-kji.o <matrix.txt 1>/dev/null")
        t2=time.time()
        time1.append(t2-t1)
        f.close()
g=open("timingskji.txt", 'w')
g.write(str(time1))
g.close()
    
    