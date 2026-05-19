## 📓 Catatan Lengkap: Fuzz Testing & Web3 Security

---

## 1. INVARIANT

Properti yang **harus selalu benar** apapun yang terjadi.

```solidity
// Invariant: shouldAlwaysBeZero harus SELALU = 0
uint256 public shouldAlwaysBeZero = 0;
```

`assert()` = cara menulis invariant dalam kode.
Kalau dilanggar → **langsung stop & error.**

```solidity
assert(nilai == 0); // ✅ benar → lanjut
assert(nilai == 1); // ❌ salah → STOP! bug ditemukan
```

---

## 2. FUZZING

Daripada test manual satu-satu → **kasih ribuan input random otomatis** untuk mencoba melanggar invariant.

Atur jumlah runs di `foundry.toml`:
```toml
[fuzz]
runs = 256  # makin besar = makin luas cakupan
```

> ⚠️ Fuzzing tidak exhaustive — tidak coba semua kemungkinan input.

---

## 3. STATELESS FUZZING

```solidity
function testFuzz_AlwaysZero(uint256 data) public {
    exampleContract.doStuff(data);
    assert(exampleContract.shouldAlwaysBeZero() == 0);
}
```

- Kamu yang tentukan fungsi mana dipanggil
- State **direset** tiap run
- Foundry hanya randomkan nilai inputnya
- Cocok untuk bug **1 langkah**

---

## 4. STATEFUL FUZZING

```solidity
// setUp
targetContract(address(exampleContract));

// invariant test
function invariant_AlwaysZero() public {
    assert(exampleContract.shouldAlwaysBeZero() == 0);
}
```

- Foundry yang tentukan fungsi mana dipanggil (random)
- State **dilanjutkan** antar run
- Cocok untuk bug yang butuh **urutan 2+ langkah**

---

## 5. PERBANDINGAN LENGKAP

| | Stateless | Stateful |
|---|---|---|
| **Keyword** | `testFuzz_` | `invariant_` |
| **Parameter** | Ada (`uint256 data`) | Tidak ada |
| **Fungsi dipanggil** | Kamu tentukan | Foundry random |
| **State** | Reset tiap run | Dilanjutkan |
| **Bug 1 langkah** | ✅ | ✅ |
| **Bug 2+ langkah** | ❌ | ✅ |
| **Kendali** | Kamu | Foundry |

---

## 6. PERSIAPAN TOOLS

| Kebutuhan | Tool |
|---|---|
| IDE | VSCode / VSCodium |
| Framework | Foundry (utama) |
| Windows | Wajib WSL |
| AI Helper | Phind / ChatGPT |
| Komunitas | GitHub, Eth Stack Exchange, Peeranha |

**Command dasar Foundry:**
```shell
forge init     # buat project baru
forge build    # compile
forge test     # jalankan test
foundryup      # update Foundry
```

---

## 7. KESIMPULAN AKHIR

```
Manual test → hanya cek skenario yang kamu pikirkan
Fuzz test   → cek ribuan skenario otomatis

Stateless   → robot pikun, state direset
Stateful    → robot ingat, state dilanjutkan
```

> *"Stateful fuzzing adalah standar baru web3 security — bisa menemukan high severity vulnerability yang tidak terpikirkan secara manual."*

> *"Hal terburuk sebagai security researcher adalah berpura-pura tahu sesuatu yang tidak kamu mengerti."*