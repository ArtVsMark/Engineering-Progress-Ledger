#!/bin/bash
# SPDX-License-Identifier: MIT — https://github.com/ArtVsMark/Engineering-Pipeline-Mechanisms
# Старт облачной сессии — заготовка механизмов (#1554): интерпретатор планки на месте.
#
# ТОЛЬКО В ОБЛАКЕ. На машине человека окружение его, и ставить туда
# интерпретатор без спроса хук не вправе: признак облака — CLAUDE_CODE_REMOTE.
#
# ЧТО ДЕЛАЕТ ЗАГОТОВКА. Ставит `python$want` из `floor.sh`: им страж толчка
# (`push_guard.sh`) и журнал навыков (`skill_log.sh`) зовут свой код, а без
# него страж закрывает каждый толчок. Установка — `install_floor.sh` рядом,
# общий с хуком старта поставщика. ДОГОВОР С НИМ — `want` и функция `warn`:
# `--update` поднимает `install_floor.sh`, а эту заготовку после первой кладки
# не трогает — она ваша. При подъёме сверьте её с заготовкой поставщика.
#
# СЛОТ ПРОЕКТА — НИЖЕ, В КОНЦЕ. Окружение проверки ВАШЕГО дерева (свой
# `.venv`, инструменты прогонов) заготовка не собирает: состав знает только
# ваше дерево. Допишите сборку там; PATH командам окна отдаёт строка, которую
# тоже допишете вы: `echo "export PATH=…:\$PATH" >> "$CLAUDE_ENV_FILE"`.
#
# СБОЙ НЕ РОНЯЕТ СТАРТ. Всякий отказ — предупреждение с названным шагом и
# выход 0: окно открывается всегда, а не готово только то, что названо.
set -uo pipefail

# Каталог хука — ДО `cd` и абсолютным: при относительном `$0` строка `dirname`
# после смены каталога указывала бы мимо `floor.sh`.
here=$(cd "$(dirname "$0")" && pwd)

warn() {
  echo "старт окна: $1 — окно работает без этого; без python${want:-<планка>} страж толчка закрывает толчок" >&2
}

if [ "${CLAUDE_CODE_REMOTE:-}" != "true" ]; then
  exit 0
fi
cd "$CLAUDE_PROJECT_DIR" || { warn "нет каталога проекта"; exit 0; }

unset want  # не из окружения окна: число только из floor.sh
[ -r "$here/floor.sh" ] || { warn "нет $here/floor.sh — число планки взять неоткуда"; exit 0; }
. "$here/floor.sh"
[ -n "${want:-}" ] || { warn "$here/floor.sh не задаёт want — число планки взять неоткуда"; exit 0; }
[ -r "$here/install_floor.sh" ] || { warn "нет $here/install_floor.sh — интерпретатор планки ставить нечем"; exit 0; }
. "$here/install_floor.sh"

# --- слот проекта: окружение проверки вашего дерева ---
# ПРИКЛАДНОГО КОДА У ЖУРНАЛА НЕТ, окружение проверки — механизмы поставщика:
# их запускатель (`.claude/mechanisms.sh`) и предполётная. Им нужен
# `python$want` С `pyyaml`. Замер окна 29.10.2026: интерпретатор планки стоит
# без `pyyaml` — запускатель падает `ModuleNotFoundError: yaml`; системный
# `python3` ниже планки — `SyntaxError` (PEP 758). Предполётная зовёт блоки
# шагов голым `python` из папки интерпретатора `PYTHON`, и где там `python`
# другой версии (`/usr/local/bin/python3.14` рядом с системным `python`), те же
# `SyntaxError` (поставщик, EPM #1767). Поэтому окружение — venv: в его `bin/`
# `python` и `python3` той же планки. `PATH` отдаёт его окну, `PYTHON` —
# запускателю.
#
# ОКРУЖЕНИЕ — ВНЕ ДЕРЕВА, в кеше окна: оно — окна, а не дерева, и в корне не
# мешает ни `git status`, ни выкачке механизмов. Его `bin/` несёт `python` и
# `python3` планки —
# отдельной прокладки не нужно. Собирается заново, если версия не та или нет
# `pyyaml`.
env_dir="${XDG_CACHE_HOME:-$HOME/.cache}/epl-floor-env"
ready() {
  [ -x "$env_dir/bin/python" ] || return 1
  "$env_dir/bin/python" -c 'import sys, yaml; print("%d.%d" % sys.version_info[:2])' 2>/dev/null | grep -qxF "$want"
}
if ! ready; then
  rm -rf "$env_dir"
  { "python$want" -m venv "$env_dir" && "$env_dir/bin/pip" install -q pyyaml; } \
    || { warn "окружение механизмов на $want с pyyaml не собрано"; exit 0; }
fi
[ -n "${CLAUDE_ENV_FILE:-}" ] || { warn "нет CLAUDE_ENV_FILE — окружение собрано, но командам окна не отдано"; exit 0; }
{
  echo "export PATH=\"$env_dir/bin:\$PATH\""
  echo "export PYTHON=python"
} >> "$CLAUDE_ENV_FILE"
exit 0
