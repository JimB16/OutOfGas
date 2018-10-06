# -*- coding: utf-8 -*-

import os
import sys
import struct


def DecompressRLE(data):
    ret = ()
    length_individuals = 0
    length_repetition = 0
	
    for i in range(len(data)-1):
        if length_individuals > 0:
            ret = ret + (data[i],)
            length_individuals = length_individuals - 1
        elif length_repetition > 0:
            for j in range(length_repetition):
                ret = ret + (data[i],)
            length_repetition = 0
        elif data[i] >= 128:
            length_individuals = data[i] - 128
            length_repetition = 0
        else:
            length_individuals = 0
            length_repetition = data[i]

    return ret

def CompressRLE(data):
    ret = ()
    length_individuals = 0
    length_repetition = 0
    individuals = ()
    repeat_counter = 0
    repeated_value = 0
	
    i = 0
    while i < (len(data)):
        while (i < (len(data)-1)) and (data[i] != data[i+1]):
            individuals = individuals + (data[i],)
            i+=1
        if i == (len(data)-1):
            individuals = individuals + (data[i],)
            i+=1
        if len(individuals) > 0:
            ret = ret + ((len(individuals)+128),) + individuals
            individuals = ()

        while (i < (len(data)-1)) and (data[i] == data[i+1]) and (repeat_counter < 125):
            repeat_counter+=1
            repeated_value = data[i]
            i+=1
        if repeat_counter > 0:
            repeat_counter+=1
            i+=1
            ret = ret + (repeat_counter,) + (repeated_value,)
            repeat_counter = 0

    ret = ret + (255,)
    return ret


if __name__ == "__main__":
    filename = sys.argv[1]
    output_folder = sys.argv[2]
    cmd = sys.argv[3]
    
    unpacked_data = 0
    
    with open(os.path.join(os.getcwd(), filename), "rb") as binary_file:
        data = binary_file.read()
        file_length_in_bytes = os.path.getsize(os.path.join(os.getcwd(), filename))
        typeFormat = "B" * file_length_in_bytes
        unpacked_data = (struct.unpack(typeFormat, data))
    
    if cmd == "-d":
        decompressed_data = DecompressRLE(unpacked_data)
    elif cmd == "-c":
        decompressed_data = CompressRLE(unpacked_data)
	
    if not os.path.exists(os.path.dirname(output_folder)):
        os.makedirs(os.path.dirname(output_folder))        
    head, tail = os.path.split(filename)
    if cmd == "-d":
	    tail = tail.replace(".rle", ".bin")
    elif cmd == "-c":
	    tail = tail.replace(".bin", ".rle")
    with open(os.path.join(output_folder + tail), 'w') as out:
        binary_data = struct.pack("B" * len(decompressed_data), *decompressed_data)
        out.write(binary_data)
