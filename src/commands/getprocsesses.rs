use sysinfo::System;

pub(crate) fn get_top_processes() -> String {
    let mut system = System::new_all();
    system.refresh_all();

    let mut processes: Vec<_> = system.processes().values().collect();
    processes.sort_by(|a, b| b.cpu_usage().partial_cmp(&a.cpu_usage()).unwrap());

    let mut output = String::new();
    output.push_str(&format!(
        "{:<6} {:<30} {:<10} {:<10}\n",
        "PID", "Name", "CPU%", "Memory (MB)"
    ));

    for process in processes.iter().take(5) {
        output.push_str(&format!(
            "{:<6} {:?} {:<10.2} {:<10.2}\n",
            process.pid(),
            process.name(),
            process.cpu_usage(),
            process.memory() as f64 / 1024.0
        ));
    }

    output
}
