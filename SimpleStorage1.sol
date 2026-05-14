// Tantangan diterima! Mari kita bedah satu per satu pertanyaan tersebut dengan gaya yang santai tapi tetap teknis.

// ---

// ### 1. Perbedaan Variabel dan Value

// **Variabel** adalah sebuah **wadah** atau nama yang kita berikan untuk menyimpan sesuatu di memori. Sedangkan **Value** (Nilai) adalah **isi** dari wadah tersebut.

// * **Analogi:** Variabel adalah sebuah "Gelas", dan Value adalah "Air" di dalamnya. Gelasnya tetap sama, tapi isinya bisa kamu ganti dari air putih menjadi kopi.
// * **Contoh Kode:** `uint256 x = 100;`
// * `x` adalah **Variabel**.
// * `100` adalah **Value**.



// ---

// ### 2. Default Value (Nilai Bawaan) di Solidity

// Di Solidity, jika kamu tidak mengisi sebuah variabel, dia akan otomatis memiliki nilai bawaan (bukan `undefined` atau `null` seperti di bahasa lain).

// | Tipe Data | Default Value | Penjelasan |
// | --- | --- | --- |
// | **bool** | `false` | Kondisi mati/salah secara default. |
// | **uint** | `0` | Angka bulat positif dimulai dari nol. |
// | **int256** | `0` | Sama seperti uint, dimulai dari nol. |
// | **string** | `""` | String kosong (tanpa karakter). |
// | **address** | `0x0000...0000` | Alamat kosong (disebut juga *zero address*). |
// | **bytes** | `0x` | Data mentah kosong (panjangnya nol). |
// | **bytes32** | `0x00...00` | 32 byte yang semuanya berisi nol. |

// ---

// ### 3. Perbedaan `uint` dan `bytes`

// Secara teknis di memori, keduanya bisa berukuran sama (256 bit), tapi **cara kita menggunakannya** sangat berbeda:

// * **`uint` (Unsigned Integer):** Digunakan untuk **Matematika**. Kamu memakai ini jika ingin melakukan operasi tambah, kurang, kali, atau bagi (contoh: menghitung saldo atau umur).
// * **`bytes`:** Digunakan untuk **Data Mentah**. Kamu memakai ini untuk menyimpan informasi yang bukan angka, seperti kode rahasia, gambar, atau file. Kamu tidak bisa melakukan "tambah" atau "kurang" pada tipe data bytes secara langsung.

// ---

// ### 4. Smart Contract Challenge

// Berikut adalah contoh Smart Contract sederhana dengan 5 tipe data yang berbeda di *storage*:

// ```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MyStorageContract {
    // 1. Tipe data angka bulat (Default: 0)
    uint256 public myNumber = 42;

    // 2. Tipe data teks (Default: "")
    string public myName = "Ibnu";

    // 3. Tipe data alamat dompet (Default: 0x0...)
    address public owner = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;

    // 4. Tipe data benar/salah (Default: false)
    bool public isActive = true;

    // 5. Tipe data tetap 32 byte (Default: 0x0...)
    bytes32 public secretID = 0xabc1230000000000000000000000000000000000000000000000000000000000;
}

// ```