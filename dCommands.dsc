#####################################################################
#|                                                                 |#
#|                            dCommands                            |#
#|                                                                 |#
#|        A script that adds highly customizable commands.         |#
#|                                                                 |#
#####################################################################
#|                                                                 |#
#|     Author: Bill Gates               Denizen Build: REL1780     |#
#|     Date: 2022/11/26                 Script Version: 1.1.2      |#
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

    # These are the messages and colors that'll be broadcasted when using the /save command.
    save:
        saving: Saving world files..
        saved: World files saved.
        color: <&[warning]>

    # These are the messages and colors that'll be broadcasted when using the /restart command.
    restart:
        # The time will be automatically added after the message, don't try to add it yourself!
        message: Restarting server in
        color: <dark_red>
        end: Restarting server.

    enchant:
        # These are specific error messages that will be shown under specific conditions. All of them will share the same color.
        error:
            invalid_enchant: This enchantment does not exist!
            remove_no_permission: You don't have permission to remove enchantments!
            no_enchant: Item doesn't have this enchantment!
            color: <&[error]>
        # This is the color for when an /enchant runs succesfully.
        color: <&[emphasis]>

    private:
        # This is the color that private messages will have.
        message: <aqua>

        # These are the colors that player names will have in private messages. Their names are self-explanatory.
        sender: <blue>
        receiver: <dark_aqua>

        # These are the error messages for the /tell, /msg, and /message commands. They'll share the same color.
        error:
            msg_to_yourself: You can't send messages to yourself!
            empty_message: You can't send an empty message!
            color: <&[error]>
        # These are the error messages for the /r command. They'll share the same color.
        reply:
            no_replies: You don't have anyone to reply to!
            not_online: The last player that messaged you isn't online anymore!
            empty: Your message cannot be empty!
            color: <&[error]>

    clearchat:
        # This is the message that'll be shown after cleaning up chat.
        message: Chat cleared.
        # This is the color that the message will have.
        color: <aqua>

    ban:
        message:
            # These are the messages that'll be shown when kicking a banned player from the server.
            perma: You're permanently banned from this server!

            temp:
                header: You're temporarily banned from this server!

                # The duration of the player's ban is automatically added after your footer message.
                ## Don't try to input the duration yourself, it WILL break.
                footer: Your ban lasts until<&co>

            # This is the color that the messages above will have. If invalid, will default to the server color.
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

    # These are the messages and colors that will be used by the gamemode commands.
    gamemode:
        creative:
            self: Gamemode set to creative.
            another: Gamemode set to creative by an admin.
            color: <&[warning]>
        survival:
            self: Gamemode set to survival.
            another: Gamemode set to survival by an admin.
            color: <&[warning]>
        spectator:
            self: Gamemode set to spectator.
            another: Gamemode set to spectator by an admin.
            color: <&[warning]>
        adventure:
            self: Gamemode set to adventure.
            another: Gamemode set to adventure by an admin.
            color: <&[warning]>

    # These are the colors for the command /dcommands, which lists all available dCommands.
    dcommands:
        header:
            # This will be the text before the list of commands.
            # Be careful with what you put in here, and remember to always use symbols' respective tags.
            text: All available dCommands<&co>
            # This is the color of the header text.
            color: <dark_aqua>

        # This is the color that commands will have. If invalid, will default to the header color.
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

    feed:
        message:
            # Message sent to you, when you feed yourself.
            self: You fed yourself!
            # Message sent to the player you fed.
            another: You've been fed by a higher power!
        # This is the color the messages above will use.
        color: <aqua>

    vanish:
        message:
            # Self-explanatory.
            on: You are now vanished.
            off: You are no longer vanished.
            color: <&[warning]>

    fly:
        message:
            # Speed tag must have .mul[10]! The script works with it's value multiplied by 10 to be more human understandable, changing it would create confusion.
            on: Fly mode turned on, at speed <player.fly_speed.mul[10]>.
            off: Fly mode turned off.
            color: <&[warning]>

    arguments:
        not_enough:
            message: Not enough arguments! Correct usage<&co>
            color: <&[error]>
        too_many:
            message: Too many arguments! Correct usage<&co>
            color: <&[error]>
        command_info:
            usage: <&[warning]>
            description: <&[base]>
            message: <&[emphasis]>

    inject_player:
        message: Player not found!
        color: <&[error]>

    smite:
        warn_target:
            enabled: false
            message: You have been struck!
            color: <&[warning]>

    godmode:
        on:
            message: Godmode turned on.
            color: <&[warning]>
        off:
            message: Godmode turned off.
            color: <&[warning]>

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
    tab completions:
        1: <empty>
    data:
        arguments:
            single: true
    debug: false
    script:
    - define save.saving <script[dcommands_config].parsed_key[save.saving].if_null[Error parsing key!]>
    - define save.saved <script[dcommands_config].parsed_key[save.saved].if_null[Error parsing key!]>
    - define save.color <color[<script[dcommands_config].parsed_key[save.color]>].if_null[<color[white]>]>
    - inject dcommands_inject_arguments
    - inject dcommands_server_definitions
    - announce "<[server.prefix]><&color[<[server.color]>]><[server.name]><&r><[server.suffix]><&color[<[save.color]>]> <[save.saving]>"
    - announce to_console <&color[<[save.color]>]><[save.saving]>
    - foreach <server.worlds> as:world:
        - wait 0.01s
        - adjust <[world]> save
    - adjust server save
    - announce "<[server.prefix]><&color[<[server.color]>]><[server.name]><&r><[server.suffix]><&color[<[save.color]>]> <[save.saved]>"
    - announce to_console <&color[<[save.color]>]><[save.saved]>


