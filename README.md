
[README.md](https://github.com/user-attachments/files/29405494/README.md)
# Multi-Agent Containment Control with Differential Privacy and Quantization

[![Paper](https://img.shields.io/badge/IEEE_T--ASE-2026-blue)](https://doi.org/10.1109/TASE.2026.3701948)
[![MATLAB](https://img.shields.io/badge/MATLAB-R2021a%2B-orange)](https://www.mathworks.com/products/matlab.html)

MATLAB simulation code for the paper:

> **Multi-Agent Containment Control with Differentially Private Schemes and Quantization**
> Sourav Bhowmick, Mallena Vardhan\*, Dennis Jobby\*, Deepak Mishra
> *IEEE Transactions on Automation Science and Engineering*, Vol. 23, 2026
> DOI: [10.1109/TASE.2026.3701948](https://doi.org/10.1109/TASE.2026.3701948)
> \* Equal contribution

The paper is available in the [`paper/`](paper/) folder.

---

## What this code does

This repository implements the simulation results (Figures 1–12) from the paper. The system models a multi-agent network of **N followers** and **N reference agents** where:

- Followers use modified **Friedkin-Johnsen (F-J) dynamics** and must converge inside the convex hull formed by the reference agents (containment control)
- States are masked with **Laplacian noise** before transmission to guarantee differential privacy
- Follower-to-follower communication uses a **uniform quantizer with dynamic encoding-decoding** to handle bandwidth-limited channels
- Each follower can independently choose its own **privacy level ε̂_i**

The three main theoretical results verified by simulation are:

1. **Theorem 1** — followers' states converge almost surely (Figs. 1–3)
2. **Theorem 2** — quantization error is finitely upper bounded (Fig. 4)
3. **Theorem 3** — ε̂-differential privacy is achieved per follower (Figs. 5–12)

---

## Repository structure

```
├── README.md
├── paper/
│   └── TASE_2026_containment_control.pdf
├── docs/
│   └── parameter_guide.md        ← code variable ↔ paper symbol reference
├── code/
│   ├── index.m                   ← main entry point — runs all simulations
│   ├── index_1.m                 ← Fig. 1: nominal containment (no noise)
│   ├── index_2.m                 ← Fig. 2: containment with Laplacian noise
│   ├── index_3.m                 ← Fig. 3: noise + quantization + encoder-decoder
│   ├── index_4.m                 ← Fig. 4: quantization error evolution
│   ├── index_5.m                 ← Figs. 5–7: DP adjacent-pair observation sequences
│   ├── index_dp.m                ← Fig. 12: ε̂ vs q_i trade-off plot
│   ├── encoder.m                 ← Φ^enc: dynamic encoder (eq. 13)
│   ├── decoder.m                 ← Ψ^dec: dynamic decoder (eq. 18)
│   ├── phi_generator.m           ← encodes φ(k): quantized output vector
│   ├── quantiser.m               ← vectorized uniform quantizer
│   ├── quantize_scalar.m         ← scalar uniform quantizer q(·) (eq. 14)
│   ├── laplace_noise.m           ← Laplacian noise generator ω ~ Lap(0, b)
│   ├── G_generator.m             ← solves for G satisfying Assumption 2
│   ├── Rand_generator.m          ← generates random W, B, Θ, η̂
│   ├── stochastic.m              ← row-normalizes a random matrix
│   ├── positions.m               ← initializes follower/leader positions
│   ├── scale_gen.m               ← builds h(k) = c·q^k or p(k) = p₀·ζ^k
│   ├── q_selector.m              ← selects q_i ∈ (|1−r̂_i|, ζ) per follower
│   ├── r_cap_generator.m         ← computes r̂_i (eq. 57)
│   └── if_neg.m                  ← checks G ≥ 0 element-wise
└── results/
    └── figures/                  ← exported simulation figures (PNG)
```

---

## Requirements

- MATLAB R2021a or later (no additional toolboxes required)

---

## How to run

**1. Clone the repository:**

```bash
git clone https://github.com/dennisjobs/Multi_agent_contaiment_control_with_dp-quantisation.git
cd Multi_agent_contaiment_control_with_dp-quantisation/code
```

**2. Open MATLAB** and navigate to the `code/` folder.

**3. Run the main script:**

```matlab
run('index.m')
```

This reproduces Figures 1–7 and 12 from the paper sequentially.

### Running individual scenarios

| Script | Reproduces | Description |
|---|---|---|
| `index_1.m` | Fig. 1 | Nominal containment, no noise |
| `index_2.m` | Fig. 2 | Containment with Laplacian noise |
| `index_3.m` | Fig. 3 | Noise + quantization + encoder-decoder |
| `index_4.m` | Fig. 4 | Quantization error δ(k) evolution |
| `index_5.m` | Figs. 5–7 | DP adjacent-pair sequences |
| `index_dp.m` | Fig. 12 | Privacy parameter ε̂ vs noise parameter q |

Each sub-script depends on the workspace initialized by `index.m`. To run one in isolation, first execute the initialization block at the top of `index.m` (up to and including the call to `index_dp`).

---

## Key parameters

See [`docs/parameter_guide.md`](docs/parameter_guide.md) for the full mapping of code variables to paper symbols.

The main tunable parameters (all set in `index.m`):

| Parameter | Variable | Typical value | Effect |
|---|---|---|---|
| Number of agents | `n` | `4` | Followers = leaders = n |
| Simulation steps | `T` | `1000` | Time horizon |
| Quantization decay | `zeta` (ζ) | `> ρ(G), < 1` | Controls p(k) = p₀ζ^k |
| Noise magnitude | `c` | `rand(n,1)` | Scale of h_i(k) = c_i · q_i^k |
| Noise decay | `q` | `< ζ` | Controls how fast Laplacian noise decays |
| DP bijection param | `r` | per-agent | Determines ε̂_i via eq. (32) |

---

## System overview

```
Reference agents (leaders)               Followers
x_l(k+1) = G·x_l(k) + η̂               x(k+1) = (I−Θ)W·x(k) − (I−Θ)W̄·δ(k)
                                                  + (S+(I−Θ)W+ΘB)·ω(k) + ΘB·x_l(k)

          ←── analog channel (exact x_l) ───←
          →── analog channel (exact x_l) ───→

                     Follower ↔ follower: digital channel
                     x̄(k) → [ Encoder ] → φ(k) → [ Decoder ] → x̂(k)
                     δ(k) = x̄(k) − x̂(k)    (quantization error)
```

**Privacy mechanism:** each follower adds ω_i(k) ~ Lap(0, c_i·q_i^k) to its state before transmitting. An adversary observing only the encoded output φ(k) cannot distinguish between δ̂-adjacent initial conditions — this is the ε̂-differential privacy guarantee of Theorem 3.

---

## Code variable to paper symbol reference

| Code variable | Paper symbol | Description |
|---|---|---|
| `W` | **W** | Row-stochastic follower-follower adjacency matrix |
| `B` | **B** | Reference-to-follower adjacency matrix |
| `G` | **G** | Reference-to-reference adjacency matrix |
| `theta` | **Θ** | Susceptibility diagonal matrix |
| `alpha_bar` | **ᾱ** | Convex combination matrix (Assumption 2) |
| `I_q` | **I_Q** | Design matrix W − ΘW̄ |
| `n_cap` | **η̂** | External input to reference agents |
| `x_all` | **x(k)** | True follower states |
| `x_all_bar` | **x̄(k)** | Noisy (masked) follower states |
| `x_l_all` | **x_l(k)** | True reference agent states |
| `x_l_all_bar` | **x̄_l(k)** | Noisy reference states |
| `x_cap_all` | **x̂(k)** | Decoded/estimated follower states |
| `phi_all` | **φ(k)** | Quantized (encoded) output |
| `xi_all` | **ξ(k)** | Encoder internal state |
| `delta_all` | **δ(k)** | Quantization error x̄(k) − x̂(k) |
| `h` | **h_i(k) = c_i·q_i^k** | Laplacian noise scale sequence |
| `p` | **p(k) = p₀·ζ^k** | Dynamic quantization scaling factor |
| `zeta` | **ζ** | Quantization decay / spectral upper bound |
| `S` | **S** | Follower noise selection diagonal matrix |
| `r` | **r̂_i** | DP bijection parameter per follower (eq. 57) |
| `epsilon` | **ε̂_i** | Differential privacy level per follower (eq. 32) |
| `delt` | **δ̂** | Adjacency perturbation for DP simulation |
| `P` | **p** | Index of the perturbed agent |

---

## Citation

If you use this code in your research, please cite:

```bibtex
@article{bhowmick2026containment,
  author    = {Bhowmick, Sourav and Vardhan, Mallena and Jobby, Dennis and Mishra, Deepak},
  title     = {Multi-Agent Containment Control with Differentially Private Schemes and Quantization},
  journal   = {IEEE Transactions on Automation Science and Engineering},
  volume    = {23},
  year      = {2026},
  doi       = {10.1109/TASE.2026.3701948}
}
```

---

## Authors

| Author | Affiliation | Contact |
|---|---|---|
| Sourav Bhowmick | Dept. of Avionics, IIST Thiruvananthapuram | souravbhowmick@iist.ac.in |
| Mallena Vardhan | Dept. of ECE, IIIT Guwahati | vardhanmallena@gmail.com |
| Dennis Jobby | Dept. of Electrical Engineering, NIT Calicut | dennisjobby16@gmail.com |
| Deepak Mishra | Dept. of Avionics, IIST Thiruvananthapuram | deepak.mishra@iist.ac.in |

---

## License

© 2026 IEEE. The paper PDF is provided for personal and academic use only, in accordance with IEEE author rights policy. The simulation code in this repository is released for research reproducibility purposes.
