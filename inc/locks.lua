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
---------------Lock -------------------
function unlock_waring(msg)
if not Admin() then return "📛*¦* هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n🚶" end
if redis:get(boss..'lock_woring'..msg.chat_id_) then 
return "🙋🏼‍♂️*¦* أهلا عزيزي "..TheRankCmd.." \n📡*¦* التحذير مفعل مسبقاً \n✓" 
else redis:set(boss..'lock_woring'..msg.chat_id_,true)
return "🙋🏼‍♂️*¦* أهلا عزيزي "..TheRankCmd.."\n📡*¦* تم تفعيل التحذير \n✓" 
end
end

function lock_waring(msg)
if not Admin() then return "📛*¦* هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n🚶" end
if not redis:get(boss..'lock_woring'..msg.chat_id_) then 
return "🙋🏼‍♂️*¦* أهلا عزيزي "..TheRankCmd.."\n📡*¦* التحذير بالتأكيد معطل\n✓" 
else
redis:del(boss..'lock_woring'..msg.chat_id_) 
return "🙋🏼‍♂️*¦* أهلا عزيزي "..TheRankCmd.."\n📡*¦* تم تعطيل التحذير \n✓" 
end 
end

function lock_ID(msg)
if not Admin() then return "📛*¦* هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n🚶" end
if not redis:get(boss..'lock_id'..msg.chat_id_) then 
return "🙋🏼‍♂️*¦* أهلا عزيزي "..TheRankCmd.."\n📡*¦* الايدي بالتأكيد معطل\n✓" 
else
redis:del(boss..'lock_id'..msg.chat_id_) 
return "🙋🏼‍♂️*¦* أهلا عزيزي "..TheRankCmd.."\n📡*¦* تم تعطيل امر الايدي\n✓" 
end 
end

function unlock_ID(msg)
if not Admin() then return "📛*¦* هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n🚶" end
if redis:get(boss..'lock_id'..msg.chat_id_) then 
return "🙋🏼‍♂️*¦* أهلا عزيزي "..TheRankCmd.."\n📡*¦* امر الايدي شغال بالفعل\n✓" 
else 
redis:set(boss..'lock_id'..msg.chat_id_,true)  
return "🙋🏼‍♂️*¦* أهلا عزيزي "..TheRankCmd.."\n📡*¦* تم تفعيل امر الايدي \n✓" 
end 
end

function unlock_Welcome(msg)
if not Admin() then return "📛*¦* هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n🚶" end
if redis:get(boss..'welcome:get'..msg.chat_id_) then 
return "🙋🏼‍♂️*¦* أهلا عزيزي "..TheRankCmd.."\n📡*¦* تفعيل الترحيب مفعل مسبقاً\n✓" 
else redis:set(boss..'welcome:get'..msg.chat_id_,true)  
return "🙋🏼‍♂️*¦* أهلا عزيزي "..TheRankCmd.."\n📡*¦* تم تفعيل الترحيب \n✓" 
end 
end

function lock_Welcome(msg)
if not Admin() then return "📛*¦* هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n🚶" end
if not redis:get(boss..'welcome:get'..msg.chat_id_) then 
return "🙋🏼‍♂️*¦* أهلا عزيزي "..TheRankCmd.."\n📡*¦* الترحيب بالتأكيد معطل\n✓" 
else
redis:del(boss..'welcome:get'..msg.chat_id_) 
return "🙋🏼‍♂️*¦* أهلا عزيزي "..TheRankCmd.."\n📡*¦* تم تعطيل الترحيب \n✓" 
end 
end

function lock_All(msg)
if not Admin() then return "📛*¦* هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n🚶" end
redis:mset(
boss..'lock_username'..msg.chat_id_,true,
boss..'mute_gif'..msg.chat_id_,true,
boss..'mute_photo'..msg.chat_id_,true,
boss..'mute_audio'..msg.chat_id_,true,
boss..'mute_voice'..msg.chat_id_,true,
boss..'mute_sticker'..msg.chat_id_,true,
boss..'mute_forward'..msg.chat_id_,true,
boss..'mute_contact'..msg.chat_id_,true,
boss..'mute_location'..msg.chat_id_,true,
boss..'mute_document'..msg.chat_id_,true,
boss..'lock_link'..msg.chat_id_,true,
boss..'lock_tag'..msg.chat_id_,true,
boss..'lock_edit'..msg.chat_id_,true,
boss..'lock_spam'..msg.chat_id_,true,
boss..'lock_bots'..msg.chat_id_,true,
boss..'lock_webpage'..msg.chat_id_,true,
boss..'mute_video'..msg.chat_id_,true,
boss..'mute_inline'..msg.chat_id_,true
)
return "🙋🏼‍♂️*¦* أهلا عزيزي "..TheRankCmd.."\n📡*¦* تم قفل الكل  \n✓"
end

function Unlock_All(msg)
if not Admin() then return "📛*¦* هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n🚶" end
redis:del(
boss..'lock_username'..msg.chat_id_,
boss..'mute_gif'..msg.chat_id_,
boss..'mute_photo'..msg.chat_id_,
boss..'mute_audio'..msg.chat_id_,
boss..'mute_voice'..msg.chat_id_,
boss..'mute_sticker'..msg.chat_id_,
boss..'mute_forward'..msg.chat_id_,
boss..'mute_contact'..msg.chat_id_,
boss..'mute_location'..msg.chat_id_,
boss..'mute_document'..msg.chat_id_,
boss..'lock_link'..msg.chat_id_,
boss..'lock_tag'..msg.chat_id_,
boss..'lock_edit'..msg.chat_id_,
boss..'lock_spam'..msg.chat_id_,
boss..'lock_bots'..msg.chat_id_,
boss..'lock_webpage'..msg.chat_id_,
boss..'mute_video'..msg.chat_id_,
boss..'mute_inline'..msg.chat_id_
)
return "🙋🏼‍♂️*¦* أهلا عزيزي "..TheRankCmd.."\n📡*¦* تم فتح الكل  \n✓"
end

function lock_Media(msg)
if not Admin() then return "📛*¦* هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n🚶" end
redis:mset(
boss..'mute_gif'..msg.chat_id_,true,
boss..'mute_photo'..msg.chat_id_,true,
boss..'mute_audio'..msg.chat_id_,true,
boss..'mute_voice'..msg.chat_id_,true,
boss..'mute_sticker'..msg.chat_id_,true,
boss..'mute_video'..msg.chat_id_,true
)
return "🙋🏼‍♂️*¦* أهلا عزيزي "..TheRankCmd.."\n🔛¦ تم قفل الوسائط  \n✓"
end

function Unlock_Media(msg)
if not Admin() then return "📛*¦* هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n🚶" end
redis:del(
boss..'mute_gif'..msg.chat_id_,
boss..'mute_photo'..msg.chat_id_,
boss..'mute_audio'..msg.chat_id_,
boss..'mute_voice'..msg.chat_id_,
boss..'mute_sticker'..msg.chat_id_,
boss..'mute_video'..msg.chat_id_
)
return "🙋🏼‍♂️*¦* أهلا عزيزي "..TheRankCmd.."\n🔛¦ تم فتح الوسائط  \n✓"
end

function tqeed_photo(msg)
if not Admin() then return "🚸*¦ * هذا الامر يخص الادمنيه فقط  \n📛" end
if redis:get(boss..':tqeed_photo:'..msg.chat_id_) then
return '🙋🏼‍♂️*¦* أهلا عزيزي '..TheRankCmd..'\n📡*¦* التقييد بالصور بالتأكيد تم قفله \n✓'
else
redis:del(boss..'mute_photo'..msg.chat_id_)
redis:set(boss..':tqeed_photo:'..msg.chat_id_,true)
return '🙋🏼‍♂️*¦* أهلا عزيزي '..TheRankCmd..'\n📡*¦* تم قفل الصور بالتقييد  \n✓'
end
end

function fktqeed_photo(msg)
if not Admin() then return "🚸*¦ * هذا الامر يخص الادمنيه فقط  \n📛" end
if not redis:get(boss..':tqeed_photo:'..msg.chat_id_) then
return '🙋🏼‍♂️*¦* أهلا عزيزي '..TheRankCmd..'\n📡*¦* التقييد بالصور بالتأكيد تم فتحه \n✓'
else 
redis:del(boss..':tqeed_photo:'..msg.chat_id_)
return '🙋🏼‍♂️*¦* أهلا عزيزي '..TheRankCmd..'\n📡*¦* تم فتح الصور بالتقييد \n✓'
end
end

---------------Lock -------------------
function tqeed_video(msg)
if not Admin() then return "🚸*¦ * هذا الامر يخص الادمنيه فقط  \n📛" end
if redis:get(boss..':tqeed_video:'..msg.chat_id_) then
return '🙋🏼‍♂️*¦* أهلا عزيزي '..TheRankCmd..'\n📡*¦* التقييد بالفيديو بالتأكيد تم قفله \n✓'
else
redis:del(boss..':tqeed_video:'..msg.chat_id_)
redis:set(boss..':tqeed_video:'..msg.chat_id_,true)
return '🙋🏼‍♂️*¦* أهلا عزيزي '..TheRankCmd..'\n📡*¦* تم قفل الفيديو بالتقييد  \n✓'
end
end

function fktqeed_video(msg)
if not Admin() then return "🚸*¦ * هذا الامر يخص الادمنيه فقط  \n📛" end
if not redis:get(boss..':tqeed_video:'..msg.chat_id_) then
return '🙋🏼‍♂️*¦* أهلا عزيزي '..TheRankCmd..'\n📡*¦* التقييد بالفيديو بالتأكيد تم فتحه \n✓'
else 
redis:del(boss..':tqeed_video:'..msg.chat_id_)
return '🙋🏼‍♂️*¦* أهلا عزيزي '..TheRankCmd..'\n📡*¦* تم فتح الفيديو بالتقييد \n✓'
end
end

---------------Lock -------------------
function tqeed_gif(msg)
if not Admin() then return "🚸*¦ * هذا الامر يخص الادمنيه فقط  \n📛" end
if redis:get(boss..':tqeed_gif:'..msg.chat_id_) then
return '🙋🏼‍♂️*¦* أهلا عزيزي '..TheRankCmd..'\n📡*¦* التقييد الممتحركه بالتأكيد تم قفله \n✓'
else
redis:del(boss..'mute_gif'..msg.chat_id_)
redis:set(boss..':tqeed_gif:'..msg.chat_id_,true)
return '🙋🏼‍♂️*¦* أهلا عزيزي '..TheRankCmd..'\n📡*¦* تم قفل المتحركه بالتقييد  \n✓'
end
end

function fktqeed_gif(msg)
if not Admin() then return "🚸*¦ * هذا الامر يخص الادمنيه فقط  \n📛" end
if not redis:get(boss..':tqeed_gif:'..msg.chat_id_) then
return '🙋🏼‍♂️*¦* أهلا عزيزي '..TheRankCmd..'\n📡*¦* التقييد المتحركه بالتأكيد تم فتحه \n✓'
else 
redis:del(boss..':tqeed_gif:'..msg.chat_id_)
return '🙋🏼‍♂️*¦* أهلا عزيزي '..TheRankCmd..'\n📡*¦* تم فتح المتحركه بالتقييد \n✓'
end
end

---------------Lock -------------------
function tqeed_fwd(msg)
if not Admin() then return "🚸*¦ * هذا الامر يخص الادمنيه فقط  \n📛" end
if redis:get(boss..':tqeed_fwd:'..msg.chat_id_) then
return '🙋🏼‍♂️*¦* أهلا عزيزي '..TheRankCmd..'\n📡*¦* التقييد بالتوجيه بالتأكيد تم قفله \n✓'
else
redis:del(boss..'mute_forward'..msg.chat_id_)
redis:set(boss..':tqeed_fwd:'..msg.chat_id_,true)
return '🙋🏼‍♂️*¦* أهلا عزيزي '..TheRankCmd..'\n📡*¦* تم قفل التوجيه بالتقييد  \n✓'
end
end

function fktqeed_fwd(msg)
if not Admin() then return "🚸*¦ * هذا الامر يخص الادمنيه فقط  \n📛" end
if not redis:get(boss..':tqeed_fwd:'..msg.chat_id_) then
return '🙋🏼‍♂️*¦* أهلا عزيزي '..TheRankCmd..'\n📡*¦* التقييد التوجيه بالتأكيد تم فتحه \n✓'
else 
redis:del(boss..':tqeed_fwd:'..msg.chat_id_)
return '🙋🏼‍♂️*¦* أهلا عزيزي '..TheRankCmd..'\n📡*¦* تم فتح التوجيه بالتقييد \n✓'
end
end

---------------Lock -------------------
function tqeed_link(msg)
if not Admin() then return "🚸*¦ * هذا الامر يخص الادمنيه فقط  \n📛" end
if redis:get(boss..':tqeed_link:'..msg.chat_id_) then
return '🙋🏼‍♂️*¦* أهلا عزيزي '..TheRankCmd..'\n📡*¦* التقييد بالروابط بالتأكيد تم قفله \n✓'
else
redis:set(boss..':tqeed_link:'..msg.chat_id_,true)
return '🙋🏼‍♂️*¦* أهلا عزيزي '..TheRankCmd..'\n📡*¦* تم قفل الروابط بالتقييد  \n✓'
end
end

function fktqeed_link(msg)
if not Admin() then return "🚸*¦ * هذا الامر يخص الادمنيه فقط  \n📛" end
if not redis:get(boss..':tqeed_link:'..msg.chat_id_) then
return '🙋🏼‍♂️*¦* أهلا عزيزي '..TheRankCmd..'\n📡*¦* التقييد بالروابط بالتأكيد تم فتحه \n✓'
else 
redis:del(boss..':tqeed_link:'..msg.chat_id_)
return '🙋🏼‍♂️*¦* أهلا عزيزي '..TheRankCmd..'\n📡*¦* تم فتح الروابط بالتقييد \n✓'
end
end

---------------Lock -------------------
function tqeed_photo(msg)
if not Admin() then return "🚸*¦ * هذا الامر يخص الادمنيه فقط  \n📛" end
if redis:get(boss..':tqeed_photo:'..msg.chat_id_) then
return '🙋🏼‍♂️*¦* أهلا عزيزي '..TheRankCmd..'\n📡*¦* التقييد بالصور بالتأكيد تم قفله \n✓'
else
redis:set(boss..':tqeed_photo:'..msg.chat_id_,true)
return '🙋🏼‍♂️*¦* أهلا عزيزي '..TheRankCmd..'\n📡*¦* تم قفل الصور بالتقييد  \n✓'
end
end

function fktqeed_photo(msg)
if not Admin() then return "🚸*¦ * هذا الامر يخص الادمنيه فقط  \n📛" end
if not redis:get(boss..':tqeed_photo:'..msg.chat_id_) then
return '🙋🏼‍♂️*¦* أهلا عزيزي '..TheRankCmd..'\n📡*¦* التقييد بالصور بالتأكيد تم فتحه \n✓'
else 
redis:del(boss..':tqeed_photo:'..msg.chat_id_)
return '🙋🏼‍♂️*¦* أهلا عزيزي '..TheRankCmd..'\n📡*¦* تم فتح الصور بالتقييد \n✓'
end
end
---------------Lock twasel-------------------
function lock_twasel(msg)
if not SudoBase() then return "🚸*¦ * هذا الامر يخص المطور الاساسي فقط  \n📛" end
if redis:get(boss..'lock_twasel') then
return '🙋🏼‍♂️*¦* أهلا عزيزي '..TheRankCmd..'\n📡*¦* التواصل بالتاكيد تم تعطيله \n✓'
else
redis:set(boss..'lock_twasel',true)
return '🙋🏼‍♂️*¦* أهلا عزيزي '..TheRankCmd..'\n📡*¦* تم تعطيل التواصل  \n✓'
end
end

function unlock_twasel(msg)
if not SudoBase() then return "🚸*¦ * هذا الامر يخص المطور الاساسي فقط  \n📛" end
if not redis:get(boss..'lock_twasel') then
return '🙋🏼‍♂️*¦* أهلا عزيزي '..TheRankCmd..'\n📡*¦* التواصل بالتاكيد تم تفعيله \n✓'
else 
redis:del(boss..'lock_twasel')
return '🙋🏼‍♂️*¦* أهلا عزيزي '..TheRankCmd..'\n📡*¦* تم تفعيل التواصل \n✓'
end
end

