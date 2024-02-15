# -*- coding: utf-8 -*-
"""
Created on Thu Oct  5 13:35:28 2023

@author: HintsOfOrangeCat

"""
import csv

# with open('DEPARTEMENTS.csv', 'r') as csv_file:
#   csv_reader = csv.reader(csv_file)
#   with open('output.txt', 'w') as text_file:
#     for row in csv_reader:
#       line =",".join(row)
#       text_file.write(line + '\n')


# print('finished extracting')


# Open the input CSV file and the output text file
with open('DEPARTEMENTS.csv', 'r', encoding='utf-8') as csv_file, open('final_regions.txt', 'w', encoding='utf-8') as output_file:
    # Read the CSV file with semicolon delimiter
    csv_reader = csv.reader(csv_file, delimiter=';')
    
    # Iterate through the rows, process each row, and write to the output text file
    for row in csv_reader:
        # Create a tuple from the row values
        output_tuple = tuple(row)
        
        # Write the tuple as a string to the output text file
        output_file.write(str(output_tuple) + ',\n')
print('finished')

# # Open the input text file and the output text file
# with open('input_file.txt', 'r', encoding='utf-8') as txt_file, open('output_file.txt', 'w', encoding='utf-8') as output_file:
#     # Read each line from the input text file
#     lines = txt_file.readlines()
    
#     # Process each line and write the formatted data to the output text file
#     for line in lines:
#         # Split the line using semicolon as the delimiter
#         values = line.strip().split(';')
        
#         # Create a tuple from the split values
#         output_tuple = tuple(values)
        
#         # Write the tuple as a string to the output text file
#         output_file.write(str(output_tuple) + '\n')
