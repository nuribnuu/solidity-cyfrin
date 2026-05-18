## Rekap Section 3: FundMe

---

### Special Functions — tanpa keyword `function`:

| Function | Kapan jalan |
|---|---|
| `constructor()` | Sekali saat deploy |
| `receive()` | ETH masuk + data kosong |
| `fallback()` | Ada data tapi function tidak ada |

---

### Hemat gas:

| Keyword | Nilai ditentukan | Naming |
|---|---|---|
| `constant` | Saat compile | `NAMA_VARIABLE` |
| `immutable` | Saat deploy | `i_namaVariable` |

---

### Konsep penting yang dipelajari:

```
✅ payable         → function bisa terima ETH
✅ msg.value       → berapa ETH yang dikirim
✅ msg.sender      → siapa yang kirim transaksi
✅ require         → validasi kondisi
✅ revert          → batalkan transaksi
✅ custom error    → error hemat gas
✅ modifier        → reusable access control
✅ for loop        → iterasi array
✅ mapping         → key → value
✅ array           → daftar data
✅ constructor     → setup awal saat deploy
✅ receive         → tangani ETH tanpa data
✅ fallback        → tangani semua kondisi lain
✅ Chainlink       → ambil harga ETH/USD
✅ interface       → interaksi contract lain
✅ import          → pakai kode dari file lain
```

---

### Contract FundMe final:

```
Data:
- MINIMUM_USD (constant)
- i_owner (immutable)
- funders (array)
- addressToAmountFunded (mapping)
- priceFeed (interface Chainlink)

Functions:
- constructor()     → set owner + priceFeed
- fund()            → terima ETH, validasi minimum $5
- withdraw()        → owner tarik semua ETH
- getLatestPrice()  → ambil harga ETH dari Chainlink
- getConversionRate() → konversi ETH → USD
- receive()         → redirect ke fund()
- fallback()        → redirect ke fund()
```

---

> **Kamu sudah kuasai dasar-dasar Solidity!** 🔥
> Selanjutnya → Foundry & advanced Solidity features 🚀