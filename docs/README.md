                   ┌──────────────┐
                   │ monitor.sh   │
                   │ (main script)│
                   └───────┬──────┘
                           │
             ┌─────────────┴─────────────┐
             │                           │
       ┌─────▼─────┐               ┌─────▼─────┐
       │ network.sh│               │ report.sh │
       │ (checks  │               │ (optional │
       │ Router,  │               │ summary)  │
       │ Internet,│               └─────┬─────┘
       │ DNS)     │                     │
       └─────┬────┘                     │
             │                          │
             │ Logs                     │
             ▼                          ▼
     ┌──────────────┐           ┌─────────────┐
     │ logs/        │           │ Terminal /  │
     │ network-     │           │ GitHub      │
     │ monitor.log  │           │ display     │
     └─────┬────────┘           └─────────────┘
           │
           ▼
    ┌──────────────┐
    │ Alert via    │
    │ msmtp/email  │
    └──────────────┘
           │
           ▼
    ┌──────────────┐
    │ cleanup.sh   │
    │ (removes old │
    │ logs)        │
    └──────────────┘