---------------Lock bro-------------------
function lock_brod(msg)
if not SudoBase() then return "📡*¦* هذا الامر يخص المطور فقط  🚶" end
if not redis:get(boss..'lock_brod') then
return '🙋🏼‍♂️*¦* أهلا عزيزي '..TheRankCmd..'\n📡*¦* اذاعه المطورين بالتاكيد تم تعطيله \n✓'
else
redis:del(boss..'lock_brod')
return '🙋🏼‍♂️*¦* أهلا عزيزي '..TheRankCmd..'\n📡*¦* تم تعطيل اذاعه المطورين  \n✓'
end
end
function unlock_brod(msg)
if not SudoBase() then return "📡*¦* هذا الامر يخص المطور فقط  🚶" end
if redis:get(boss..'lock_brod') then
return '🙋🏼‍♂️*¦* أهلا عزيزي '..TheRankCmd..'\n📡*¦* اذاعه المطورين بالتاكيد تم تفعيله \n✓'
else 
redis:set(boss..'lock_brod',true)
return '🙋🏼‍♂️*¦* أهلا عزيزي '..TheRankCmd..'\n📡*¦* تم تفعيل اذاعه المطورين  \n✓'
end
end

---------------Lock replay-------------------
function lock_replay(msg)
if not Admin() then return "📡*¦* هذا الامر يخص الادمنيه فقط  🚶" end
if not redis:get(boss..'replay'..msg.chat_id_) then
return '🙋🏼‍♂️*¦* أهلا عزيزي '..TheRankCmd..'\n📡*¦* الردود بالتاكيد تم تعطيله \n✓'
else
redis:del(boss..'replay'..msg.chat_id_)
return '🙋🏼‍♂️*¦* أهلا عزيزي '..TheRankCmd..'\n📡*¦* تم تعطيل الردود  \n✓'
end
end

function unlock_replay(msg)
if not Admin() then return "📡*¦* هذا الامر يخص الادمنيه فقط  🚶" end
if redis:get(boss..'replay'..msg.chat_id_) then
return '🙋🏼‍♂️*¦* أهلا عزيزي '..TheRankCmd..'\n📡*¦* الردود بالتاكيد تم تفعيله \n✓'
else 
redis:set(boss..'replay'..msg.chat_id_,true)
return '🙋🏼‍♂️*¦* أهلا عزيزي '..TheRankCmd..'\n📡*¦* تم تفعيل الردود  \n✓'
end
end

---------------Lock bot service-------------------
function lock_service(msg)
if not SudoBase() then return "🚸*¦ * هذا الامر يخص المطور الاساسي فقط  \n📛" end
if not redis:get(boss..'lock_service') then
return '🙋🏼‍♂️*¦* أهلا عزيزي '..TheRankCmd..'\n📡*¦* تم بالتاكيد تعطيل نظام البوت خدمي \n✓'
else
redis:del(boss..'lock_service')
return '🙋🏼‍♂️*¦* أهلا عزيزي '..TheRankCmd..'\n📡*¦* تم  تعطيل نظام البوت خدمي \n✓'
end
end

function unlock_service(msg)
if not SudoBase() then return "🚸*¦ * هذا الامر يخص المطور الاساسي فقط  \n📛" end
if redis:get(boss..'lock_service') then
return '🙋🏼‍♂️*¦* أهلا عزيزي '..TheRankCmd..'\n📡*¦* تم بالتأكيد تفعيل نظام البوت خدمي \n✓'
else 
redis:set(boss..'lock_service',true)
return '🙋🏼‍♂️*¦* أهلا عزيزي '..TheRankCmd..'\n📡*¦* تم تفعيل نظام البوت خدمي \n✓\n🚸¦ اصبح البوت الان بامكان اي شخص\n🔚¦ ان يستخدم البوت للتفعيل'
end
end

---------------Lock Link-------------------
function lock_link(msg)
if not Admin() then return "📡*¦* هذا الامر يخص الادمنيه فقط  🚶" end
if redis:get(boss..'lock_link'..msg.chat_id_) then
return '🙋🏼‍♂️*¦* أهلا عزيزي '..TheRankCmd..'\n📡*¦* الروابط بالتأكيد تم قفلها \n✓'
else
redis:set(boss..'lock_link'..msg.chat_id_,true)
return '🙋🏼‍♂️*¦* أهلا عزيزي '..TheRankCmd..'\n📡*¦* تم قفل الروابط \n✓'
end
end

function unlock_link(msg)
if not Admin() then return "📡*¦* هذا الامر يخص الادمنيه فقط  🚶" end
if not redis:get(boss..'lock_link'..msg.chat_id_) then
return '🙋🏼‍♂️*¦* أهلا عزيزي '..TheRankCmd..'\n📡*¦* الروابط بالتأكيد تم فتحها \n✓'
else 
redis:del(boss..'lock_link'..msg.chat_id_)
return '🙋🏼‍♂️*¦* أهلا عزيزي '..TheRankCmd..'\n📡*¦* تم فتح الروابط \n✓'
end
end

---------------Lock Tag-------------------
function lock_tag(msg) 
if not Admin() then return "📡*¦* هذا الامر يخص الادمنيه فقط  🚶" end
if redis:get(boss..'lock_tag'..msg.chat_id_) then
return '🙋🏼‍♂️*¦* أهلا عزيزي '..TheRankCmd..'\n📡*¦* التاك (#) بالتأكيد تم قفله \n✓'
else
redis:set(boss..'lock_tag'..msg.chat_id_,true)
return '🙋🏼‍♂️*¦* أهلا عزيزي '..TheRankCmd..'\n📡*¦* تم قفل التاك (#) \n✓'
end
end

function unlock_tag(msg)

if not Admin() then return "📡*¦* هذا الامر يخص الادمنيه فقط  🚶" end
if not redis:get(boss..'lock_tag'..msg.chat_id_) then
return '🙋🏼‍♂️*¦* أهلا عزيزي '..TheRankCmd..'\n📡*¦* التاك(#) بالتأكيد تم فتحه \n✓'
else 
redis:del(boss..'lock_tag'..msg.chat_id_)
return '🙋🏼‍♂️*¦* أهلا عزيزي '..TheRankCmd..'\n📡*¦* تم فتح التاك (#) \n✓'
end
end
---------------Lock UserName-------------------
function lock_username(msg) 

if not Admin() then return "📡*¦* هذا الامر يخص الادمنيه فقط  🚶" end

if redis:get(boss..'lock_username'..msg.chat_id_) then
return '🙋🏼‍♂️*¦* أهلا عزيزي '..TheRankCmd..'\n📡*¦* المعرفات @ بالتأكيد تم قفله \n✓'
else
redis:set(boss..'lock_username'..msg.chat_id_,true)
return '🙋🏼‍♂️*¦* أهلا عزيزي '..TheRankCmd..'\n📡*¦* تم قفل المعرفات @ \n✓'
end
end

function unlock_username(msg)
if not Admin() then return "📡*¦* هذا الامر يخص الادمنيه فقط  🚶" end
if not redis:get(boss..'lock_username'..msg.chat_id_) then
return '🙋🏼‍♂️*¦* أهلا عزيزي '..TheRankCmd..'\n📡*¦* آلمـعرفآت بآلتآگيد تم فتحهآ @ \n✓'
else 
redis:del(boss..'lock_username'..msg.chat_id_)
return '🙋🏼‍♂️*¦* أهلا عزيزي '..TheRankCmd..'\n📡*¦* تم فتح آلمـعرفآت @ \n✓'
end
end

---------------Lock Edit-------------------
function lock_edit(msg) 
if not Admin() then return "📡*¦* هذا الامر يخص الادمنيه فقط  🚶" end
if redis:get(boss..'lock_edit'..msg.chat_id_) then
return '🙋🏼‍♂️*¦* أهلا عزيزي '..TheRankCmd..'\n📡*¦* التعديل بالتأكيد تم قفله \n✓'
else
redis:set(boss..'lock_edit'..msg.chat_id_,true)
return '🙋🏼‍♂️*¦* أهلا عزيزي '..TheRankCmd..'\n📡*¦* تم قفل التعديل \n✓'
end
end

function unlock_edit(msg)
if not Admin() then return "📡*¦* هذا الامر يخص الادمنيه فقط  🚶" end
if not redis:get(boss..'lock_edit'..msg.chat_id_) then
return '🙋🏼‍♂️*¦* أهلا عزيزي '..TheRankCmd..'\n📡*¦* التعديل بالتأكيد تم فتحه \n✓'
else 
redis:del(boss..'lock_edit'..msg.chat_id_)
return '🙋🏼‍♂️*¦* أهلا عزيزي '..TheRankCmd..'\n📡*¦* تم فتح التعديل \n✓'
end
end

---------------Lock spam-------------------
function lock_spam(msg) 
if not Admin() then return "📡*¦* هذا الامر يخص الادمنيه فقط  🚶" end
if   redis:get(boss..'lock_spam'..msg.chat_id_) then
return '🙋🏼‍♂️*¦* أهلا عزيزي '..TheRankCmd..'\n📡*¦* الكلايش بالتأكيد تم قفلها \n✓'
else
redis:set(boss..'lock_spam'..msg.chat_id_,true)
return '🙋🏼‍♂️*¦* أهلا عزيزي '..TheRankCmd..'\n📡*¦* تم قفل الكلايش \n✓'
end
end

function unlock_spam(msg)
if not Admin() then return "📡*¦* هذا الامر يخص الادمنيه فقط  🚶" end
if not redis:get(boss..'lock_spam'..msg.chat_id_) then
return '🙋🏼‍♂️*¦* أهلا عزيزي '..TheRankCmd..'\n📡*¦* الكلايش بالتأكيد تم فتحها \n✓'
else 
redis:del(boss..'lock_spam'..msg.chat_id_)
return '🙋🏼‍♂️*¦* أهلا عزيزي '..TheRankCmd..'\n📡*¦* تم فتح الكلايش \n✓'
end
end

---------------Lock Flood-------------------
function lock_flood(msg) 
if not Admin() then return "📡*¦* هذا الامر يخص الادمنيه فقط  🚶" end
if redis:get(boss..'lock_flood'..msg.chat_id_) then
return '🙋🏼‍♂️*¦* أهلا عزيزي '..TheRankCmd..'\n📡*¦* التكرار بالتأكيد تم قفله \n✓'
else
redis:set(boss..'lock_flood'..msg.chat_id_,true)
return '🙋🏼‍♂️*¦* أهلا عزيزي '..TheRankCmd..'\n📡*¦* تم قفل التكرار \n✓'
end
end

function unlock_flood(msg)
if not Admin() then return "📡*¦* هذا الامر يخص الادمنيه فقط  🚶" end
if not redis:get(boss..'lock_flood'..msg.chat_id_) then
return '🙋🏼‍♂️*¦* أهلا عزيزي '..TheRankCmd..'\n📡*¦* التكرار بالتأكيد تم فتحه \n✓'
else 
redis:del(boss..'lock_flood'..msg.chat_id_)
return '🙋🏼‍♂️*¦* أهلا عزيزي '..TheRankCmd..'\n📡*¦* تم فتح التكرار \n✓'
end
end

---------------Lock Bots-------------------
function lock_bots(msg) 
if not Admin() then return "📡*¦* هذا الامر يخص الادمنيه فقط  🚶" end
if redis:get(boss..'lock_bots'..msg.chat_id_) then
return '🙋🏼‍♂️*¦* أهلا عزيزي '..TheRankCmd..'\n📡*¦* البوتات بالتأكيد تم قفلها \n✓'
else
redis:set(boss..'lock_bots'..msg.chat_id_,true)
return '🙋🏼‍♂️*¦* أهلا عزيزي '..TheRankCmd..'\n📡*¦* تم قفل البوتات \n✓'
end
end

function unlock_bots(msg)
if not Admin() then return "📡*¦* هذا الامر يخص الادمنيه فقط  🚶" end
if not redis:get(boss..'lock_bots'..msg.chat_id_) then
return '🙋🏼‍♂️*¦* أهلا عزيزي '..TheRankCmd..'\n📡*¦* البوتات بالتأكيد تم فتحها \n✓'
else 
redis:del(boss..'lock_bots'..msg.chat_id_)
return '🙋🏼‍♂️*¦* أهلا عزيزي '..TheRankCmd..'\n📡*¦* تم فتح البوتات \n✓'
end
end

---------------Lock Join-------------------
function lock_join(msg) 
if not Admin() then return "📡*¦* هذا الامر يخص الادمنيه فقط  🚶" end
if redis:get(boss..'lock_join'..msg.chat_id_) then
return '🙋🏼‍♂️*¦* أهلا عزيزي '..TheRankCmd..'\n📡*¦* الاضافه بالتاكيد تم قفلها \n✓'
else
redis:set(boss..'lock_join'..msg.chat_id_,true)
return '🙋🏼‍♂️*¦* أهلا عزيزي '..TheRankCmd..'\n📡*¦* تم قفل الاضافه \n✓'
end
end

function unlock_join(msg)
if not Admin() then return "📡*¦* هذا الامر يخص الادمنيه فقط  🚶" end
if not redis:get(boss..'lock_join'..msg.chat_id_) then
return '🙋🏼‍♂️*¦* أهلا عزيزي '..TheRankCmd..'\n📡*¦* الاضافه بالتاكيد تم فتحها \n✓'
else 
redis:del(boss..'lock_join'..msg.chat_id_)
return '🙋🏼‍♂️*¦* أهلا عزيزي '..TheRankCmd..'\n📡*¦* تم فتح الاضافه \n✓'
end
end

---------------Lock Markdown-------------------
function lock_markdown(msg) 
if not Admin() then return "📡*¦* هذا الامر يخص الادمنيه فقط  🚶" end
if redis:get(boss..'lock_markdown'..msg.chat_id_) then
return '🙋🏼‍♂️*¦* أهلا عزيزي '..TheRankCmd..'\n📡*¦* الماركدوان بالتاكيد تم قفله \n✓'
else
redis:set(boss..'lock_markdown'..msg.chat_id_,true)
return '🙋🏼‍♂️*¦* أهلا عزيزي '..TheRankCmd..'\n📡*¦* تم قفل الماركدوان \n✓'
end
end

function unlock_markdown(msg)
if not Admin() then return "📡*¦* هذا الامر يخص الادمنيه فقط  🚶" end
if not redis:get(boss..'lock_markdown'..msg.chat_id_) then
return '🙋🏼‍♂️*¦* أهلا عزيزي '..TheRankCmd..'\n📡*¦* الماركدوان بالتأكيد تم فتحه \n✓'
else 
redis:del(boss..'lock_markdown'..msg.chat_id_)
return '🙋🏼‍♂️*¦* أهلا عزيزي '..TheRankCmd..'\n📡*¦* تم فتح الماركدوان \n✓'
end
end

---------------Lock Webpage-------------------
function lock_webpage(msg) 
if not Admin() then return "📡*¦* هذا الامر يخص الادمنيه فقط  🚶" end
if redis:get(boss..'lock_webpage'..msg.chat_id_) then
return '🙋🏼‍♂️*¦* أهلا عزيزي '..TheRankCmd..'\n📡*¦* الويب بالتأكيد تم قفله \n✓'
else
redis:set(boss..'lock_webpage'..msg.chat_id_,true)
return '🙋🏼‍♂️*¦* أهلا عزيزي '..TheRankCmd..'\n📡*¦* تم قفل الويب \n✓'
end
end

function unlock_webpage(msg)
if not Admin() then return "📡*¦* هذا الامر يخص الادمنيه فقط  🚶" end
if not redis:get(boss..'lock_webpage'..msg.chat_id_) then
return '🙋🏼‍♂️*¦* أهلا عزيزي '..TheRankCmd..'\n📡*¦* الويب بالتأكيد تم فتحه \n✓'
else 
redis:del(boss..'lock_webpage'..msg.chat_id_)
return '🙋🏼‍♂️*¦* أهلا عزيزي '..TheRankCmd..'\n📡*¦* تم فتح الويب \n✓'
end
end
---------------Mute Gif-------------------
function mute_gif(msg) 
if not Admin() then return "📡*¦* هذا الامر يخص الادمنيه فقط  🚶" end
if redis:get(boss..'mute_gif'..msg.chat_id_) then
return '🙋🏼‍♂️*¦* أهلا عزيزي '..TheRankCmd..'\n📡*¦* المتحركه بالتأكيد تم قفلها \n✓'
else
redis:set(boss..'mute_gif'..msg.chat_id_,true)
return '🙋🏼‍♂️*¦* أهلا عزيزي '..TheRankCmd..'\n📡*¦* تم قفل المتحركه \n✓'
end
end

