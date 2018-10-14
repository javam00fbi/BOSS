--[[
#    ▀█████████▄   ▄██████▄     ▄████████    ▄████████
#      ███    ███ ███    ███   ███    ███   ███    ███
#      ███    ███ ███    ███   ███    █▀    ███    █▀
#     ▄███▄▄▄██▀  ███    ███   ███          ███
#    ▀▀███▀▀▀██▄  ███    ███ ▀███████████ ▀███████████ ¦ Dev : @TH3BOSS
#      ███    ██▄ ███    ███          ███          ███ ¦ Dev : @BLCON
#      ███    ███ ███    ███    ▄█    ███    ▄█    ███
#    ▄█████████▀   ▀██████▀   ▄████████▀   ▄████████▀  ¦ Source TH3BOSS BY @TH3BS
#---------------------------------------------------------------------
]] 
Er_cjson, JSON  = pcall(require, "cjson")
Er_ssl,   https = pcall(require, "ssl.https")
Er_url,   URL   = pcall(require, "socket.url")
Er_http,  http  = pcall(require, "socket.http")
Er_redis, redis = pcall(require, "redis")

redis = redis.connect('127.0.0.1',6379)
http.TIMEOUT = 4

if not Er_cjson then
print("('\n\27[1;31m￤Pkg _ Cjson is Not installed.('\n\27[0m￤")
os.exit()
end
if not Er_http then
print("('\n\27[1;31m￤Pkg _ luaSec - https  is Not installed.('\n\27[0m￤")
os.exit()
end
if not Er_url then
print("('\n\27[1;31m￤Pkg _ Lua-cURL  is Not installed.('\n\27[0m￤")
os.exit()
end
if not Er_redis then
print("('\n\27[1;31m￤Pkg _ redis-lua is Not installed.('\n\27[0m￤")
os.exit()
end

