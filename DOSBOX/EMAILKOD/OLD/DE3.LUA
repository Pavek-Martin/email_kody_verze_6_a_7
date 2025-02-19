os.execute("cls")
print("")

vybran_rar = "07052310.rar"

print(vybran_rar)

hledej_datum = string.sub(vybran_rar,1,8)
print(hledej_datum)
--os.exit()

cesta = "HESLA/"
cesta_rar_slozka = "ARCHIVY"

soubor = "rok" .. string.sub(vybran_rar,5,6) .. ".txt"
print(soubor)
--os.exit()

--hledej_datum = "xxxx" -- test aby nenasel

nalezeno_radek = 0
--os.execute("sleep 3")
file2 = io.open(cesta..soubor , "r")
if not file2 then
print("neexistuje soubor "..cesta..soubor)
print("napred vygenerovat soubor klicu")
print("pouzit soubor generuj.lua")
os.execute("sleep 3")
os.exit()
end

print("byl otevren soubor hesel "..cesta..soubor)
print(hledej_datum.." < datum hledany v souboru hesel")


pocitadlo_1 = 0
for radek in file2:lines() do
pocitadlo_1 = pocitadlo_1 + 1
--print(radek)
if hledej_datum == radek then
nalezeno_radek = 1
--print("nalezeno radek")
print(radek.." < nalezeno datum v souboru hesel radek ".. pocitadlo_1)
heslo = (file2:read())
--print(heslo)
print("")
break
else
--print("nenalezeno radek")
end -- if

end
file2:close()

if nalezeno_radek == 0 then
print("toto datum v souboru hesel nenalezeno")
os.exit()
end
os.execute("sleep 3")


--c2 = "rar t -p"..heslo.." "..vybrany_soubor_rar.." && sleep 5; rar x -p"..heslo.." -y "..vybrany_soubor_rar
--print(c2)
os.execute(c2)
os.execute("sleep 3")
print(heslo)
--