dcommands_restart:
    type: command
    name: restart
    description: Restarts the server after given DurationTag input. If no DurationTag is given, defaults to 30 seconds.
    usage: /restart (DurationTag)
    permission: dcommands.restart
    tab completions:
        1: <empty>
    data:
        arguments:
            minimum: 0
            maximum: 1
    debug: false
    script:
    - inject dcommands_inject_arguments
    - if <server.has_flag[dcommands.restarting]>:
        - narrate "<&[error]>Server is already restarting!"
        - stop
    - flag server dcommands.restarting
    - inject dcommands_server_definitions
    - definemap restart:
        message: <script[dcommands_config].parsed_key[restart.message].if_null[Error parsing key!]>
        color: <color[<script[dcommands_config].parsed_key[restart.color]>].if_null[<color[white]>]>
        end: <script[dcommands_config].parsed_key[restart.end].if_null[Error parsing key!]>
    - if <context.args.is_empty>:
        - announce "<[server.prefix]><&color[<[server.color]>]><[server.name]><&r><[server.suffix]><&color[<[restart.color]>]> <[restart.message]> 30 seconds."
        - announce to_console "<&color[<[restart.color]>]><[restart.message]> 30 seconds."
        - wait 20s
        - announce "<[server.prefix]><&color[<[server.color]>]><[server.name]><&r><[server.suffix]><&color[<[restart.color]>]> <[restart.message]> 10 seconds."
        - announce to_console "<&color[<[restart.color]>]><[restart.message]> 10 seconds."
        - wait 5s
        - announce "<[server.prefix]><&color[<[server.color]>]><[server.name]><&r><[server.suffix]><&color[<[restart.color]>]> <[restart.message]> 5 seconds."
        - announce to_console "<&color[<[restart.color]>]><[restart.message]> 5 seconds."
        - wait 4s
        - flag server dcommands.restarting:!
        - wait 1s
        - adjust server restart
        - stop
    - define duration <duration[<context.args.first>].if_null[null]>
    - if <[duration]> == null:
        - narrate "<&[error]>Not a valid DurationTag! Examples of valid DurationTags:"
        - narrate "<&[error]>15s, 15m, 15h."
        - stop
    - repeat 20:
        - announce "<[server.prefix]><&color[<[server.color]>]><[server.name]><&r><[server.suffix]><&color[<[restart.color]>]> <[restart.message]> <[duration].formatted_words>."
        - announce to_console "<&4>Restarting server in <[duration].formatted_words>."
        - define duration <[duration].in_seconds.div[2]>
        - if <[duration]> > 10:
            - define duration <[duration].round_up_to_precision[10]>
        - else:
            - define duration <[duration].round_up_to_precision[0.1]>
        - if <[duration]> <= 1:
            - wait 1s
            - announce "<[server.prefix]><&color[<[server.color]>]><[server.name]><&r><[server.suffix]><&color[<[restart.color]>]> <[restart.end]>"
            - announce to_console "<&color[<[restart.color]>]> <[restart.end]>"
            - flag server dcommands.restarting:!
            - wait 1s
            - adjust server restart
            - stop
        - define duration <duration[<[duration]>]>
        - wait <[duration]>


dcommands_enchant:
    type: command
    name: enchant
    description: Enchants the item in your hand up to level 255, or removes enchantments from it.
    usage: /enchant [enchantment] (level | remove)
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
    - define color <color[<script[dcommands_config].parsed_key[enchant.color]>].if_null[<color[white]>]>
    - define error.color <color[<script[dcommands_config].parsed_key[enchant.error.color]>].if_null[<color[white]>]>
    - if <[enchant]> == null:
        - narrate <&color[<[error.color]>]><script[dcommands_config].parsed_key[enchant.error.invalid_enchant].if_null[Error parsing key!]>
        - stop
    - define arg <context.args.get[2].if_null[1]>
    - if <[arg].is_integer>:
        - narrate "<&color[<[color]>]>Enchanting <player.item_in_hand.material.translated_name> with <[enchant].full_name[<[arg]>].strip_color>."
        - inventory adjust slot:hand enchantments:<[enchantraw]>,<[arg]>
    - else:
        - if <[arg]> == remove:
            - if !<player.has_permission[dcommands.enchant.remove]>:
                - narrate <&color[<[error.color]>]><script[dcommands_config].parsed_key[enchant.error.remove_no_permission].if_null[Error parsing key!]>
                - stop
            - if !<player.item_in_hand.enchantment_map.keys.contains[<[enchantraw]>]>:
                - narrate <&color[<[error.color]>]><script[dcommands_config].parsed_key[enchant.error.no_enchant].if_null[Error parsing key!]>
                - stop
            - define level <player.item_in_hand.enchantment_map.deep_get[<[enchantraw]>]>
            - inventory adjust slot:hand remove_enchantments:<[enchantraw]>
            - narrate "<&color[<[color]>]>Removed <[enchant].full_name[<[level]>].strip_color> from <player.item_in_hand.material.translated_name>."
        - else:
            - narrate "<&[error]>Incorrect usage!"
            - narrate <&[error]><script.data_key[usage]>


