-- ============================================================
-- NFS No Limits Script GameGuardian
-- REDESIGNED VERSION - FIXED BUGS - STABLE RELEASE
-- FREE VERSION (REP/Nitro/Tuner Trial removed)
-- Script by: ZydXie
-- ============================================================

-- WAJIB: Baris pertama harus ini!
HackingIsTheGame = 1776

-- Lanjutkan kode script kamu di sini
gg.toast("✅ Script Version 9.3.0 Running!")

-- Contoh fungsi script
--gg.alert("Welcome to script ZydXie GG!")

if gg.isVisible(true) then gg.setVisible(false) end
gg.processPause()

-- ============================================================
-- Fungsi bantuan
-- ============================================================
function safeTonumber(val)
    if val == nil then return nil end
    if type(val) == "number" then return val end
    return tonumber(val)
end

function safeToString(val)
    if val == nil then return "0" end
    return tostring(val)
end

function safeGroupSearch(pattern, typeFlag, alignFlag, signFlag, startAddr, endAddr)
    gg.clearResults()
    local success, result = pcall(gg.searchNumber, pattern, typeFlag, alignFlag, signFlag, startAddr, endAddr)
    if not success then
        gg.alert("❌ Search error: " .. tostring(result) .. "\n\nPattern: " .. tostring(pattern))
        return 0
    end
    if gg.isVisible(true) then gg.setVisible(false) end
    gg.sleep(100)
    return gg.getResultsCount()
end

function standby()
    gg.processResume()
    gg.setVisible(false)

    while true do
        if gg.isVisible(true) then
            gg.setVisible(false)
            return
        end
        gg.sleep(100)
    end
end

-- ============================================================
-- SUBSCRIPTION CHECK
-- ============================================================
if gg.alert(
    "╔═════════════ ≪ °❈° ≫ ═════════════╗\n\n\t\t\tS͏c͏r͏i͏p͏t͏ b͏y͏   : 𝐙𝐲𝐝𝐗𝐢𝐞\n\t\t\tY͏o͏u͏T͏u͏b͏e͏   : 𝐙𝐲𝐝𝐗𝐢𝐞『𝙂𝙂』\n\t\t\tT͏e͏l͏e͏g͏r͏a͏m͏  : 𝐭.𝐦𝐞/𝐳𝐲𝐝𝐱𝐢𝐞\n\n╚═════════════ ≪ °❈° ≫ ═════════════╝\n\n𝐇𝐚𝐯𝐞 𝐲𝐨𝐮 𝐒𝐮𝐛𝐬𝐜𝐫𝐢𝐛𝐞 𝐦𝐲 𝐘𝐨𝐮𝐭𝐮𝐛𝐞 𝐂𝐡𝐚𝐧𝐧𝐞𝐥?\n",
    '✔️ 𝐘𝐄𝐒 𝐈 𝐀𝐌', '❌ 𝐍𝐎 𝐈 𝐀𝐌 𝐍𝐎𝐓') ~= 1 then
    gg.processResume()
    if gg.isVisible(true) then gg.setVisible(false) end
    os.exit()
end

-- ============================================================
-- MAIN MENU
-- ============================================================
::mainmenu::
if gg.isVisible(true) then gg.setVisible(false) end
gg.processPause()
gg.clearResults()

menu = gg.choice({
    '『1』Cash ● Gold ● Scrap ● Race Skips ● Tuning',
    '『2』Gasoline ● Tickets',
    '『3』Blueprints',
    '『4』Materials',
    '『5』VIP Points',
    '❌ EXIT'
}, nil,
'╔═══════════ ≪ ° 𝙕𝙮𝙙𝙓𝙞𝙚『𝙂𝙂』° ≫ ═══════════╗\n\n' ..
'\t\t\tGame               : Need For Speed No Limits\n' ..
'\t\t\tVersion            : 9.3.0\n' ..
'\t\t\tStatus             : FREE Version\n\n' ..
'╚══════════════  ≪ °❈° ≫  ══════════════╝')


if menu == 1 then goto resources_menu end
if menu == 2 then goto gasoline_tickets end
if menu == 3 then goto blueprints_menu end
if menu == 4 then goto materials_menu end
if menu == 5 then goto vip_points end
if menu == 6 then goto close_script end
if menu == nil then
    standby()
    goto mainmenu
