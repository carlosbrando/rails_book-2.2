## Benchmarking reports in milliseconds

All log messages that reported the time that a process took to be executed have been modified to display milliseconds.

For example, the message:

	"Completed in 0.10000 (4 reqs/sec) | Rendering: 0.04000 (40%) | DB: 0.00400 (4%) | 200 OK"

will now be displayed as follows:

	"Completed in 100ms (View: 40, DB: 4) | 200 OK"
