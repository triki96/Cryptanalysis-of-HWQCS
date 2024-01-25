
# Cryptanalysis-of-HWQCS

This repository contains an implementation of the estimates presented in *"Breaking HWQCS: a Code-Based Signature Scheme  from High Weight QC-LDPC Codes"*, by *Alex Pellegrini* and *Giovanni Tognolini*. 

HWQCS (High Weight Code-based Signature Scheme from QC-LDPC Codes) is a Hamming metric code based signature scheme presented at ICISC 2023, which uses quasi-cyclic low density parity check codes (QC-LDPC). The scheme introduces high Hamming weight errors and signs each message using a fresh ephermeral secret key rather than using only one secret key, so to avoid known attacks on QC-LDPC signature schemes. In this implementation, we show that the signatures of HWQCS leak substantial information concerning the ephemeral keys. Furthermore, we manage to completely reconstruct the ephemeral keys of an average of one signature out of twelve. Full details are available at [**link**].

## Usage
The repository is made up of different files, all written in SageMath:

 - *information_leakage.sage* shows the information leakage which affects the ephemeral values of HWQCS.
 - *attack_complete.sage* perform the recovery of the ephemeral values used in HWQCS.

 
To run the main attack, use:
```
sage attack_complete.sage
```


## Comments
Please don't hesitate to notify us of any issues via email at the following email addresses:

 - giovanni[dot]tognolini[at]unitn[dot]it
 - a[dot]pellegrini[at]tue[dot]nl
