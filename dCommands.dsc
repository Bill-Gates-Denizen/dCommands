#####################################################################
#|                                                                 |#
#|                            dCommands                            |#
#|                                                                 |#
#|        A script that adds highly customizable commands.         |#
#|                                                                 |#
#####################################################################
#|                                                                 |#
#|     Author: Bill Gates               Denizen Build: REL1779     |#
#|     Date: 2022/11/02                 Script Version: 1.01       |#
#|                                                                 |#
#####################################################################
#
# ---------------------------- CONFIG START ---------------------------

dcommands_config:
    type: data

    ## DON'T CHANGE DATA NAMES, ONLY THEIR VALUES!

    ## FOR SPECIAL CHARACTERS LIKE [] OR <>, USE THEIR RESPECTIVE TAGS

    ## ALL COLOR INPUTS NEED TO BE A VALID COLORTAG! If invalid, they'll default to white.

    server:
        # Name of your server here. Use <empty> to not have one.
        name: dCommands

        # This will appear before the name of your server. Use <empty> to not have one.
        prefix: <&lb>

        # This will appear after the name of your server. Use <empty> to not have one.
        suffix: <&rb>

        # This will be the color of your server's name.
        color: <blue>

    # This is the color that global messages will have.
    # So far, all commands that use this color are /save, /restart and /clearchat.
    global_message_color: <red>

    private:
        # This is the color that private messages will have.
        message: <aqua>

        # These are the colors that player names will have in private messages. Their names are self-explanatory.
        sender: <blue>
        receiver: <dark_aqua>

    ban:
        # This is the color ban messages will have.
        message:
            # These are the messages that'll be shown when kicking a banned player from the server.
            perma: You're permanently banned from this server!

            temp:
                header: You're temporarily banned from this server!

                # The duration of the player's ban is automatically added after your footer message.
                ## Don't try to input the duration yourself, it WILL break.
                footer: Your ban lasts until<&co>

            # You can use <empty> here. If you do, it'll use the same color as the server color.
            color: <dark_red>

        # This is the color ban reasons and durations will have.
        value: <gray>

        # - These colors will also be used when preventing a banned user from joining the server!

    unban:
        # This is the color that the unban announcement message will have.
        message: <aqua>

        # OPTIONAL: This is the color the unbanned player's name will have.
        # You can use <empty> to default to the message's color.
        player: <dark_aqua>

    # These are the colors for the command /dcommands, which lists all available dCommands.
    dcommands:
        header:
            # This will be the text before the list of commands.
            # Be careful with what you put in here, and remember to always use symbols' respective tags.
            text: All available dCommands<&co>
            # This is the color of the header text.
            color: <dark_aqua>

        # This is the color that commands will have. If invalid, will defualt to the header color.
        commands: <dark_aqua>

        separator:
            # This is the symbol that'll appear before a command.
            # Be careful with what you put in here, and remember to always use symbols' respective tags.
            symbol: →

            # This is the color that the symbol will use.
            color: <blue>

        # Will narrate a separate list containing all disabled dCommands if the player is opped.
        show_disabled_dcommands: true

    # These are the configurations for the /heal command.
    heal:
        message:
            # Message sent to you, when you heal yourself.
            self: You healed yourself!

            another:
                # Message sent to the player you healed.
                theirs: You've been healed by a higher power!
                # Message sent to yourself after healing someone else. The next word will be the player's name.
                # This would mean that a 'You just healed' input, would actually produce 'You just healed PoopSlayer69!'
                yours: You just healed

            # This is the color that the messages above will be.
            color: <aqua>

        # This is the color that /heal's numbers will have.
        numbers: <dark_aqua>

        separator:
            # This will appear in between the old health and the new health.
            # Example: 10 → 20
            symbol: →

            # You can use <empty> here. If you do, it'll use the same color as the message color.
            color: <aqua>

    # These are the configuration for the /feed command.
    feed:
        message:
            # Message sent to you, when you feed yourself.
            self: You fed yourself!
            # Message sent to the player you fed.
            another: You've been fed by a higher power!
        # This is the color the messages above will use.
        color: <aqua>

    # For more advanced users:
    # Every script has it's own usage and description data args, they're used whenever you use the commands wrong
    # So if you want to change the messages that are shown there, edit them to whatever you want.
    # If you're feeling extra smart today, L944 has the injectable tasks that take care of that.
    # Please don't change anything after this config section if you're not 200% sure of what you are doing, as changes may create conflicts with other commands or the entire script.

# ---------------------------- CONFIG END ----------------------------
# ----------------- DONT TOUCH FILE AFTER THIS POINT -----------------

dcommands_save:
    type: command
    name: save
    description: Saves denizen files and world files.
    usage: /save
    permission: dcommands.save
    data:
        arguments:
            single: true
    debug: false
    script:
    - inject dcommands_inject_arguments
    - inject dcommands_server_definitions
    - announce "<[server.prefix]><&color[<[server.color]>]><[server.name]><&r><[server.suffix]><&color[<[global_message_color]>]> Saving world files.."
    - announce to_console "<&ss>bSaving world files.."
    - foreach <server.worlds> as:world:
        - wait 0.01s
        - adjust <[world]> save
    - adjust server save
    - announce "<[server.prefix]><&color[<[server.color]>]><[server.name]><&r><[server.suffix]><&color[<[global_message_color]>]> World files saved."
    - announce to_console "<&ss>bWorld files saved."


