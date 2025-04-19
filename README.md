# 🕒 codespace-tracker

> A modular and automated Codespace session tracker that logs runtime, monitors usage, and triggers scripts based on your defined conditions.  
> **Automation, Monitoring, and Magic — all in one Codespace.** 🔮

---

## 📦 Features

- ⏱️ **Track Every Codespace Session** – Logs session start, duration, and total runtime.
- 🔁 **Live Runtime Monitoring** – Updates every minute using `ghadi.sh` + `update_minute.py`.
- 🚨 **Trigger Scripts on Conditions** – Triggers custom scripts (like backups or alerts) when conditions like 6 min, 20 hrs, etc. are met.
- 🔍 **Crash Recovery** – Handles unclean shutdowns like a pro.
- 🔧 **Modular Architecture** – Every component does one job, and does it well.
- ⚙️ **Fully Configurable** – Want to trigger your own script at 100 mins? Just edit the config.

---

## 🧠 Architecture Overview

```
codespace-tracker/
├── ghadi.sh               # Runs every minute, triggers update_minute.py
├── update_minute.py       # Updates current session + minute_runtime
├── chalu.sh               # Initializes new session + recovers last crash
├── session_init.py        # Sets start time
├── crash_recovery.py      # Recovers session if crash happened
├── runtime.py             # Every 20 mins, logs session time
├── totalruntime.py        # Every 25 mins, logs total runtime
├── trigger.py             # Monitors runtime & triggers scripts via config
├── trigger_config.json    # 🔥 Config for all triggers
├── utils.py               # Helper functions for reading/writing/logs
├── start_all.sh           # Starts all core background processes
├── setup.sh               # Master installer script
└── .codespace-tracker/
    ├── minute_runtime.json     # Session runtime (live, per minute)
    ├── current_session.json    # Current session timer
    ├── total_runtime.json      # Total Codespace usage
    ├── session_logs.json       # All past sessions
    ├── first_start.json        # First launch timestamp
    ├── flags/                  # Trigger flags go here
    └── debug.log               # Logs, errors, and recovery messages
```






---

## 🚀 How to Use

### 🔧 Setup

```bash
bash setup.sh

This will:

Create the .codespace-tracker directory

Set up your config files

Start background processes (runtime logger, trigger, etc.)

📈 Your Trigger, Your Rules
Edit trigger_config.json to add new runtime conditions & scripts:

json
Copy
Edit

{
  "label": "6-minute script",
  "script_url": "https://example.com/my-script.sh",
  "script_command": "bash my-script.sh",
  "cwd": "/workspaces/timer",
  "flag_name": "trigger_6min.flag",
  "conditions": {
    "minute_runtime_minutes": 6
  }
}


✅ Add as many as you want!
⚡ The engine will monitor and trigger them automatically.

💾 Runtime Files
Runtime JSON files are stored inside .codespace-tracker/:


File	Purpose
minute_runtime.json	Session runtime (live, per minute)
total_runtime.json	Total Codespace usage
current_session.json	Current session timer
session_logs.json	All past sessions
first_start.json	When was Codespace first launched
debug.log	Logs, errors, and recovery messages
💡 Ideas for Use Cases
Trigger backups every 2 hours

Auto-generate .env files on new session

Kill unused containers after 6 hours

Alert if Codespace ran 24+ hrs

Build and deploy automatically after long dev sessions

🙌 Contributions Welcome
Got a feature in mind? A better trigger system?
Feel free to fork, raise PRs, or just create issues!
This project is made to grow and be flexible 💪

📜 License
This project uses the MIT License —

✅ Free to use

✅ Modify for your use case

✅ Even use commercially

🧠 Just credit the original author if you redistribute 🙌

MIT License Details →

🧙‍♂️ Author
Naveen Amrawanshi
Made with ❤️ by @naksh-07

“Code toh sab likhte hai... main toh meain chat gpt se likhwata hoon!”


---

Let me know if you want a badge row, gif demo, or install stats added at the top!
