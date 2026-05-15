## Kaidah yang Kamu Dapat Sejauh Ini

---

### 1. Tentukan lokasi data
| Dimana | Aturan |
|---|---|
| Luar function | Otomatis `storage` |
| Dalam function — value types | Otomatis `stack`, tidak perlu keyword |
| Dalam function — reference types | Wajib tulis `memory` atau `calldata` |

---

### 2. Pilih memory vs calldata
| Kondisi | Pakai |
|---|---|
| Input perlu diubah | `memory` |
| Input tidak perlu diubah | `calldata` |

---

### 3. Pilih storage pointer vs memory
| Kondisi | Pakai |
|---|---|
| Mau ubah data asli | `storage pointer` |
| Mau olah data tanpa ubah aslinya | `memory` |

---

### 4. Tentukan view / pure / kosong
| Kondisi | Pakai |
|---|---|
| Mengubah storage | kosong |
| Membaca storage | `view` |
| Hanya olah parameter | `pure` |

---

### 5. Tentukan visibility
| Kondisi | Pakai |
|---|---|
| Bisa diakses siapa saja | `public` |
| Hanya contract sendiri + turunan | `internal` |
| Hanya contract sendiri | `private` |
| Hanya dari luar contract | `external` |

---

### 6. Wajib tulis keyword (calldata/memory) di mana saja reference type muncul dalam function
Parameter, variabel lokal, maupun `returns (...)` — konsisten.

---

### 7. Struct hanya blueprint
Struct tidak punya visibility — visibility baru muncul saat membuat variabelnya.

## Cara Pikirnya

Tanya satu pertanyaan sederhana:

> **"Siapa yang butuh akses ke ini?"**

---

### `beli` → `public`
Karena **user dari luar** yang memanggil ini — ini adalah aksi utama contract.
```
user (luar) → beli() ✅
```

---

### `hitungTotal` → `private`
Karena **hanya dipakai di dalam contract ini saja** — user tidak perlu tahu cara hitungnya, cukup tahu hasilnya.
```
beli() → hitungTotal() ✅
user → hitungTotal() ❌ tidak perlu
```

---

### `totalPenjualan` → `private`
Karena **tidak ada rencana contract lain atau turunan yang perlu baca data ini.**

---

### Kenapa bukan `internal`?

| | `private` | `internal` |
|---|---|---|
| Contract sendiri | ✅ | ✅ |
| Contract turunan | ❌ | ✅ |

> `internal` dipilih kalau kamu **berencana membuat turunan** dari contract ini yang butuh akses.

Contoh kapan pakai `internal`:
```solidity
contract Toko {
    uint256 internal totalPenjualan; // turunan boleh akses
}

contract TokoOnline is Toko {
    function lihatTotal() public view returns (uint256) {
        return totalPenjualan; // bisa akses karena internal ✅
    }
}
```

---

### Kaidah simpelnya:

> Belum ada rencana inheritance → **`private`**
> Ada rencana inheritance → **`internal`**

---

## Kesalahan yang Ditemukan:

---

### 1. Tidak baca soal dengan teliti
`addItem` — soal bilang **"stock awal selalu 0"** tapi kamu jadikan parameter:
```solidity
// ❌ kamu
function addItem(string calldata _name, uint256 _price, uint256 _stock)

// ✅ benar
function addItem(string calldata _name, uint256 _price)
```

---

### 2. Parameter tidak perlu dioper dari luar
`updatePrice` — kamu minta `_price` dari user padahal harga sudah ada di storage:
```solidity
// ❌ kamu — user bisa oper harga sembarang
function updatePrice(uint256 _index, uint256 _price, uint256 _discount)

// ✅ benar — ambil dari storage langsung
function updatePrice(uint256 _index, uint256 _discount)
```

---

### Pola kesalahannya sama:

> **Kurang teliti membaca soal + belum terbiasa berpikir "data yang dibutuhkan sudah ada di mana?"**

---

### Tips ke depan:

Sebelum nulis kode, tanya dulu:
1. **Apa yang diminta soal?** — baca ulang
2. **Data yang dibutuhkan sudah ada di storage?** — kalau sudah, tidak perlu jadi parameter