dcommands_restart:
    type: command
    name: restart
    description: Restarts the server after given DurationTag input. If no DurationTag is given, defaults to 30 seconds.
    usage: /restart (DurationTag)
    permission: dcommands.restart
    tab completions:
        1: <list>
    data:
        arguments:
            minimum: 0
            maximum: 1
    debug: false
    script:
    - inject dcommands_inject_arguments
    - if <server.has_flag[restarting]>:
        - narrate "<&[error]>Server is already restarting!"
        - stop
    - flag server restarting
    - inject dcommands_server_definitions
    - if <context.args.is_empty>:
        - announce "<[server.prefix]><&color[<[server.color]>]><[server.name]><&r><[server.suffix]><&color[<[global_message_color]>]> Restarting server in 30 seconds."
        - announce to_console "<&ss>4Restarting server in 30 seconds."
        - wait 20s
        - announce "<[server.prefix]><&color[<[server.color]>]><[server.name]><&r><[server.suffix]><&color[<[global_message_color]>]> Restarting server in 10 seconds."
        - announce to_console "<&ss>4Restarting server in 10 seconds."
        - wait 5s
        - announce "<[server.prefix]><&color[<[server.color]>]><[server.name]><&r><[server.suffix]><&color[<[global_message_color]>]> Restarting server in 5 seconds."
        - announce to_console "<&ss>4Restarting server in 5 seconds."
        - wait 5s
        - adjust server restart
        - stop
    - define duration <duration[<context.args.first>].if_null[null]>
    - if <[duration]> == null:
        - narrate "<&[error]>Not a valid DurationTag! Examples of valid DurationTags:"
        - narrate "<&[error]>15s, 15m, 15h."
        - stop
    - repeat 20:
        - announce "<[server.prefix]><&color[<[server.color]>]><[server.name]><&r><[server.suffix]><&color[<[global_message_color]>]> Restarting server in <[duration].formatted_words>."
        - announce to_console "<&ss>4Restarting server in <[duration].formatted_words>."
        - define duration <[duration].in_seconds.div[2]>
        - if <[duration]> > 10:
            - define duration <[duration].round_up_to_precision[10]>
        - else:
            - define duration <[duration].round_up_to_precision[0.1]>
        - if <[duration]> <= 1:
            - wait 1s
            - announce "<[server.prefix]><&color[<[server.color]>]><[server.name]><&r><[server.suffix]><&color[<[global_message_color]>]> Restarting server."
            - announce to_console "<&ss>4Restarting server."
            - wait 1s
            - adjust server restart
            - stop
        - define duration <duration[<[duration]>]>
        - wait <[duration]>


dcommands_enchant:
    type: command
    name: enchant
    description: Enchants the item in your hand up to level 255, or removes enchantments from it.
    usage: /enchant [enchantment] (level / remove)
    permission: dcommands.enchant
    tab completions:
        1: <server.enchantments.parse[name]>
        2: remove
    data:
        arguments:
            minimum: 1
            maximum: 2
    debug: false
    script:
    - inject dcommands_inject_arguments
    - define enchantraw <context.args.first>
    - define enchant <enchantment[<[enchantraw]>].if_null[null]>
    - if <[enchant]> == null:
        - narrate "<&[error]>This enchantment does not exist!"
        - stop
    - define arg <context.args.get[2].if_null[1]>
    - if <[arg].is_integer>:
        - narrate "<&[emphasis]>Enchanting <player.item_in_hand.material.translated_name> with <[enchant].full_name[<[arg]>].strip_color>."
        - inventory adjust slot:hand enchantments:<[enchantraw]>,<[arg]>
    - else:
        - if <[arg]> == remove:
            - define level <player.item_in_hand.enchantment_map.deep_get[<[enchantraw]>]>
            - inventory adjust slot:hand remove_enchantments:<[enchantraw]>
            - narrate "<&[emphasis]>Removed <[enchant].full_name[<[level]>].strip_color> from <player.item_in_hand.material.translated_name>."
        - else:
            - narrate "<&[error]>Incorrect usage!"
            - narrate <&[error]><script.data_key[usage]>
            - stop


dcommands_ban_handler:
    type: world
    debug: false
    events:
        on player prelogin flagged:banned:
        - determine kicked+<proc[ban_handler_proc].context[<player>]>

dcommands_ban_proc:
    type: procedure
    definitions: player
    debug: false
    script:
    - define reason <[player].flag[banned.reason]>
    - inject dcommands_server_definitions
    - inject dcommands_ban_definitions
    - if <[player].has_flag[banned.duration]>:
        - define duration <[player].flag[banned.duration]>
        - determine "<[server.prefix]><&color[<[server.color]>]><[server.name]><&r><[server.suffix]><&nl><&color[<[ban.message.color]>]><[ban.message.temp.header]><&nl><&nl><&color[<[ban.message.color]>]>Reason: <&color[<[ban.value]>]><[reason]><&nl><&color[<[ban.message.color]>]><[ban.message.temp.footer]> <&color[<[ban.value]>]><[duration].formatted_words>"
    - else:
        - determine "<[server.prefix]><&color[<[server.color]>]><[server.name]><&r><[server.suffix]><&nl><&color[<[ban.message.color]>]><[ban.message.perma]><&nl><&nl><&color[<[ban.message.color]>]>Reason: <&color[<[ban.value]>]><[reason]>"

