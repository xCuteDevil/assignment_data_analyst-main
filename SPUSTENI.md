# Jak spustit analýzu (pro kontrolující)

## Požadavky

- **Python 3.9 nebo novější** (ověřeno s 3.9+; 3.10–3.12 je v pořádku).
- Nástroj **pip** (součást běžné instalace Pythonu).

Na **macOS** může systémový / starší Python hlásit `NotOpenSSLWarning` od `urllib3` 2.x (SSL z `LibreSSL`). V `requirements.txt` je proto omezení `urllib3<2`. Trvalejší řešení je Python z [python.org](https://www.python.org/downloads/), **Homebrew** (`brew install python`) nebo **pyenv**, kde je OpenSSL novější.

## 1. Klonování a vstup do složky projektu

```bash
git clone https://github.com/xCuteDevil/assignment_data_analyst-main.git
cd assignment_data_analyst-main
```

## 2. Virtuální prostředí (doporučeno)

Izoluje závislosti od systémového Pythonu.

**macOS / Linux:**

```bash
python3 -m venv .venv
source .venv/bin/activate
```

**Windows (cmd):**

```bat
python -m venv .venv
.venv\Scripts\activate.bat
```

**Windows (PowerShell):**

```powershell
python -m venv .venv
.\.venv\Scripts\Activate.ps1
```

Po aktivaci uvidíte v terminálu prefix `(.venv)`.

## 3. Instalace závislostí

```bash
pip install -U pip
pip install -r requirements.txt
```

## 4. Spuštění Jupyter Lab

Spouštějte z **kořene repozitáře** (tam, kde leží `Pressure.csv` a `pumping_analysis.ipynb`).

```bash
jupyter lab
```

V prohlížeči otevřete soubor **`pumping_analysis.ipynb`** a postupně spusťte buňky (**Run → Run All Cells** nebo postupně **Shift+Enter**).

V Cursoru / VS Code lze notebook spustit přímo, pokud je jako kernel vybrán interpreter z `.venv` (Python: Select Interpreter → `.venv/bin/python`).

## 5. Co se může při běhu vytvořit

- Složka **`html/`** s exportovanými interaktivními grafy (Plotly) — při čisté instalaci z gitu nemusí existovat; vytvoří se po spuštění příslušných buněk.
- Lokální soubory pod **`iframe_figures/`** (náhledy Plotly v Jupyteru) — obvykle ignorované v `.gitignore` (`*.html`).

Na výsledek analýzy to nemá vliv, pokud máte `Pressure.csv` a spuštěný notebook.

## `ModuleNotFoundError` (např. `statsmodels`)

Znovu nainstalujte závislosti (aktivované `.venv`):

```bash
pip install -r requirements.txt
```

V Jupyteru / Cursoru zkontrolujte, že je vybraný **kernel z `.venv`** (ne jiný systémový Python).

## Deaktivace venv

```bash
deactivate
```

---

**Shrnutí:** `python3 -m venv .venv` → aktivace → `pip install -r requirements.txt` → `jupyter lab` → otevřít `pumping_analysis.ipynb` z kořene projektu.

## Rychlé spuštění (volitelné)

Projekt lze spustit i pomocí skriptu:

bash run_clean_test.sh

Skript automaticky provede všechny potřebné kroky:

- naklonuje repozitář do nové složky
- vytvoří virtuální prostředí
- nainstaluje všechny potřebné závislosti (viz requirements.txt)
- spustí Jupyter Lab v prohlížeči

Instalace závislostí může při prvním spuštění trvat 1–3 minuty.

Po otevření Jupyteru v prohlížeči:

- otevřete soubor pumping_analysis.ipynb
- spusťte všechny buňky (Run → Run All Cells nebo Shift+Enter)