dcommands_ban_handler:
    type: world
    debug: false
    events:
        on player prelogin flagged:dcommands.banned:
        - determine kicked+<proc[dcommands_ban_proc].context[<player>|<player.ban_reason>]>
        on player prelogin flagged:dcommands.tempbanned:
        - determine kicked+<proc[dcommands_tempban_proc].context[<player>|<player.ban_reason>|<player.ban_expiration_time>]>

dcommands_ban_proc:
    type: procedure
    definitions: player|reason
    debug: false
    script:
    - inject dcommands_server_definitions
    - inject dcommands_ban_definitions
    - determine "<[server.prefix]><&color[<[server.color]>]><[server.name]><&r><[server.suffix]><n><&color[<[ban.message.color]>]><[ban.message.perma]><n><n><&color[<[ban.message.color]>]>Reason: <&color[<[ban.value]>]><[reason]>"

dcommands_tempban_proc:
    type: procedure
    definitions: player|reason|expiration
    debug: false
    script:
    - inject dcommands_server_definitions
    - inject dcommands_ban_definitions
    - determine "<[server.prefix]><&color[<[server.color]>]><[server.name]><&r><[server.suffix]><n><&color[<[ban.message.color]>]><[ban.message.temp.header]><n><n><&color[<[ban.message.color]>]>Reason: <&color[<[ban.value]>]><[reason]><n><&color[<[ban.message.color]>]><[ban.message.temp.footer]> <&color[<[ban.value]>]><[expiration].format>"

dcommands_ban:
    type: command
    name: ban
    description: Permanently bans the desired player.
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
    - if <[player].has_flag[dcommands.banned]>:
        - narrate "<&[error]>This player is already banned!"
        - stop
    - inject dcommands_server_definitions
    - inject dcommands_ban_definitions
    - define reason <context.raw_args.after[<[name]>].substring[2]>
    - announce "<[server.prefix]><&color[<[server.color]>]><[server.name]><&r><[server.suffix]> <&color[<[ban.message.color]>]>Player <[name]> has been permanently banned for <&dq><&color[<[ban.value]>]><[reason]><&color[<[ban.message.color]>]><&dq>."
    - announce to_console "<&color[<[ban.message.color]>]><player.name> has  permanently banned <[name]> for <&dq><[reason]><&dq>."
    - flag <[player]> dcommands.banned
    - kick <[player]> reason:Disconnected
    - ban <[player]> reason:<[reason]> source:<player.name.if_null[Console]>

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
        - narrate "<&[error]>You cannot tempban yourself!"
        - stop
    - define duration <context.args.get[2]>
    - if <duration[<[duration]>].exists>:
        - if <[player].is_banned>:
            - narrate "<&[error]>This player is already banned!"
            - stop
        - inject dcommands_server_definitions
        - inject dcommands_ban_definitions
        - define reason <context.raw_args.after[<[duration]>].substring[2]>
        - define duration <duration[<[duration]>]>
        - announce "<[server.prefix]><&color[<[server.color]>]><[server.name]><&r><[server.suffix]> <&color[<[ban.message.color]>]>Player <[name]> has been temporarily banned for <&color[<[ban.value]>]><[duration].formatted_words><&color[<[ban.message.color]>]>, for <&dq><&color[<[ban.value]>]><[reason]><&color[<[ban.message.color]>]><&dq>."
        - announce to_console "<&color[<[ban.message.color]>]><player.name> has temporarily banned <[name]> for <[duration].formatted_words>, for <&dq><[reason]><&dq>."
        - flag <[player]> dcommands.tempbanned expire:<[duration]>
        - kick <[player]> reason:Disconnected
        - ban <[player]> reason:<[reason]> source:<player.name.if_null[Console]> expire:<[duration]>
    - else:
        - narrate "<&[error]>Invalid duration! Examples of valid durations:"
        - narrate "<&[error]>1d, 5m, 30s"


dcommands_unban:
    type: command
    name: unban
    description: Unbans a banned player.
    usage: /unban [name]
    permission: dcommands.unban
    tab completions:
        1: <server.players.filter[is_banned]>
    data:
        arguments:
            minimum: 1
            maximum: 1
    debug: false
    script:
    - inject dcommands_inject_arguments
    - inject dcommands_inject_offline_player
    - if <[player].is_banned>:
        - flag <[player]> dcommands.banned:!
        - flag <[player]> dcommands.tempbanned:!
        - ban <[player]> remove
        - inject dcommands_server_definitions
        - define unban.message <color[<script[dcommands_config].parsed_key[unban.message]>].if_null[<color[white]>]>
        - define unban.player <color[<script[dcommands_config].parsed_key[unban.player]>].if_null[<color[<[unban.message]>]>]>
        - announce "<[server.prefix]><&color[<[server.color]>]><[server.name]><&r><[server.suffix]> <&color[<[unban.player]>]><[player].name> <&color[<[unban.message]>]>has been unbanned!"
        - if <player.if_null[null]> == null:
            - announce to_console "<&color[<[unban.message]>]><[player].name> has been unbanned by console."
        - else:
            - announce to_console "<&color[<[unban.message]>]><player.name> has unbanned <[player].name>."
    - else:
        - narrate "<&[error]>This player is not banned!"

