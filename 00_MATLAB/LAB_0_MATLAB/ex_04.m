% EXERCISE 4

clear all
close all
clc

% One of the uses of logical tests is to mask out certain elements of a matrix.

x = [-2 3.1416 5; -5 -3 -1]
L = x >= 0

pos = x.*L
