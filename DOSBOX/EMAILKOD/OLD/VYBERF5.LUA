os.execute("cls")
print()

os.execute("dir ARCHIVY > soub_rar.txt")
os.execute("sleep 5")
--os.exit()

t={}
file = io.open("soub_rar.txt", "r")
while true do
radek=(file:read())
if radek ~= nil then
--print(radek)

table.insert(t,radek)
else
break
end

end --while

file:close()

--print(#t)


pwd=t[1]
--print(pwd)


t2={}
for aa = 4,#t - 2 do
hl1=" RAR "
nal1=string.find(t[aa],hl1)

if nal1 ~= nil then
vloz_adresar = string.sub(t[aa],1,8)
vloz_adresar=vloz_adresar .. ".rar"
--print(vloz_adresar)
table.insert(t2,vloz_adresar)
end

end

t=nil

if #t2 == 0 then
print('nenalezen adresar "ARCHIVY" a nebo vnem nejsou zadne soubory *.rar')
print("konec programu")
os.execute("del soub_rar.txt")
os.execute("sleep 10")
os.exit()
end


for bb = 1,#t2 do
print(bb.." " ..t2[bb])
end

print("?")
volba_soubor=tonumber(io.read())
--print(volba_soubor)

if volba_soubor < 1 or volba_soubor > #t2 then
print("spatne zadani")
print("konec programu")
os.execute("sleep 10")
os.exit()
end

--print(type(volba_soubor))
--os.exit()

vybran_rar=(t2[volba_soubor])
print(vybran_rar)
os.execute("del soub_rar.txt")
os.execute("sleep 10")

--