dcommands_inject_offline_player:
    type: task
    debug: false
    script:
    - define inject_player_color <color[<script[dcommands_config].parsed_key[inject_player.color]>].if_null[<color[white]>]>
    - define name <context.args.first>
    - define player <server.match_offline_player[<[name]>].if_null[null]>
    - if <[player]> == null || <[player].name> != <[name]>:
        - narrate <&color[<[inject_player_color]>]><script[dcommands_config].parsed_key[inject_player.message].if_null[Error parsing key!]>
        - stop


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
    - if !<player.has_permission[dcommands.enderchest.others]>:
        - narrate "<&[error]>You don't have permission to do this!"
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
    - inject dcommands_inject_player
    - define error.color <color[<script[dcommands_config].parsed_key[private.error.color]>].if_null[<color[white]>]>
    - if <context.args.size> < <script.data_key[data.arguments.minimum]>:
        - narrate <&color[<[error.color]>]><script[dcommands_config].parsed_key[private.error.empty_message].if_null[Error parsing key!]>
        - narrate <&color[<[error.color]>]><script.data_key[usage]>
        - stop
    - define receiver <[player]>
    - define sender <player>
    - if <[sender]> == <[receiver]>:
        - narrate <&color[<[error.color]>]><script[dcommands_config].parsed_key[private.error.msg_to_yourself].if_null[Error parsing key!]>
        - stop
    - define message <context.raw_args.after[<[name]>]>
    - flag <[sender]> dcommands.private:<[receiver]>
    - flag <[receiver]> dcommands.private:<[sender]>
    - define private.message <color[<script[dcommands_config].parsed_key[private.message]>].if_null[<color[white]>]>
    - define private.sender <color[<script[dcommands_config].parsed_key[private.sender]>].if_null[<color[white]>]>
    - define private.receiver <color[<script[dcommands_config].parsed_key[private.receiver]>].if_null[<color[white]>]>
    - narrate "<&7>[<&color[<[private.sender]>]><[sender].name> <&7>⇒ <&color[<[private.receiver]>]>You<&7>]<&color[<[private.message]>]><[message]>" targets:<[receiver]>
    - narrate "<&7>[<&color[<[private.receiver]>]>You <&7>⇒ <&color[<[private.sender]>]><[receiver].name><&7>]<&color[<[private.message]>]><[message]>" targets:<[sender]>
    - announce to_console "<&color[<[private.sender]>]><[sender].name> <&7>-<&gt> <&color[<[private.receiver]>]><[receiver].name><&7>:<&color[<[private.message]>]><[message]>"

dcommands_private_reply:
    type: command
    name: r
    description: Replies to the latest message received.
    usage: /r [message]
    permission: dcommands.reply
    tab completions:
        1: <empty>
    debug: false
    script:
    - define error <color[<script[dcommands_config].parsed_key[private.reply.color]>].if_null[<color[white]>]>
    - if !<player.has_flag[dcommands.private]>:
        - narrate <&color[<[error]>]><script[dcommands_config].parsed_key[private.reply.no_replies].if_null[Error parsing key!]>
        - stop
    - define receiver <player.flag[dcommands.private]>
    - define sender <player>
    - if !<[receiver].is_online>:
        - narrate <&color[<[error]>]><script[dcommands_config].parsed_key[private.reply.not_online].if_null[Error parsing key!]>
        - stop
    - if <context.args.is_empty>:
        - narrate <&color[<[error]>]><script[dcommands_config].parsed_key[private.reply.empty].if_null[Error parsing key!]>
        - stop
    - define message <context.raw_args>
    - flag <[sender]> dcommands.private:<[receiver]>
    - flag <[receiver]> dcommands.private:<[sender]>
    - define private.message <color[<script[dcommands_config].parsed_key[private.message]>].if_null[<color[white]>]>
    - define private.sender <color[<script[dcommands_config].parsed_key[private.sender]>].if_null[<color[white]>]>
    - define private.receiver <color[<script[dcommands_config].parsed_key[private.receiver]>].if_null[<color[white]>]>
    - narrate "<&7>[<&color[<[private.sender]>]><[sender].name> <&7>⇒ <&color[<[private.receiver]>]>You<&7>]<&color[<[private.message]>]> <[message]>" targets:<[receiver]>
    - narrate "<&7>[<&color[<[private.receiver]>]>You <&7>⇒ <&color[<[private.sender]>]><[receiver].name><&7>]<&color[<[private.message]>]> <[message]>" targets:<[sender]>
    - announce to_console "<&color[<[private.sender]>]><[sender].name> <&7>-<&gt> <&color[<[private.receiver]>]><[receiver].name><&7>:<&color[<[private.message]>]><[message]>"

dcommands_reply_cleaner:
    type: world
    debug: false
    events:
        on player quits:
        - flag <player> dcommands.private:!