end


-- ============================================================
-- SECTION 1: RESOURCES (Cash, Gold, Scrap, Race Skips, Tuning)
-- ============================================================
::resources_menu::
gg.processPause()

res_choice = gg.choice({
    '『💰』Cash',
    '『🥇』Gold',
    '『🔧』Scrap',
    '『🏁』Race Skips',
    '『⚡』Tuning Points',
    '❌ Back to Menu'
}, nil, '╔══════════ ≪ °Select Resource° ≫ ══════════╗\n\nSelect the resource to modify')

if res_choice == nil then goto mainmenu end
if res_choice == 6 then goto mainmenu end

selected_resource = ""
if res_choice == 1 then selected_resource = 'Cash' end
if res_choice == 2 then selected_resource = 'Gold' end
if res_choice == 3 then selected_resource = 'Scrap' end
if res_choice == 4 then selected_resource = 'Race Skips' end
if res_choice == 5 then selected_resource = 'Tuning Points' end

::get_resource_values::
data = gg.prompt({
    'Enter CURRENT ' .. selected_resource .. ' value',
    'Enter TARGET ' .. selected_resource .. ' value'
}, {
    [1] = 'Current ' .. selected_resource,
    [2] = 'New ' .. selected_resource
})

if data == nil then
    gg.toast('⚠ Cancelled')
    goto mainmenu
end

current_val = safeTonumber(data[1])
target_val = safeTonumber(data[2])

if current_val == nil or data[1] == 'Current ' .. selected_resource then
    gg.toast('⚠ Invalid current value!')
    goto get_resource_values
end
if target_val == nil or data[2] == 'New ' .. selected_resource then
    gg.toast('⚠ Invalid target value!')
    goto get_resource_values
end

if target_val < 0 then
    gg.toast('⚠ Target value cannot be negative!')
    goto get_resource_values
end

gg.toast('🔍 Searching for ' .. selected_resource .. ' with value ' .. current_val .. '...')

if selected_resource == "Tuning Points" then
    search_count = safeGroupSearch(
        current_val .. ';327680~327700;24~26::9',
        gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1
    )
else
    search_count = safeGroupSearch(
        current_val .. ';327688~327693;24~26::9',
        gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1
    )
end

if search_count == 0 then
    gg.alert(
        '❌ VALUE NOT FOUND\n\n' ..
        'Value ' .. current_val .. ' for ' .. selected_resource .. ' was not found.\n\n' ..
        'Possible causes:\n' ..
        '1. Incorrect value entered\n' ..
        '2. Game was just restarted, try playing for a bit\n' ..
        '3. Different game version, pattern ID may have changed'
    )
    goto mainmenu
end

results = gg.getResults(100000)
results_tbl = gg.getValues(results)

valid_count = 0
valid_addresses = {}

-- Pattern: [RESOURCE_VALUE] [327681~327699] [24~26]
for i = 2, #results_tbl do
    curr = results_tbl[i]
    prev = results_tbl[i - 1]

    if curr ~= nil and prev ~= nil then
        curr_val_num = safeTonumber(curr.value)
        prev_val_num = safeTonumber(prev.value)

        if curr_val_num and prev_val_num then
            if curr_val_num >= 327681 and curr_val_num <= 327699 then
                if results_tbl[i + 1] ~= nil then
                    next_val_num = safeTonumber(results_tbl[i + 1].value)
                    if next_val_num and next_val_num >= 24 and next_val_num <= 26 then
                        if prev_val_num == current_val then
                            valid_count = valid_count + 1
                            valid_addresses[valid_count] = i - 1
                        end
                    end
                end
            end
        end
    end
end

if valid_count == 0 then
    gg.alert(
        '❌ VALIDATION FAILED\n\n' ..
        'Could not validate ' .. selected_resource .. '.\n\n' ..
        'Pattern ID mismatch. Possibly different game version.\n' ..
        'Total search results: ' .. search_count
    )
    goto mainmenu
end

