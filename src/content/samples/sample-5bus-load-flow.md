---
title: "5-bus Newton-Raphson load flow worked example"
---

# Worked example: 5-bus load flow by Newton-Raphson

**Worked example, not a client project. All data below is assumed by me for demonstration.**

## Problem
Find bus voltages, line flows and losses for a small 5-bus network on a 100 MVA base. Bus 1 is the slack bus (1.060 pu), bus 2 is a generator bus (1.045 pu, 40 MW), and buses 3, 4 and 5 are load buses. Total load is 165 MW and 40 MVAr.

## Method
- Bus admittance matrix from a pi model of each line (series R + jX, half of the total charging B at each end).
- Newton-Raphson in polar form with a flat start (1.0 pu, 0 degrees), power-mismatch tolerance 1e-8 pu.
- Converged in 3 updates (max mismatch 0.4875, 0.0333, 7.2e-5, 5.1e-10 pu).
- Not modelled: generator Q limits, transformer taps, voltage and thermal limits.

## Results
| Bus | Type | V (pu) | Angle (deg) | P gen (MW) | Q gen (MVAr) |
|---|---|---|---|---|---|
| 1 | Slack | 1.0600 | 0.000 | 129.59 | -2.36 |
| 2 | PV | 1.0450 | -2.768 | 40.00 | 25.06 |
| 3 | PQ | 1.0223 | -4.977 | 0 | 0 |
| 4 | PQ | 1.0215 | -5.309 | 0 | 0 |
| 5 | PQ | 1.0156 | -6.129 | 0 | 0 |

Total generation 169.59 MW against 165 MW load, so real-power loss is 4.59 MW. The lowest voltage is 1.0156 pu at bus 5.

## Checks
- The converged voltages reproduce every specified bus injection (S = V x conj(Y V)).
- Generation minus load equals the sum of line losses (4.592 MW), within rounding.

## Files
- `sample-5bus-load-flow.xlsx`: inputs, bus results, line flows, iteration log
- `solve_loadflow.m`: MATLAB script for the same case
- `sample-5bus-load-flow-diagram.png`, `sample-5bus-convergence.png`

Check against current standards and NEA rules before real use.
