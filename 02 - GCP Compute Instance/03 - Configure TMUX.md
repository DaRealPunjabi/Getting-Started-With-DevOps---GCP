# Configure TMUX

Tmux allows you to create multiple windows and panes within a single terminal window

# Examine Tmux Setting
On GCP cloud shell terminal Tmux support is built and enabled by default.
```
Click the ⚙️ icon and then click Tmux setting
```

# Tmux Commands

📝 Tmux uses a prefix key, which is CTRL+b by default.

**Split the screen horizontally** <br />
```
Ctrl+B (once) and then " (double quote character) <br />
```

**Split the screen vertically** <br />
```
Ctrl + B (once) and then % (percent character)
```

**Move across open panels (so they are selected)** <br />
```
Ctrl + B (once) and then arrow keys
```

**Close panel** <br />
```
type exit on selected panel
```

#Configure Tmux
From ssh terminal using an editor to create the configuration file
```
vi .tmux.conf
```
Enter
```
set -g status on
set -g mouse on
```
Save the changes
```
<esc> :wq!
❗️ Close and restart the terminal for the changes to take effects.
```