local ip_login = io.popen("echo $SSH_CLIENT | awk '{ print $1}'"):read('*a')
function create_config()
if not redis:get(ip_login..":TOKEN") then
io.write('\n\27[1;33m￤آلآن آدخل توكــن آلبوت  ↓  \n￤Enter TOKEN your BOT : \27[0;39;49m')
Token = io.read():gsub(' ','')
if Token == '' then
print('\n\27[1;31m￤ You Did not Enter TOKEN !\n￤ عذرآ لم تقوم بآدخآل آي شـيء , آدخل توگن آلبوت آلآن ')
create_config()
end 
Api_Token = 'https://api.telegram.org/bot'..Token
local url , res = https.request(Api_Token..'/getMe')
if res ~= 200 then
print('\n\27[1;31m￤ Your Token is Incorrect Please Check it!\n￤ آلتوگن آلذي آدخلتهہ‏‏ غير صـحيح , تآگد مـنهہ‏‏ ثم حآول مـجددآ!')
create_config()
end
local GetToken = JSON.decode(url)
BOT_NAME = GetToken.result.first_name
BOT_User = "@"..GetToken.result.username
redis:setex(ip_login..":TOKEN",120,Token)
io.write('\n\27[1;36m￤تم آدخآل آلتوگن بنجآح   \n￤Success Enter Your Token: \27[1;34m@'..GetToken.result.username..'\n\27[0;39;49m') 
end
io.write('\n\27[1;33m￤آدخل مـعرف آلمـطـور آلآسـآسـي ↓  \n￤Enter your USERNAME SUDO : \27[0;39;49m')
SUDO_USER = io.read():gsub(' ','')
if SUDO_USER == '' then
print('\n\27[1;31m￤ You Did not Enter USERNAME !\n￤ لم تقوم بآدخآل شـي , يرجى آلآنتبآهہ‏‏ وآدخل آلآن مـعرف آلمـطـور آلآسـآسـي')
create_config()
end 
if not SUDO_USER:match('@[%a%d_]') then
print('\n\27[1;31m￤ This is Not USERNAME !\n￤هہ‏‏ذآ ليس مـعرف حسـآب تلگرآم , عذرآ آدخل آلمـعرف آلصـحيح آلآن . ')
create_config()
end 
local url , res = https.request('https://th3boss.com/GetID/?User='..SUDO_USER)
if res ~= 200 then
print('\n\27[1;31m￤ Conect is Failed !\n￤ حدث خطـآ في آلآتصـآل بآلسـيرفر , يرجى مـرآسـلهہ‏‏ مـطـور آلسـورس ليتمـگن مـن حل آلمـشـگلهہ‏‏ في آسـرع وقت مـمـگن . !')
create_config()
end
success, GetUser = pcall(JSON.decode, url)
if not success then
print('\n\27[1;31m￤ Conect is Failed !\n￤ حدث مشـگلهہ‌‏ في سـگربت آلآسـتخرآج , يرجى مـرآسـلهہ‏‏ مـطـور آلسـورس ليتمـگن مـن حل آلمـشـگلهہ‏‏ في آسـرع وقت مـمـگن . !')
create_config()
end
if not GetUser.result then
print('\n\27[1;31m￤ USERNAME is Incorrect Please Check it!\n￤ لآ يوجد حسـآب بهہ‏‏ذآ آلمـعرف , تآگد مـنهہ‏‏ جيدآ  !')
create_config()
if GetUser.cause then
print('\n\27[1;31m￤ '..GetUser.cause)
os.exit()
end
end  
print('\n\27[1;36m￤تم آدخآل مـعرف آلمـطـور بنجآح , سـوف يتم تشـغيل آلسـورس آلآن .\n￤Success Save USERNAME IS_ID: \27[0;32m['..GetUser.information.id..']\n\27[0;39;49m')
boss = Token:match("(%d+)")
redis:set(boss..":VERSION",GetUser.information.Source_version)
redis:set(boss..":SUDO_ID:",GetUser.information.id)
redis:set(boss..":DataCenter:",GetUser.information.DataCenter)
redis:set(boss..":UserNameBot:",BOT_User)
redis:set(boss..":NameBot:",BOT_NAME)
redis:hset(boss..'username:'..GetUser.information.id,'username','@'..GetUser.information.username)
redis:set("TH3BOSS_INSTALL","Yes")
info = {}
info.username = '@'..GetUser.information.username
info.userbot  = BOT_User
info.userjoin  = io.popen("whoami"):read('*a'):gsub('[\n\r]+', '') 
https.request(GetUser.information.WebSite..'/request/?insert='..JSON.encode(info))
Cr_file = io.open("./inc/Token.txt", "w")
Cr_file:write(Token)
Cr_file:close() 
print('\27[1;36m￤Token.txt is created.\27[m')
local Text = "🙋🏼‍♂️¦ اهلا عزيزي [المطور الاساسي](tg://user?id="..GetUser.information.id..") \n🔖¦ شكرا لاستخدامك سورس الزعيم \n📡¦ أرســل  الان /start\n📛¦ لاضهار الاوامر للمطور  المجهزه بالكيبورد\n\n⚡️"
https.request(Api_Token..'/sendMessage?chat_id='..GetUser.information.id..'&text='..URL.escape(Text)..'&parse_mode=Markdown')
os.execute([[
rm -f ./README.md
rm -rf ./.git
chmod +x ./run
./run
]])
end




function Start_Bot()
local TokenBot = io.open('./inc/Token.txt', "r")
if not TokenBot then
print('\27[0;33m>>'..[[





▀█████████▄   ▄██████▄     ▄████████    ▄████████
  ███    ███ ███    ███   ███    ███   ███    ███
  ███    ███ ███    ███   ███    █▀    ███    █▀
 ▄███▄▄▄██▀  ███    ███   ███          ███
▀▀███▀▀▀██▄  ███    ███ ▀███████████ ▀███████████ ¦ Dev : @TH3BS
  ███    ██▄ ███    ███          ███          ███ ¦ Dev : @BLCON
  ███    ███ ███    ███    ▄█    ███    ▄█    ███
▄█████████▀   ▀██████▀   ▄████████▀   ▄████████▀  ¦ Source The3Boss
---------------------------------------------------------------------
]]..'\027[0;32m')
create_config() 
else
Token = TokenBot:read('*a')
File = {}
local login = io.popen("whoami"):read('*a'):gsub('[\n\r]+', '') 
boss = Token:match("(%d+)")
our_id = tonumber(boss)
ApiToken = "https://api.telegram.org/bot"..Token
Bot_User = redis:get(boss..":UserNameBot:")
SUDO_ID = tonumber(redis:get(boss..":SUDO_ID:"))
SUDO_USER = redis:hgetall(boss..'username:'..SUDO_ID).username:gsub('_',[[\_]])
version = redis:get(boss..":VERSION")
DataCenter = redis:get(boss..":DataCenter:")