function unmute_gif(msg)
if not Admin() then return "📡*¦* هذا الامر يخص الادمنيه فقط  🚶" end
if not redis:get(boss..'mute_gif'..msg.chat_id_) then
return '🙋🏼‍♂️*¦* أهلا عزيزي '..TheRankCmd..'\n📡*¦* المتحركه بالتأكيد تم فتحها \n✓'
else 
redis:del(boss..'mute_gif'..msg.chat_id_)
return '🙋🏼‍♂️*¦* أهلا عزيزي '..TheRankCmd..'\n📡*¦* تم فتح المتحركه \n✓'
end
end
---------------Mute Game-------------------
function mute_game(msg) 
if not Admin() then return "📡*¦* هذا الامر يخص الادمنيه فقط  🚶" end
if redis:get(boss..'mute_game'..msg.chat_id_) then
return '🙋🏼‍♂️*¦* أهلا عزيزي '..TheRankCmd..'\n📡*¦* الالعاب بالتأكيد تم قفلها \n✓'
else
redis:set('mute_game'..msg.chat_id_,true)
return '🙋🏼‍♂️*¦* أهلا عزيزي '..TheRankCmd..'\n📡*¦* تم قفل الالعاب \n✓'
end
end

function unmute_game(msg)
if not Admin() then return "📡*¦* هذا الامر يخص الادمنيه فقط  🚶" end
if not redis:get(boss..'mute_game'..msg.chat_id_) then
return '🙋🏼‍♂️*¦* أهلا عزيزي '..TheRankCmd..'\n📡*¦* الألعاب بالتأكيد تم فتحها \n✓'
else 
redis:del(boss..'mute_game'..msg.chat_id_)
return '🙋🏼‍♂️*¦* أهلا عزيزي '..TheRankCmd..'\n📡*¦* تم فتح الألعاب \n✓'
end
end
---------------Mute Inline-------------------
function mute_inline(msg) 
if not Admin() then return "📡*¦* هذا الامر يخص الادمنيه فقط  🚶" end
if redis:get(boss..'mute_inline'..msg.chat_id_) then
return '🙋🏼‍♂️*¦* أهلا عزيزي '..TheRankCmd..'\n📡*¦* الانلاين بالتأكيد تم قفله \n✓'
else
redis:set(boss..'mute_inline'..msg.chat_id_,true)
return '🙋🏼‍♂️*¦* أهلا عزيزي '..TheRankCmd..'\n📡*¦* تم قفل الانلاين \n✓'
end
end

function unmute_inline(msg)
if not Admin() then return "📡*¦* هذا الامر يخص الادمنيه فقط  🚶" end
if not redis:get(boss..'mute_inline'..msg.chat_id_) then
return '🙋🏼‍♂️*¦* أهلا عزيزي '..TheRankCmd..'\n📡*¦* الانلاين بالتأكيد تم فتحه \n✓'
else 
redis:del(boss..'mute_inline'..msg.chat_id_)
return '🙋🏼‍♂️*¦* أهلا عزيزي '..TheRankCmd..'\n📡*¦* تم فتح الانلاين \n✓'
end
end
---------------Mute Text-------------------
function mute_text(msg) 
if not Admin() then return "📡*¦* هذا الامر يخص الادمنيه فقط  🚶" end
if redis:get(boss..'mute_text'..msg.chat_id_) then
return '🙋🏼‍♂️*¦* أهلا عزيزي '..TheRankCmd..'\n📡*¦* الدرشه بالتأكيد تم قفلها \n✓'
else
redis:set(boss..'mute_text'..msg.chat_id_,true)
return '🙋🏼‍♂️*¦* أهلا عزيزي '..TheRankCmd..'\n📡*¦* تم قفل الدردشه \n✓'
end
end

function unmute_text(msg)
if not Admin() then return "📡*¦* هذا الامر يخص الادمنيه فقط  🚶" end
if not redis:get(boss..'mute_text'..msg.chat_id_) then
return '🙋🏼‍♂️*¦* أهلا عزيزي '..TheRankCmd..'\n📡*¦* الدردشه بالتأكيد تم فتحها \n✓'
else 
redis:del(boss..'mute_text'..msg.chat_id_,true)
return '🙋🏼‍♂️*¦* أهلا عزيزي '..TheRankCmd..'\n📡*¦* تم فتح الدردشه \n✓'
end
end
---------------Mute photo-------------------
function mute_photo(msg) 
if not Admin() then return "📡*¦* هذا الامر يخص الادمنيه فقط  🚶" end
if redis:get(boss..'mute_photo'..msg.chat_id_) then
return '🙋🏼‍♂️*¦* أهلا عزيزي '..TheRankCmd..'\n📡*¦* الصور بالتأكيد تم قفلها \n✓'
else
redis:set(boss..'mute_photo'..msg.chat_id_,true)
return '🙋🏼‍♂️*¦* أهلا عزيزي '..TheRankCmd..'\n📡*¦* تم قفل الصور \n✓'
end
end

function unmute_photo(msg)
if not Admin() then return "📡*¦* هذا الامر يخص الادمنيه فقط  🚶" end
if not redis:get(boss..'mute_photo'..msg.chat_id_)then
return '🙋🏼‍♂️*¦* أهلا عزيزي '..TheRankCmd..'\n📡*¦* الصور بالتأكيد تم فتحها \n✓'
else 
redis:del(boss..'mute_photo'..msg.chat_id_)
return '🙋🏼‍♂️*¦* أهلا عزيزي '..TheRankCmd..'\n📡*¦* تم فتح الصور \n✓'
end
end
---------------Mute Video-------------------
function mute_video(msg) 
if not Admin() then return "📡*¦* هذا الامر يخص الادمنيه فقط  🚶" end
if redis:get(boss..'mute_video'..msg.chat_id_) then
return '🙋🏼‍♂️*¦* أهلا عزيزي '..TheRankCmd..'\n📡*¦* الفيديو بالتأكيد تم قفلها \n✓'
else
redis:set(boss..'mute_video'..msg.chat_id_,true)
return '🙋🏼‍♂️*¦* أهلا عزيزي '..TheRankCmd..'\n📡*¦* تم قفل الفيديو \n✓'
end
end

function unmute_video(msg)
if not Admin() then return "📡*¦* هذا الامر يخص الادمنيه فقط  🚶" end
if not redis:get(boss..'mute_video'..msg.chat_id_) then
return '🙋🏼‍♂️*¦* أهلا عزيزي '..TheRankCmd..'\n📡*¦* الفيديو يال��أكيد تم فتحها \n✓'
else 
redis:del(boss..'mute_video'..msg.chat_id_)
return '🙋🏼‍♂️*¦* أهلا عزيزي '..TheRankCmd..'\n📡*¦* تم فتح الفيديو \n✓'
end
end
---------------Mute Audio-------------------
function mute_audio(msg) 
if not Admin() then return "📡*¦* هذا الامر يخص الادمنيه فقط  🚶" end
if redis:get(boss..'mute_audio'..msg.chat_id_) then
return '🙋🏼‍♂️*¦* أهلا عزيزي '..TheRankCmd..'\n📡*¦* البصمات بالتأكيد تم قفلها \n✓'
else
redis:set(boss..'mute_audio'..msg.chat_id_,true)
return '🙋🏼‍♂️*¦* أهلا عزيزي '..TheRankCmd..'\n📡*¦* تم قفل البصمات \n✓'
end
end

function unmute_audio(msg)
if not Admin() then return "📡*¦* هذا الامر يخص الادمنيه فقط  🚶" end
if not redis:get(boss..'mute_audio'..msg.chat_id_) then
return '🙋🏼‍♂️*¦* أهلا عزيزي '..TheRankCmd..'\n📡*¦* البصمات بالتأكيد تم فتحها \n✓'
else 
redis:del(boss..'mute_audio'..msg.chat_id_)
return '🙋🏼‍♂️*¦* أهلا عزيزي '..TheRankCmd..'\n📡*¦* تم فتح البصمات \n✓'
end
end
---------------Mute Voice-------------------
function mute_voice(msg) 
if not Admin() then return "📡*¦* هذا الامر يخص الادمنيه فقط  🚶" end
if   redis:get(boss..'mute_voice'..msg.chat_id_) then
return '🙋🏼‍♂️*¦* أهلا عزيزي '..TheRankCmd..'\n📡*¦* الصوت بالتأكيد تم قفله \n✓'
else
redis:set(boss..'mute_voice'..msg.chat_id_,true)
return '🙋🏼‍♂️*¦* أهلا عزيزي '..TheRankCmd..'\n📡*¦* تم قفل الصوت \n✓'
end
end

function unmute_voice(msg)
if not Admin() then return "📡*¦* هذا الامر يخص الادمنيه فقط  🚶" end
if not redis:get(boss..'mute_voice'..msg.chat_id_) then
return '🙋🏼‍♂️*¦* أهلا عزيزي '..TheRankCmd..'\n📡*¦* الصوت بالتأكيد تم فتحه \n✓'
else 
redis:del(boss..'mute_voice'..msg.chat_id_)
return '🙋🏼‍♂️*¦* أهلا عزيزي '..TheRankCmd..'\n📡*¦* تم فتح الصوت \n✓'
end
end
---------------Mute Sticker-------------------
function mute_sticker(msg) 

if not Admin() then return "📡*¦* هذا الامر يخص الادمنيه فقط  🚶" end

if   redis:get(boss..'mute_sticker'..msg.chat_id_) then
return '🙋🏼‍♂️*¦* أهلا عزيزي '..TheRankCmd..'\n📡*¦* الملصقات بالتأكيد تم قفلها \n✓'
else
redis:set(boss..'mute_sticker'..msg.chat_id_,true)
return '🙋🏼‍♂️*¦* أهلا عزيزي '..TheRankCmd..'\n📡*¦* تم قفل الملصقات \n✓'
end
end

function unmute_sticker(msg)
if not Admin() then return "📡*¦* هذا الامر يخص الادمنيه فقط  🚶" end
if not redis:get(boss..'mute_sticker'..msg.chat_id_) then
return '🙋🏼‍♂️*¦* أهلا عزيزي '..TheRankCmd..'\n📡*¦* الملصقات بالتأكيد تم فتحها \n✓'
else 
redis:del(boss..'mute_sticker'..msg.chat_id_)
return '🙋🏼‍♂️*¦* أهلا عزيزي '..TheRankCmd..'\n📡*¦* تم فتح الملصقات \n✓'
end
end
---------------Mute Contact-------------------
function mute_contact(msg) 
if not Admin() then return "📡*¦* هذا الامر يخص الادمنيه فقط  🚶" end
if redis:get(boss..'mute_contact'..msg.chat_id_) then
return '🙋🏼‍♂️*¦* أهلا عزيزي '..TheRankCmd..'\n📡*¦* جهات الاتصال بالتأكيد تم قفلها \n✓'
else
redis:set(boss..'mute_contact'..msg.chat_id_,true)
return '🙋🏼‍♂️*¦* أهلا عزيزي '..TheRankCmd..'\n📡*¦* تم قفل جهات الاتصال \n✓'
end
end

function unmute_contact(msg)
if not Admin() then return "📡*¦* هذا الامر يخص الادمنيه فقط  🚶" end
if not redis:get(boss..'mute_contact'..msg.chat_id_) then
return '🙋🏼‍♂️*¦* أهلا عزيزي '..TheRankCmd..'\n📡*¦* جهات الاتصال بالتأكيد تم فتحها \n✓'
else 
redis:del(boss..'mute_contact'..msg.chat_id_)
return '🙋🏼‍♂️*¦* أهلا عزيزي '..TheRankCmd..'\n📡*¦* تم فتح جهات الاتصال \n✓'
end
end
---------------Mute Forward-------------------
function mute_forward(msg) 
if not Admin() then return "📡*¦* هذا الامر يخص الادمنيه فقط  🚶" end
if redis:get(boss..'mute_forward'..msg.chat_id_) then
return '🙋🏼‍♂️*¦* أهلا عزيزي '..TheRankCmd..'\n📡*¦* التوجيه بالتأكيد تم قفلها \n✓'
else
redis:set(boss..'mute_forward'..msg.chat_id_,true)
return '🙋🏼‍♂️*¦* أهلا عزيزي '..TheRankCmd..'\n📡*¦* تم قفل التوجيه \n✓'
end
end

function unmute_forward(msg)
if not Admin() then return "📡*¦* هذا الامر يخص الادمنيه فقط  🚶" end
if not redis:get(boss..'mute_forward'..msg.chat_id_) then
return '🙋🏼‍♂️*¦* أهلا عزيزي '..TheRankCmd..'\n📡*¦* التوجيه بالتأكيد تم فتحها \n✓'
else 
redis:del(boss..'mute_forward'..msg.chat_id_)
return '🙋🏼‍♂️*¦* أهلا عزيزي '..TheRankCmd..'\n📡*¦* تم فتح التوجيه \n✓'
end
end
---------------Mute Location-------------------
function mute_location(msg) 
if not Admin() then return "📡*¦* هذا الامر يخص الادمنيه فقط  🚶" end
if redis:get(boss..'mute_location'..msg.chat_id_) then
return '🙋🏼‍♂️*¦* أهلا عزيزي '..TheRankCmd..'\n📡*¦* الموقع بالتأكيد تم قفله \n✓'
else
redis:set(boss..'mute_location'..msg.chat_id_,true)
return '🙋🏼‍♂️*¦* أهلا عزيزي '..TheRankCmd..'\n📡*¦* تم قفل الموقع \n✓'
end
end

function unmute_location(msg)
if not Admin() then return "📡*¦* هذا الامر يخص الادمنيه فقط  🚶" end
if not redis:get(boss..'mute_location'..msg.chat_id_) then
return '🙋🏼‍♂️*¦* أهلا عزيزي '..TheRankCmd..'\n📡*¦* الموقع بالتأكيد تم فتحه \n✓'
else 
redis:del(boss..'mute_location'..msg.chat_id_)
return '🙋🏼‍♂️*¦* أهلا عزيزي '..TheRankCmd..'\n📡*¦* تم فتح الموقع \n✓'
end
end
---------------Mute Document-------------------
function mute_document(msg) 
if not Admin() then return "📡*¦* هذا الامر يخص الادمنيه فقط  🚶" end
if redis:get(boss..'mute_document'..msg.chat_id_) then
return '🙋🏼‍♂️*¦* أهلا عزيزي '..TheRankCmd..'\n📡*¦* الملفات بالتأكيد تم قفلها \n✓'
else
redis:set(boss..'mute_document'..msg.chat_id_,true)
return '🙋🏼‍♂️*¦* أهلا عزيزي '..TheRankCmd..'\n📡*¦* تم قفل الملفات \n✓'
end
end

function unmute_document(msg)
if not Admin() then return "📡*¦* هذا الامر يخص الادمنيه فقط  🚶" end
if not redis:get(boss..'mute_document'..msg.chat_id_) then
return '🙋🏼‍♂️*¦* أهلا عزيزي '..TheRankCmd..'\n📡*¦* الملفات بالتأكيد تم فتحها \n✓'
else 
redis:del(boss..'mute_document'..msg.chat_id_)
return '🙋🏼‍♂️*¦* أهلا عزيزي '..TheRankCmd..'\n📡*¦* تم فتح الملفات \n✓'
end
end
---------------Mute TgService-------------------
function mute_tgservice(msg) 
if not Admin() then return "📡*¦* هذا الامر يخص الادمنيه فقط  🚶" end
if redis:get(boss..'mute_tgservice'..msg.chat_id_) then
return '🙋🏼‍♂️*¦* أهلا عزيزي '..TheRankCmd..'\n📡*¦* الاشعارات بالتأكيد تم قفلها \n✓'
else
redis:set(boss..'mute_tgservice'..msg.chat_id_,true)
return '🙋🏼‍♂️*¦* أهلا عزيزي '..TheRankCmd..'\n📡*¦* تم قفل الاشعارات \n✓'
end
end

function unmute_tgservice(msg)
if not Admin() then return "📡*¦* هذا الامر يخص الادمنيه فقط  🚶" end
if not redis:get(boss..'mute_tgservice'..msg.chat_id_) then
return '🙋🏼‍♂️*¦* أهلا عزيزي '..TheRankCmd..'\n📡*¦* الاشعارات بالتأكيد تم فتحها \n✓'
else 
redis:del(boss..'mute_tgservice'..msg.chat_id_)
return '🙋🏼‍♂️*¦* أهلا عزيزي '..TheRankCmd..'\n📡*¦* تم فتح الاشعارات \n✓'
end
end

