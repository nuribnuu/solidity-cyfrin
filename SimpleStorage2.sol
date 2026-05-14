// Tantangan yang bagus! Mari kita bedah satu per satu untuk memastikan pemahamanmu semakin solid sebelum lanjut ke modul berikutnya.

// ---

// ### 1. Empat Keyword Visibility

// Visibility menentukan siapa yang bisa memanggil fungsi atau mengakses variabel tersebut.

// * **`public`**: Bisa diakses dari mana saja (dalam kontrak, kontrak luar, dan oleh pengguna/UI). Secara otomatis membuat *getter function* jika digunakan pada variabel.
// * **`private`**: Hanya bisa diakses oleh kontrak tempat ia ditulis. Kontrak lain atau kontrak turunan tidak bisa memanggilnya.
// * **`internal`**: Bisa diakses oleh kontrak tersebut dan semua kontrak yang merupakan turunannya (*children contracts*). Ini adalah *default visibility* untuk variabel jika tidak ditulis.
// * **`external`**: Hanya bisa diakses dari luar kontrak. Fungsi ini tidak bisa dipanggil oleh fungsi lain di dalam kontrak yang sama (kecuali menggunakan `this.namaFungsi()`).

// ---

// ### 2. Perbedaan `view` vs `pure`

// Keduanya tidak mengubah data di blockchain (*non-state-changing*), tetapi tingkat aksesnya berbeda:

// * **`view`**: Boleh **membaca** data dari *storage* (seperti membaca variabel global) tetapi tidak boleh mengubahnya.
// * **`pure`**: Tidak boleh **membaca maupun menulis** ke *storage*. Ia hanya bekerja berdasarkan input yang diberikan ke dalam fungsi tersebut.

// ---

// ### 3. Kapan fungsi `pure` membayar Gas?

// Meskipun fungsi `pure` (dan `view`) gratis jika dipanggil dari luar (lewat Remix/Wallet/Website), mereka **tetap memakan Gas** jika:

// * Fungsi tersebut dipanggil oleh fungsi lain di dalam sebuah **transaksi** yang mengubah data (*state-changing transaction*).
// * Misalnya, jika fungsi `store` (yang berbayar) memanggil fungsi `pure` untuk menghitung sesuatu, maka kerja komputer untuk menjalankan fungsi `pure` tersebut akan dihitung ke dalam total tagihan Gas transaksi tersebut.

// ---

// ### 4. Apa itu Scope?

// **Scope** adalah batasan di mana sebuah variabel dapat dikenali dan digunakan. Variabel yang dibuat di dalam sebuah fungsi tidak bisa digunakan di luar fungsi tersebut.

// **Contoh Scope yang Salah:**

// ```solidity
// function hitung() public pure {
//     uint256 hasil = 10 + 10;
// }

// function panggilHasil() public pure returns(uint256) {
//     return hasil; // ERROR: 'hasil' tidak dikenal di sini karena berada di scope fungsi hitung()
// }

// ```

// ---

// ### 5. Deploy Kontrak vs Transfer ETH

// * **Deploy Kontrak**: Transaksi ini mengirimkan *bytecode* kontrak ke alamat kosong (`0x0`). Ini sangat mahal karena node harus membuat entri baru di blockchain, menjalankan kode inisialisasi, dan menyimpan kode tersebut secara permanen.
// * **Transfer ETH**: Transaksi sederhana yang hanya memindahkan saldo dari alamat A ke B. Node hanya perlu melakukan penambahan dan pengurangan saldo tanpa menjalankan logika yang rumit, sehingga biayanya jauh lebih murah (standar 21.000 Gas).

// ---

// ### 🧑‍💻 Smart Contract Challenge

// Berikut adalah kode kontrak yang memenuhi ketiga syarat fungsi yang kamu minta:

// ```solidity
// // SPDX-License-Identifier: MIT
// pragma solidity ^0.8.0;

// contract VisibilityTest {
//     uint256 private number = 100;

//     // 1. View function - hanya bisa diakses kontrak ini sendiri (private)
//     function lihatAngkaInternal() private view returns (uint256) {
//         return number;
//     }

//     // 2. Pure function - tidak bisa diakses dari dalam kontrak sendiri (external)
//     function hitungLuar(uint256 a, uint256 b) external pure returns (uint256) {
//         return a + b;
//     }

//     // 3. View function - bisa diakses oleh kontrak ini dan turunannya (internal)
//     function untukAnakCucu() internal view returns (uint256) {
//         return number;
//     }
// }

// ```

// **Penjelasan Singkat:**

// * `lihatAngkaInternal` menggunakan **`private`** sehingga hanya fungsi lain di kontrak ini yang bisa memanggilnya.
// * `hitungLuar` menggunakan **`external`** sehingga jika kamu mencoba memanggilnya dari fungsi lain di dalam kontrak ini, compiler akan error.
// * `untukAnakCucu` menggunakan **`internal`** sehingga kontrak lain yang melakukan `contract Anak is VisibilityTest` bisa menggunakan fungsi ini.