confirm = gg.alert(
    '✔️️ ' .. selected_resource .. ' FOUND!\n\n' ..
    'Current value: ' .. current_val .. '\n' ..
    'Target value: ' .. target_val .. '\n' ..
    'Total addresses found: ' .. search_count .. '\n' ..
    'Valid addresses (safe to modify): ' .. valid_count .. '\n\n' ..
    'ARE YOU SURE YOU WANT TO MODIFY? ' .. valid_count .. ' addresses will be changed.',
    '✔️ YES, CHANGE IT!', '❌ CANCEL'
)

if confirm ~= 1 then
    gg.toast('⚠ Changes cancelled')
    goto mainmenu
end

for i = 1, valid_count do
    results_tbl[valid_addresses[i]].value = safeToString(target_val)
end

gg.setValues(results_tbl)

gg.alert(
    '✔️️ SUCCESS!\n\n' ..
    selected_resource .. ' SUCCESSFULLY CHANGED!\n\n' ..
    'From: ' .. current_val .. '\n' ..
    'To: ' .. target_val .. '\n' ..
    'Number of addresses modified: ' .. valid_count .. '\n\n' ..
    'If changes are not visible, try restarting the game.'
)

gg.sleep(500)
goto mainmenu


-- ============================================================
-- SECTION 2: GASOLINE & TICKETS
-- ============================================================
::gasoline_tickets::
gg.processPause()

gt_choice = gg.choice({
    '『⛽』Gasoline',
    '『🎫』Tickets',
    '❌ Back to Menu'
}, nil, '╔══════════ ≪ °Select° ≫ ══════════╗\n\nSelect the resource to modify')

if gt_choice == nil then goto mainmenu end
if gt_choice == 3 then goto mainmenu end

selected_gt = ""
if gt_choice == 1 then selected_gt = 'Gasoline' end
if gt_choice == 2 then selected_gt = 'Tickets' end

::get_gt_values::
data = gg.prompt({
    'Current ' .. selected_gt .. ' value',
    'Target ' .. selected_gt .. ' value'
}, {
    [1] = 'Current',
    [2] = 'Target'
})

if data == nil then
    gg.toast('⚠ Cancelled')
    goto mainmenu
end

cur_gt = safeTonumber(data[1])
tgt_gt = safeTonumber(data[2])

if cur_gt == nil or data[1] == 'Current' then
    gg.toast('⚠ Invalid current value!')
    goto get_gt_values
end
if tgt_gt == nil or data[2] == 'Target' then
    gg.toast('⚠ Invalid target value!')
    goto get_gt_values
end

if tgt_gt < 0 then
    gg.toast('⚠ Target value cannot be negative!')
    goto get_gt_values
end

gg.toast('🔍 Searching for ' .. selected_gt .. '...')

total_gt = safeGroupSearch(
    cur_gt .. ';327681~327699;24~26;262144;2621443::21',
    gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1
)

if total_gt == 0 then
    gg.alert('❌ Value ' .. cur_gt .. ' not found!')
    goto mainmenu
end

results_gt = gg.getResults(100000)
results_gt_tbl = gg.getValues(results_gt)

valid_gt_count = 0

for i = 1, #results_gt_tbl do
    if results_gt_tbl[i] ~= nil then
        val_gt = safeTonumber(results_gt_tbl[i].value)
        if val_gt and val_gt == cur_gt then
            if results_gt_tbl[i + 1] ~= nil then
                next_v = safeTonumber(results_gt_tbl[i + 1].value)
                if next_v and next_v >= 327681 and next_v <= 327699 then
                    valid_gt_count = valid_gt_count + 1
                    results_gt_tbl[i].value = safeToString(tgt_gt)
                end
            end
        end
    end
end

if valid_gt_count == 0 then
    gg.alert(
        '❌ VALIDATION FAILED\n\n' ..
        'Could not validate ' .. selected_gt .. '.\n' ..
        'Total results: ' .. total_gt
    )
    goto mainmenu
end

confirm_gt = gg.alert(
    '✔️️ ' .. selected_gt .. ' FOUND!\n\n' ..
    'Current value: ' .. cur_gt .. '\n' ..
    'Valid addresses: ' .. valid_gt_count .. '\n' ..
    'Target: ' .. tgt_gt .. '\n\n' ..
    'Modify ' .. valid_gt_count .. ' addresses?',
    '✔️ YES, CHANGE IT!',
    '❌ CANCEL'
)