local ok, ERROR =  pcall(function() loadfile("./inc/functions.lua")() end)
if not ok then 
print('\27[31m! Error File Not "Run inc/functions.lua" !\n\27[39m')
print(tostring(io.popen("lua inc/functions.lua"):read('*all')))
os.exit()
end

local ok, ERROR =  pcall(function() loadfile("./inc/locks.lua")() end)
if not ok then 
print('\27[31m! Error File Not "Run inc/locks.lua" !\n\27[39m')
print(tostring(io.popen("lua inc/locks.lua"):read('*all')))
os.exit()
end

print('\27[0;33m>>'..[[






▀█████████▄   ▄██████▄     ▄████████    ▄████████ 
  ███    ███ ███    ███   ███    ███   ███    ███ 
  ███    ███ ███    ███   ███    █▀    ███    █▀  
 ▄███▄▄▄██▀  ███    ███   ███          ███        
▀▀███▀▀▀██▄  ███    ███ ▀███████████ ▀███████████ ¦ Dev : @TH3BS
  ███    ██▄ ███    ███          ███          ███ ¦ Dev : @BLCON
  ███    ███ ███    ███    ▄█    ███    ▄█    ███ 
▄█████████▀   ▀██████▀   ▄████████▀   ▄████████▀  ¦ VERSION » v]]..version..[[

-------------------------------------------------------------------
                                                  
]]..'\027[0;32m'
..'¦ TOKEN_BOT: \27[1;34m'..Token..'\027[0;32m\n'
..'¦ BOT__INFO: \27[1;34m'.. Bot_User..'\27[0;36m » ('..boss..')\027[0;32m\n'
..'¦ INFO_SUDO: \27[1;34m'..SUDO_USER:gsub([[\_]],'_')..'\27[0;36m » ('..SUDO_ID..')\27[m\027[0;32m\n'
..'¦ Run_Scrpt: \27[1;34m./inc/Script.lua\027[0;32m \n'
..'¦ LOGIN__IN: \27[1;34m'..login..'\027[0;32m \n'
..'¦ VERSION->: \27[1;34mv'..version..'\027[0;32m\n'
..'======================================\27[0;33m\27[0;31m'
)

end
local ok, i =  pcall(function() ScriptFile= loadfile("./inc/Script.lua")() end)
if not ok then 
print('\27[31m! Error File Not "Run inc/Script.lua" !\n\27[39m')
print(tostring(io.popen("lua inc/Script.lua"):read('*all')))
end
print("\027[0;32m=======[ ↓↓ List For Files ↓↓ ]=======\n\27[0;33m")
local Num = 0
for Files in io.popen('ls plugins'):lines() do
if (Files:match(".lua$")) then
Num = Num + 1
local ok, i =  pcall(function() File[Files] = loadfile("plugins/"..Files)() end)
if not ok then
print('\27[31mError loading plugins '..Files..'\27[39m')
print(tostring(io.popen("lua plugins/"..Files):read('*all')))
else
print("\27[0;36m "..Num.."- "..Files..'\27[m')
end 
end 

end

print('\n\27[0;32m¦ All Files is : '..Num..' Are Active.\n--------------------------------------\27[m\n')
end

Start_Bot()


function input_inFo(msg)

if not msg.forward_info_ and msg.is_channel_post_ then
StatusLeft(msg.chat_id_,our_id)
return false
end

if msg.date and msg.date < os.time() - 30 and not msg.edited then --[[ فحص تاريخ الرساله ]]
print('\27[36m¦¦¦¦  !! [THIS__OLD__MSG]  !! ¦¦¦¦\27[39m')
return false  
end  

if MsgsBot(msg) then 
print("\27[1;31mThis Msgs Bot\27[0m")
return false
end



