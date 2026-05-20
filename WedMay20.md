## Rekap Section: First Security Review

---

### 1. Onboarding Protocol
Sebelum audit, tanya 7 hal wajib ke client: About, Setup, Testing, Scope, Compatibilities, Roles, Known Issues. Kalau client hanya kasih Etherscan link → **tolak dulu.**

---

### 2. Ukur Kompleksitas Codebase
Pakai **CLOC** dan **Solidity Metrics** untuk hitung baris kode & estimasi waktu audit. Mulai dari contract **terkecil** dulu.

---

### 3. Fase Audit
```
Initial Review → Scoping → Recon → Cari Bug → Laporan
Protocol Fixes → Developer perbaiki + tambah test
Mitigation Review → Cek ulang perbaikan → Laporan final
```

---

### 4. The Tincho Method
Baca docs dulu, catat langsung di kode, mulai dari contract kecil, switch ke mindset adversarial, timebox diri sendiri.

---

### 5. Bug yang Ditemukan di PasswordStore
```
[H-1] setPassword tidak ada access control
      → siapapun bisa ganti password

[H-2] Password disimpan on-chain
      → siapapun bisa baca lewat blockchain

[I-1] NatSpec getPassword salah
      → dokumentasi tidak sesuai kode
```

---

### 6. Severity Matrix

|  | High Impact | Medium Impact | Low Impact |
|---|---|---|---|
| **High Likelihood** | H | H/M | M |
| **Medium Likelihood** | H/M | M | M/L |
| **Low Likelihood** | M | M/L | L |

---

### 7. Template Finding Report
```
[S-#] TITLE (Root Cause + Impact)
Description    → jelaskan vulnerability
Impact         → dampaknya apa
Proof of Concept → bukti kode exploit
Recommended Mitigation → cara fix
```

---

### 8. Tools Tambahan
**Pandoc + LaTeX** → convert markdown report ke PDF profesional untuk portfolio GitHub.

---

> **Timeboxing** — audit bisa dilakukan selamanya, tapi efisiensi waktu adalah kunci menjadi security researcher yang baik.


## Rekap Belajar Hari Ini

---

### 1. Fuzz Testing
- **Invariant** = aturan yang tidak boleh dilanggar
- **Stateless fuzzing** = state reset tiap run, keyword `testFuzz_`
- **Stateful fuzzing** = state dilanjutkan, keyword `invariant_`
- Stateful lebih powerful karena bisa detect bug 2+ langkah

---

### 2. ABI Encoding
- Setiap transaksi di blockchain dikirim sebagai biner
- `data field` = tempat menyimpan fungsi yang dipanggil
- `call` dan `staticcall` = cara kirim transaksi low-level
- Method ID = fungsi yang sudah di-encode jadi hex

---

### 3. Upgradeable Smart Contracts
- **Proxy pattern** = pisahkan state (proxy) dan logic (implementation)
- **delegatecall** = jalankan kode contract B di storage contract A
- Storage layout harus sama persis — kalau tidak → data rusak

---

### 4. `selfdestruct`
- Hapus contract + paksa kirim ETH ke alamat manapun
- Bisa bypass `receive`/`fallback` function
- Jangan andalkan `address(this).balance` untuk logika penting

---

### 5. Smart Contract Security Review
- Istilah yang benar: **security review**, bukan audit
- 3 fase: Initial Review → Protocol Fixes → Mitigation Review
- Security = perjalanan, bukan endpoint

---

### 6. Tools Security
- **Static Analysis** → Slither, Aderyn
- **Fuzz Testing** → Foundry
- **Formal Verification** → Certora
- 80% bug tidak bisa dideteksi tools → human auditor tetap utama

---

### 7. Audit Readiness & Scoping
- Rekt Test = 12 pertanyaan sebelum protocol layak diaudit
- Etherscan-only codebase = red flag, tolak dulu
- Tanya 7 hal wajib: About, Setup, Testing, Scope, Compatibilities, Roles, Known Issues

---

### 8. The Tincho Method
- Baca docs dulu
- Catat langsung di kode
- Mulai dari contract terkecil
- Switch ke mindset adversarial
- Timebox diri sendiri

---

### 9. Vulnerability & Severity
- **Access control bug** = tidak ada pengecekan `msg.sender`
- **On-chain privacy bug** = data blockchain selalu publik
- Severity = Impact × Likelihood (matrix H/M/L)

---

### 10. Konsep Pendukung
- `assert` = pastikan kondisi benar, kalau tidak → stop
- `assertEq` = bandingkan dua nilai, kalau beda → stop
- `forge coverage` = ukur seberapa banyak kode yang dites
- **NatSpec** = dokumentasi standar Solidity (`@notice`, `@param`, dll)
- **Docker container** = isolasi kode tidak dikenal agar komputer aman
- **On-chain vs Off-chain** = blockchain publik vs server private

---

> Hari ini kamu sudah cover dari dasar fuzz testing sampai melakukan security review pertama. Kerja keras banget! 🔥