---------------Mute Keyboard-------------------
function mute_keyboard(msg) 
if not Admin() then return "📡*¦* هذا الامر يخص الادمنيه فقط  🚶" end
if redis:get(boss..'mute_keyboard'..msg.chat_id_) then
return '🙋🏼‍♂️*¦* أهلا عزيزي '..TheRankCmd..'\n📡*¦* الكيبورد بالتأكيد تم قفله \n✓'
else
redis:set(boss..'mute_keyboard'..msg.chat_id_,true)
return '🙋🏼‍♂️*¦* أهلا عزيزي '..TheRankCmd..'\n📡*¦* تم قفل الكيبورد \n✓'
end
end

function unmute_keyboard(msg)
if not Admin() then return "📡*¦* هذا الامر يخص الادمنيه فقط  🚶" end
if not redis:get(boss..'mute_keyboard'..msg.chat_id_) then
return '🙋🏼‍♂️*¦* أهلا عزيزي '..TheRankCmd..'\n📡*¦* الكيبورد بالتأكيد تم فتحه \n✓'
else 
redis:del(boss..'mute_keyboard'..msg.chat_id_)
return '🙋🏼‍♂️*¦* أهلا عزيزي '..TheRankCmd..'\n📡*¦* تم فتح الكيبورد \n✓'
end
end

---------------lock_bots_by_kick-------------------
function lock_bots_by_kick(msg)
if not Admin() then return "📡*¦* هذا الامر يخص الادمنيه فقط  🚶" end
if redis:get(boss..'lock_bots_by_kick'..msg.chat_id_) then
return '🙋🏼‍♂️*¦* أهلا عزيزي '..TheRankCmd..'\n📡*¦* البوتات بالطرد بالتاكيد تم قفله \n✓'
else
redis:del(boss..'lock_bots'..msg.chat_id_) 
redis:set(boss..'lock_bots_by_kick'..msg.chat_id_,true)
return '🙋🏼‍♂️*¦* أهلا عزيزي '..TheRankCmd..'\n📡*¦* تم قفل البوتات بالطرد (مع طرد الي ضافه) \n✓'
end
end

function unlock_bots_by_kick(msg)
if not Admin() then return "📡*¦* هذا الامر يخص الادمنيه فقط  🚶" end
if not redis:get(boss..'lock_bots_by_kick'..msg.chat_id_) then
return '🙋🏼‍♂️*¦* أهلا عزيزي '..TheRankCmd..'\n📡*¦* البوتات بالطرد بالتاكيد مفتوحه \n✓'
else 
redis:del(boss..'lock_bots_by_kick'..msg.chat_id_)
return '🙋🏼‍♂️*¦* أهلا عزيزي '..TheRankCmd..'\n📡*¦* تم فتح البوتات بالطرد  \n✓'
end
end
---------------locks pin-------------------
function lock_pin(msg)
if not Admin() then return "📡*¦* هذا الامر يخص الادمنيه فقط  🚶" end
if redis:get(boss..'lock_pin'..msg.chat_id_) then
return '🙋🏼‍♂️*¦* أهلا عزيزي '..TheRankCmd..'\n📡*¦* التثبيت بالفعل مقفل \n✓'
else
redis:set(boss..'lock_pin'..msg.chat_id_,true) 
return '🙋🏼‍♂️*¦* أهلا عزيزي '..TheRankCmd..'\n📡*¦* تـم قفل التثبيت \n✓'
end
end

function unlock_pin(msg)
if not Admin() then return "📡*¦* هذا الامر يخص الادمنيه فقط  🚶" end
if not redis:get(boss..'lock_pin'..msg.chat_id_) then
return '🙋🏼‍♂️*¦* أهلا عزيزي '..TheRankCmd..'\n📡*¦* التثبيت بالفعل مفتوح \n✓'
else 
redis:del(boss..'lock_pin'..msg.chat_id_)
return '🙋🏼‍♂️*¦* أهلا عزيزي '..TheRankCmd..'\n📡*¦* تـم فتح التثبيت   \n✓'
end
end
function Flterzhrfa(Name)
local FlterChar = {
["ټ"] = "ت",
["ٽ"] = "ث",
["چ"] = "ج",
["ڂ"] = "خ",
["ځ"] = "ح",
["ڍ"] = "د",
["ڎ"] = "ذ",
["ڔ"] = "ر",
["ژ"] = "ز",
["ڛ"] = "س",
["ڜ"] = "ش",
["ڝ"] = "ص",
["ڞ"] = "ض",
["ط"] = "ط",
["ڟ"] = "ظ",
["ع"] = "ع",
["ڠ"] = "غ",
["ڢ"] = "ف",
["ڣ"] = "ق",
["ک"] = "ك",
["ڷ"] = "ل",
["۾"] = "م",
["ن"] = "ن",
["ﻬ"] = "ه",
["ﯝ"] = "و",
["ء"] = "ء",
["ﻰ"] = "ى",
["ٻ"] = "ب",
["ٺ"] = "ت",
["ڄ"] = "ج",
["ﭸ"] = "ح",
["ځ"] = "خ",
["ڊ"] = "د",
["ڈ"] = "ذ",
["ﺮ"] = "ر",
["ﺰ"] = "ز",
["ڛ"] = "س",
["ﺶ"] = "ش",
["ﺺ"] = "ص",
["ﺾ"] = "ض",
["ﻂ"] = "ط",
["ﻆ"] = "ظ",
["ﻊ"] = "ع",
["ﻐ"] = "غ",
["ﻑ"] = "ف",
["ﻖ"] = "ق",
["ڳ"] = "ك",
["ﻞ"] = "ل",
["ﻡ"] = "م",
["ﻦ"] = "ن",
["ﻩ"] = "ه",
["ﯙ"] = "و",
["ﮯ"] = "",
["ي"] = "ي",
["ڀ"] = "ب",
["ﭥ"] = "ث",
["چ"] = "ج",
["ﭹ"] = "ح",
["ڂ"] = "خ",
["ڍ"] = "ي",
["ڎ"] = "ذ",
["ﺭ"] = "ر",
["ﻧ"] = "ز",
["ښ"] = "س",
["ﺸ"] = "ش",
["ﺻ"] = "ص",
["ﺿ"] = "ض",
["ﻄ"] = "ط",
["ﻇ"] = "ظ",
["ﻌ"] = "ع",
["ﻏ"] = "غ",
["ﻒ"] = "ف",
["ﻘ"] = "ق",
["ڲ"] = "ك",
["ﻠ"] = "ا",
["ﻢ"] = "م",
["ﻨ"] = "ن",
["ﻪ"] = "ه",
["ﯠ"] = "و",
["ﮰ"] = "",
["ﻲ"] = "ي",
["ٻ"] = "ب",
["ٿ"] = "ت",
["ﭢ"] = "ث",
["ڇ"] = "ج",
["ﮁ"] = "ج",
["څ"] = "خ",
["ډ"] = "د",
["ڏ"] = "ذ",
["ﭠ"] = "ت",
["ﺴ"] = "س",
["ﺷ"] = "ش",
["ﺼ"] = "ص",
["ﻀ"] = "ض",
["ط"] = "ط",
["ﻈ"] = "ظ",
["ﻋ"] = "ء",
["ﻎ"] = "غ",
["ﻔ"] = "ف",
["ڦ"] = "ق",
["ﻚ"] = "ك",
["ﻝ"] = "ل",
["ﻣ"] = "م",
["ﻧ"] = "ن",
["ﻬ"] = "ه",
["ﯡ"] = "و",
["ﮱ"] = "",
["ﻰ"] = "ى",
["ﮡ"] = "",
["ﮢ"] = "",
["ﮣ"] = "",
["ﮤ"] = "ه",
["ﮥ"] = "ه",
["ﮦ"] = "ه",
["ﮧ"] = "",
["ﮨ"] = "",
["ﮩ"] = "",
["ﮫ"] = "ه",
["ﮬ"] = "ه",
["ﮭ"] = "ه",
["ﮮ"] = "",
["ﮯ"] = "",
["ﮰ"] = "",
["ﮱ"] = "",
["ﯙ"] = "و",
["ﯚ"] = "و",
["ﯼ"] = "ى",
["ﯽ"] = "ى",
["ﯾ"] = "ي",
["ﯿ"] = "ي",
["ﺐ"] = "ب",
["ﺑ"] = "ب",
["ﺒ"] = "ب",
["ﺓ"] = "ة",
["ﺔ"] = "ة",
["ﺕ"] = "ت",
["ﺖ"] = "ت",
["ﺗ"] = "ت",
["ﺘ"] = "ت",
["ﺙ"] = "ث",
["ﺚ"] = "ث",
["ﺛ"] = "ث",
["ﺜ"] = "ث",
["ﺝ"] = "ج",
["ﺞ"] = "ج",
["ﺟ"] = "ج",
["ﺠ"] = "",
["ﺡ"] = "ح",
["ﺢ"] = "ح",
["ﺣ"] = "ح",
["ﺤ"] = "ح",
["ﺥ"] = "خ",
["ﺦ"] = "خ",
["ﺧ"] = "خ",
["ﺨ"] = "خ",
["ﺩ"] = "د",
["ﺪ"] = "د",
["ﺫ"] = "ذ",
["ﺬ"] = "ذ",
["ﺭ"] = "ر",
["ﺮ"] = "ر",
["ﺯ"] = "ز",
["ﺰ"] = "ز",
["ﺱ"] = "س",
["ﺲ"] = "س",
["ﺳ"] = "س",
["ﺴ"] = "س",
["ﺵ"] = "ش",
["ﺶ"] = "ش",
["ﺷ"] = "ش",
["ﺸ"] = "ش",
["ﺹ"] = "ص",
["ﺺ"] = "ص",
["ﺻ"] = "ص",
["ﺼ"] = "ص",
["ﺽ"] = "ض",
["ﺾ"] = "ض",
["ﺿ"] = "ض",
["ﻀ"] = "ض",
["ﻁ"] = "ط",
["ﻂ"] = "ط",
["ﻃ"] = "ط",
["ﻄ"] = "ط",
["ﻅ"] = "ظ",
["ﻆ"] = "ظ",
["ﻇ"] = "ظ",
["ﻈ"] = "ظ",
["ﻉ"] = "ع",
["ﻊ"] = "ع",
["ﻋ"] = "ء",
["ﻌ"] = "ع",
["ﻍ"] = "غ",
["ﻎ"] = "غ",
["ﻏ"] = "غ",
["ﻐ"] = "غ",
["ﻑ"] = "ف",
["ﻒ"] = "ف",
["ﻓ"] = "ف",
["ﻔ"] = "غ",
["ﻕ"] = "ق",
["ﻖ"] = "ق",
["ﻗ"] = "ق",
["ﻘ"] = "ق",
["ﻙ"] = "ك",
["ﻚ"] = "ك",
["ﻛ"] = "ك",
["ﻜ"] = "ك",
["ﻝ"] = "ل",
["ﻞ"] = "ل",
["ﻟ"] = "ا",
["ﻠ"] = "ا",
["ﻡ"] = "م",
["ﻢ"] = "م",
["ﻣ"] = "م",
["ﻤ"] = "م",
["ﻥ"] = "ن",
["ﻦ"] = "ن",
["ﻧ"] = "ن",
["ﻨ"] = "ن",
["ٲ"] = "ا",
["ٳ"] = "ا",
["ٴ"] = "",
["ٶ"] = "و",
["ٷ"] = "و",
["ٸ"] = "ئ",
["ٹ"] = "",
["ٺ"] = "ت",
["ٻ"] = "ب",
["پ"] = "ب",
["ٿ"] = "ث",
["ڀ"] = "ب",
["ځ"] = "ح",
["ڂ"] = "خ",
["ڃ"] = "ج",
["ڄ"] = "ج",
["څ"] = "خ",
["چ"] = "ج",
["ڇ"] = "ج",
["ڈ"] = "د",
["ډ"] = "د",
["ڊ"] = "د",
["ڋ"] = "د",
["ڌ"] = "ذ",
["ڍ"] = "د",
["ڎ"] = "ذ",
["ڏ"] = "ذ",
["ڐ"] = "ذ",
["ڑ"] = "ر",
["ڒ"] = "ر",
["ړ"] = "ر",
["ڔ"] = "ر",
["ڕ"] = "ر",
["ږ"] = "ر",
["ڗ"] = "ز",
["ژ"] = "ز",
["ڙ"] = "ز",
["ښ"] = "س",
["ڛ"] = "س",
["ڜ"] = "ش",
["ڝ"] = "ص",
["ڞ"] = "ض",
["ڟ"] = "ظ",
["ڠ"] = "غ",
["ڡ"] = "ف",
["ڢ"] = "ف",
["ڣ"] = "ف",
["ڤ"] = "ف",
["ڥ"] = "ف",
["ڦ"] = "ف",
["ڧ"] = "ف",
["ڨ"] = "ف",
["ک"] = "ك",
["ڪ"] = "ك",
["ګ"] = "ك",
["ڬ"] = "ك",
["ڭ"] = "ك",
["ڮ"] = "ك",
["گ"] = "ك",
["ڰ"] = "ك",
["ڱ"] = "ك",
["ڲ"] = "ك",
["ڳ"] = "ك",
["ڴ"] = "ك",
["ڵ"] = "ل",
["ڶ"] = "ل",
["ڷ"] = "ل",
["ں"] = "",
["ڻ"] = "",
["ڼ"] = "ن",
["ڽ"] = "ن",
["ھ"] = "ه",
["ۀ"] = "ه",
["ۂ"] = "ه",
["ۃ"] = "ة",
["ۄ"] = "و",
["ۅ"] = "و",
["ۆ"] = "و",
["ۇ"] = "و",
["ۈ"] = "و",
["ۉ"] = "و",
["ۊ"] = "و",
["ۋ"] = "و",
["ی"] = "ى",
["ۍ"] = "ى",
["ێ"] = "ى",
["ې"] = "ي",
["ۑ"] = "ي",
["ے"] = "",
["ۓ"] = "",
["ە"] = "ه",
["ٲ"] = "ا",
["ٻ"] = "ب",
["ٺ"] = "ت",
["ڄ"] = "ج",
["ﭸ"] = "ج",
["ځ"] = "ح",
["ڊ"] = "د",
["ڈ"] = "ذ",
["ﺮ"] = "ر",
["ﺰ"] = "ز",
["ڛ"] = "س",
["ﺶ"] = "ش",
["ﺺ"] = "ص",
["ﺾ"] = "ض",
["ﻂ"] = "ط",
["ﻆ"] = "ظ",
["ﻊ"] = "ع",
["غ"] = "غ",
["ﻑ"] = "ف",
["ﻖ"] = "ق",
["ڳ"] = "ك",
["ﻡ"] = "م",
["ﻦ"] = "ن",
["ﻩ"] = "ه",
["ﯙ"] = "و",
["ٳ"] = "ا",
["ٻ"] = "ب",
["چ"] = "ج",
["ڂ"] = "خ",
["ځ"] = "ح",
["ڍ"] = "د",
["ڎ"] = "ذ",
["ڔ"] = "ر",
["ژ"] = "ز",
["ڛ"] = "س",
["ڜ"] = "ش",
["ڝ"] = "ص",
["ڞ"] = "ض",
["ط"] = "ط",
["ڟ"] = "ظ",
["ڠ"] = "غ",
["غ"] = "غ",
["ڢ"] = "ف",
["ڣ"] = "ف",
["ک"] = "ك",
["۾"] = "م",
["ن"] = "ن",
["ﻬ"] = "ه",
["ﯝ"] = "ؤ",
["ﻰ"] = "ى",
["ا"] = "ا",
["ٻ"] = "ب",
["ٿ"] = "ث",
["ﭢ"] = "ث",
["ڇ"] = "ج",
["ﮁ"] = "ج",
["څ"] = "خ",
["ډ"] = "د",
["ڏ"] = "ذ",
["ر"] = "ر",
["ﭠ"] = "ت",
["ﺳ"] = "س",
["ﺴ"] = "س",
["ﺷ"] = "ش",
["ﺼ"] = "ص",
["ﻀ"] = "ض",
["ﻈ"] = "ظ",
["ﻋ"] = "ء",
["ﻔ"] = "ف",
["ڦ"] = "ف",
["ﻚ"] = "ك",
["ﻣ"] = "م",
["ﻧ"] = "ن",
["ﻬ"] = "ه",
["ﯡ"] = "و",
["ﻰ"] = "ى",
["ﮱ"] = "",
["ٵ"] = "ا",
["ٶ"] = "و",
["ٷ"] = "و",
["ٸ"] = "ى",
["ٹ"] = "",
["ٺ"] = "ت",
["ٻ"] = "ب",
["پ"] = "ب",
["ٿ"] = "ت",
["ڀ"] = "ب",
["ځ"] = "ح",
["ڂ"] = "خ",
["ڃ"] = "ج",
["ڄ"] = "ج",
["څ"] = "خ",
["چ"] = "ج",
["ڇ"] = "ج",
["ڈ"] = "د",
["ډ"] = "د",
["ڊ"] = "د",
["ڋ"] = "د",
["ڌ"] = "ذ",
["ڍ"] = "د",
["ڎ"] = "ذ",
["ڏ"] = "ذ",
["ڐ"] = "ذ",
["ڑ"] = "ر",
["ڒ"] = "ر",
["ړ"] = "ر",
["ڔ"] = "ر",
["ڕ"] = "ر",
["ږ"] = "ر",
["ڗ"] = "ز",
["ژ"] = "ز",
["ڙ"] = "ز",
["ښ"] = "س",
["ڛ"] = "س",
["ڜ"] = "ش",
["ڝ"] = "ص",
["ڞ"] = "",
["ڟ"] = "ظ",
["ڠ"] = "غ",
["ڡ"] = "ف",
["ڢ"] = "ف",
["ڣ"] = "ف",
["ڤ"] = "ق",
["ڥ"] = "ق",
["ڦ"] = "ق",
["ڧ"] = "ف",
["ڨ"] = "ق",
["ک"] = "ك",
["ڪ"] = "ك",
["ګ"] = "ك",
["ڬ"] = "ك",
["ڭ"] = "ك",
["ڮ"] = "ك",
["گ"] = "ك",
["ڰ"] = "ك",
["ڱ"] = "ك",
["ڲ"] = "ك",
["ڳ"] = "ك",
["ڴ"] = "ك",
["ڵ"] = "ل",
["ڶ"] = "ل",
["ڷ"] = "ل",
["ں"] = "",
["ڻ"] = "ن",
["ڼ"] = "ن",
["ڽ"] = "ن",
["ھ"] = "ه",
["ۀ"] = "ه",
["ۂ"] = "ه",
["ۃ"] = "ة",
["ۄ"] = "و",
["ۅ"] = "و",
["ۆ"] = "و",
["ۇ"] = "و",
["ۈ"] = "و",
["ۉ"] = "و",
["ۊ"] = "و",
["ۋ"] = "و",
["ی"] = "ى",
["ۍ"] = "ى",
["ێ"] = "ى",
["ې"] = "ي",
["ۑ"] = "ي",
["ے"] = "",
["ۓ"] = "",
["ﭒ"] = "ي",
["ﭓ"] = "ي",
["ﭔ"] = "ي",
["ﭕ"] = "ي",
["ﭖ"] = "ب",
["ﭗ"] = "ب",
["ﭘ"] = "ب",
["ﭙ"] = "ب",
["ﭚ"] = "ب",
["ﭛ"] = "ي",
["ﭜ"] = "ي",
["ﭝ"] = "ي",
["ﭞ"] = "ت",
["Ξ"] = "",
["Ζ"] = "z",
["ﭠ"] = "ت",
["ﭡ"] = "ت",
["ﭢ"] = "ت",
["ﭣ"] = "ت",
["ﭤ"] = "ت",
["ﭥ"] = "ت",
["ﭦ"] = "",
["ﭧ"] = "",
["ﭨ"] = "",
["ﭩ"] = "",
["ﭪ"] = "ف",
["ﭫ"] = "ف",
["ﭬ"] = "ف",
["ﭭ"] = "ف",
["ﭮ"] = "ف",
["ﭯ"] = "ف",
["ﭰ"] = "ف",
["ﭱ"] = "ف",
["ﭲ"] = "ج",
["ﭳ"] = "ج",
["ﭴ"] = "ج",
["ﭵ"] = "ج",
["ﭶ"] = "ج",
["ﭷ"] = "ج",
["ﭸ"] = "ج",
["ﭹ"] = "ج",
["ﭺ"] = "ج",
["ﭻ"] = "ج",
["ﭼ"] = "ج",
["ﭽ"] = "ج",
["ﭾ"] = "ج",
["ﮑ"] = "ك",
["ﮐ"] = "ك",
["ﮏ"] = "ك",
["ﮎ"] = "ك",
["ﮍ"] = "ر",
["ﮌ"] = "ر",
["ﮋ"] = "ز",
["ﮊ"] = "ز",
["ﮉ"] = "ذ",
["ﮈ"] = "د",
["ﮇ"] = "ذ",
["ﮆ"] = "ذ",
["ﮅ"] = "ذ",
["ﮄ"] = "ذ",
["ﮃ"] = "د",
["ﮂ"] = "د",
["ﮁ"] = "ج",
["ﮀ"] = "ج",
["ﭿ"] = "ج",
["ﮓ"] = "ك",
["ﮔ"] = "ك",
["ﮕ"] = "ك",
["ﮖ"] = "ك",
["ﮗ"] = "ك",
["ﮘ"] = "ك",
["ﮙ"] = "ك",
["ﮚ"] = "ك",
["ﮛ"] = "ك",
["ﮜ"] = "ك",
["ﮝ"] = "ك",
["ﮞ"] = "",
["ﮟ"] = "",
["ﮠ"] = "",
["ﮡ"] = "",
["ﮢ"] = "",
["ﮣ"] = "",
["ﮤ"] = "ه",
["ﮥ"] = "ه",
["ﮦ"] = "ه",
["ﮧ"] = "",
["ﮨ"] = "",
["ﮩ"] = "",
["ﮪ"] = "ه",
["ﮫ"] = "ه",
["ﮬ"] = "ه",
["̷"] = "",
["ﮭ"] = "ه",
["ﮮ"] = "",
["ﮯ"] = "",
["ﮰ"] = "",
["ﮱ"] = "",
["ﯙ"] = "و",
["ﯚ"] = "و",
["ﯼ"] = "ى",
["ﯽ"] = "ى",
["ﯾ"] = "ي",
["ﯿ"] = "ي",
["ﺐ"] = "ب",
["ﺑ"] = "ب",
["ﺒ"] = "ب",
["ﺓ"] = "ة",
["ﺔ"] = "ة",
["ﺕ"] = "ت",
["ﺖ"] = "ت",
["ﺗ"] = "ت",
["ﺘ"] = "ت",
["ﺙ"] = "ث",
["ﺚ"] = "ث",
["ﺛ"] = "ث",
["ﺜ"] = "ث",
["ﺝ"] = "ج",
["ﺞ"] = "ج",
["ﺟ"] = "ج",
["ﺠ"] = "ج",
["ﺡ"] = "ح",
["ﺢ"] = "ح",
["ﺣ"] = "ح",
["ﺤ"] = "ح",
["ﺥ"] = "خ",
["ﺦ"] = "خ",
["ﺧ"] = "خ",
["ﺨ"] = "خ",
["ﺩ"] = "د",
["ﺪ"] = "د",
["ﺫ"] = "ذ",
["ﺬ"] = "ذ",
["ﺭ"] = "ر",
["ﺮ"] = "ر",
["ﺯ"] = "ز",
["ﺰ"] = "ز",
["ﺱ"] = "س",
["ﺲ"] = "س",
["ﺳ"] = "س",
["ﺴ"] = "س",
["ﺵ"] = "ش",
["ﺶ"] = "ش",
["ﺷ"] = "ش",
["ﺸ"] = "ش",
["ﺹ"] = "ص",
["ﺺ"] = "ص",
["ﺻ"] = "ص",
["ﺼ"] = "ص",
["ﺽ"] = "ض",
["ﺾ"] = "ض",
["ﺿ"] = "ض",
["ﻀ"] = "ض",
["ﻁ"] = "ط",
["ﻂ"] = "ط",
["ﻃ"] = "ط",
["ﻄ"] = "ط",
["ﻅ"] = "ظ",
["ﻆ"] = "ظ",
["ﻇ"] = "ظ",
["ﻈ"] = "ض",
["ﻉ"] = "ع",
["ﻊ"] = "ع",
["ﻋ"] = "ع",
["ﻌ"] = "ع",
["ﻍ"] = "غ",
["ﻎ"] = "غ",
["ﻏ"] = "غ",
["ﻐ"] = "غ",
["ﻑ"] = "ف",
["ﻒ"] = "ف",
["ﻓ"] = "ف",
["ﻔ"] = "ف",
["ﻕ"] = "ق",
["ﻖ"] = "ق",
["ﻗ"] = "ق",
["ﻘ"] = "ق",
["ﻙ"] = "ك",
["ﻚ"] = "ك",
["ﻛ"] = "ك",
["ﻜ"] = "ك",
["ﻝ"] = "ل",
["ﻞ"] = "ل",
["ﻟ"] = "ل",
["ﻠ"] = "ا",
["ﻡ"] = "م",
["ﻢ"] = "م",
["ﻣ"] = "م",
["ﻤ"] = "م",
["ﻥ"] = "ن",
["ﻦ"] = "ن",
["ﻧ"] = "ن",
["ﻨ"] = "ن",
["ﻩ"] = "ه",
["ﻪ"] = "ه",
["ﻬ"] = "ه",
["ٱ"] = "ا",
["ٲ"] = "ا",
["ٳ"] = "ا",
["ٴ"] = "ء",
["ٵ"] = "ا",
["ٶ"] = "ؤ",
["ٷ"] = "ؤ",
["ٸ"] = "ئ",
["ٹ"] = "ت",
["ٺ"] = "ت",
["ٻ"] = "ب",
["پ"] = "ب",
["ٿ"] = "ت",
["ڀ"] = "ب",
["ځ"] = "ح",
["ڂ"] = "خ",
["ڃ"] = "ج",
["ڄ"] = "ج",
["څ"] = "ج",
["چ"] = "خ",
["ڇ"] = "ج",
["ڈ"] = "د",
["ډ"] = "د",
["ڊ"] = "د",
["ڋ"] = "د",
["ڌ"] = "ذ",
["ڍ"] = "د",
["ڎ"] = "ذ",
["ڏ"] = "ذ",
["ڐ"] = "ذ",
["ڑ"] = "ر",
["ڒ"] = "ر",
["ړ"] = "ر",
["ڔ"] = "ر",
["ڕ"] = "ر",
["ږ"] = "ر",
["ڗ"] = "ز",
["ژ"] = "ز",
["ڙ"] = "ز",
["ښ"] = "س",
["ڛ"] = "س",
["ڜ"] = "ش",
["ڝ"] = "ص",
["ڞ"] = "ض",
["ڟ"] = "ظ",
["ڠ"] = "غ",
["ڡ"] = "ف",
["ڢ"] = "ف",
["ڣ"] = "ف",
["ڤ"] = "ق",
["ڥ"] = "ف",
["ڦ"] = "ق",
["ڧ"] = "ف",
["ڨ"] = "ق",
["ک"] = "ك",
["ڪ"] = "ك",
["ګ"] = "ك",
["ڬ"] = "ك",
["ڭ"] = "ك",
["ڮ"] = "ك",
["گ"] = "ك",
["ڰ"] = "ك",
["ڱ"] = "ك",
["ڲ"] = "ك",
["ڳ"] = "ك",
["ڴ"] = "ك",
["ڵ"] = "ل",
["ڶ"] = "ل",
["ڷ"] = "ل",
["ں"] = "ر",
["ڻ"] = "ن",
["ڼ"] = "ن",
["ھ"] = "ه",
["ۀ"] = "ه",
["ہ"] = "",
["ۂ"] = "",
["ۃ"] = "ة",
["ۄ"] = "و",
["ۅ"] = "و",
["ۆ"] = "و",
["̶"] = "",
["͠"] = "",
["ۇ"] = "و",
["ۈ"] = "و",
["ۉ"] = "و",
["ۊ"] = "و",
["ۋ"] = "و",
["ی"] = "ى",
["ۍ"] = "ى",
["ێ"] = "ئ",
["ې"] = "ي",
["ۑ"] = "ى",
["ـ"] = "",
["ے"] = "",
["ﺂ"] = "ا",
["ﻟ"] = "ل",
["̐"] = "",
["ُ"] = "",
["ﺟ"] = "ج",
["ڳ"] = "ك",
["ﺳ"] = "س",
["ﺽ"] = "ض",
["ﻧ"] = "ن",
["̭"] = "",
["ﺑ"] = "ب",
["ﭠ"] = "ت",
["ﺷ"] = "ش",
}
return UTF8_replace(Name,FlterChar) or ''
end