dcommands_ban:
    type: command
    name: ban
    description: Bans someone.
    usage: /ban [name] [reason]
    permission: dcommands.ban
    tab completions:
        1: <server.online_players.parse[name]>
    data:
        arguments:
            minimum: 2
            maximum: 999
    debug: false
    script:
    - inject dcommands_inject_arguments
    - inject dcommands_inject_player
    - if <[player]> == <player>:
        - narrate "<&[error]>You cannot ban yourself!"
        - stop
    - if <[player].has_flag[banned]>:
        - narrate "<&[error]>This player is already banned!"
        - stop
    - inject dcommands_server_definitions
    - inject dcommands_ban_definitions
    - define reason <context.raw_args.after[<[name]>].substring[2]>
    - announce "<[server.prefix]><&color[<[server.color]>]><[server.name]><&r><[server.suffix]> <&color[<[ban.message.color]>]>Player <[name]> has been permanently banned for <&dq><&color[<[ban.value]>]><[reason]><&color[<[ban.message.color]>]><&dq>."
    - announce to_console "<&ss>4<player.name> has  permanently banned <[name]> for <&dq><[reason]><&dq>."
    - flag <[player]> banned.reason:<[reason]>
    - kick <[player]> reason:<proc[ban_handler_proc].context[<player>]>

dcommands_ban_definitions:
    type: task
    debug: false
    script:
    - define ban.message.perma <server.flag[dcommands.ban.message.perma]>
    - define ban.message.temp.header <server.flag[dcommands.ban.message.temp.header]>
    - define ban.message.temp.footer <server.flag[dcommands.ban.message.temp.footer]>
    - define ban.message.color <server.flag[dcommands.ban.message.color]>
    - define ban.value <server.flag[dcommands.ban.value]>

dcommands_tempban:
    type: command
    name: tempban
    description: Bans someone temporarily.
    usage: /tempban [name] [duration] [reason]
    permission: dcommands.tempban
    tab completions:
        1: <server.online_players.parse[name]>
    data:
        arguments:
            minimum: 3
            maximum: 999
    debug: false
    script:
    - inject dcommands_inject_arguments
    - inject dcommands_inject_player
    - if <[player]> == <player>:
        - narrate "<&[error]>You cannot ban yourself!"
        - stop
    - define duration <context.args.get[2]>
    - if <duration[<[duration]>].exists>:
        - if <[player].has_flag[banned]>:
            - narrate "<&[error]>This player is already banned!"
            - stop
        - inject dcommands_server_definitions
        - inject dcommands_ban_definitions
        - define reason <context.raw_args.after[<[duration]>].substring[2]>
        - define duration <duration[<[duration]>]>
        - announce "<[server.prefix]><&color[<[server.color]>]><[server.name]><&r><[server.suffix]> <&color[<[ban.message.color]>]>Player <[name]> has been temporarily banned for <&color[<[ban.value]>]><[duration].formatted_words><&color[<[ban.message.color]>]>, for <&dq><&color[<[ban.value]>]><[reason]><&color[<[ban.message.color]>]><&dq>."
        - announce to_console "<&ss>4<player.name> has  temporarily banned <[name]> for <[duration].formatted_words>, for <&dq><[reason]><&dq>."
        - flag <[player]> banned.reason:<[reason]> expire:<[duration]>
        - flag <[player]> banned.duration:<[duration]> expire:<[duration]>
        - kick <[player]> reason:<proc[ban_handler_proc].context[<player>]>
    - else:
        - narrate "<&[error]>Invalid duration! Examples of valid durations:"
        - narrate "<&[error]>1d, 5m, 30s"


dcommands_unban:
    type: command
    name: unban
    description: Does something
    usage: /unban [name]
    permission: dcommands.unban
    tab completions:
        1: <server.online_players.parse[name]>
    data:
        arguments:
            minimum: 1
            maximum: 1
    debug: false
    script:
    - inject dcommands_inject_arguments
    - inject dcommands_inject_player
    - if <[player].has_flag[banned]>:
        - flag <[player]> banned:!
        - inject dcommands_server_definitions
        - define unban.message <server.flag[dcommands.unban.message]>
        - define unban.player <server.flag[dcommands.unban.player]>
        - announce "<[server.prefix]><&color[<[server.color]>]><[server.name]><&r><[server.suffix]> <&color[<[unban.player]>]><[player].name> <&color[<[unban.message]>]>has been unbanned!"
        - announce to_console "<&ss>b<player.name> has unbanned <[player].name>."
    - else:
        - narrate "<&[error]>This player is not banned!"