if msg.reply_to_message_id_ ~= 0 then msg.reply_id = msg.reply_to_message_id_ end
msg.type = GetType(msg.chat_id_)

if msg.type == "pv" and redis:get(boss..':mute_pv:'..msg.chat_id_) then
print('\27[1;31m is_MUTE_BY_FLOOD\27[0m')
return false 
end

if redis:get(boss..'sender:'..msg.sender_user_id_..':flood') then
print("\27[1;31mThis Flood Sender ...\27[0")
Del_msg(msg.chat_id_,msg.id_)
return false
end


if redis:get(boss..'group:add'..msg.chat_id_) then 
GroupActive = true
else
GroupActive = false
end


if msg.sender_user_id_ == SUDO_ID then 
Rank = 1
elseif GroupActive and redis:sismember(boss..':SUDO_BOT:',msg.sender_user_id_) then 
Rank = 2
elseif GroupActive and redis:sismember(boss..':MONSHA_BOT:'..msg.chat_id_,msg.sender_user_id_) then 
Rank = 3
elseif GroupActive and redis:sismember(boss..'owners:'..msg.chat_id_,msg.sender_user_id_) then 
Rank = 4
elseif GroupActive and redis:sismember(boss..'admins:'..msg.chat_id_,msg.sender_user_id_) then 
Rank = 5
elseif GroupActive and redis:sismember(boss..'whitelist:'..msg.chat_id_,msg.sender_user_id_) then 
Rank = 6
elseif msg.sender_user_id_ == our_id then
Rank = 7
else
Rank = 0
end


--=========={{ Rank For User }} ==============
if Rank == 1 then 
TheRank = 'مطور اساسي 👨🏻‍✈️' 
elseif Rank == 2 then 
TheRank = 'مطور البوت 👨🏽‍💻'
elseif Rank == 3 then 
TheRank = 'المنشىء 👷🏽'
elseif Rank == 4 then 
TheRank = 'مدير البوت 👨🏼‍⚕️' 
elseif Rank == 5 then 
TheRank = 'ادمن في البوت 👨🏼‍🎓'
elseif Rank == 6 then 
TheRank = 'عضو مميز ⭐️'
else
TheRank = 'فقط عضو 🙍🏼‍♂️'
end

if Rank == 1 then 
TheRankCmd = 'المطور 👨🏻‍✈️' 
elseif Rank == 2 then 
TheRankCmd = 'المطور 👨🏽‍💻'
elseif Rank == 3 then 
TheRankCmd = 'المنشىء 👷🏽'
elseif Rank == 4 then 
TheRankCmd = 'المدير 👨🏼‍⚕️' 
elseif Rank == 5 then 
TheRankCmd = 'الادمن 👨🏼‍🎓'
end


function SudoBase()
if Rank == 1 then
return true
else
return false
end
end

function SudoUser()
if Rank == 1 or Rank == 2 then
return true
else
return false
end
end

function Creator()
if Rank == 1 or Rank == 2 or Rank == 3 then
return true
else
return false
end
end

function Director()
if Rank == 1 or Rank == 2 or Rank == 3 or Rank == 4 then
return true
else
return false
end
end

function Admin()
if Rank == 1 or Rank == 2 or Rank == 3 or Rank == 4 or Rank == 5 then
return true
else
return false
end
end

function Special()
if Rank == 6 then
return true
else
return false
end
end

function OurBot()
if Rank == 7 then
return true
else
return false
end
end



-- [[ المحظورين عام ]]
if GeneralBanned((msg.adduser or msg.sender_user_id_)) then
print('\27[1;31m is_G_BAN_USER\27[0m')
Del_msg(msg.chat_id_,msg.id_)
kick_user((msg.adduser or msg.sender_user_id_),msg.chat_id_)
return false 
end

--[[ المكتومين ]]
if MuteUser(msg.chat_id_,msg.sender_user_id_) then 
if Admin() then redis:srem(boss..'is_silent_users:'..msg.chat_id_,msg.sender_user_id_) return end
print("\27[1;31m User is Silent\27[0m")
Del_msg(msg.chat_id_,msg.id_)
return false 
end

