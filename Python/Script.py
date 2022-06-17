from pprint import pprint
from matplotlib import pyplot
from os import system


############Seccion de definiciones: Diccionarios, funciones, etc#################

Codigo_Genetico = {
#                        Second Base
#        T             C             A             G
# T
    'TTT': 'F', 'TCT': 'S', 'TAT': 'Y', 'TGT': 'C',     # TxT
    'TTC': 'F', 'TCC': 'S', 'TAC': 'Y', 'TGC': 'C',     # TxC
    'TTA': 'L', 'TCA': 'S', 'TAA': 'X', 'TGA': 'X',     # TxA
    'TTG': 'L', 'TCG': 'S', 'TAG': 'X', 'TGG': 'W',     # TxG
# C
    'CTT': 'L', 'CCT': 'P', 'CAT': 'H', 'CGT': 'R',     # CxT
    'CTC': 'L', 'CCC': 'P', 'CAC': 'H', 'CGC': 'R',     # CxC
    'CTA': 'L', 'CCA': 'P', 'CAA': 'Q', 'CGA': 'R',     # CxA
    'CTG': 'L', 'CCG': 'P', 'CAG': 'Q', 'CGG': 'R',     # CxG
# A
    'ATT': 'I', 'ACT': 'T', 'AAT': 'N', 'AGT': 'S',     # AxT
    'ATC': 'I', 'ACC': 'T', 'AAC': 'N', 'AGC': 'S',     # AxC
    'ATA': 'I', 'ACA': 'T', 'AAA': 'K', 'AGA': 'R',     # AxA
    'ATG': 'M', 'ACG': 'T', 'AAG': 'K', 'AGG': 'R',     # AxG
# G
    'GTT': 'V', 'GCT': 'A', 'GAT': 'D', 'GGT': 'G',     # GxT
    'GTC': 'V', 'GCC': 'A', 'GAC': 'D', 'GGC': 'G',     # GxC
    'GTA': 'V', 'GCA': 'A', 'GAA': 'E', 'GGA': 'G',     # GxA
    'GTG': 'V', 'GCG': 'A', 'GAG': 'E', 'GGG': 'G'      # GxG
}

Hydropathy_Scores = {
        'I':	 4.5,
        'V':	 4.2,
        'L':	 3.8,
        'F':	 2.8,
        'C':	 2.5,
        'M':	1.9,
        'A':	1.8,
        'G':	-0.4,
        'T':	-0.7,
        'S':	-0.8,
        'W':	-0.9,
        'Y':	-1.3,
        'P':	-1.6,
        'H':	-3.2,
        'E':	-3.5,
        'Q':	-3.5,
        'D':	-3.5,
        'N':	-3.5,
        'K':	-3.9,
        'R':	-4.5
}

def Leer_FASTA_short(filename):
       with open(filename) as file:
           #Lee el contenido del archivo como un solo string
           tmp = file.read().partition('\n')
           file.close()
           #return tmp[2].replace('\n', '')
           return [tmp[0], tmp[2].replace('\n', '')]


def Guardar_Fasta(titulo, sequence, filename):
    with open(filename, "w") as file:
        file.write("%s\n" % titulo)
        for (n, residue) in enumerate(sequence):
            if n > 0 and n % 60 == 0:
                file.write("\n")
            file.write(residue)
        if n % 60 != 0:
           file.write("\n")
    file.close()


def Traduccion(sequence):
    proteina = ''
    for i in range(0, len(sequence),3):
        codon = sequence[i:i+3]
        #print (codon)
        aminoacido = Codigo_Genetico[codon]
        #print (aminoacido)
        if aminoacido != 'X':
            proteina = proteina + aminoacido
    return proteina

def Hydropathy_Scan(protein, windowsize, filename):
    values = []
    with open(filename, 'w') as file:
        file.write("Position, Score\n")
        for i in range(0, len(protein)-windowsize):
            peptide = protein[i:i+20]
            acumscore = 0
            for j in range(0, windowsize):
                aa = peptide[j]
                score = Hydropathy_Scores[aa]
                acumscore = acumscore + score
            avescore = acumscore/windowsize
            file.write("%d, %.2f\n" % (i+1,avescore))
            values.append((i+1,avescore))
    file.close()
    return values

############Cuerpo principal del programa#############################################

def main():
    #system('clear')
    #Lectura de la secuencia de DNA
    filename = 'V01169.fasta'
    title, sequence = Leer_FASTA_short(filename)   #Notar que la función regresa una lista !!!!
    print ("Título de la secuencia:\n%s" % (title))
    print ("Secuencia:\n%s" % (sequence))

    #Traduccion y almacenamiento de la proteina
    pprint (Codigo_Genetico)
    proteina = Traduccion(sequence)
    print ("\nSecuencia de la proteina:\n%s" % (proteina))
    filename = 'proteina.fasta'
    Guardar_Fasta(title, proteina, filename)

    #Analisis de la hidrofobicidad
    windowsize = 20
    filename = "KD_Scores.txt"
    #Hydropathy_Scan(proteina, windowsize, filename)
    values = Hydropathy_Scan(proteina, windowsize, filename)
    print ("Data saved in file ", filename)


    #plot with pyplot
    x_pos = [x[0] for x in values]
    y_kds = [x[1] for x in values]
    pyplot.plot(x_pos,y_kds, color='green', label="window size = 20")
    pyplot.xlabel('Position')
    pyplot.ylabel('Hydropathy')
    pyplot.title('Kyte & Doolittle hydropathy plot')
    pyplot.legend(loc='upper left')
    pyplot.show()


main()