dcommands_invsee:
    type: command
    name: invsee
    description: Looks at the desired player's inventory. Works with offline players.
    usage: /invsee [name]
    permission: dcommands.invsee
    tab completions:
        1: <server.online_players.parse[name]>
    data:
        arguments:
            minimum: 1
            maximum: 1
    debug: false
    script:
    - inject dcommands_inject_arguments
    - inject dcommands_inject_player
    - if <[player]> == <player>:
        - inventory open d:<player.inventory>
        - stop
    - narrate "<&[warning]>Opening <[player].name>'s inventory.."
    - inventory open d:<[player].inventory>


dcommands_enderchest:
    type: command
    name: enderchest
    description: Opens someone's enderchest. If no name given, opens yours. Works with offline players.
    usage: /enderchest (name)
    permission: dcommands.enderchest
    aliases:
    - ec
    - echest
    tab completions:
        1: <server.online_players.parse[name]>
    data:
        arguments:
            minimum: 0
            maximum: 1
    debug: false
    script:
    - inject dcommands_inject_arguments
    - if <context.args.is_empty>:
        - inventory open d:<player.enderchest>
        - stop
    - inject dcommands_inject_player
    - if <[player]> == <player>:
        - inventory open d:<player.enderchest>
        - stop
    - narrate "<&[warning]>Opening <[player].name>'s enderchest.."
    - inventory open d:<[player].enderchest>


dcommands_private:
    type: command
    name: tell
    description: Sends private messages to another player.
    usage: /tell [player] [message]
    permission: dcommands.tell
    aliases:
    - msg
    - message
    tab completions:
        1: <server.online_players.parse[name]>
    data:
        arguments:
            minimum: 2
    debug: false
    script:
    - if <context.args.size> < <script.data_key[data.arguments.minimum]>:
        - narrate "<&[error]>You can't send an empty message!"
        - narrate <&[error]><script.data_key[usage]>
        - stop
    - inject dcommands_inject_player
    - define receiver <[player]>
    - define sender <player>
    - if <[sender]> == <[receiver]>:
        - narrate "<&[error]>You can't send messages to yourself!"
        - stop
    - define message <context.raw_args.after[<[name]>]>
    - flag <[sender]> dcommands.private.last:<[receiver]>
    - flag <[receiver]> dcommands.private.last:<[sender]>
    - define private.message <server.flag[dcommands.private.message]>
    - define private.sender <server.flag[dcommands.private.sender]>
    - define private.receiver <server.flag[dcommands.private.receiver]>
    - narrate "<&7>[<&color[<[private.sender]>]><[sender].name> <&7>⇒ <&color[<[private.receiver]>]>You<&7>]<&color[<[private.message]>]><[message]>" targets:<[receiver]>
    - narrate "<&7>[<&color[<[private.receiver]>]>You <&7>⇒ <&color[<[private.sender]>]><[receiver].name><&7>]<&color[<[private.message]>]><[message]>" targets:<[sender]>
    - announce to_console "<&ss>3<[sender].name> <&ss>7-<&gt> <&ss>3<[receiver].name><&ss>7:<&ss>b<[message]>"

dcommands_private_reply:
    type: command
    name: r
    description: Replies to the latest message received.
    usage: /r [message]
    permission: dcommands.reply
    tab completions:
        1: <list>
    debug: false
    script:
    - if !<player.has_flag[dcommands.private.last]>:
        - narrate "<&[error]>You don't have anyone to reply!"
        - stop
    - define receiver <player.flag[dcommands.private.last]>
    - define sender <player>
    - if !<[receiver].is_online>:
        - narrate "<&[error]>The last player to message you isn't online anymore!"
        - stop
    - if <context.args.is_empty>:
        - narrate "<&[error]>Your message cannot be empty!"
        - stop
    - define message <context.raw_args>
    - flag <[sender]> dcommands.private.last:<[receiver]>
    - flag <[receiver]> dcommands.private.last:<[sender]>
    - define private.message <server.flag[dcommands.private.message]>
    - define private.sender <server.flag[dcommands.private.sender]>
    - define private.receiver <server.flag[dcommands.private.receiver]>
    - narrate "<&7>[<&color[<[private.sender]>]><[sender].name> <&7>⇒ <&color[<[private.receiver]>]>You<&7>]<&color[<[private.message]>]> <[message]>" targets:<[receiver]>
    - narrate "<&7>[<&color[<[private.receiver]>]>You <&7>⇒ <&color[<[private.sender]>]><[receiver].name><&7>]<&color[<[private.message]>]> <[message]>" targets:<[sender]>
    - announce to_console "<&ss>3<[sender].name> <&ss>7-<&gt> <&ss>3<[receiver].name><&ss>7:<&ss>b <[message]>"

dcommands_reply_cleaner:
    type: world
    debug: false
    events:
        on player quits:
        - flag <player> dcommands.private.last:!