--[[ المحظورين ]]
if Check_Banned((msg.adduser or msg.sender_user_id_),msg.sender_user_id_) then
if Admin() then redis:srem(boss..'banned:'..msg.chat_id_,msg.sender_user_id_) return end
print('\27[1;31m is_BANED_USER\27[0m')
Del_msg(msg.chat_id_, msg.id_)
kick_user((msg.adduser or msg.sender_user_id_), msg.chat_id_)
return false 
end

if not Admin() then
if redis:get(boss..'mute_text'..msg.chat_id_) then --قفل الدردشه
print("\27[1;31m Chat is Mute \27[0m")
Del_msg(msg.chat_id_,msg.id_)
return false 
end
--[[ الكلمات الممنوعه ]]
if msg.text and FilterX(msg) then
return false
end 
end 

if ScriptFile and ScriptFile.Boss then 
if msg.text and ScriptFile.iBoss then
for k, Boss in pairs(ScriptFile.Boss) do
local SearchText = msg.text:match(Boss)
if SearchText then
if not CheckFlood(msg) then
return false 
end
local GetMsg = ScriptFile.iBoss(msg,{msg.text:match(Boss)})
if GetMsg then
print("\27[1;35m¦This_Msg : ",Boss.." | Plugin is: \27[1;32mScript.lua\27[0m")
sendMsg(msg.chat_id_,msg.id_,GetMsg)
return false
end 
end
end
end
if ScriptFile.dBoss then
if ScriptFile.dBoss(msg) == false then
return false
end
print("\27[1;35m¦Msg_IN_Process : Proc _ Script.lua\27[0m")
end

for name,Plug in pairs(File) do
if Plug.Boss then 
if msg.text and Plug.iBoss then
for k, Boss in pairs(Plug.Boss) do
local SearchText = msg.text:match(Boss)
if SearchText then
if not CheckFlood(msg) then
return false
end
local GetMsg = Plug.iBoss(msg,{msg.text:match(Boss)})
if GetMsg then
print("\27[1;35m¦This_Msg : ",Boss.." | Plugin is: \27[1;32m"..name.."\27[0m")
sendMsg(msg.chat_id_,msg.id_,GetMsg)
end 
return false
end
end
end
if Plug.dBoss then
Plug.dBoss(msg)
print("\27[1;35m¦Msg_IN_Process : \27[1;32"..name.."\27[0m")
end
else
print("The File "..name.." Not Runing in The Source Boss")
end 

end
else
print("The File Script.lua Not Runing in The Source Boss")

end



end


