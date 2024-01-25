# Cryptanalysis-of-HWQCS

Cryptanalysis of HWQCS (High Weight Code-based Signature Scheme from QC-LDPC Codes)

We analyze HWQCS, a Hamming metric code based signature scheme  
presented at ICISC 2023, which uses quasi-cyclic low density parity check codes  
(QC-LDPC). The scheme introduces high Hamming weight errors and signs each  
message using a fresh ephermeral secret key rather than using only one secret  
key, so to avoid known attacks on QC-LDPC signature schemes. In this implementation,  
we show that the signatures of HWQCS leak substantial information concerning  
the ephemeral keys. Furthermore, we manage to completely reconstruct the ephemeral keys of an average of one signature out of twelve. Full details are available in [put link].