dcommands_clearchat:
    type: command
    name: clearchat
    description: Does something
    usage: /clearchat
    permission: dcommands.clearchat
    tab completions:
        1: <list>
    data:
        arguments:
            single: true
    debug: false
    script:
    - inject dcommands_inject_arguments
    - repeat 10:
        - announce <&nl><&nl><&nl><&nl><&nl><&nl><&nl><&nl><&nl><&nl><&nl><&nl><&nl><&nl><&nl><&nl><&nl><&nl><&nl><&nl><&nl><&nl><&nl>
    - inject dcommands_server_definitions
    - announce "<[server.prefix]><&color[<[server.color]>]><[server.name]><&r><[server.suffix]><&color[<[global_message_color]>]> Chat was cleared."
    - announce to_console "<&ss>bChat was cleared by <player.name>."


dcommands_dcommands:
    type: command
    name: dcommands
    description: Lists all available dCommands.
    usage: /dcommands
    permission: dcommands.dcommands
    tab completions:
        1: <list>
    data:
        arguments:
            single: true
    debug: false
    script:
    - inject dcommands_inject_arguments
    - define commands <util.scripts.filter[container_type.equals[COMMAND]]>
    - define path <script.relative_filename>
    - define dcommands.disabled <[commands].filter[data_key[enabled].equals[false]]>
    - define dcommands.raw <[commands].filter[relative_filename.equals[<[path]>]].exclude[<[dcommands.disabled]>]>
    - define dcommands.name <[dcommands.raw].parse[data_key[name]]>
    - define dcommands.header.text <server.flag[dcommands.dcommands.header.text]>
    - define dcommands.header.color <server.flag[dcommands.dcommands.header.color]>
    - define dcommands.separator.symbol <server.flag[dcommands.dcommands.separator.symbol]>
    - define dcommands.separator.color <server.flag[dcommands.dcommands.separator.color]>
    - define dcommands.commands <server.flag[dcommands.dcommands.commands]>
    - narrate <&color[<[dcommands.header.color]>]><[dcommands.header.text]>
    - narrate "<&color[<[dcommands.separator.color]>]><[dcommands.separator.symbol]> <&color[<[dcommands.commands]>]><[dcommands.name].alphabetical.separated_by[<&nl><&color[<[dcommands.separator.color]>]><[dcommands.separator.symbol]> <&color[<[dcommands.commands]>]>]>"
    - if <player.is_op>:
        - if <script[dcommands_config].data_key[dcommands.show_disabled_dcommands]>:
            - if <[dcommands.disabled].is_empty>:
                - stop
            - narrate "<&7>Disabled dCommands:"
            - narrate "<&8><[dcommands.separator.symbol]> <&7><[dcommands.disabled].parse[data_key[name]].alphabetical.separated_by[<&nl><&8><[dcommands.separator.symbol]> <&7>]>"

dcommands_load_definitions:
    type: world
    debug: false
    events:
        after scripts loaded:
        - flag server restarting:!
        - flag server dcommands:!
        - flag server dcommands.server.prefix:<script[dcommands_config].data_key[server.prefix].parsed>
        - flag server dcommands.server.suffix:<script[dcommands_config].data_key[server.suffix].parsed>
        - flag server dcommands.server.name:<script[dcommands_config].data_key[server.name].parsed>
        - flag server dcommands.server.color:<color[<script[dcommands_config].data_key[server.color].parsed>].if_null[<color[white]>]>
        - flag server dcommands.global_message_color:<color[<script[dcommands_config].data_key[global_message_color].parsed>].if_null[<color[white]>]>
        - flag server dcommands.ban.message.perma:<script[dcommands_config].data_key[ban.message.perma].parsed>
        - flag server dcommands.ban.message.temp.header:<script[dcommands_config].data_key[ban.message.temp.header].parsed>
        - flag server dcommands.ban.message.temp.footer:<script[dcommands_config].data_key[ban.message.temp.footer].parsed>
        - flag server dcommands.ban.message.color:<color[<script[dcommands_config].data_key[ban.message.color].parsed>].if_null[<server.flag[dcommands.server.color]>]>
        - flag server dcommands.ban.value:<color[<script[dcommands_config].data_key[ban.value].parsed>].if_null[<color[white]>]>
        - flag server dcommands.unban.message:<color[<script[dcommands_config].data_key[unban.message].parsed>].if_null[<color[white]>]>
        - flag server dcommands.unban.player:<color[<script[dcommands_config].data_key[unban.player].parsed>].if_null[<color[<server.flag[dcommands.unban.message]>]>]>
        - flag server dcommands.private.message:<color[<script[dcommands_config].data_key[private.message].parsed>].if_null[<color[white]>]>
        - flag server dcommands.private.sender:<color[<script[dcommands_config].data_key[private.sender].parsed>].if_null[<color[white]>]>
        - flag server dcommands.private.receiver:<color[<script[dcommands_config].data_key[private.receiver].parsed>].if_null[<color[white]>]>
        - wait 0.01s
        - flag server dcommands.dcommands.header.text:<script[dcommands_config].data_key[dcommands.header.text].parsed>
        - flag server dcommands.dcommands.header.color:<color[<script[dcommands_config].data_key[dcommands.header.color].parsed>].if_null[<color[white]>]>
        - flag server dcommands.dcommands.separator.symbol:<script[dcommands_config].data_key[dcommands.separator.symbol].parsed>
        - flag server dcommands.dcommands.separator.color:<color[<script[dcommands_config].data_key[dcommands.separator.color].parsed>].if_null[<color[white]>]>
        - flag server dcommands.dcommands.commands:<color[<script[dcommands_config].data_key[dcommands.commands].parsed>].if_null[<server.flag[dcommands.dcommands.header.color]>]>
        - flag server dcommands.heal.message.self:<script[dcommands_config].data_key[heal.message.self].parsed>
        - flag server dcommands.heal.message.another.theirs:<script[dcommands_config].data_key[heal.message.another.theirs].parsed>
        - flag server dcommands.heal.message.another.yours:<script[dcommands_config].data_key[heal.message.another.yours].parsed>
        - flag server dcommands.heal.message.color:<color[<script[dcommands_config].data_key[heal.message.color].parsed>].if_null[<color[white]>]>
        - flag server dcommands.heal.numbers:<color[<script[dcommands_config].data_key[heal.numbers].parsed>].if_null[<color[white]>]>
        - flag server dcommands.heal.separator.symbol:<script[dcommands_config].data_key[heal.separator.symbol].parsed>
        - flag server dcommands.heal.separator.color:<color[<script[dcommands_config].data_key[heal.separator.color].parsed>].if_null[<server.flag[dcommands.heal.message.color]>]>
        - flag server dcommands.feed.color:<color[<script[dcommands_config].data_key[feed.color].parsed>].if_null[<color[white]>]>
        - flag server dcommands.feed.message.self:<script[dcommands_config].data_key[feed.message.self].parsed>
        - flag server dcommands.feed.message.another:<script[dcommands_config].data_key[feed.message.another].parsed>