function tdcli_update_callback(data)
	local msg = data.message_
	if data.ID == "UpdateMessageSendFailed" then 
	print(data.message.chat_id)
	print(data.message.sender_user_id)
	print(data.message.id)
	print(data.error_message)
	redis:srem(boss..'users',data.message.chat_id)
	elseif data.ID == "UpdateMessageSendSucceeded" then
	if Refresh_Start then
	Refresh_Start = false
	Start_Bot()
	return false
	end
	if UpdateSourceStart then
	UpdateSourceStart = false
	EditMsg(data.message.chat_id,data.message.id,'10% - |█          |')
	sleep(0.2)
	EditMsg(data.message.chat_id,data.message.id,'20% - |███         |')
	sleep(0.2)
	EditMsg(data.message.chat_id,data.message.id,'30% - |████        |')
	sleep(0.2)
	EditMsg(data.message.chat_id,data.message.id,'40% - |█████       |')
	sleep(0.2)
	EditMsg(data.message.chat_id,data.message.id,'50% - |██████      |')
	download_file('https://raw.githubusercontent.com/TH3BS/BOSS/master/inc/Run.lua','./inc/Run.lua')
	download_file('https://raw.githubusercontent.com/TH3BS/BOSS/master/inc/Script.lua','./inc/Script.lua')
	download_file('https://raw.githubusercontent.com/TH3BS/BOSS/master/inc/functions.lua','./inc/functions.lua')
	download_file('https://raw.githubusercontent.com/TH3BS/BOSS/master/inc/locks.lua','./inc/locks.lua')
	EditMsg(data.message.chat_id,data.message.id,'60% - |███████     |')
	sleep(0.2)
	EditMsg(data.message.chat_id,data.message.id,'70% - |████████    |')
	sleep(0.2)
	EditMsg(data.message.chat_id,data.message.id,'80% - |█████████   |')
	sleep(0.2)
	EditMsg(data.message.chat_id,data.message.id,'90% - |██████████  |')
	sleep(0.2)
	EditMsg(data.message.chat_id,data.message.id,'100% - |█████████████|\n\n🔝*¦* تم تحديث السورس الى اصدار *v'..redis:get(boss..":VERSION")..'*\n📟*¦* تم اعاده تشغيل السورس بنجاح')
	dofile("./inc/Run.lua")
	print("Update Source And Reload ~ ./inc/Run.lua")
	end
	elseif data.ID == "UpdateNewMessage" then
	if msg.content_.ID == "MessageText" and not msg.forward_info_ then
	if msg.content_.entities_ and msg.content_.entities_[0] and msg.content_.entities_[0].ID then
	if msg.content_.entities_[0].ID == "MessageEntityTextUrl" then
	msg.textEntityTypeTextUrl = true
	print("MessageEntityTextUrl")
	elseif msg.content_.entities_[0].ID == "MessageEntityBold" then 
	msg.textEntityTypeBold = true
	elseif msg.content_.entities_[0].ID == "MessageEntityItalic" then
	msg.textEntityTypeItalic = true
	print("MessageEntityItalic")
	elseif msg.content_.entities_[0].ID == "MessageEntityCode" then
	msg.textEntityTypeCode = true
	print("MessageEntityCode")
	end
	end
	msg.text = msg.content_.text_
	if (msg.text=="تحديث" or msg.text=="we" or msg.text=="تحديث ♻️") and msg.sender_user_id_ == SUDO_ID then
	return sendMsg(msg.chat_id_,msg.id_," 🗂¦ تہ‏‏م تحديث آلمـلفآت \n✓",nil,function(arg,data)
	Refresh_Start = true
	end)
	end 
	if msg.text== 'reload' and msg.sender_user_id_ == SUDO_ID then
	sendMsg(msg.chat_id_,msg.id_,'👷🏽| {* تــم أعـاده تشغيل البوت  *} 📡.\n\n👨🏼‍💼| { Bot is Reloaded » }👍🏿',nil,function(arg,data)
	dofile("./inc/Run.lua")
	print("Reload ~ ./inc/Run.lua")
	end)
	return false
	end
	elseif msg.content_.ID == "MessagePinMessage" then
	print('¦'..msg.content_.ID)
	msg.pinned = true
	elseif msg.content_.ID == "MessagePhoto" then
	print('¦'..msg.content_.ID)
	msg.photo = true 
	if msg.content_.photo_.sizes_[3] then 
	photo_id = msg.content_.photo_.sizes_[3].photo_.persistent_id_
	else 
	photo_id = msg.content_.photo_.sizes_[0].photo_.persistent_id_
	end
	elseif msg.content_.ID == "MessageVideo" then
	print('¦'..msg.content_.ID)
	msg.video = true
	video_id = msg.content_.video_.video_.persistent_id_
	elseif msg.content_.ID == "MessageAnimation" then
	print('¦'..msg.content_.ID)
	msg.animation = true
	animation_id = msg.content_.animation_.animation_.persistent_id_
	elseif msg.content_.ID == "MessageVoice" then
	print('¦'..msg.content_.ID)
	msg.voice = true
	voice_id = msg.content_.voice_.voice_.persistent_id_
	elseif msg.content_.ID == "MmessageAudio" then
	print('¦'..msg.content_.ID)
	msg.audio = true
	audio_id = msg.content_.audio_.audio_.persistent_id_
	elseif msg.forward_info_ then
   	msg.forward_info = true 
	print('¦'.." IS_FWD : Msg .")
	elseif msg.content_.ID == "MessageVideoNote" then
    msg.video_note = true
	elseif msg.content_.ID == "MessageSticker" then
	print('¦'..msg.content_.ID)
	msg.sticker = true
	sticker_id = msg.content_.sticker_.sticker_.persistent_id_
	elseif msg.content_.ID == "MessageContact" then
	print('¦'..msg.content_.ID)
	msg.contact = true
	elseif msg.content_.ID == "MessageDocument" then
	print('¦'..msg.content_.ID)
	msg.document = true
	file_id = msg.content_.document_.document_.persistent_id_
	file_name = msg.content_.document_.document_.file_name_
	elseif msg.content_.ID == "MessageLocation" then
	print('¦'..msg.content_.ID)
	msg.location = true
	elseif msg.content_.ID == "MessageGame" then
	print('¦'..msg.content_.ID)
	msg.game = true
	elseif msg.content_.ID == "MessageChatAddMembers" then
	for i=0,#msg.content_.members_ do
	msg.adduser = msg.content_.members_[i].id_
	msg.addusername = msg.content_.members_[i].username_
	msg.addname = msg.content_.members_[i].first_name_
	msg.adduserType = msg.content_.members_[i].type_.ID
	print('¦'..msg.content_.ID..' : '..msg.adduser)
	print('¦ name : '..msg.addname)
	print('¦ username : '..(msg.addusername or ""))
	print('¦ Type : '..msg.adduserType)
	end 
	elseif msg.content_.ID == "MessageChatJoinByLink" then
	print('¦'..msg.content_.ID..' : '..msg.sender_user_id_)
	msg.joinuser = true
	elseif msg.reply_markup and  msg.reply_markup.ID == "replyMarkupInlineKeyboard" then
	msg.replyMarkupInlineKeyboard = true
	end 
	input_inFo(msg)
	if msg.content_.ID == "MessageChatChangeTitle" then
	print("¦ messageChatChangeTitle : { "..msg.content_.title_.." } ")
	if redis:get(boss..'group:add'..msg.chat_id_) then
	redis:set(boss..'group:name'..msg.chat_id_,msg.content_.title_)
	end
	end
	
	elseif data.ID == "UpdateNewChat" then  
	if redis:get(boss..'group:add'..data.chat_.id_) then
	redis:set(boss..'group:name'..data.chat_.id_,data.chat_.title_)
	end
	elseif data.ID == "UpdateChannel" then  
	if data.channel_.status_.ID == "chatMemberStatusKicked" then 

	elseif data.channel_.status_.ID == "ChatMemberStatusMember" then 
	print('¦ The bot is Member')
	elseif data.channel_.status_.ID == "ChatMemberStatusEditor" then 
	print('¦ The Bot is Admin')
	elseif data.channel_.status_.ID == "ChatMemberStatusKicked" then 
	if redis:get(boss..'group:add-100'..data.channel_.id_) then
	local linkGroup = (redis:get(boss..'linkGroup-100'..data.channel_.id_) or "")
	local NameGroup = (redis:get(boss..'group:name-100'..data.channel_.id_) or "")
	send_msg(SUDO_ID,"📛| قام شخص بطرد البوت من المجموعه الاتيه : \n🏷| ألايدي : `-100"..data.channel_.id_.."`\n🗯| الـمجموعه : "..Flter_Markdown(NameGroup).."\n\n📮| تـم مسح كل بيانات المجموعه بنـجاح ")
	rem_data_group('-100'..data.channel_.id_)
	return false
	end
	end
	print(data.channel_.status_.ID) 
	elseif data.ID == "UpdateUser" then  
	
	if data.user_.type_.ID == "UserTypeDeleted" then
	print("¦ userTypeDeleted")
	os.execute('redis-cli KEYS "*'..data.user_.id_..'*" | xargs redis-cli DEL')
	elseif data.user_.type_.ID == "UserTypeGeneral" then
	local CheckUser = redis:hgetall(boss..'username:'..data.user_.id_).username
	if data.user_.username_  then 
	USERNAME = '@'..data.user_.username_:gsub('_',[[\_]])
	else
	USERNAME = data.user_.first_name_..' '..(data.user_.last_name_ or "" )
	end	
	if CheckUser and CheckUser ~= USERNAME  then
	print("¦ Enter Update User ")
	redis:hset(boss..'username:'..data.user_.id_,'username',USERNAME)
	end 
	end
	elseif data.ID == "UpdateMessageEdited" then
	GetMsgInfo(data.chat_id_,data.message_id_,function(arg,data)
	msg = data
	msg.edited = true
	data.text = (data.content_.text_ or false)
	input_inFo(msg)  
	end,nil)
	end
 
	
end
