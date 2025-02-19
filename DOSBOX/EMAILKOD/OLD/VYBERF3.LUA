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

if #t == 0 then
print("nic nenalezeno")
os.exit()
end


pwd=t[1]
--print(pwd)


t2={}
for aa = 4,#t - 2 do
hl1=" RAR "
nal1=string.find(t[aa],hl1)

if nal1 ~= nil then
--print(string.sub(t[aa],1,12))
vloz_adresar = string.sub(t[aa],1,12)
--print(vloz_adresar)
table.insert(t2,vloz_adresar)
end

end

t=nil
if #t2 == 0 then
print("nenalezeny zadne soubory *.RAR")
--os.execute("del soub_rar.txt")
os.execute("sleep 10")
os.exit()
end

t3={}
for bb = 1,#t2 do
print(bb.."-  " ..t2[bb])
end


os.execute("sleep 5")
os.exit()

--

