
--[[ CORE ]] --



RegisterNewSlashCommand(
    function()
        if(IsInGroup() == true) then
            C_PartyInfo.LeaveParty();
            C_PartyInfo.ConfirmLeaveParty();
        else
            SendSystemMessage("Not in group")
        end
    end, -- executing function
    "lg",               -- slash cmd name
    "leavegroup"        -- slash cmd alias
)

local blockParty = false
local frame = CreateFrame("Frame")
frame:RegisterEvent("PARTY_INVITE_REQUEST")

frame:SetScript("OnEvent", function(self, event, sender)
    if(blockParty == true) then
        DeclineGroup()
        StaticPopup_Hide("PARTY_INVITE");
    end
end)

RegisterNewSlashCommand(
    function()
        if blockParty == false  then
            blockParty = true
            SendSystemMessage("[ON] Blocking Party Invites")
        else
            blockParty = false
            SendSystemMessage("[OFF] Allowing Party Invites")
        end
    end,
    "bparty",
    "block"
)