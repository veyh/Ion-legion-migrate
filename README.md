# Ion Legion Migrate

This is a very simple addon that will let you migrate your dual spec action bars to Legion.

## Usage

1. Remove Ion and all of its components.
2. Install this addon. (Yes, it's intentionally called `Ion`.)
3. Log on to a character.
4. Use the command `/ionlm <primary spec id> <secondary spec id>`. You can get the spec id by looking at the list of specializations (press N). For example, if your character is a paladin and your primary spec was Retribution (spec 3) and your secondary spec was Holy (spec 1), you type `/ionlm 3 1`.
5. Repeat step 4 for every character.
6. Remove this addon and install SLOKnightfall's updated version of Ion: https://github.com/SLOKnightfall/Ion/archive/Legion.zip

If you don't remember which spec was primary and which was secondary, you can cheat by going to `World of Warcraft\WTF\Account\<account_name>\<realm_name>\<character_name>\SavedVariables` and opening `Ion.lua` in a text editor. Then search for a spell unique to a specialization, such as `Ice Lance`. You might see something like this

```lua
    -- SNIP --

        {
            {
                ["homestate"] = {
                    ["macro_Auto"] = "Slow;",
                    ["macro_Name"] = "",
                    ["actionID"] = false,
                    ["macro_Equip"] = false,
                    ["macro_Icon"] = false,
                    ["macro_Text"] = "#autowrite\n/cast Slow()",
                    ["macro_Note"] = "",
                    ["macro_Watch"] = false,
                    ["macro_UseNote"] = false,
                },
                ["paged2"] = {
                    ["macro_Auto"] = "",
                    ["macro_Name"] = "",
                    ["actionID"] = false,
                    ["macro_Equip"] = false,
                    ["macro_Icon"] = false,
                    ["macro_Text"] = "",
                    ["macro_Note"] = "",
                    ["macro_Watch"] = false,
                    ["macro_UseNote"] = false,
                },
            }, -- [1]
            {
                ["homestate"] = {
                    ["macro_Auto"] = "Ice Lance;",
                    ["macro_Name"] = "",
                    ["actionID"] = false,
                    ["macro_Equip"] = false,
                    ["macro_Icon"] = false,
                    ["macro_Text"] = "#autowrite\n/cast Ice Lance()",
                    ["macro_Note"] = "",
                    ["macro_Watch"] = false,
                    ["macro_UseNote"] = false,
                },
                ["paged2"] = {
                    ["macro_Auto"] = "Cone of Cold;",
                    ["macro_Name"] = "",
                    ["actionID"] = false,
                    ["macro_Equip"] = false,
                    ["macro_Icon"] = false,
                    ["macro_Text"] = "/cast Cone of Cold",
                    ["macro_Note"] = "",
                    ["macro_Watch"] = false,
                    ["macro_UseNote"] = false,
                },
            }, -- [2]
            ["keys"] = {
                {
                    ["hotKeyText"] = ":",
                    ["hotKeyLock"] = false,
                    ["hotKeys"] = ":",
                    ["hotKeyPri"] = false,
                }, -- [1]
                {
                    ["hotKeyText"] = ":",
                    ["hotKeyLock"] = false,
                    ["hotKeys"] = ":",
                    ["hotKeyPri"] = false,
                }, -- [2]
            },
        }, -- [79]
    
    -- SNIP --
```

That's an example from my mage. Notice the `-- [1]` and `-- [2]` at the end of some of those lines? The former refers to the primary spec, which in this case is Arcane, and the latter to the secondary spec (Frost).

