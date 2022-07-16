// https://docs.circom.io/getting-started/installation/
// install nodejs and npm
//    install latest js and npm on ubuntue 18 LTS
// install dependacy
//    curl --proto '=https' --tlsv1.2 https://sh.rustup.rs -sSf | sh
// install circom and snarkjs
//    sudo npm install circom
//    sudo npm install snarkjs

template Multiplier() {
    signal private input a;
    signal private input b;
    signal output c;

    c <== a*b;
}

component main = Multiplier();
