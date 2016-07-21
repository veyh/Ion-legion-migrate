local legion = {}

function legion:migrate_dualspec(spec_1_id, spec_2_id, num_specs, char_db)
  for key, button in pairs(char_db.buttons) do
    char_db.buttons[key] = self:migrate_button(spec_1_id, spec_2_id, num_specs,
                                               button)
  end

  return char_db
end

function legion:migrate_button(spec_1_id, spec_2_id, num_specs, button)
  local new_button = {
    [spec_1_id] = button[1],
    [spec_2_id] = button[2],
    keys = {
      [spec_1_id] = button.keys[1],
      [spec_2_id] = button.keys[2],
    }
  }

  for i=1,num_specs do
    if not new_button[i] then
      -- just copy primary spec data
      new_button[i] = button[1]
      new_button.keys[i] = button.keys[1]
    end
  end

  return new_button
end

_G.SLASH_ION_LEGION_MIGRATE1 = "/ionlm"

function SlashCmdList.ION_LEGION_MIGRATE(msg, editbox)
  local num_specs = GetNumSpecializations()
  local spec_1_id, spec_2_id = msg:match("^(%d+)%s+(%d+)")
  spec_1_id = tonumber(spec_1_id)
  spec_2_id = tonumber(spec_2_id)

  if (not legion:is_valid_spec_id(spec_1_id, num_specs)
  or  not legion:is_valid_spec_id(spec_2_id, num_specs)) then
    return print(
      string.format("%s <spec 1 id> <spec 2 id>", _G.SLASH_ION_LEGION_MIGRATE)
    )
  end

  local char_db = _G.IonCDB
  local profile = legion:get_profile(profile_name)

  char_db = legion:migrate_dualspec(spec_1_id, spec_2_id, num_specs, char_db)

  _G.IonCDB = char_db
  profile.IonCDB = char_db

  print("Success! Log on to the next character or if you're done remove " ..
        "this addon and put the real Ion back on.")
end

function legion:is_valid_spec_id(id, num_specs)
  return id and id > 0 and id <= num_specs
end

function legion:get_profile()
  local char_name = UnitName("player")
  local realm_name = GetRealmName()
  local char_and_realm_name = string.format("%s - %s", char_name, realm_name)

  local profile_key = _G.IonProfilesDB.profileKeys[char_and_realm_name]
  local profile = _G.IonProfilesDB.profiles[profile_key]

  return profile
end