dcommands_clearchat:
    type: command
    name: clearchat
    description: Cleans up the chat, leaving a custom message behind.
    usage: /clearchat
    permission: dcommands.clearchat
    tab completions:
        1: <empty>
    data:
        arguments:
            single: true
    debug: false
    script:
    - inject dcommands_inject_arguments
    - announce <n.repeat[100]>
    - inject dcommands_server_definitions
    - define message <script[dcommands_config].parsed_key[clearchat.message].if_null[Error parsing key!]>
    - define color <color[<script[dcommands_config].parsed_key[clearchat.color]>].if_null[<color[white]>]>
    - announce "<[server.prefix]><&color[<[server.color]>]><[server.name]><&r><[server.suffix]><&color[<[color]>]> <[message]>"
    - announce to_console "<&color[<[color]>]>Chat was cleared by <player.name>."


dcommands_dcommands:
    type: command
    name: dcommands
    description: Lists all available dCommands.
    usage: /dcommands
    permission: dcommands.dcommands
    tab completions:
        1: <empty>
    data:
        arguments:
            single: true
    debug: false
    script:
    - inject dcommands_inject_arguments
    - define commands <util.scripts.filter[container_type.equals[COMMAND]]>
    - define path <script.relative_filename>
    - define dcommands.disabled <[commands].filter[data_key[enabled].not]>
    - define dcommands.raw <[commands].filter[relative_filename.equals[<[path]>]].exclude[<[dcommands.disabled]>]>
    - define dcommands.name <[dcommands.raw].parse[data_key[name]]>
    - define dcommands.header.text <script[dcommands_config].parsed_key[dcommands.header.text].if_null[Error parsing key!]>
    - define dcommands.header.color <color[<script[dcommands_config].parsed_key[dcommands.header.color]>].if_null[<color[white]>]>
    - define dcommands.separator.symbol <script[dcommands_config].parsed_key[dcommands.separator.symbol].if_null[Error parsing key!]>
    - define dcommands.separator.color <color[<script[dcommands_config].parsed_key[dcommands.separator.color]>].if_null[<color[white]>]>
    - define dcommands.commands <color[<script[dcommands_config].parsed_key[dcommands.commands]>].if_null[<[dcommands.header.color]>]>
    - narrate <&color[<[dcommands.header.color]>]><[dcommands.header.text]>
    - narrate "<&color[<[dcommands.separator.color]>]><[dcommands.separator.symbol]> <&color[<[dcommands.commands]>]><[dcommands.name].alphabetical.separated_by[<n><&color[<[dcommands.separator.color]>]><[dcommands.separator.symbol]> <&color[<[dcommands.commands]>]>]>"
    - if <player.has_permission[dcommands.dcommands.see_disabled_commands]>:
        - if <script[dcommands_config].data_key[dcommands.show_disabled_dcommands]>:
            - if <[dcommands.disabled].is_empty>:
                - stop
            - narrate "<&7>Disabled dCommands:"
            - narrate "<&8><[dcommands.separator.symbol]> <&7><[dcommands.disabled].parse[data_key[name]].alphabetical.separated_by[<n><&8><[dcommands.separator.symbol]> <&7>]>"

dcommands_ban_definitions:
    type: task
    debug: false
    script:
    - define ban.message.perma <script[dcommands_config].parsed_key[ban.message.perma].if_null[Error parsing key!]>
    - define ban.message.temp.header <script[dcommands_config].parsed_key[ban.message.temp.header].if_null[Error parsing key!]>
    - define ban.message.temp.footer <script[dcommands_config].parsed_key[ban.message.temp.footer].if_null[Error parsing key!]>
    - define ban.message.color <color[<script[dcommands_config].parsed_key[ban.message.color]>].if_null[<[server.color]>]>
    - define ban.value <color[<script[dcommands_config].parsed_key[ban.value]>].if_null[<color[white]>]>

dcommands_server_definitions:
    type: task
    debug: false
    script:
    - define server.prefix <script[dcommands_config].parsed_key[server.prefix].if_null[Error parsing key!]>
    - define server.suffix <script[dcommands_config].parsed_key[server.suffix].if_null[Error parsing key!]>
    - define server.name <script[dcommands_config].parsed_key[server.name].if_null[Error parsing key!]>
    - define server.color <color[<script[dcommands_config].parsed_key[server.color]>].if_null[<color[white]>]>

dcommands_gmc:
    type: command
    name: gmc
    description: Creative mode shortcut.
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
    - define color <color[<script[dcommands_config].parsed_key[gamemode.creative.color]>].if_null[<color[white]>]>
    - if <context.args.is_empty>:
        - if <player.gamemode> == creative:
            - stop
        - else:
            - adjust <player> gamemode:creative
            - narrate <&color[<[color]>]><script[dcommands_config].parsed_key[gamemode.creative.self].if_null[Error parsing key!]>
        - stop
    - if !<player.has_permission[dcommands.gmc.others]>:
        - narrate "<&[error]>You don't have permission to do this!"
        - stop
    - inject dcommands_inject_player
    - if <[player]> == <player>:
        - adjust <player> gamemode:creative
        - narrate <&color[<[color]>]><script[dcommands_config].parsed_key[gamemode.creative.self]>
        - stop
    - if <[player].gamemode> == creative:
        - stop
    - else:
        - adjust <[player]> gamemode:creative
        - narrate "<&color[<[color]>]>Set <[player].name>'s gamemode to creative."
        - narrate <&color[<[color]>]><script[dcommands_config].parsed_key[gamemode.creative.another]> targets:<[player]>

