#!/usr/bin/env python3

import i3ipc

i3 = i3ipc.Connection()

def on_workspace_init(self, event):
    if not len(event.current.leaves()):
        i3.command('exec --no-startup-id ~/.i3/setbkg.sh')

i3.on('workspace::focus', on_workspace_init)

i3.main()