function FlterEmoje(Name)
local FlterChar = {
['🤣'] = '',
['😂'] = '',
['😅'] = '',
['😆'] = '',
['😁'] = '',
['😄'] = '',
['😃'] = '',
['😀'] = '',
['😍'] = '',
['😌'] = '',
['😉'] = '',
['🙃'] = '',
['🙂'] = '',
['😇'] = '',
['😊'] = '',
['☺'] = '',
['️'] = '',
['😜'] = '',
['😝'] = '',
['😛'] = '',
['😋'] = '',
['😚'] = '',
['😙'] = '',
['😗'] = '',
['😘'] = '',
['😒'] = '',
['😏'] = '',
['🤩'] = '',
['😎'] = '',
['🤓'] = '',
['🧐'] = '',
['🤨'] = '',
['🤪'] = '',
['😖'] = '',
['😣'] = '',
['☹'] = '',
['️'] = '',
['🙁'] = '',
['😕'] = '',
['😟'] = '',
['😔'] = '',
['😞'] = '',
['🤬'] = '',
['😡'] = '',
['😠'] = '',
['😤'] = '',
['😭'] = '',
['😢'] = '',
['😩'] = '',
['😫'] = '',
['🤗'] = '',
['😓'] = '',
['😥'] = '',
['😰'] = '',
['😨'] = '',
['😱'] = '',
['😳'] = '',
['🤯'] = '',
['😬'] = '',
['😑'] = '',
['😐'] = '',
['😶'] = '',
['🤥'] = '',
['🤫'] = '',
['🤭'] = '',
['🤔'] = '',
['🤤'] = '',
['😴'] = '',
['😲'] = '',
['😮'] = '',
['😧'] = '',
['😦'] = '',
['😯'] = '',
['🙄'] = '',
['🤒'] = '',
['😷'] = '',
['🤧'] = '',
['🤮'] = '',
['🤢'] = '',
['🤐'] = '',
['😵'] = '',
['😪'] = '',
['🤡'] = '',
['👺'] = '',
['👹'] = '',
['👿'] = '',
['😈'] = '',
['🤠'] = '',
['🤑'] = '',
['🤕'] = '',
['🎃'] = '',
['🤖'] = '',
['👾'] = '',
['👽'] = '',
['☠'] = '',
['️'] = '',
['💀'] = '',
['👻'] = '',
['💩'] = '',
['😿'] = '',
['🙀'] = '',
['😽'] = '',
['😼'] = '',
['😻'] = '',
['😹'] = '',
['😸'] = '',
['😺'] = '',
['👎'] = '',
['👍'] = '',
['🤝'] = '',
['👏'] = '',
['🙌'] = '',
['👐'] = '',
['🤲'] = '',
['😾'] = '',
['🤘'] = '',
['🤟'] = '',
['✌'] = '',
['️'] = '',
['🤞'] = '',
['🤜'] = '',
['🤛'] = '',
['✊'] = '',
['️'] = '',
['👊'] = '',
['🤚'] = '',
['✋'] = '',
['️'] = '',
['☝'] = '',
['️'] = '',
['🏽'] = '',
['👇'] = '',
['👆'] = '',
['👉'] = '',
['👈'] = '',
['👌'] = '',
['🙏'] = '',
['✍'] = '',
['️'] = '',
['🖕'] = '',
['💪'] = '',
['🤙'] = '',
['👋'] = '',
['🖖'] = '',
['🖐'] = '',
['👣'] = '',
['👃'] = '',
['👂'] = '',
['👅'] = '',
['👄'] = '',
['💋'] = '',
['💄'] = '',
['💍'] = '',
['👧'] = '',
['👶'] = '',
['👥'] = '',
['👤'] = '',
['🗣'] = '',
['🧠'] = '',
['👀'] = '',
['👁'] = '',
['🧔'] = '',
['👱'] = '',
['‍'] = '',
['♂'] = '',
['👱'] = '',
['‍'] = '',
['♀'] = '',
['👨'] = '',
['🧑'] = '',
['👩'] = '',
['👦'] = '',
['🧒'] = '',
['👮'] = '',
['‍'] = '',
['♀'] = '',
['🧕'] = '',
['👳'] = '',
['🏽'] = '',
['‍'] = '',
['♂'] = '',
['👳'] = '',
['‍'] = '',
['♀'] = '',
['👲'] = '',
['👴'] = '',
['🧓'] = '',
['👵'] = '',
['👩'] = '',
['‍'] = '',
['⚕'] = '',
['🕵'] = '',
['️'] = '',
['‍'] = '',
['♂'] = '',
['🕵'] = '',
['‍'] = '',
['♀'] = '',
['💂'] = '',
['‍'] = '',
['♂'] = '',
['💂'] = '',
['‍'] = '',
['♀'] = '',
['👷'] = '',
['‍'] = '',
['♂'] = '',
['👷'] = '',
['‍'] = '',
['♀'] = '',
['👮'] = '',
['‍'] = '',
['♂'] = '',
['👩'] = '',
['‍'] = '',
['🎤'] = '',
['👨'] = '',
['‍'] = '',
['🎓'] = '',
['👩'] = '',
['‍'] = '',
['🎓'] = '',
['👨'] = '',
['‍'] = '',
['🍳'] = '',
['👩'] = '',
['‍'] = '',
['🍳'] = '',
['👨'] = '',
['‍'] = '',
['🌾'] = '',
['👩'] = '',
['‍'] = '',
['🌾'] = '',
['👨'] = '',
['‍'] = '',
['⚕'] = '',
['👩'] = '',
['‍'] = '',
['💼'] = '',
['👨'] = '',
['‍'] = '',
['💻'] = '',
['👩'] = '',
['‍'] = '',
['💻'] = '',
['👨'] = '',
['‍'] = '',
['🏭'] = '',
['👩'] = '',
['‍'] = '',
['🏭'] = '',
['👨'] = '',
['‍'] = '',
['🏫'] = '',
['👩'] = '',
['‍'] = '',
['🏫'] = '',
['👨'] = '',
['‍'] = '',
['🎤'] = '',
['👩'] = '',
['‍'] = '',
['🚒'] = '',
['👨'] = '',
['‍'] = '',
['🎨'] = '',
['👩'] = '',
['‍'] = '',
['🎨'] = '',
['👨'] = '',
['‍'] = '',
['🔬'] = '',
['👩'] = '',
['‍'] = '',
['🔬'] = '',
['👨'] = '',
['‍'] = '',
['🔧'] = '',
['👩'] = '',
['‍'] = '',
['🔧'] = '',
['👨'] = '',
['🏼'] = '',
['‍'] = '',
['💼'] = '',
['👰'] = '',
['👨'] = '',
['‍'] = '',
['⚖'] = '',
['👩'] = '',
['‍'] = '',
['⚖'] = '',
['👨'] = '',
['‍'] = '',
['🚀'] = '',
['👩'] = '',
['‍'] = '',
['🚀'] = '',
['👨'] = '',
['‍'] = '',
['✈'] = '',
['️'] = '',
['👩'] = '',
['‍'] = '',
['✈'] = '',
['️'] = '',
['👨'] = '',
['‍'] = '',
['🚒'] = '',
['🧝'] = '',
['‍'] = '',
['♀'] = '',
['🧙'] = '',
['‍'] = '',
['♂'] = '',
['🧙'] = '',
['‍'] = '',
['♀'] = '',
['🎅'] = '',
['🤶'] = '',
['🤴'] = '',
['👸'] = '',
['🤵'] = '',
['🧜'] = '',
['‍'] = '',
['♀'] = '',
['🧞'] = '',
['‍'] = '',
['♂'] = '',
['🧞'] = '',
['‍'] = '',
['♀'] = '',
['🧟'] = '',
['‍'] = '',
['♂'] = '',
['🧟'] = '',
['‍'] = '',
['♀'] = '',
['🧛'] = '',
['‍'] = '',
['♂'] = '',
['🧛'] = '',
['‍'] = '',
['♀'] = '',
['🧝'] = '',
['‍'] = '',
['♂'] = '',
['🙇'] = '',
['‍'] = '',
['♂'] = '',
['🙇'] = '',
['‍'] = '',
['♀'] = '',
['🤱'] = '',
['🤰'] = '',
['👼'] = '',
['🧚'] = '',
['‍'] = '',
['♂'] = '',
['🧚'] = '',
['‍'] = '',
['♀'] = '',
['🧜'] = '',
['‍'] = '',
['♂'] = '',
['🙋'] = '',
['‍'] = '',
['♂'] = '',
['🙋'] = '',
['‍'] = '',
['♀'] = '',
['🙆'] = '',
['‍'] = '',
['♂'] = '',
['🙆'] = '',
['‍'] = '',
['♀'] = '',
['🙅'] = '',
['‍'] = '',
['♂'] = '',
['🙅'] = '',
['‍'] = '',
['♀'] = '',
['💁'] = '',
['‍'] = '',
['♂'] = '',
['💁'] = '',
['‍'] = '',
['♀'] = '',
['🙍'] = '',
['‍'] = '',
['♂'] = '',
['🙍'] = '',
['‍'] = '',
['♀'] = '',
['🙎'] = '',
['‍'] = '',
['♂'] = '',
['🙎'] = '',
['‍'] = '',
['♀'] = '',
['🤷'] = '',
['‍'] = '',
['♂'] = '',
['🤷'] = '',
['‍'] = '',
['♀'] = '',
['🤦'] = '',
['‍'] = '',
['♂'] = '',
['🤦'] = '',
['‍'] = '',
['♀'] = '',
['🤳'] = '',
['💅'] = '',
['🧖'] = '',
['‍'] = '',
['♂'] = '',
['🧖'] = '',
['‍'] = '',
['♀'] = '',
['💆'] = '',
['‍'] = '',
['♂'] = '',
['💆'] = '',
['‍'] = '',
['♀'] = '',
['💇'] = '',
['‍'] = '',
['♂'] = '',
['💇'] = '',
['‍'] = '',
['♀'] = '',
['🏃'] = '',
['‍'] = '',
['♀'] = '',
['🚶'] = '',
['‍'] = '',
['♂'] = '',
['🚶'] = '',
['‍'] = '',
['♀'] = '',
['🕴'] = '',
['👯'] = '',
['‍'] = '',
['♂'] = '',
['👯'] = '',
['‍'] = '',
['♀'] = '',
['🕺'] = '',
['💃'] = '',
['💏'] = '',
['👨'] = '',
['‍'] = '',
['❤'] = '',
['️'] = '',
['‍'] = '',
['👨'] = '',
['👩'] = '',
['‍'] = '',
['❤'] = '',
['️'] = '',
['‍'] = '',
['👩'] = '',
['💑'] = '',
['👬'] = '',
['👭'] = '',
['👫'] = '',
['🏃'] = '',
['‍'] = '',
['♂'] = '',
['👩'] = '',
['‍'] = '',
['👩'] = '',
['‍'] = '',
['👦'] = '',
['👨'] = '',
['‍'] = '',
['👩'] = '',
['‍'] = '',
['👧'] = '',
['‍'] = '',
['👧'] = '',
['👨'] = '',
['‍'] = '',
['👩'] = '',
['‍'] = '',
['👦'] = '',
['‍'] = '',
['👦'] = '',
['👨'] = '',
['‍'] = '',
['👩'] = '',
['‍'] = '',
['👧'] = '',
['‍'] = '',
['👦'] = '',
['👨'] = '',
['‍'] = '',
['👩'] = '',
['‍'] = '',
['👧'] = '',
['👪'] = '',
['👨'] = '',
['‍'] = '',
['❤'] = '',
['️'] = '',
['‍'] = '',
['💋'] = '',
['‍'] = '',
['👨'] = '',
['👩'] = '',
['‍'] = '',
['❤'] = '',
['️'] = '',
['‍'] = '',
['💋'] = '',
['‍'] = '',
['👩'] = '',
['👨'] = '',
['‍'] = '',
['👨'] = '',
['‍'] = '',
['👦'] = '',
['‍'] = '',
['👦'] = '',
['👨'] = '',
['‍'] = '',
['👨'] = '',
['‍'] = '',
['👧'] = '',
['‍'] = '',
['👦'] = '',
['👨'] = '',
['‍'] = '',
['👨'] = '',
['‍'] = '',
['👧'] = '',
['👨'] = '',
['‍'] = '',
['👨'] = '',
['‍'] = '',
['👦'] = '',
['👩'] = '',
['‍'] = '',
['👩'] = '',
['‍'] = '',
['👧'] = '',
['‍'] = '',
['👧'] = '',
['👩'] = '',
['‍'] = '',
['👩'] = '',
['‍'] = '',
['👦'] = '',
['‍'] = '',
['👦'] = '',
['👩'] = '',
['‍'] = '',
['👩'] = '',
['‍'] = '',
['👧'] = '',
['‍'] = '',
['👦'] = '',
['👩'] = '',
['‍'] = '',
['👩'] = '',
['‍'] = '',
['👧'] = '',
['👨'] = '',
['‍'] = '',
['👧'] = '',
['👨'] = '',
['‍'] = '',
['👦'] = '',
['👩'] = '',
['‍'] = '',
['👧'] = '',
['‍'] = '',
['👧'] = '',
['👩'] = '',
['‍'] = '',
['👦'] = '',
['‍'] = '',
['👦'] = '',
['👩'] = '',
['‍'] = '',
['👧'] = '',
['‍'] = '',
['👦'] = '',
['👩'] = '',
['‍'] = '',
['👧'] = '',
['👩'] = '',
['‍'] = '',
['👦'] = '',
['👨'] = '',
['‍'] = '',
['👨'] = '',
['‍'] = '',
['👧'] = '',
['‍'] = '',
['👧'] = '',
['👔'] = '',
['👖'] = '',
['👕'] = '',
['👚'] = '',
['🧥'] = '',
['👨'] = '',
['‍'] = '',
['👧'] = '',
['‍'] = '',
['👧'] = '',
['👨'] = '',
['‍'] = '',
['👦'] = '',
['‍'] = '',
['👦'] = '',
['👨'] = '',
['‍'] = '',
['👧'] = '',
['‍'] = '',
['👦'] = '',
['👟'] = '',
['👞'] = '',
['👢'] = '',
['👡'] = '',
['👠'] = '',
['👘'] = '',
['👙'] = '',
['👗'] = '',
['⛑'] = '',
['🎓'] = '',
['👒'] = '',
['🧢'] = '',
['🎩'] = '',
['🧣'] = '',
['🧤'] = '',
['🧦'] = '',
['🕶'] = '',
['👓'] = '',
['🎒'] = '',
['💼'] = '',
['👜'] = '',
['👛'] = '',
['👝'] = '',
['👑'] = '',
['🖤'] = '',
['💜'] = '',
['💙'] = '',
['💚'] = '',
['💛'] = '',
['🧡'] = '',
['❤'] = '',
['️'] = '',
['🌂'] = '',
['💘'] = '',
['💖'] = '',
['💗'] = '',
['💓'] = '',
['💞'] = '',
['💕'] = '',
['❣'] = '',
['️'] = '',
['💔'] = '',
['💝'] = '',
['🐼'] = '',
['🐻'] = '',
['🦊'] = '',
['🐰'] = '',
['🐹'] = '',
['🐭'] = '',
['🐱'] = '',
['🐶'] = '',
['🐵'] = '',
['🐸'] = '',
['🐽'] = '',
['🐷'] = '',
['🐮'] = '',
['🦁'] = '',
['🐯'] = '',
['🐨'] = '',
['🐤'] = '',
['🐦'] = '',
['🐧'] = '',
['🐔'] = '',
['🐒'] = '',
['🙊'] = '',
['🙉'] = '',
['🙈'] = '',
['🐗'] = '',
['🐺'] = '',
['🦇'] = '',
['🦉'] = '',
['🦅'] = '',
['🦆'] = '',
['🐥'] = '',
['🐣'] = '',
['🐞'] = '',
['🐚'] = '',
['🐌'] = '',
['🦋'] = '',
['🐛'] = '',
['🐝'] = '',
['🦄'] = '',
['🐴'] = '',
['🦎'] = '',
['🐍'] = '',
['🐢'] = '',
['🦂'] = '',
['🕸'] = '',
['🕷'] = '',
['🦗'] = '',
['🐜'] = '',
['🐠'] = '',
['🐡'] = '',
['🦀'] = '',
['🦐'] = '',
['🦑'] = '',
['🐙'] = '',
['🦕'] = '',
['🦖'] = '',
['🐆'] = '',
['🐅'] = '',
['🐊'] = '',
['🦈'] = '',
['🐋'] = '',
['🐳'] = '',
['🐬'] = '',
['🐟'] = '',
['🐃'] = '',
['🦒'] = '',
['🐫'] = '',
['🐪'] = '',
['🦏'] = '',
['🐘'] = '',
['🦍'] = '',
['🦓'] = '',
['🦌'] = '',
['🐐'] = '',
['🐑'] = '',
['🐏'] = '',
['🐖'] = '',
['🐎'] = '',
['🐄'] = '',
['🐂'] = '',
['🐁'] = '',
['🐇'] = '',
['🕊'] = '',
['🦃'] = '',
['🐓'] = '',
['🐈'] = '',
['🐩'] = '',
['🐕'] = '',
['🎄'] = '',
['🌵'] = '',
['🐲'] = '',
['🐉'] = '',
['🐾'] = '',
['🦔'] = '',
['🐿'] = '',
['🐀'] = '',
['🎍'] = '',
['🍀'] = '',
['☘'] = '',
['️'] = '',
['🌿'] = '',
['🌱'] = '',
['🌴'] = '',
['🌳'] = '',
['🌲'] = '',
['🌷'] = '',
['💐'] = '',
['🌾'] = '',
['🍄'] = '',
['🍁'] = '',
['🍂'] = '',
['🍃'] = '',
['🎋'] = '',
['🌝'] = '',
['🌞'] = '',
['🌻'] = '',
['🌼'] = '',
['🌸'] = '',
['🌺'] = '',
['🥀'] = '',
['🌹'] = '',
['🌑'] = '',
['🌘'] = '',
['🌗'] = '',
['🌖'] = '',
['🌕'] = '',
['🌚'] = '',
['🌜'] = '',
['🌛'] = '',
['💫'] = '',
['🌏'] = '',
['🌍'] = '',
['🌎'] = '',
['🌙'] = '',
['🌔'] = '',
['🌓'] = '',
['🌒'] = '',
['🌪'] = '',
['🔥'] = '',
['💥'] = '',
['☄'] = '',
['️'] = '',
['⚡'] = '',
['️'] = '',
['✨'] = '',
['🌟'] = '',
['⭐'] = '',
['️'] = '',
['🌧'] = '',
['🌦'] = '',
['☁'] = '',
['️'] = '',
['🌥'] = '',
['⛅'] = '',
['️'] = '',
['🌤'] = '',
['☀'] = '',
['️'] = '',
['🌈'] = '',
['💨'] = '',
['🌬'] = '',
['⛄'] = '',
['️'] = '',
['☃'] = '',
['️'] = '',
['❄'] = '',
['️'] = '',
['🌨'] = '',
['🌩'] = '',
['⛈'] = '',
['🌫'] = '',
['🌊'] = '',
['☂'] = '',
['️'] = '',
['☔'] = '',
['️'] = '',
['💦'] = '',
['💧'] = '',
['🍇'] = '',
['🍉'] = '',
['🍌'] = '',
['🍋'] = '',
['🍊'] = '',
['🍐'] = '',
['🍎'] = '',
['🍏'] = '',
['🍅'] = '',
['🥝'] = '',
['🥥'] = '',
['🍍'] = '',
['🍑'] = '',
['🍒'] = '',
['🍈'] = '',
['🍓'] = '',
['🥔'] = '',
['🥕'] = '',
['🌽'] = '',
['🌶'] = '',
['🥒'] = '',
['🥦'] = '',
['🥑'] = '',
['🍆'] = '',
['🍳'] = '',
['🥚'] = '',
['🧀'] = '',
['🥨'] = '',
['🥖'] = '',
['🍞'] = '',
['🥐'] = '',
['🍠'] = '',
['🍟'] = '',
['🍔'] = '',
['🌭'] = '',
['🍖'] = '',
['🍗'] = '',
['🥩'] = '',
['🥓'] = '',
['🥞'] = '',
['🥫'] = '',
['🥘'] = '',
['🥗'] = '',
['🌯'] = '',
['🌮'] = '',
['🥙'] = '',
['🥪'] = '',
['🍕'] = '',
['🍙'] = '',
['🍤'] = '',
['🍱'] = '',
['🍣'] = '',
['🍛'] = '',
['🍲'] = '',
['🍜'] = '',
['🍝'] = '',
['🍨'] = '',
['🍧'] = '',
['🍡'] = '',
['🍢'] = '',
['🥠'] = '',
['🍥'] = '',
['🍘'] = '',
['🍚'] = '',
['🍫'] = '',
['🍬'] = '',
['🍭'] = '',
['🍮'] = '',
['🎂'] = '',
['🍰'] = '',
['🥧'] = '',
['🍦'] = '',
['🥛'] = '',
['🍯'] = '',
['🥜'] = '',
['🌰'] = '',
['🍪'] = '',
['🥟'] = '',
['🍩'] = '',
['🍿'] = '',
['🥂'] = '',
['🍻'] = '',
['🍺'] = '',
['🍶'] = '',
['🥤'] = '',
['🍵'] = '',
['☕'] = '',
['️'] = '',
['🍼'] = '',
['🍽'] = '',
['🍴'] = '',
['🥄'] = '',
['🍾'] = '',
['🍹'] = '',
['🍸'] = '',
['🥃'] = '',
['🍷'] = '',
['🎾'] = '',
['⚾'] = '',
['️'] = '',
['🏈'] = '',
['🏀'] = '',
['⚽'] = '',
['️'] = '',
['🥢'] = '',
['🥡'] = '',
['🥣'] = '',
['🏑'] = '',
['🏒'] = '',
['🥅'] = '',
['🏸'] = '',
['🏓'] = '',
['🎱'] = '',
['🏉'] = '',
['🏐'] = '',
['⛸'] = '',
['🎽'] = '',
['🥋'] = '',
['🥊'] = '',
['🎣'] = '',
['🏹'] = '',
['⛳'] = '',
['️'] = '',
['🏏'] = '',
['🤼'] = '',
['‍'] = '',
['♀'] = '',
['🏋'] = '',
['️'] = '',
['‍'] = '',
['♂'] = '',
['🏋'] = '',
['‍'] = '',
['♀'] = '',
['🏂'] = '',
['⛷'] = '',
['🎿'] = '',
['🛷'] = '',
['🥌'] = '',
['🤾'] = '',
['‍'] = '',
['♂'] = '',
['🤾'] = '',
['‍'] = '',
['♀'] = '',
['🤺'] = '',
['⛹'] = '',
['️'] = '',
['‍'] = '',
['♂'] = '',
['⛹'] = '',
['‍'] = '',
['♀'] = '',
['🤸'] = '',
['‍'] = '',
['♂'] = '',
['🤸'] = '',
['‍'] = '',
['♀'] = '',
['🤼'] = '',
['‍'] = '',
['♂'] = '',
['🏊'] = '',
['‍'] = '',
['♀'] = '',
['🏄'] = '',
['‍'] = '',
['♂'] = '',
['🏄'] = '',
['‍'] = '',
['♀'] = '',
['🧘'] = '',
['‍'] = '',
['♂'] = '',
['🧘'] = '',
['‍'] = '',
['♀'] = '',
['🏇'] = '',
['🏌'] = '',
['️'] = '',
['‍'] = '',
['♂'] = '',
['🏌'] = '',
['‍'] = '',
['♀'] = '',
['🚵'] = '',
['‍'] = '',
['♀'] = '',
['🧗'] = '',
['‍'] = '',
['♂'] = '',
['🧗'] = '',
['‍'] = '',
['♀'] = '',
['🚣'] = '',
['‍'] = '',
['♂'] = '',
['🚣'] = '',
['‍'] = '',
['♀'] = '',
['🤽'] = '',
['‍'] = '',
['♂'] = '',
['🤽'] = '',
['‍'] = '',
['♀'] = '',
['🏊'] = '',
['‍'] = '',
['♂'] = '',
['🏅'] = '',
['🥉'] = '',
['🥈'] = '',
['🥇'] = '',
['🏆'] = '',
['🚴'] = '',
['‍'] = '',
['♂'] = '',
['🚴'] = '',
['‍'] = '',
['♀'] = '',
['🚵'] = '',
['‍'] = '',
['♂'] = '',
['🤹'] = '',
['‍'] = '',
['♂'] = '',
['🤹'] = '',
['‍'] = '',
['♀'] = '',
['🎪'] = '',
['🎟'] = '',
['🎫'] = '',
['🎗'] = '',
['🏵'] = '',
['🎖'] = '',
['🥁'] = '',
['🎹'] = '',
['🎼'] = '',
['🎧'] = '',
['🎤'] = '',
['🎬'] = '',
['🎨'] = '',
['🎭'] = '',
['🎮'] = '',
['🎳'] = '',
['🎯'] = '',
['🎲'] = '',
['🎻'] = '',
['🎸'] = '',
['🎺'] = '',
['🎷'] = '',
['🎰'] = '',
['🚑'] = '',
['🚓'] = '',
['🏎'] = '',
['🚎'] = '',
['🚌'] = '',
['🚙'] = '',
['🚕'] = '',
['🚗'] = '',
['🛵'] = '',
['🚲'] = '',
['🛴'] = '',
['🚜'] = '',
['🚛'] = '',
['🚚'] = '',
['🚐'] = '',
['🚒'] = '',
['🚠'] = '',
['🚡'] = '',
['🚖'] = '',
['🚘'] = '',
['🚍'] = '',
['🚔'] = '',
['🚨'] = '',
['🏍'] = '',
['🚈'] = '',
['🚅'] = '',
['🚄'] = '',
['🚝'] = '',
['🚞'] = '',
['🚋'] = '',
['🚃'] = '',
['🚟'] = '',
['🛬'] = '',
['🛫'] = '',
['✈'] = '',
['️'] = '',
['🚉'] = '',
['🚊'] = '',
['🚇'] = '',
['🚆'] = '',
['🚂'] = '',
['⛵'] = '',
['️'] = '',
['🛶'] = '',
['🚁'] = '',
['🛸'] = '',
['🚀'] = '',
['🛰'] = '',
['💺'] = '',
['🛩'] = '',
['🚧'] = '',
['⛽'] = '',
['️'] = '',
['⚓'] = '',
['️'] = '',
['🚢'] = '',
['⛴'] = '',
['🛳'] = '',
['🛥'] = '',
['🚤'] = '',
['🏰'] = '',
['🗼'] = '',
['🗽'] = '',
['🗿'] = '',
['🗺'] = '',
['🚏'] = '',
['🚥'] = '',
['🚦'] = '',
['🏖'] = '',
['⛱'] = '',
['⛲'] = '',
['️'] = '',
['🎠'] = '',
['🎢'] = '',
['🎡'] = '',
['🏟'] = '',
['🏯'] = '',
['⛺'] = '',
['️'] = '',
['🏕'] = '',
['🗻'] = '',
['🏔'] = '',
['⛰'] = '',
['🌋'] = '',
['🏜'] = '',
['🏝'] = '',
['🏬'] = '',
['🏢'] = '',
['🏭'] = '',
['🏗'] = '',
['🏚'] = '',
['🏘'] = '',
['🏡'] = '',
['🏠'] = '',
['🏩'] = '',
['🏫'] = '',
['🏪'] = '',
['🏨'] = '',
['🏦'] = '',
['🏥'] = '',
['🏤'] = '',
['🏣'] = '',
['🛤'] = '',
['⛩'] = '',
['🕋'] = '',
['🕍'] = '',
['🕌'] = '',
['⛪'] = '',
['️'] = '',
['🏛'] = '',
['💒'] = '',
['🎇'] = '',
['🌠'] = '',
['🌄'] = '',
['🌅'] = '',
['🏞'] = '',
['🎑'] = '',
['🗾'] = '',
['🛣'] = '',
['🌁'] = '',
['🌉'] = '',
['🌌'] = '',
['🌃'] = '',
['🏙'] = '',
['🌆'] = '',
['🌇'] = '',
['🎆'] = '',
['🇦'] = '',
['🇱'] = '',
['🇦'] = '',
['🇽'] = '',
['🇦'] = '',
['🇫'] = '',
['🏳'] = '',
['‍'] = '',
['🌈'] = '',
['🚩'] = '',
['🏁'] = '',
['🏴'] = '',
['🏳'] = '',
['🇦'] = '',
['🇷'] = '',
['🇦'] = '',
['🇬'] = '',
['🇦'] = '',
['🇶'] = '',
['🇦'] = '',
['🇮'] = '',
['🇦'] = '',
['🇴'] = '',
['🇦'] = '',
['🇩'] = '',
['🇦'] = '',
['🇸'] = '',
['🇩'] = '',
['🇿'] = '',
['🇧'] = '',
['🇩'] = '',
['🇧'] = '',
['🇭'] = '',
['🇧'] = '',
['🇸'] = '',
['🇦'] = '',
['🇿'] = '',
['🇦'] = '',
['🇹'] = '',
['🇦'] = '',
['🇺'] = '',
['🇦'] = '',
['🇼'] = '',
['🇦'] = '',
['🇲'] = '',
['🇧'] = '',
['🇴'] = '',
['🇧'] = '',
['🇹'] = '',
['🇧'] = '',
['🇲'] = '',
['🇧'] = '',
['🇯'] = '',
['🇧'] = '',
['🇿'] = '',
['🇧'] = '',
['🇪'] = '',
['🇧'] = '',
['🇾'] = '',
['🇧'] = '',
['🇧'] = '',
['🇧'] = '',
['🇫'] = '',
['🇧'] = '',
['🇬'] = '',
['🇧'] = '',
['🇳'] = '',
['🇻'] = '',
['🇬'] = '',
['🇮'] = '',
['🇴'] = '',
['🇧'] = '',
['🇷'] = '',
['🇧'] = '',
['🇼'] = '',
['🇧'] = '',
['🇦'] = '',
['🇰'] = '',
['🇾'] = '',
['🇧'] = '',
['🇶'] = '',
['🇨'] = '',
['🇻'] = '',
['🇮'] = '',
['🇨'] = '',
['🇨'] = '',
['🇦'] = '',
['🇨'] = '',
['🇲'] = '',
['🇰'] = '',
['🇭'] = '',
['🇧'] = '',
['🇮'] = '',
['🇰'] = '',
['🇲'] = '',
['🇨'] = '',
['🇴'] = '',
['🇨'] = '',
['🇨'] = '',
['🇨'] = '',
['🇽'] = '',
['🇨'] = '',
['🇳'] = '',
['🇨'] = '',
['🇱'] = '',
['🇹'] = '',
['🇩'] = '',
['🇨'] = '',
['🇫'] = '',
['🇨'] = '',
['🇼'] = '',
['🇨'] = '',
['🇺'] = '',
['🇭'] = '',
['🇷'] = '',
['🇨'] = '',
['🇮'] = '',
['🇨'] = '',
['🇷'] = '',
['🇨'] = '',
['🇰'] = '',
['🇨'] = '',
['🇩'] = '',
['🇨'] = '',
['🇬'] = '',
['🇪'] = '',
['🇬'] = '',
['🇪'] = '',
['🇨'] = '',
['🇩'] = '',
['🇴'] = '',
['🇩'] = '',
['🇲'] = '',
['🇩'] = '',
['🇯'] = '',
['🇩'] = '',
['🇰'] = '',
['🇨'] = '',
['🇿'] = '',
['🇨'] = '',
['🇾'] = '',
['🇫'] = '',
['🇴'] = '',
['🇫'] = '',
['🇰'] = '',
['🇪'] = '',
['🇺'] = '',
['🇪'] = '',
['🇹'] = '',
['🇪'] = '',
['🇪'] = '',
['🇪'] = '',
['🇷'] = '',
['🇬'] = '',
['🇶'] = '',
['🇸'] = '',
['🇻'] = '',
['🇬'] = '',
['🇲'] = '',
['🇬'] = '',
['🇦'] = '',
['🇹'] = '',
['🇫'] = '',
['🇵'] = '',
['🇫'] = '',
['🇬'] = '',
['🇫'] = '',
['🇫'] = '',
['🇷'] = '',
['🇫'] = '',
['🇮'] = '',
['🇫'] = '',
['🇯'] = '',
['🇬'] = '',
['🇵'] = '',
['🇬'] = '',
['🇩'] = '',
['🇬'] = '',
['🇱'] = '',
['🇬'] = '',
['🇷'] = '',
['🇬'] = '',
['🇮'] = '',
['🇬'] = '',
['🇭'] = '',
['🇩'] = '',
['🇪'] = '',
['🇬'] = '',
['🇪'] = '',
['🇭'] = '',
['🇳'] = '',
['🇭'] = '',
['🇹'] = '',
['🇬'] = '',
['🇾'] = '',
['🇬'] = '',
['🇼'] = '',
['🇬'] = '',
['🇳'] = '',
['🇬'] = '',
['🇬'] = '',
['🇬'] = '',
['🇹'] = '',
['🇬'] = '',
['🇺'] = '',
['🇮'] = '',
['🇪'] = '',
['🇮'] = '',
['🇶'] = '',
['🇮'] = '',
['🇷'] = '',
['🇮'] = '',
['🇩'] = '',
['🇮'] = '',
['🇳'] = '',
['🇮'] = '',
['🇸'] = '',
['🇭'] = '',
['🇺'] = '',
['🇭'] = '',
['🇰'] = '',
['🇯'] = '',
['🇴'] = '',
['🇯'] = '',
['🇪'] = '',
['🎌'] = '',
['🇯'] = '',
['🇵'] = '',
['🇯'] = '',
['🇲'] = '',
['🇮'] = '',
['🇹'] = '',
['🇮'] = '',
['🇱'] = '',
['🇮'] = '',
['🇲'] = '',
['🇱'] = '',
['🇻'] = '',
['🇱'] = '',
['🇦'] = '',
['🇰'] = '',
['🇬'] = '',
['🇰'] = '',
['🇼'] = '',
['🇽'] = '',
['🇰'] = '',
['🇰'] = '',
['🇮'] = '',
['🇰'] = '',
['🇪'] = '',
['🇰'] = '',
['🇿'] = '',
['🇲'] = '',
['🇴'] = '',
['🇱'] = '',
['🇺'] = '',
['🇱'] = '',
['🇹'] = '',
['🇱'] = '',
['🇮'] = '',
['🇱'] = '',
['🇾'] = '',
['🇱'] = '',
['🇷'] = '',
['🇱'] = '',
['🇸'] = '',
['🇱'] = '',
['🇧'] = '',
['🇲'] = '',
['🇭'] = '',
['🇲'] = '',
['🇹'] = '',
['🇲'] = '',
['🇱'] = '',
['🇲'] = '',
['🇻'] = '',
['🇲'] = '',
['🇾'] = '',
['🇲'] = '',
['🇼'] = '',
['🇲'] = '',
['🇬'] = '',
['🇲'] = '',
['🇰'] = '',
['🇲'] = '',
['🇨'] = '',
['🇲'] = '',
['🇩'] = '',
['🇫'] = '',
['🇲'] = '',
['🇲'] = '',
['🇽'] = '',
['🇾'] = '',
['🇹'] = '',
['🇲'] = '',
['🇺'] = '',
['🇲'] = '',
['🇷'] = '',
['🇲'] = '',
['🇶'] = '',
['🇳'] = '',
['🇷'] = '',
['🇳'] = '',
['🇦'] = '',
['🇲'] = '',
['🇲'] = '',
['🇲'] = '',
['🇿'] = '',
['🇲'] = '',
['🇦'] = '',
['🇲'] = '',
['🇸'] = '',
['🇲'] = '',
['🇪'] = '',
['🇲'] = '',
['🇳'] = '',
['🇳'] = '',
['🇺'] = '',
['🇳'] = '',
['🇬'] = '',
['🇳'] = '',
['🇪'] = '',
['🇳'] = '',
['🇮'] = '',
['🇳'] = '',
['🇿'] = '',
['🇳'] = '',
['🇨'] = '',
['🇳'] = '',
['🇱'] = '',
['🇳'] = '',
['🇵'] = '',
['🇵'] = '',
['🇸'] = '',
['🇵'] = '',
['🇼'] = '',
['🇵'] = '',
['🇰'] = '',
['🇴'] = '',
['🇲'] = '',
['🇳'] = '',
['🇴'] = '',
['🇲'] = '',
['🇵'] = '',
['🇰'] = '',
['🇵'] = '',
['🇳'] = '',
['🇫'] = '',
['🇵'] = '',
['🇹'] = '',
['🇵'] = '',
['🇱'] = '',
['🇵'] = '',
['🇳'] = '',
['🇵'] = '',
['🇭'] = '',
['🇵'] = '',
['🇪'] = '',
['🇵'] = '',
['🇾'] = '',
['🇵'] = '',
['🇬'] = '',
['🇵'] = '',
['🇦'] = '',
['🇸'] = '',
['🇲'] = '',
['🇼'] = '',
['🇸'] = '',
['🇷'] = '',
['🇼'] = '',
['🇷'] = '',
['🇺'] = '',
['🇷'] = '',
['🇴'] = '',
['🇷'] = '',
['🇪'] = '',
['🇶'] = '',
['🇦'] = '',
['🇵'] = '',
['🇷'] = '',
['🇸'] = '',
['🇽'] = '',
['🇸'] = '',
['🇬'] = '',
['🇸'] = '',
['🇱'] = '',
['🇸'] = '',
['🇨'] = '',
['🇷'] = '',
['🇸'] = '',
['🇸'] = '',
['🇳'] = '',
['🇸'] = '',
['🇦'] = '',
['🇸'] = '',
['🇹'] = '',
['🇸'] = '',
['🇸'] = '',
['🇰'] = '',
['🇷'] = '',
['🇿'] = '',
['🇦'] = '',
['🇸'] = '',
['🇴'] = '',
['🇸'] = '',
['🇧'] = '',
['🇬'] = '',
['🇸'] = '',
['🇸'] = '',
['🇮'] = '',
['🇸'] = '',
['🇰'] = '',
['🇻'] = '',
['🇨'] = '',
['🇵'] = '',
['🇲'] = '',
['🇱'] = '',
['🇨'] = '',
['🇰'] = '',
['🇳'] = '',
['🇸'] = '',
['🇭'] = '',
['🇧'] = '',
['🇱'] = '',
['🇱'] = '',
['🇰'] = '',
['🇪'] = '',
['🇸'] = '',
['🇹'] = '',
['🇯'] = '',
['🇹'] = '',
['🇼'] = '',
['🇸'] = '',
['🇾'] = '',
['🇨'] = '',
['🇭'] = '',
['🇸'] = '',
['🇪'] = '',
['🇸'] = '',
['🇿'] = '',
['🇸'] = '',
['🇷'] = '',
['🇸'] = '',
['🇩'] = '',
['🇹'] = '',
['🇳'] = '',
['🇹'] = '',
['🇹'] = '',
['🇹'] = '',
['🇴'] = '',
['🇹'] = '',
['🇰'] = '',
['🇹'] = '',
['🇬'] = '',
['🇹'] = '',
['🇱'] = '',
['🇹'] = '',
['🇭'] = '',
['🇹'] = '',
['🇿'] = '',
['🇦'] = '',
['🇪'] = '',
['🇺'] = '',
['🇦'] = '',
['🇺'] = '',
['🇬'] = '',
['🇻'] = '',
['🇮'] = '',
['🇹'] = '',
['🇻'] = '',
['🇹'] = '',
['🇨'] = '',
['🇹'] = '',
['🇲'] = '',
['🇹'] = '',
['🇷'] = '',
['🇻'] = '',
['🇺'] = '',
['🇺'] = '',
['🇿'] = '',
['🇺'] = '',
['🇾'] = '',
['🇺'] = '',
['🇸'] = '',
['🏴'] = '',
['󠁧'] = '',
['󠁢'] = '',
['󠁷'] = '',
['󠁬'] = '',
['󠁳'] = '',
['󠁿'] = '',
['🏴'] = '',
['󠁧'] = '',
['󠁢'] = '',
['󠁳'] = '',
['󠁣'] = '',
['󠁴'] = '',
['󠁿'] = '',
['🏴'] = '',
['󠁧'] = '',
['󠁢'] = '',
['󠁥'] = '',
['󠁮'] = '',
['󠁧'] = '',
['󠁿'] = '',
['🇬'] = '',
['🇧'] = '',
['🇿'] = '',
['🇼'] = '',
['🇿'] = '',
['🇲'] = '',
['🇾'] = '',
['🇪'] = '',
['🇪'] = '',
['🇭'] = '',
['🇼'] = '',
['🇫'] = '',
['🇻'] = '',
['🇳'] = '',
['🇻'] = '',
['🇪'] = '',
['🇻'] = '',
['🇦'] = '',
['🔯'] = '',
['✡'] = '',
['️'] = '',
['☸'] = '',
['️'] = '',
['🕉'] = '',
['☪'] = '',
['️'] = '',
['✝'] = '',
['️'] = '',
['☮'] = '',
['️'] = '',
['💟'] = '',
['♊'] = '',
['️'] = '',
['♉'] = '',
['️'] = '',
['♈'] = '',
['️'] = '',
['⛎'] = '',
['🛐'] = '',
['☦'] = '',
['️'] = '',
['☯'] = '',
['️'] = '',
['🕎'] = '',
['♒'] = '',
['️'] = '',
['♑'] = '',
['️'] = '',
['♐'] = '',
['️'] = '',
['♏'] = '',
['️'] = '',
['♎'] = '',
['️'] = '',
['♍'] = '',
['️'] = '',
['♌'] = '',
['️'] = '',
['♋'] = '',
['️'] = '',
['📳'] = '',
['📴'] = '',
['☣'] = '',
['️'] = '',
['☢'] = '',
['️'] = '',
['🉑'] = '',
['⚛'] = '',
['️'] = '',
['🆔'] = '',
['♓'] = '',
['️'] = '',
['💮'] = '',
['🆚'] = '',
['✴'] = '',
['️'] = '',
['🈷'] = '',
['🈺'] = '',
['🈸'] = '',
['🈚'] = '',
['️'] = '',
['🈶'] = '',
['🅰'] = '',
['️'] = '',
['🈲'] = '',
['🈹'] = '',
['🈵'] = '',
['🈴'] = '',
['㊗'] = '',
['️'] = '',
['㊙'] = '',
['️'] = '',
['🉐'] = '',
['🛑'] = '',
['⭕'] = '',
['️'] = '',
['❌'] = '',
['🆘'] = '',
['🅾'] = '',
['️'] = '',
['🆑'] = '',
['🆎'] = '',
['🅱'] = '',
['️'] = '',
['🚯'] = '',
['🚷'] = '',
['♨'] = '',
['️'] = '',
['💢'] = '',
['💯'] = '',
['🚫'] = '',
['📛'] = '',
['⛔'] = '',
['️'] = '',
['❓'] = '',
['❕'] = '',
['❗'] = '',
['️'] = '',
['🚭'] = '',
['📵'] = '',
['🔞'] = '',
['🚱'] = '',
['🚳'] = '',
['🚸'] = '',
['⚠'] = '',
['️'] = '',
['〽'] = '',
['️'] = '',
['🔆'] = '',
['🔅'] = '',
['⁉'] = '',
['️'] = '',
['‼'] = '',
['️'] = '',
['❔'] = '',
['❇'] = '',
['️'] = '',
['💹'] = '',
['🈯'] = '',
['️'] = '',
['✅'] = '',
['♻'] = '',
['️'] = '',
['🔰'] = '',
['⚜'] = '',
['️'] = '',
['🔱'] = '',
['🏧'] = '',
['💤'] = '',
['🌀'] = '',
['Ⓜ'] = '',
['️'] = '',
['💠'] = '',
['🌐'] = '',
['❎'] = '',
['✳'] = '',
['️'] = '',
['🛄'] = '',
['🛃'] = '',
['🛂'] = '',
['🈂'] = '',
['🈳'] = '',
['🅿'] = '',
['️'] = '',
['♿'] = '',
['️'] = '',
['🚾'] = '',
['📶'] = '',
['🎦'] = '',
['🚮'] = '',
['🚻'] = '',
['🚼'] = '',
['🚺'] = '',
['🚹'] = '',
['🛅'] = '',
['🆗'] = '',
['🆖'] = '',
['🔠'] = '',
['🔡'] = '',
['🔤'] = '',
['ℹ'] = '',
['️'] = '',
['🔣'] = '',
['🈁'] = '',
['3'] = '',
['⃣'] = '',
['2'] = '',
['⃣'] = '',
['1'] = '',
['⃣'] = '',
['0'] = '',
['⃣'] = '',
['🆓'] = '',
['🆕'] = '',
['🆒'] = '',
['🆙'] = '',
['🔢'] = '',
['🔟'] = '',
['9'] = '',
['⃣'] = '',
['8'] = '',
['⃣'] = '',
['7'] = '',
['⃣'] = '',
['6'] = '',
['⃣'] = '',
['5'] = '',
['⃣'] = '',
['4'] = '',
['⃣'] = '',
['⏺'] = '',
['⏹'] = '',
['⏯'] = '',
['⏸'] = '',
['▶'] = '',
['️'] = '',
['⏏'] = '',
['*'] = '',
['⃣'] = '',
['#'] = '',
['⃣'] = '',
['🔼'] = '',
['◀'] = '',
['️'] = '',
['⏬'] = '',
['⏫'] = '',
['⏪'] = '',
['⏩'] = '',
['⏮'] = '',
['⏭'] = '',
['↙'] = '',
['️'] = '',
['↘'] = '',
['️'] = '',
['↗'] = '',
['️'] = '',
['⬇'] = '',
['️'] = '',
['⬆'] = '',
['️'] = '',
['⬅'] = '',
['️'] = '',
['➡'] = '',
['️'] = '',
['🔽'] = '',
['🔀'] = '',
['⤵'] = '',
['️'] = '',
['⤴'] = '',
['️'] = '',
['↩'] = '',
['️'] = '',
['↪'] = '',
['️'] = '',
['↔'] = '',
['️'] = '',
['↕'] = '',
['️'] = '',
['↖'] = '',
['️'] = '',
['➖'] = '',
['➕'] = '',
['🎶'] = '',
['🎵'] = '',
['🔃'] = '',
['🔄'] = '',
['🔂'] = '',
['🔁'] = '',
['〰'] = '',
['®'] = '',
['©'] = '',
['™'] = '',
['💱'] = '',
['💲'] = '',
['✖'] = '',
['️'] = '',
['➗'] = '',
['✔'] = '',
['️'] = '',
['🔜'] = '',
['🔝'] = '',
['🔛'] = '',
['🔙'] = '',
['🔚'] = '',
['➿'] = '',
['➰'] = '',
['🔻'] = '',
['🔺'] = '',
['🔵'] = '',
['🔴'] = '',
['⚫'] = '',
['️'] = '',
['⚪'] = '',
['️'] = '',
['🔘'] = '',
['☑'] = '',
['️'] = '',
['▫'] = '',
['️'] = '',
['▪'] = '',
['️'] = '',
['🔲'] = '',
['🔳'] = '',
['🔷'] = '',
['🔶'] = '',
['🔹'] = '',
['🔸'] = '',
['🔇'] = '',
['🔈'] = '',
['⬜'] = '',
['️'] = '',
['⬛'] = '',
['️'] = '',
['◻'] = '',
['️'] = '',
['◼'] = '',
['️'] = '',
['◽'] = '',
['️'] = '',
['◾'] = '',
['️'] = '',
['💬'] = '',
['👁'] = '',
['‍'] = '',
['🗨'] = '',
['📢'] = '',
['📣'] = '',
['🔕'] = '',
['🔔'] = '',
['🔊'] = '',
['🔉'] = '',
['🎴'] = '',
['🃏'] = '',
['♦'] = '',
['️'] = '',
['♥'] = '',
['️'] = '',
['♣'] = '',
['️'] = '',
['♠'] = '',
['️'] = '',
['🗯'] = '',
['💭'] = '',
['🕖'] = '',
['🕕'] = '',
['🕔'] = '',
['🕓'] = '',
['🕒'] = '',
['🕑'] = '',
['🕐'] = '',
['🀄'] = '',
['️'] = '',
['🕞'] = '',
['🕝'] = '',
['🕜'] = '',
['🕛'] = '',
['🕚'] = '',
['🕙'] = '',
['🕘'] = '',
['🕗'] = '',
['🕦'] = '',
['🕥'] = '',
['🕤'] = '',
['🕣'] = '',
['🕢'] = '',
['🕡'] = '',
['🕠'] = '',
['🕟'] = '',
['🖨'] = '',
['🖥'] = '',
['⌨'] = '',
['️'] = '',
['💻'] = '',
['📲'] = '',
['📱'] = '',
['⌚'] = '',
['️'] = '',
['🕧'] = '',
['📀'] = '',
['💿'] = '',
['💾'] = '',
['💽'] = '',
['🗜'] = '',
['🕹'] = '',
['🖲'] = '',
['🖱'] = '',
['📞'] = '',
['🎞'] = '',
['📽'] = '',
['🎥'] = '',
['📹'] = '',
['📸'] = '',
['📷'] = '',
['📼'] = '',
['🎛'] = '',
['🎚'] = '',
['🎙'] = '',
['📻'] = '',
['📺'] = '',
['📠'] = '',
['📟'] = '',
['☎'] = '',
['️'] = '',
['🔋'] = '',
['📡'] = '',
['⏳'] = '',
['⌛'] = '',
['️'] = '',
['🕰'] = '',
['⏰'] = '',
['⏲'] = '',
['⏱'] = '',
['💵'] = '',
['💸'] = '',
['🛢'] = '',
['🗑'] = '',
['🕯'] = '',
['🔦'] = '',
['💡'] = '',
['🔌'] = '',
['🔧'] = '',
['⚖'] = '',
['️'] = '',
['💎'] = '',
['💳'] = '',
['💰'] = '',
['💷'] = '',
['💶'] = '',
['💴'] = '',
['🔫'] = '',
['⛓'] = '',
['⚙'] = '',
['️'] = '',
['🔩'] = '',
['⛏'] = '',
['🛠'] = '',
['⚒'] = '',
['🔨'] = '',
['⚱'] = '',
['️'] = '',
['⚰'] = '',
['️'] = '',
['🚬'] = '',
['🛡'] = '',
['⚔'] = '',
['️'] = '',
['🗡'] = '',
['🔪'] = '',
['💣'] = '',
['🕳'] = '',
['🔬'] = '',
['🔭'] = '',
['⚗'] = '',
['️'] = '',
['💈'] = '',
['📿'] = '',
['🔮'] = '',
['🏺'] = '',
['🛎'] = '',
['🛁'] = '',
['🚿'] = '',
['🚰'] = '',
['🚽'] = '',
['🌡'] = '',
['💉'] = '',
['💊'] = '',
['🛍'] = '',
['🖼'] = '',
['🛌'] = '',
['🛏'] = '',
['🛋'] = '',
['🚪'] = '',
['🗝'] = '',
['🔑'] = '',
['🎎'] = '',
['🎉'] = '',
['🎊'] = '',
['🎀'] = '',
['🎏'] = '',
['🎈'] = '',
['🎁'] = '',
['🛒'] = '',
['📥'] = '',
['💌'] = '',
['📧'] = '',
['📨'] = '',
['📩'] = '',
['✉'] = '',
['️'] = '',
['🎐'] = '',
['🏮'] = '',
['📮'] = '',
['📭'] = '',
['📬'] = '',
['📫'] = '',
['📪'] = '',
['🏷'] = '',
['📦'] = '',
['📤'] = '',
['📉'] = '',
['📈'] = '',
['📊'] = '',
['📑'] = '',
['📄'] = '',
['📃'] = '',
['📜'] = '',
['📯'] = '',
['🗄'] = '',
['🗳'] = '',
['🗃'] = '',
['📇'] = '',
['📅'] = '',
['📆'] = '',
['🗓'] = '',
['🗒'] = '',
['📔'] = '',
['📓'] = '',
['📰'] = '',
['🗞'] = '',
['🗂'] = '',
['📂'] = '',
['📁'] = '',
['📋'] = '',
['🔖'] = '',
['📖'] = '',
['📚'] = '',
['📙'] = '',
['📘'] = '',
['📗'] = '',
['📕'] = '',
['📒'] = '',
['✂'] = '',
['️'] = '',
['📍'] = '',
['📌'] = '',
['📏'] = '',
['📐'] = '',
['🖇'] = '',
['📎'] = '',
['🔗'] = '',
['🔍'] = '',
['✏'] = '',
['️'] = '',
['📝'] = '',
['🖍'] = '',
['🖌'] = '',
['✒'] = '',
['️'] = '',
['🖋'] = '',
['🖊'] = '',
['🔓'] = '',
['🔒'] = '',
['🔐'] = '',
['🔏'] = '',
['🔎'] = ''}
return UTF8_replace(Name,FlterChar) or ''
end