dcommands_gms:
    type: command
    name: gms
    description: Survival mode shortcut.
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
    - define color <color[<script[dcommands_config].parsed_key[gamemode.survival.color]>].if_null[<color[white]>]>
    - if <context.args.is_empty>:
        - if <player.gamemode> == survival:
            - stop
        - else:
            - adjust <player> gamemode:survival
            - narrate <&color[<[color]>]><script[dcommands_config].parsed_key[gamemode.survival.self].if_null[Error parsing key!]>
        - stop
    - if !<player.has_permission[dcommands.gms.others]>:
        - narrate "<&[error]>You don't have permission to do this!"
        - stop
    - inject dcommands_inject_player
    - if <[player]> == <player>:
        - adjust <player> gamemode:survival
        - narrate <&color[<[color]>]><script[dcommands_config].parsed_key[gamemode.survival.self].if_null[Error parsing key!]>
        - stop
    - if <[player].gamemode> == survival:
        - stop
    - else:
        - adjust <[player]> gamemode:survival
        - narrate "<&color[<[color]>]>Set <[player].name>'s gamemode to survival."
        - narrate <&color[<[color]>]><script[dcommands_config].parsed_key[gamemode.survival.another].if_null[Error parsing key!]> targets:<[player]>

dcommands_gmsp:
    type: command
    name: gmsp
    description: Spectator mode shortcut.
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
    - define color <color[<script[dcommands_config].parsed_key[gamemode.survival.color]>].if_null[<color[white]>]>
    - if <context.args.is_empty>:
        - if <player.gamemode> == spectator:
            - stop
        - else:
            - adjust <player> gamemode:spectator
            - narrate <&color[<[color]>]><script[dcommands_config].parsed_key[gamemode.spectator.self].if_null[Error parsing key!]>
        - stop
    - if !<player.has_permission[dcommands.gmsp.others]>:
        - narrate "<&[error]>You don't have permission to do this!"
        - stop
    - inject dcommands_inject_player
    - if <[player]> == <player>:
        - adjust <player> gamemode:spectator
        - narrate <&color[<[color]>]><script[dcommands_config].parsed_key[gamemode.spectator.self].if_null[Error parsing key!]>
        - stop
    - if <[player].gamemode> == spectator:
        - stop
    - else:
        - adjust <[player]> gamemode:spectator
        - narrate "<&color[<[color]>]>Set <[player].name>'s gamemode to spectator."
        - narrate <&color[<[color]>]><script[dcommands_config].parsed_key[gamemode.spectator.another].if_null[Error parsing key!]> targets:<[player]>

dcommands_gma:
    type: command
    name: gma
    description: Adventure mode shortcut.
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
    - define color <color[<script[dcommands_config].parsed_key[gamemode.survival.color]>].if_null[<color[white]>]>
    - if <context.args.is_empty>:
        - if <player.gamemode> == adventure:
            - stop
        - else:
            - adjust <player> gamemode:adventure
            - narrate <&color[<[color]>]><script[dcommands_config].parsed_key[gamemode.adventure.self].if_null[Error parsing key!]>
        - stop
    - if !<player.has_permission[dcommands.gma.others]>:
        - narrate "<&[error]>You don't have permission to do this!"
        - stop
    - inject dcommands_inject_player
    - if <[player]> == <player>:
        - adjust <player> gamemode:adventure
        - narrate <&color[<[color]>]><script[dcommands_config].parsed_key[gamemode.adventure.self].if_null[Error parsing key!]>
        - stop
    - if <[player].gamemode> == adventure:
        - stop
    - else:
        - adjust <[player]> gamemode:adventure
        - narrate "<&color[<[color]>]>Set <[player].name>'s gamemode to adventure."
        - narrate <&color[<[color]>]><script[dcommands_config].parsed_key[gamemode.adventure.another].if_null[Error parsing key!]> targets:<[player]>

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
    - define heal.message.self <script[dcommands_config].parsed_key[heal.message.self].if_null[Error parsing key!]>
    - define heal.message.color <color[<script[dcommands_config].parsed_key[heal.message.color]>].if_null[<color[white]>]>
    - define heal.numbers <color[<script[dcommands_config].parsed_key[heal.numbers]>].if_null[<color[white]>]>
    - define heal.separator.symbol <script[dcommands_config].parsed_key[heal.separator.symbol].if_null[Error parsing key!]>
    - define heal.separator.color <color[<script[dcommands_config].parsed_key[heal.separator.color]>].if_null[<[heal.message.color]>]>
    - if <context.args.is_empty>:
        - define health <player.health.round_to_precision[0.5]>
        - define maxhealth <player.health_max>
        - adjust <player> fire_time:1t
        - heal <player>
        - narrate <&color[<[heal.message.color]>]><[heal.message.self]>
        - narrate "<&color[<[heal.numbers]>]><[health]> <&color[<[heal.separator.color]>]><[heal.separator.symbol]> <&color[<[heal.numbers]>]><[maxhealth]>"
        - stop
    - if !<player.has_permission[dcommands.heal.others]>:
        - narrate "<&[error]>You don't have permission to do this!"
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
        - define heal.message.another.theirs <script[dcommands_config].parsed_key[heal.message.another.theirs].if_null[Error parsing key!]>
        - define heal.message.another.yours <script[dcommands_config].parsed_key[heal.message.another.yours].if_null[Error parsing key!]>
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
    - define feed.color <color[<script[dcommands_config].parsed_key[feed.color]>].if_null[<color[white]>]>
    - define feed.message.self <script[dcommands_config].parsed_key[feed.message.self].if_null[Error parsing key!]>
    - define feed.message.another <script[dcommands_config].parsed_key[feed.message.another].if_null[Error parsing key!]>
    - if <context.args.is_empty>:
        - feed <player>
        - narrate <&color[<[feed.color]>]><[feed.message.self]>
        - stop
    - if !<player.has_permission[dcommands.feed.others]>:
        - narrate "<&[error]>You don't have permission to do this!"
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
        1: <empty>
    data:
        arguments:
            single: true
    debug: false
    script:
    - inject dcommands_inject_arguments
    - define color <color[<script[dcommands_config].parsed_key[vanish.message.color]>].if_null[<color[white]>]>
    - if <player.visible>:
        - narrate <&color[<[color]>]><script[dcommands_config].parsed_key[vanish.message.on].if_null[Error parsing key!]>
        - adjust <player> visible:false
        - adjust <player> invulnerable:true
    - else:
        - narrate <&color[<[color]>]><script[dcommands_config].parsed_key[vanish.message.off].if_null[Error parsing key!]>
        - adjust <player> visible:true
        - adjust <player> invulnerable:false