dcommands_server_definitions:
    type: task
    debug: false
    script:
    - define server.prefix <server.flag[dcommands.server.prefix]>
    - define server.suffix <server.flag[dcommands.server.suffix]>
    - define server.name <server.flag[dcommands.server.name]>
    - define server.color <server.flag[dcommands.server.color]>
    - define global_message_color <server.flag[dcommands.global_message_color]>

dcommands_gmc:
    type: command
    name: gmc
    description: Creative mode.
    usage: /gmc (player)
    permission: dcommands.gmc
    tab completions:
        1: <server.online_players.parse[name]>
    data:
        arguments:
            minimum: 0
            maximum: 1
    debug: false
    script:
    - inject dcommands_inject_arguments
    - if <context.args.is_empty>:
        - if <player.gamemode> == creative:
            - stop
        - else:
            - adjust <player> gamemode:creative
            - narrate "<&[warning]>Gamemode set to creative."
        - stop
    - inject dcommands_inject_player
    - if <[player]> == <player>:
        - adjust <player> gamemode:creative
        - narrate "<&[warning]>Gamemode set to creative."
        - stop
    - if <[player].gamemode> == creative:
        - stop
    - else:
        - adjust <[player]> gamemode:creative
        - narrate "<&[warning]>Set <[player].name>'s gamemode to creative."
        - narrate "<&[warning]>Gamemode set to creative by an admin." targets:<[player]>

dcommands_gms:
    type: command
    name: gms
    description: Survival mode.
    usage: /gms (player)
    permission: dcommands.gms
    tab completions:
        1: <server.online_players.parse[name]>
    data:
        arguments:
            minimum: 0
            maximum: 1
    debug: false
    script:
    - inject dcommands_inject_arguments
    - if <context.args.is_empty>:
        - if <player.gamemode> == survival:
            - stop
        - else:
            - adjust <player> gamemode:survival
            - narrate "<&[warning]>Gamemode set to survival."
        - stop
    - inject dcommands_inject_player
    - if <[player]> == <player>:
        - adjust <player> gamemode:survival
        - narrate "<&[warning]>Gamemode set to survival."
        - stop
    - if <[player].gamemode> == survival:
        - stop
    - else:
        - adjust <[player]> gamemode:survival
        - narrate "<&[warning]>Set <[player].name>'s gamemode to survival."
        - narrate "<&[warning]>Gamemode set to survival by an admin." targets:<[player]>

dcommands_gmsp:
    type: command
    name: gmsp
    description: Spectator mode.
    usage: /gmsp (player)
    permission: dcommands.gmsp
    tab completions:
        1: <server.online_players.parse[name]>
    data:
        arguments:
            minimum: 0
            maximum: 1
    debug: false
    script:
    - inject dcommands_inject_arguments
    - if <context.args.is_empty>:
        - if <player.gamemode> == spectator:
            - stop
        - else:
            - adjust <player> gamemode:spectator
            - narrate "<&[warning]>Gamemode set to spectator."
        - stop
    - inject dcommands_inject_player
    - if <[player]> == <player>:
        - adjust <player> gamemode:spectator
        - narrate "<&[warning]>Gamemode set to spectator."
        - stop
    - if <[player].gamemode> == spectator:
        - stop
    - else:
        - adjust <[player]> gamemode:spectator
        - narrate "<&[warning]>Set <[player].name>'s gamemode to spectator."
        - narrate "<&[warning]>Gamemode set to spectator by an admin." targets:<[player]>

