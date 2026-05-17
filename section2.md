## Rekap Section 2: Storage Factory

---

### 1. Deploy Contract dari Contract
```solidity
SimpleStorage newStorage = new SimpleStorage();
```
> Satu contract bisa **melahirkan** contract lain menggunakan `new`

---

### 2. Import
```solidity
import {SimpleStorage} from "./SimpleStorage.sol";
```
> Supaya bisa pakai contract dari file lain — **tidak perlu tulis ulang**

---

### 3. Array of Contract
```solidity
SimpleStorage[] public simpleStorages;
```
> Simpan banyak contract dalam array supaya **tidak tertimpa** dan bisa diakses by index

---

### 4. Interaksi antar Contract
Butuh 2 hal:

| Yang dibutuhkan | Fungsinya |
|---|---|
| **Address** | Dimana contract-nya |
| **ABI** | Function apa yang bisa dipanggil |

```solidity
simpleStorages[_index].store(_number);
```

---

### 5. Inheritance
```solidity
contract AddFiveStorage is SimpleStorage {}
```
> Child otomatis mewarisi semua state variable dan function parent — **tidak perlu duplicate kode**

---

### 6. Virtual & Override

| Keyword | Dimana | Artinya |
|---|---|---|
| `virtual` | Parent | *"boleh diubah turunan"* |
| `override` | Child | *"aku mengubah function parent"* |

---

### Konsep Besar Section Ini:

> **Composability** — contract bisa saling berinteraksi, mewarisi, dan membangun di atas satu sama lain. Inilah yang membuat DeFi sangat powerful. 🔥