dcommands_fly:
    type: command
    name: fly
    description: Allows the user to fly, even in survival mode.
    usage: /fly
    permission: dcommands.fly
    tab completions:
        1: <empty>
    data:
        arguments:
            single: true
    debug: false
    script:
    - inject dcommands_inject_arguments
    - define color <color[<script[dcommands_config].parsed_key[fly.message.color]>].if_null[<color[white]>]>
    - if !<player.can_fly>:
        - narrate <&color[<[color]>]><script[dcommands_config].parsed_key[fly.message.on]>
        - adjust <player> can_fly:true
    - else:
        - narrate <&color[<[color]>]><script[dcommands_config].parsed_key[fly.message.off]>
        - adjust <player> can_fly:false


dcommands_inject_arguments:
    type: task
    debug: false
    script:
    - definemap inject_argument_color:
        not_enough: <color[<script[dcommands_config].parsed_key[arguments.not_enough.color]>].if_null[<color[white]>]>
        too_many: <color[<script[dcommands_config].parsed_key[arguments.too_many.color]>].if_null[<color[white]>]>
        command_info:
            usage: <color[<script[dcommands_config].parsed_key[arguments.command_info.usage]>].if_null[<color[white]>]>
            description: <color[<script[dcommands_config].parsed_key[arguments.command_info.description]>].if_null[<color[white]>]>
            message: <color[<script[dcommands_config].parsed_key[arguments.command_info.message]>].if_null[<color[white]>]>
    - define minarg <queue.script.data_key[data.arguments.minimum].if_null[null]>
    - define maxarg <queue.script.data_key[data.arguments.maximum].if_null[null]>
    - define single <queue.script.data_key[data.arguments.single].if_null[null]>
    - if <[single]> != null:
        - if !<context.args.is_empty>:
            - narrate <&color[<[color.too_many]>]><script[dcommands_config].parsed_key[arguments.too_many.message].if_null[Error parsing key!]>
            - inject dcommands_inject_message
            - stop
    - else:
        - if <[minarg]> == null || <[maxarg]> == null:
            - narrate "<&4>Invalid minimum or maximum argument count! Contact the server developer."
            - stop
        - if <context.args.size> < <[minarg]>:
            - narrate <&color[<[inject_argument_color.not_enough]>]><script[dcommands_config].parsed_key[arguments.not_enough.message].if_null[Error parsing key!]>
            - inject dcommands_inject_message
            - stop
        - if <context.args.size> > <[maxarg]>:
            - narrate <&color[<[inject_argument_color.too_many]>]><script[dcommands_config].parsed_key[arguments.too_many.message].if_null[Error parsing key!]>
            - inject dcommands_inject_message
            - stop

dcommands_inject_message:
    type: task
    debug: false
    script:
    - narrate <&color[<[inject_argument_color.command_info.usage]>]><queue.script.parsed_key[usage].if_null[Error parsing key!]>
    - narrate <&color[<[inject_argument_color.command_info.description]>]><queue.script.parsed_key[description].if_null[Error parsing key!]>
    - define message <queue.script.parsed_key[data.arguments.message].if_null[null]>
    - if <[message]> != null:
        - narrate <&color[<[inject_argument_color.command_info.message]>]><[message]>

