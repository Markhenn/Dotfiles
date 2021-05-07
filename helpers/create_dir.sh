#!/bin/bash

temp=$(ls 'Old/Rechnungen_2020')

for obj in $temp; do
	mkdir Nebenkosten/"00$obj"
done



