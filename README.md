# Multi-agent Containment Control with Differentially Private Schemes and Quantization

This repository contains the code and simulation results for the research paper:

**"Multi-agent Containment Control with Differentially Private Schemes and Quantization"**
By Sourav Bhowmick, Mallena Vardhan*, Dennis Jobby*, and Deepak Mishra.

The paper investigates containment control of networked discrete-time dynamical systems by incorporating differential privacy (DP) and communication constraints in the form of quantization. The work focuses on analyzing the convergence of the containment control problem, the boundedness of the quantization, and the differential privacy achieved by follower agents.

## Key Features

* **Multi-Agent System (MAS) Model:** Implementation of follower agents with modified Friedkin-Johnsen (F-J) dynamics and reference agents with affine dynamics.
* **Differential Privacy (DP):** Integration of Laplacian noise to mask the states of followers and reference agents before transmission, ensuring privacy from adversaries.
* **Quantization:** Employment of a uniform quantizer with a dynamic encoding-decoding scheme for communication among follower agents in a communication-constrained environment.
* **Convergence Analysis:** Code to demonstrate the convergence of follower states to a random vector almost surely, and the realization of mean square containment control.
* **Quantization Bound Analysis:** Analysis of the boundedness of the quantization mechanism to ensure the quantizer remains unsaturated.
* **Privacy Analysis:** Verification of the $\hat{\epsilon}$-differential privacy for individual follower agents and the entire MAS network.
* **Numerical Simulations:** MATLAB/Python scripts to reproduce the simulation results presented in the paper, verifying the effectiveness of the proposed methodology.

## Paper Abstract

In this paper, containment control of a group of networked discrete-time dynamical systems has been investigated through differential privacy (DP) and communication constraints in the form of quantization. The networked systems are divided into followers and dynamical reference agents, wherein the followers' dynamical models are a modified version of the Friedkin-Johnsen (F-J) model—a popular model anchored in stochastic matrices for investigating non-consensus behaviour in opinion dynamics, while the reference agents follow affine dynamics. In order for the containment control problem to be private from adversaries, the followers and the reference agents' states are masked with independent and identically distributed (i.i.d.) Laplacian noises before transmitting to other neighbours. The followers can both transmit and receive information from other followers but can only receive communication from reference agents, while the reference agents can both transmit and receive information from other reference agents. On the other hand, in a communication-constraint environment, instead of exchanging the real state values, every follower employs a uniform quantizer with a dynamic encoding-decoding scheme to send the quantized private states out to the other follower neighbour agents. The proposed work attempts to analyse the convergence of the containment control problem, boundedness of the underlying quantization problem, and the differential-privacy achieved by the follower agents with respect to their transmitted quantized observation messages, while at the same time achieving the containment.The simulation results verify the effectiveness of the proposed methodology.

## Installation

This project is primarily implemented in MATLAB, based on the figures provided in the paper.

### MATLAB

1.  **Clone the repository:**
    ```bash
    git clone [https://github.com/your-username/Differentially-Private-Quantized-Containment-Control.git](https://github.com/your-username/Differentially-Private-Quantized-Containment-Control.git)
    cd Differentially-Private-Quantized-Containment-Control
    ```
2.  **Open MATLAB:** Navigate to the cloned directory in MATLAB.
3.  **Run the index.m file:**

    ```matlab
    % In MATLAB command window
    index.m;
    ```

## Usage

The `index.m` script will execute the simulations, generate plots similar to those in the paper (Figures 1-6), and output relevant metrics to the console.

You can modify parameters such as:
* Initial state values of followers and reference agents.
* `W`, `B`, `G` matrices.
* `Theta` matrix.
* Noise parameters (`c_i`, `q_i`).
* Quantization parameters (`p_0`, `zeta`, `r`).

Refer to the comments within the simulation scripts for detailed explanations of each parameter.