dcommands_gma:
    type: command
    name: gma
    description: Adventure mode.
    usage: /gma (player)
    permission: dcommands.gma
    tab completions:
        1: <server.online_players.parse[name]>
    data:
        arguments:
            minimum: 0
            maximum: 1
    debug: false
    script:
    - inject dcommands_inject_arguments
    - if <context.args.is_empty>:
        - if <player.gamemode> == adventure:
            - stop
        - else:
            - adjust <player> gamemode:adventure
            - narrate "<&[warning]>Gamemode set to adventure."
        - stop
    - inject dcommands_inject_player
    - if <[player]> == <player>:
        - adjust <player> gamemode:adventure
        - narrate "<&[warning]>Gamemode set to adventure."
        - stop
    - if <[player].gamemode> == adventure:
        - stop
    - else:
        - adjust <[player]> gamemode:adventure
        - narrate "<&[warning]>Set <[player].name>'s gamemode to adventure."
        - narrate "<&[warning]>Gamemode set to adventure by an admin." targets:<[player]>

dcommands_heal:
    type: command
    name: heal
    description: Heals yourself or another player.
    usage: /heal (player)
    permission: dcommands.heal
    tab completions:
        1: <server.online_players.parse[name]>
    data:
        arguments:
            minimum: 0
            maximum: 1
    debug: false
    script:
    - inject dcommands_inject_arguments
    - define heal.message.self <server.flag[dcommands.heal.message.self]>
    - define heal.message.color <server.flag[dcommands.heal.message.color]>
    - define heal.numbers <server.flag[dcommands.heal.numbers]>
    - define heal.separator.symbol <server.flag[dcommands.heal.separator.symbol]>
    - define heal.separator.color <server.flag[dcommands.heal.separator.color]>
    - if <context.args.is_empty>:
        - define health <player.health.round_to_precision[0.5]>
        - define maxhealth <player.health_max>
        - adjust <player> fire_time:1t
        - heal <player>
        - narrate <&color[<[heal.message.color]>]><[heal.message.self]>
        - narrate "<&color[<[heal.numbers]>]><[health]> <&color[<[heal.separator.color]>]><[heal.separator.symbol]> <&color[<[heal.numbers]>]><[maxhealth]>"
        - stop
    - inject dcommands_inject_player
    - if <[player]> == <player>:
        - define health <player.health.round_to_precision[0.5]>
        - define maxhealth <player.health_max>
        - adjust <player> fire_time:1t
        - heal <player>
        - narrate <&color[<[heal.message.color]>]><[heal.message.self]>
        - narrate "<&color[<[heal.numbers]>]><[health]> <&color[<[heal.separator.color]>]><[heal.separator.symbol]> <&color[<[heal.numbers]>]><[maxhealth]>"
        - stop
    - else:
        - define heal.message.another.theirs <server.flag[dcommands.heal.message.another.theirs]>
        - define heal.message.another.yours <server.flag[dcommands.heal.message.another.yours]>
        - define health <[player].health.round_to_precision[0.5]>
        - define maxhealth <[player].health_max>
        - heal <[player]>
        - adjust <[player]> fire_time:1t
        - narrate "<&color[<[heal.message.color]>]><[heal.message.another.yours]> <[player].name>!"
        - narrate <&color[<[heal.message.color]>]><[heal.message.another.theirs]> targets:<[player]>
        - narrate "<&color[<[heal.numbers]>]><[health]> <&color[<[heal.separator.color]>]><[heal.separator.symbol]> <&color[<[heal.numbers]>]><[maxhealth]>"


dcommands_feed:
    type: command
    name: feed
    description: Feeds yourself or another player.
    usage: /feed (player)
    permission: dcommands.feed
    tab completions:
        1: <server.online_players.parse[name]>
    data:
        arguments:
            minimum: 0
            maximum: 1
    debug: false
    script:
    - inject dcommands_inject_arguments
    - define feed.color <server.flag[dcommands.feed.color]>
    - define feed.message.self <server.flag[dcommands.feed.message.self]>
    - define feed.message.another <server.flag[dcommands.feed.message.another]>
    - if <context.args.is_empty>:
        - feed <player>
        - narrate <&color[<[feed.color]>]><[feed.message.self]>
        - stop
    - inject dcommands_inject_player
    - if <[player]> == <player>:
        - feed <player>
        - narrate <&color[<[feed.color]>]><[feed.message.self]>
        - stop
    - else:
        - feed <[player]>
        - narrate <&color[<[feed.color]>]><[feed.message.another]> targets:<[player]>


dcommands_vanish:
    type: command
    name: vanish
    description: Makes yourself invisible and invulnerable.
    usage: /vanish | invis | v
    permission: dcommands.vanish
    aliases:
    - invis
    - v
    tab completions:
        1: <list>
    data:
        arguments:
            single: true
    debug: false
    script:
    - inject dcommands_inject_arguments
    - if <player.visible>:
        - narrate "<&[warning]>You are now vanished."
        - adjust <player> visible:false
        - adjust <player> invulnerable:true
    - else:
        - narrate "<&[warning]>You are no longer vanished."
        - adjust <player> visible:true
        - adjust <player> invulnerable:false