dcommands_inject_player:
    type: task
    debug: false
    script:
    - define inject_player_color <color[<script[dcommands_config].parsed_key[inject_player.color]>].if_null[<color[white]>]>
    - define name <context.args.first>
    - define player <server.match_player[<[name]>].if_null[null]>
    - if <[player]> == null || <[player].name> != <[name]>:
        - narrate <&color[<[inject_player_color]>]><script[dcommands_config].parsed_key[inject_player.message].if_null[Error parsing key!]>
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
    - repeat <[quantity]>:
        - if <script[dcommands_config].data_key[smite.warn_target.enabled]>:
            - narrate <&color[<color[<script[dcommands_config].parsed_key[smite.warn_target.color]>].if_null[<color[white]>]>]><script[dcommands_config].parsed_key[smite.warn_target.message]> targets:<[player]>
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
        1: <empty>
    data:
        arguments:
            single: true
    debug: false
    script:
    - inject dcommands_inject_arguments
    - definemap godmodecolor:
        on: <color[<script[dcommands_config].parsed_key[godmode.on.color]>].if_null[<color[white]>]>
        off: <color[<script[dcommands_config].parsed_key[godmode.off.color]>].if_null[<color[white]>]>
    - if !<player.invulnerable>:
        - narrate <&color[<[godmodecolor.on]>]><script[dcommands_config].parsed_key[godmode.on.message].if_null[Error parsing key!]>
        - adjust <player> invulnerable:true
    - else:
        - narrate <&color[<[godmodecolor.off]>]><script[dcommands_config].parsed_key[godmode.off.message].if_null[Error parsing key!]>
        - adjust <player> invulnerable:false

dcommands_speed:
    type: command
    name: speed
    description: Changes your walking or flying speed.
    usage: /speed [fly | walk] (speed)
    permission: dcommands.speed
    tab completions:
        1: fly|walk
        2: <empty>
    data:
        arguments:
            minimum: 1
            maximum: 2
    debug: false
    script:
    - inject dcommands_inject_arguments
    - choose <context.args.first>:
        - case walk:
            - define msg Walking
        - case fly:
            - define msg Flying
        - default:
            - inject dcommands_inject_message
            - stop
    - if <context.args.size> == 1:
        - choose <[msg]>:
            - case Walking:
                - narrate "<&[base]>Your walking speed is set at <&[emphasis]><player.walk_speed><&[base]>!"
            - case Flying:
                - narrate "<&[base]>Your flying speed is set at <&[emphasis]><player.fly_speed><&[base]>!"
            - default:
                - narrate "<&[error]>If you saw this message, something went terribly wrong. Please contact the author!"
    - else:
        - define speed <context.args.get[2]>
        - if !<[speed].is_decimal>:
            - narrate "<&[error]>Speed input must be a number!"
            - stop
        - narrate "<&[warning]><[msg]> speed changed to <[speed]>"
        - choose <[msg]>:
            - case Walking:
                - adjust <player> walk_speed:<[speed]>
            - case Flying:
                - adjust <player> fly_speed:<[speed]>
            - default:
                - narrate "<&[error]>If you saw this message, something went terribly wrong. Please contact the author!"

dcommands_rename:
    type: command
    name: rename
    description: Renames the item on your hand. Accepts tags.
    usage: /rename [text | Reset]
    permission: dcommands.rename
    tab completions:
        1: Reset
    data:
        arguments:
            minimum: 1
            maximum: 1
    debug: false
    script:
    - inject dcommands_inject_arguments
    - define newname <context.raw_args>
    - if <[newname]> == Reset:
        - inventory adjust slot:hand display
        - stop
    - narrate "<&[warning]>Renaming <player.item_in_hand.display.if_null[<player.item_in_hand.material.translated_name>]> <&[warning]>to <[newname].parsed><&[warning]>."
    - inventory adjust slot:hand display:<[newname].parsed>

dcommands_lore_add:
    type: command
    name: loreadd
    description: Adds lore to the item on your hand. Accepts tags.
    usage: /loreadd [text]
    permission: dcommands.loreadd
    aliases:
    - addlore
    tab completions:
        1: <empty>
    data:
        arguments:
            minimum: 1
            maximum: 999
    debug: false
    script:
    - inject dcommands_inject_arguments
    - define lore <context.raw_args.parsed>
    - inventory adjust slot:hand lore:<player.item_in_hand.lore.include[<[lore]>].if_null[<[lore]>]>
    - narrate "<&[warning]>Adding lore '<&[emphasis]><[lore]><&[warning]>' to <player.item_in_hand.display.if_null[<player.item_in_hand.material.translated_name>]><&[warning]>."

dcommands_lore_remove:
    type: command
    name: loreremove
    description: Removes a line of lore from the item on your hand. Accepts tags.
    usage: /loreremove [line]
    permission: dcommands.loreremove
    aliases:
    - removelore
    tab completions:
        1: <util.list_numbers[from=1;to=<player.item_in_hand.lore.size.if_null[0]>].if_null[<empty>]>
    data:
        arguments:
            minimum: 1
            maximum: 1
    debug: false
    script:
    - inject dcommands_inject_arguments
    - if <player.item_in_hand.lore.if_null[null]> == null:
        - narrate "<&[error]>This item does not have lore!"
        - stop
    - define line <context.args.first>
    - if !<[line].is_integer>:
        - narrate "<&[error]>Line input must be an integer!"
        - stop
    - define lore <player.item_in_hand.lore.get[<[line]>]>
    - inventory adjust slot:hand lore:<player.item_in_hand.lore.remove[<[line]>]>
    - narrate "<&[warning]>Removing lore line number <[line]>. That line contained '<[lore]><&[warning]>'."