// SPDX-License-Identifier: MIT
pragma solidity 0.8.34;

contract SimpleStorage {

}

// 1. What is an IDE and Remix's Main Features?

// IDE stands for Integrated Development Environment. It is software that provides comprehensive facilities to programmers for software development, typically consisting of a source code editor, build automation tools, and a debugger.

// Remix IDE Main Features:

// Browser-based: No local setup required.

// Integrated Compiler: Instant support for various Solidity versions.

// Remix VM: A simulated blockchain environment in the browser for fast testing.

// Debugger: Visual tool to track transaction execution step-by-step.

// 2. The Use of the pragma Keyword

// The pragma keyword specifies which Solidity compiler version should be used for the source file. This prevents the code from being compiled with a version that might introduce incompatible changes.

// 3. What is Compiling a Contract?

// The Ethereum Virtual Machine (EVM) cannot execute Solidity code directly. Compiling is the process of translating high-level Solidity code into:

// Bytecode: The machine code deployed on the blockchain.

// ABI (Application Binary Interface): A JSON-like map that allows external applications (like a website) to interact with the contract's functions.

// 4. Empty Contract Code Example

// Solidity
// pragma solidity >=0.8.11 <=0.8.13;
// contract MyEmptyContract {

// // This contract is empty but valid for compilation

// }