dcommands_fly:
    type: command
    name: fly
    description: Allows the user to fly, even in survival mode.
    usage: /fly
    permission: dcommands.fly
    tab completions:
        1: <list>
    data:
        arguments:
            single: true
    debug: false
    script:
    - inject dcommands_inject_arguments
    - if !<player.can_fly>:
        - narrate "<&[warning]>Fly mode turned on, at speed <player.fly_speed.mul[10]>."
        - adjust <player> can_fly:true
    - else:
        - narrate "<&[warning]>Fly mode turned off."
        - adjust <player> can_fly:false


dcommands_inject_arguments:
    type: task
    debug: false
    script:
    - define minarg <queue.script.data_key[data.arguments.minimum].if_null[null]>
    - define maxarg <queue.script.data_key[data.arguments.maximum].if_null[null]>
    - define single <queue.script.data_key[data.arguments.single].if_null[null]>
    - if <[single]> != null:
        - if !<context.args.is_empty>:
            - narrate "<&[error]>Incorrect usage!"
            - inject dcommands_inject_message
            - stop
    - else:
        - if <context.args.size> < <[minarg]>:
            - narrate "<&[error]>Not enough arguments! Correct usage:"
            - inject dcommands_inject_message
            - stop
        - if <context.args.size> > <[maxarg]>:
            - narrate "<&[error]>Too many arguments! Correct usage:"
            - inject dcommands_inject_message
            - stop

dcommands_inject_message:
    type: task
    debug: false
    script:
    - narrate <&[error]><queue.script.data_key[usage].if_null[null]>
    - narrate <&[base]><queue.script.data_key[description].parsed.if_null[null]>
    - define message <queue.script.data_key[data.arguments.message].if_null[null]>
    - if <[message]> != null:
        - narrate <&[emphasis]><[message].parsed>

dcommands_inject_player:
    type: task
    debug: false
    script:
    - define name <context.args.first>
    - define player <server.match_player[<[name]>].if_null[null]>
    - if ( <[player]> == null ) || ( <[player].name> != <[name]> ):
        - narrate "<&[error]>Player not found!"
        - stop


dcommands_smite:
    type: command
    name: smite
    description: Spawns lightning bolts on whoever you want. Use high quantities at your own risk.
    usage: /smite [player] (quantity) (delay)
    permission: dcommands.smite
    tab completions:
        1: <server.online_players.parse[name]>
    data:
        arguments:
            minimum: 1
            maximum: 3
            message: Delay is given in seconds.
    debug: false
    script:
    - inject dcommands_inject_arguments
    - inject dcommands_inject_player
    - define quantity <context.args.get[2].if_null[1]>
    - if !<[quantity].is_decimal>:
        - narrate "<&[error]>Quantity must be a number!"
        - stop
    - define delay <context.args.get[3].if_null[1]>
    - if !<[delay].is_decimal>:
        - narrate "<&[error]>Delay must be a number!"
        - stop
    - define delay <duration[<[delay]>]>
    - narrate <[quantity]>
    - narrate <[delay]>
    - repeat <[quantity]>:
        - strike <[player].location>
        - wait <[delay]>

dcommands_godmode:
    type: command
    name: godmode
    description: Turns godmode on and off.
    usage: /godmode | god
    aliases:
    - god
    - invulnerable
    permission: dcommands.godmode
    tab completions:
        1: <list>
    data:
        arguments:
            single: true
    debug: false
    script:
    - inject dcommands_inject_arguments
    - if !<player.invulnerable>:
        - narrate "<&[warning]>God mode turned on."
        - adjust <player> invulnerable:true
    - else:
        - narrate "<&[warning]>God mode turned off."
        - adjust <player> invulnerable:false

dcommands_speed:
    type: command
    name: speed
    description: Changes your walking or flying speed. Default speed for both is 1.
    usage: /speed [fly | walk] (speed)
    permission: dcommands.speed
    tab completions:
        1: fly|walk
        2: <list>
    data:
        arguments:
            minimum: 1
            maximum: 2
    debug: false
    script:
    - inject dcommands_inject_arguments
    - choose <context.args.first>:
        - case walk:
            - define type walk_speed
            - define msg Walk
        - case fly:
            - define type fly_speed
            - define msg Flying
        - default:
            - inject dcommands_inject_message
            - stop
    - if <context.args.size> == 1:
        - choose <[msg]>:
            - case Walk:
                - narrate "<&[base]>Your walking speed is set at <&[emphasis]><player.walk_speed><&[base]>!"
            - case fly:
                - narrate "<&[base]>Your walking speed is set at <&[emphasis]><player.fly_speed><&[base]>!"
            - default:
                - narrate "<&[error]>If you saw this message, the author did a fuckie wuckie somewhere! Please contact!"
    - else:
        - define speed <context.args.get[2]>
        - if !<[speed].is_decimal>:
            - narrate "<&[error]>Speed input must be a number!"
            - stop
        - define speed <[speed].round_to_precision[0.1]>
        - narrate "<&[warning]><[msg]> speed changed to <[speed]>"
        - adjust <player> <[type]>:<[speed].div[10]>