if confirm_gt ~= 1 then
    gg.toast('⚠ Cancelled')
    goto mainmenu
end

gg.setValues(results_gt_tbl)

gg.alert(
    '✔️️ SUCCESS!\n\n' ..
    selected_gt .. ' successfully changed:\n' ..
    cur_gt .. ' → ' .. tgt_gt
)

goto mainmenu


-- ============================================================
-- SECTION 3: BLUEPRINTS
-- ============================================================
::blueprints_menu::
gg.processPause()

bp_menu = gg.choice({
    '『1』Build Cars From Scratch',
    '『2』Change Blueprints for Specific Cars',
    '『3』Max Blueprints for All Cars',
    '『4』Remove Duplicate Blueprints',
    '❌ Back to Menu'
}, nil, '╔══════════ ≪ °Blueprints° ≫ ══════════╗')

if bp_menu == nil then goto mainmenu end
if bp_menu == 5 then goto mainmenu end

if bp_menu == 1 then
    -- Build from scratch
    gg.toast('🔍 Searching for empty blueprints...')
    gg.clearResults()
    gg.searchNumber('0;327702~327706;26;12;1~4000::29', gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
    if gg.isVisible(true) then gg.setVisible(false) end
    gg.sleep(100)

    bp_count = gg.getResultsCount()
    if bp_count == 0 then
        gg.alert('❌ No cars available to build from scratch.')
        goto blueprints_menu
    end

    bp_results = gg.getResults(10000)
    bp_values = gg.getValues(bp_results)

    valid_entries = 0
    for i = 1, #bp_values, 5 do
        if bp_values[i] ~= nil then
            valid_entries = valid_entries + 1
            bp_values[i].value = '999'
        end
    end

    confirm_bp = gg.alert(
        '✔️️ Empty blueprints found: ' .. valid_entries .. ' cars\n\nChange all to 999 blueprints?',
        '✔️ YES', '❌ NO'
    )

    if confirm_bp == 1 then
        gg.setValues(bp_values)
        gg.alert('✔️️ SUCCESS! ' .. valid_entries .. ' cars changed to 999 blueprints.\n\nUse "Remove Duplicate BP" to clean up.')
    else
        gg.toast('⚠ Cancelled')
    end

    goto blueprints_menu

elseif bp_menu == 2 then
    -- Specific cars
    sp_choice = gg.choice({
        '『1』Search by number of Blueprints',
        '『2』Search by number of Cars',
        '❌ Back'
    }, nil, 'Select method')

    if sp_choice == nil then goto blueprints_menu end
    if sp_choice == 3 then goto blueprints_menu end

    if sp_choice == 1 then
        a = gg.prompt({'Enter the number of BP to max out (0 = all)'}, {[1]='0'})
        if a == nil then goto blueprints_menu end
        bp_target = safeTonumber(a[1])
        if bp_target == nil then bp_target = 0 end

        gg.toast('🔍 Searching for blueprints with value ' .. bp_target .. '...')
        gg.clearResults()
        gg.searchNumber(bp_target .. ';327702~327706;26;12;0~~0::29', gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
        if gg.isVisible(true) then gg.setVisible(false) end
        gg.sleep(100)

        bp_count2 = gg.getResultsCount()
        if bp_count2 == 0 then
            gg.alert('❌ No blueprints found with value ' .. bp_target)
            goto blueprints_menu
        end

        bp_results2 = gg.getResults(10000)
        bp_values2 = gg.getValues(bp_results2)

        entries2 = 0
        for i = 1, #bp_values2, 5 do
            if bp_values2[i] ~= nil then
                entries2 = entries2 + 1
                bp_values2[i].value = '999'
            end
        end

        confirm2 = gg.alert(
            '✔️️ Found ' .. entries2 .. ' entries with ' .. bp_target .. ' BP\n\nChange to 999?',
            '✔️ YES', '❌ NO'
        )

        if confirm2 == 1 then
            gg.setValues(bp_values2)
            gg.alert('✔️️ SUCCESS! ' .. entries2 .. ' entries changed.')
        end

    elseif sp_choice == 2 then
        a = gg.prompt({'How many cars do you want to max BP for?'}, {[1]='10'})
        if a == nil then goto blueprints_menu end
        num_cars = safeTonumber(a[1])
        if num_cars == nil or num_cars < 1 then num_cars = 10 end

        gg.toast('🔍 Searching for ' .. num_cars .. ' cars to max BP...')
        gg.clearResults()
        gg.searchNumber('0~399;327702~327706;26;12;' .. num_cars .. '::29', gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
        if gg.isVisible(true) then gg.setVisible(false) end
        gg.sleep(100)

        bp_count3 = gg.getResultsCount()
        if bp_count3 == 0 then
            gg.alert('❌ Not found.')
            goto blueprints_menu
        end

        bp_results3 = gg.getResults(10000)
        bp_values3 = gg.getValues(bp_results3)

        entries3 = 0
        for i = 1, #bp_values3, 5 do
            if bp_values3[i] ~= nil then
                entries3 = entries3 + 1
                bp_values3[i].value = '999'
            end
        end

        confirm3 = gg.alert(
            '✔️️ Found ' .. entries3 .. ' cars\nChange BP to 999?',
            '✔️ YES', '❌ NO'
        )

        if confirm3 == 1 then
            gg.setValues(bp_values3)
            gg.alert('✔️️ SUCCESS! ' .. entries3 .. ' cars maxed to 999 BP.')
        end
    end

    goto blueprints_menu

elseif bp_menu == 3 then
    -- Max all blueprints
    gg.toast('🔍 Searching for all blueprints...')
    gg.clearResults()
    gg.searchNumber('0~399;327702~327706;26;12;1~4000::29', gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
    if gg.isVisible(true) then gg.setVisible(false) end
    gg.sleep(100)

    bp_count4 = gg.getResultsCount()
    if bp_count4 == 0 then
        gg.alert('❌ No blueprints found.')
        goto blueprints_menu
    end

    bp_results4 = gg.getResults(10000)
    bp_values4 = gg.getValues(bp_results4)

    entries4 = 0
    for i = 1, #bp_values4, 5 do
        if bp_values4[i] ~= nil then
            entries4 = entries4 + 1
            bp_values4[i].value = '999'
        end
    end

    confirm4 = gg.alert(
        '✔️️ Found ' .. entries4 .. ' cars\nMax all blueprints?',
        '✔️ YES, MAX THEM ALL!', '❌ NO'
    )

    if confirm4 == 1 then
        gg.setValues(bp_values4)
        gg.alert('✔️️ SUCCESS!\n\n' .. entries4 .. ' cars maxed out!\n\nSuggestion: Run "Remove Duplicate BP" to clean up.')
    end

    goto blueprints_menu

elseif bp_menu == 4 then
    -- Remove duplicate blueprints
    gg.toast('🔍 Searching for duplicate blueprints...')
    gg.clearResults()
    gg.searchNumber('599~999;327702~327706;26::9', gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
    if gg.isVisible(true) then gg.setVisible(false) end
    gg.sleep(100)
    gg.refineNumber('599~999', gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
    if gg.isVisible(true) then gg.setVisible(false) end
    gg.sleep(100)

    dup_count = gg.getResultsCount()
    if dup_count == 0 then
        gg.alert('❌ No duplicate blueprints found.')
        goto blueprints_menu
    end

    confirm_dup = gg.alert(
        '✔️️ Found ' .. dup_count .. ' duplicate blueprints\n\nDelete all (set to 0)?',
        '✔️ YES, DELETE!', '❌ NO'
    )

    if confirm_dup == 1 then
        gg.getResults(2000)
        gg.editAll('0', gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
        gg.alert('✔️️ SUCCESS! Duplicate blueprints removed.')
    end

    goto blueprints_menu
end


-- ============================================================
-- SECTION 4: MATERIALS / PARTS
-- ============================================================
::materials_menu::
gg.processPause()

mat_choice = gg.choice({
    '『1』Automatic (1→25, 2→49, 3→150)',
    '『2』Manual (input your own)',
    '❌ Back to Menu'
}, nil, '╔══════════ ≪ °Materials° ≫ ══════════╗\n\nSelect material hack method')

if mat_choice == nil then goto mainmenu end
if mat_choice == 3 then goto mainmenu end

if mat_choice == 1 then
    -- Automatic
    auto_choice = gg.choice({
        '『1』Hack Tier 1-2 (25-49)',
        '『2』Hack Tier 1-2-3 (50-99-150)',
        '❌ Back'
    }, nil, nil)

    if auto_choice == nil then goto materials_menu end
    if auto_choice == 3 then goto materials_menu end

    parts_range = ""
    if auto_choice == 1 then parts_range = '1~2' end
    if auto_choice == 2 then parts_range = '1~3' end

    gg.toast('🔍 Searching for materials...')
    gg.clearResults()
    gg.searchNumber(parts_range .. ';327681~327699;26;262144;2621443::21', gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
    if gg.isVisible(true) then gg.setVisible(false) end
    gg.sleep(100)
    gg.refineNumber(parts_range, gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
    if gg.isVisible(true) then gg.setVisible(false) end
    gg.sleep(100)

    mat_count = gg.getResultsCount()
    if mat_count == 0 then
        gg.alert('❌ No materials found.')
        goto materials_menu
    end

    mat_results = gg.getResults(100000)
    mat_values = gg.getValues(mat_results)

    change_count = 0
    for i = 1, #mat_values do
        if mat_values[i] ~= nil then
            val = mat_values[i].value
            if auto_choice == 1 then
                if val == '1' then mat_values[i].value = '25' change_count = change_count + 1 end
                if val == '2' then mat_values[i].value = '49' change_count = change_count + 1 end
            else
                if val == '1' then mat_values[i].value = '50' change_count = change_count + 1 end
                if val == '2' then mat_values[i].value = '99' change_count = change_count + 1 end
                if val == '3' then mat_values[i].value = '150' change_count = change_count + 1 end
            end
        end
    end

    confirm_mat = gg.alert(
        '✔️️ Found ' .. mat_count .. ' material addresses\nWill modify: ' .. change_count .. ' addresses\n\nConfirm changes?',
        '✔️ YES', '❌ NO'
    )

    if confirm_mat == 1 then
        gg.setValues(mat_values)
        gg.alert('✔️️ SUCCESS! ' .. change_count .. ' materials modified.')
    end

    goto materials_menu

elseif mat_choice == 2 then
    -- Manual
    ::get_mat_values::
    data = gg.prompt({
        'Current material value',
        'Target material value'
    }, {
        [1] = 'Current',
        [2] = 'Target'
    })

    if data == nil then goto mainmenu end

    cur_mat = safeTonumber(data[1])
    tgt_mat = safeTonumber(data[2])

    if cur_mat == nil or data[1] == 'Current' then
        gg.toast('⚠ Invalid value')
        goto get_mat_values
    end
    if tgt_mat == nil or data[2] == 'Target' then
        gg.toast('⚠ Invalid value')
        goto get_mat_values
    end

    if tgt_mat < 0 then
        gg.toast('⚠ Target value cannot be negative!')
        goto get_mat_values
    end

    gg.toast('🔍 Searching for material with value ' .. cur_mat .. '...')
    gg.clearResults()
    gg.searchNumber(cur_mat .. ';327681~327699;26;262144;2621443::21', gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
    if gg.isVisible(true) then gg.setVisible(false) end
    gg.sleep(100)

    mat_count2 = gg.getResultsCount()
    if mat_count2 == 0 then
        gg.alert('❌ Material with value ' .. cur_mat .. ' not found.')
        goto materials_menu
    end

    confirm_mat2 = gg.alert(
        '✔️️ Material with value ' .. cur_mat .. ' found!\nTotal addresses: ' .. mat_count2 .. '\n\nChange all to ' .. tgt_mat .. '?',
        '✔️ YES, CHANGE IT!', '❌ CANCEL'
    )

    if confirm_mat2 == 1 then
        gg.getResults(1000)
        gg.editAll(safeToString(tgt_mat), gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
        gg.alert('✔️️ SUCCESS! Material changed: ' .. cur_mat .. ' → ' .. tgt_mat)
    end

    goto materials_menu
end


-- ============================================================
-- SECTION 5: VIP POINTS
-- ============================================================
::vip_points::
vip_info = gg.alert(
    '╔══════════ ≪ °VIP Points° ≫ ══════════╗\n\n' ..
    'VIP 1  = 10 Pts\n' ..
    'VIP 2  = 500 Pts\n' ..
    'VIP 3  = 1,200 Pts\n' ..
    'VIP 4  = 2,000 Pts\n' ..
    'VIP 5  = 7,500 Pts\n' ..
    'VIP 6  = 15,000 Pts\n' ..
    'VIP 7  = 30,000 Pts\n' ..
    'VIP 8  = 55,000 Pts\n' ..
    'VIP 9  = 85,000 Pts\n' ..
    'VIP 10 = 150,000 Pts\n\n' ..
    '╚══════════════════════════════╝',
    '✔️ NEXT', '❌ BACK'
)

if vip_info ~= 1 then goto mainmenu end

::get_vip::
data = gg.prompt({
    'Enter CURRENT VIP Points',
    'Enter TARGET VIP Points (max 150,000)'
}, {
    [1] = 'Current VIP',
    [2] = 'Target VIP'
})

if data == nil then goto vip_points end

cur_vip = safeTonumber(data[1])
tgt_vip = safeTonumber(data[2])

if cur_vip == nil or data[1] == 'Current VIP' then
    gg.toast('⚠ Invalid value')
    goto get_vip
end
if tgt_vip == nil or data[2] == 'Target VIP' then
    gg.toast('⚠ Invalid value')
    goto get_vip
end

if tgt_vip > 150000 then
    gg.alert('❌ Maximum VIP Points is 150,000.\nPlease enter a value of 150,000 or less.')
    goto get_vip
end
if tgt_vip < 0 then
    gg.toast('⚠ Target value cannot be negative!')
    goto get_vip
end

gg.toast('🔍 Searching for VIP Points...')

vip_search_result = safeGroupSearch(
    cur_vip .. ';327691;26::9',
    gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1
)

if vip_search_result == 0 then
    gg.alert('❌ VIP Points with value ' .. cur_vip .. ' not found.')
    goto vip_points
end

-- Validasi manual: cek pattern ID 327691
vip_all = gg.getResults(vip_search_result)
vip_values_tbl = gg.getValues(vip_all)

valid_vip_count = 0

for i = 1, #vip_values_tbl do
    if vip_values_tbl[i] ~= nil then
        valVip = safeTonumber(vip_values_tbl[i].value)
        if valVip and valVip == cur_vip then
            if vip_values_tbl[i + 1] ~= nil then
                nextVipV = safeTonumber(vip_values_tbl[i + 1].value)
                if nextVipV and nextVipV == 327691 then
                    valid_vip_count = valid_vip_count + 1
                    vip_values_tbl[i].value = safeToString(tgt_vip)
                end
            end
        end
    end
end

if valid_vip_count == 0 then
    gg.alert(
        '❌ VALIDATION FAILED\n\n' ..
        'Could not validate VIP Points.\n' ..
        'Total results found: ' .. vip_search_result
    )
    goto vip_points
end

confirm_vip = gg.alert(
    '✔️️ VIP Points with value ' .. cur_vip .. ' found!\n' ..
    'Total addresses: ' .. vip_search_result .. '\n' ..
    'Valid addresses: ' .. valid_vip_count .. '\n\n' ..
    'Change to ' .. tgt_vip .. '?',
    '✔️ YES, CHANGE IT!', '❌ CANCEL'
)

if confirm_vip == 1 then
    gg.setValues(vip_values_tbl)
    gg.alert('✔️️ SUCCESS! VIP Points changed:\n' .. cur_vip .. ' → ' .. tgt_vip)
end

gg.sleep(300)
goto mainmenu


-- ============================================================
-- CLOSING
-- ============================================================
::close_script::
if gg.alert('Return to game?', '✔️ YES', '❌ NO') == 1 then
    goto exit_game
else
    gg.processResume()
    gg.setVisible(true)
    os.exit()
end

::exit_game::
gg.processResume()
os.exit()
