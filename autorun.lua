local term = require("term")
local shell = require("shell")
local keyboard = require("keyboard")
local computer = require("computer")
local event = require("event")
local io = require("io")

u = io.open(".userName", "r")
 textu = u:read()
  u:close()

p = io.open(".passWord", "r")
 textp = p:read()
  p:close()

function check()

 if keyboard.isControlDown() and keyboard.isAltDown() then
  computer.shutdown(true)
 end
end
event.listen("key_down", check)

while true do
  term.clear()
  term.setCursor(1,1)
  term.write("User: ")
  username = term.read()
  username = string.gsub(username, "\n", "")
  term.setCursor(1,2)
  term.write("Password: ")
  password = term.read(nil, nil, nil, "")
  password = string.gsub(password, "\n", "")
  if username == textu and password == textp then
    term.clear()
    term.setCursor(1,1)
    print("Welcome, " ..textu)
    os.sleep(2.5)
    term.clear()
    term.setCursor(1,1)
    shell.setWorkingDirectory("/usr/home/" .. textu .. "/")
    shell.setAlias("usage", "/usage")
    break
  else
    term.clear()
    term.setCursor(1,1)
    term.write("Password incorrect...")
    os.sleep(2.5)
  end
end
