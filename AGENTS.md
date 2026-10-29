<!-- SPDX-License-Identifier: MIT — https://github.com/ArtVsMark/Engineering-Pipeline-Mechanisms -->
# Журнал прогресса — ядро для любого агента

> **Читатель:** агент — что проект требует от любого агента.

Это ядро журнала прогресса: еженедельные снимки состояния проектов семьи
ArtVsMark, которые только дописываются. Что требуется от **любого** агента —
здесь; надстройка агентского окна Claude Code — [`CLAUDE.md`](CLAUDE.md);
человеку со стороны — [`README.md`](README.md), он же называет устройство
журнала и таблицу снимков
([021](https://github.com/ArtVsMark/Engineering-Incidents-Playbook/blob/main/rules/ru/021-split-docs-by-reader.md)).

**Договор — канон, свод — триггеры.** Как журнал ведёт работу — порядок
источников, ветка, находки в снимке — [`docs/agent/behaviour.md`](docs/agent/behaviour.md);
какие вопросы о журнале задают и каких не задаёт никто — [`docs/dev/directions.md`](docs/dev/directions.md);
договор конвейера — у поставщика механизмов, по тегу из `uses:` прогонов.
Здесь их утверждения не повторяются
([022](https://github.com/ArtVsMark/Engineering-Incidents-Playbook/blob/main/rules/ru/022-one-canonical-document.md),
[029](https://github.com/ArtVsMark/Engineering-Incidents-Playbook/blob/main/rules/ru/029-triggers-and-canon.md)).

**Здесь действуют правила каталога, а не только названное ниже.** Каталог —
[Engineering-Incidents-Playbook](https://github.com/ArtVsMark/Engineering-Incidents-Playbook),
указатель — [`rules/README.md`](https://github.com/ArtVsMark/Engineering-Incidents-Playbook/blob/main/rules/README.md).
Ядро называет поимённо лишь то, что нарушается чаще всего; остальное окно
обязано найти само, и «в своде не было» причиной не считается
([134](https://github.com/ArtVsMark/Engineering-Incidents-Playbook/blob/main/rules/ru/134-a-window-reopens-only-after-the-rulebook-exists.md)).

**Чужое «почему» — ссылка, а не копия**
([153](https://github.com/ArtVsMark/Engineering-Incidents-Playbook/blob/main/rules/ru/153-foreign-why-is-a-link-not-a-copy.md)).
Инцидент, из которого выросло правило, живёт в каталоге. Здесь — формулировка
и адрес.

## 🚦 Критические запреты

```
❌ НЕ писать в общую ветку напрямую — только изменением через ветку
❌ НЕ открывать изменение учётными данными агента: автором в общей ветке
   станет приложение, и переписать это нечем (131)
❌ НЕ пересказывать договор в своде и в README — только ссылка (022)
❌ НЕ вписывать числа в прозу без маркера и сборки, которая их переписывает
   (222); замер с названной датой — факт своего дня и числом в прозе не
   считается, а число, которое читается как нынешнее состояние, — считается
❌ НЕ пушить в ветку чужого изменения — её ведёт своё окно
```

Запреты журнала:

```
❌ НЕ править, не удалять и не переименовывать вышедший снимок в snapshots/
   и не убирать его дату или ссылку из таблицы README — ошибку в снимке
   исправляет следующий снимок (043); держит джоб snapshots в ci.yml
❌ НЕ править копии механизмов — пути, названные в .claude/kit-laid.json
   (хуки и навыки окна): правленая копия отказывает обновлению (090).
   Хук старта .claude/hooks/session-start.sh — не копия: его слот свой
```

Адреса: [043](https://github.com/ArtVsMark/Engineering-Incidents-Playbook/blob/main/rules/ru/043-decisions-are-superseded-not-edited.md),
[090](https://github.com/ArtVsMark/Engineering-Incidents-Playbook/blob/main/rules/ru/090-shared-helpers-move-up-not-sideways.md) — внутри блока ссылка не
работает.

**Журнал публичен, а снимок не правится**: однажды положенное остаётся в
истории. Что можно класть в открытый репозиторий, судит роль приватности во
взгляде ([`docs/agent/roles.md`](docs/agent/roles.md)); правила каталога на это
нет, и запретом без адреса оно здесь не подменяется.

Часть этих запретов **машинно не проверяется**: гейт видит имя ветки, но не
намерение. Они записаны явно именно поэтому, а не потому что «и так понятно»
([057](https://github.com/ArtVsMark/Engineering-Incidents-Playbook/blob/main/rules/ru/057-unmechanizable-rules-are-named-explicitly.md)).

## 🕳 Чего в проекте ещё нет

**Объявленные пробелы — исходы «артефакта нет» и «роли нет» карты
[`docs/dev/directions.md`](docs/dev/directions.md)**; отдельного списка
пробелов у журнала нет. Отсутствующий гейт и молчащий снаружи неотличимы,
поэтому пробел называется, а не выравнивается
([046](https://github.com/ArtVsMark/Engineering-Incidents-Playbook/blob/main/rules/ru/046-name-the-gaps-do-not-level-them.md)).

## 🔌 Транспорт к площадке

**Самый дешёвый из доступных, и цена операции проверяется до того, как на ней
построен конвейер**
([001](https://github.com/ArtVsMark/Engineering-Incidents-Playbook/blob/main/rules/ru/001-transport-rest-not-graphql.md),
[017](https://github.com/ArtVsMark/Engineering-Incidents-Playbook/blob/main/rules/ru/017-measure-quota-do-not-guess.md)).
Разница между транспортами бывает трёхсоткратной, и обнаруживается она на
конвейере, который уже написан.

Своего транспорта у журнала нет: свой код — только `bash` в шагах и хуке старта,
к площадке он не ходит. Общие шаги ходят к площадке
транспортом поставщика, прибитым тем же тегом, что и `uses:`. Окно ходит тем,
что ему дано, и **называет чем** в описании изменения.

## 🔑 Секреты: чем держатся и когда истекают

Секрет — единственная часть механизма, которую окно не может ни увидеть, ни
починить. Истёкший токен снаружи выглядит как сломанный скрипт: «изменения
перестали открываться» будут искать в коде, а искать надо в дате. Поэтому дата
записана здесь, а не живёт в памяти владельца.

| секрет | что держит | истекает | продлевает |
|---|---|---|---|
| `MERGE_QUEUE_TOKEN` | операции от лица владельца: открытие изменения (`agent-pr`), слияние (`automerge`), выпуск, дрейф и другие — полный список печатает `grep -rl 'secrets.MERGE_QUEUE_TOKEN' .github/workflows/` | срок не записан — вписывает владелец | владелец, `ArtVsMark` |
| `CLAUDE_CODE_OAUTH_TOKEN` | внешний взгляд и ответ по обращению: `review`, `claude`, `task-items` | срок не записан — вписывает владелец | владелец, `ArtVsMark` |

**Что происходит без секрета — объявлено, а не выясняется отказом.** Шаг
открытия предупреждает и выходит третьим исходом, ревью не состоится и скажет
об этом; красным ни то, ни другое не становится: необязательный канал не
роняет основную работу
([084](https://github.com/ArtVsMark/Engineering-Incidents-Playbook/blob/main/rules/ru/084-best-effort-channels-never-block-the-main-path.md)).

## 🌿 Ветка, изменение, коммит

**Ветка режется от `origin/main`**, а при красной общей ветке — от последнего
зелёного её коммита: [`docs/agent/behaviour.md`](docs/agent/behaviour.md),
контур 1.

**Ветку, выданную средой, работой не считают.** Облачное окно получает при
старте ветку вида `claude/<имя-окна>`: это след запуска, а не задача. Работа
режется в свою `agent/<задача>` — подробности механики окна в
[`CLAUDE.md`](CLAUDE.md).

**Одна тема на изменение**
([132](https://github.com/ArtVsMark/Engineering-Incidents-Playbook/blob/main/rules/ru/132-one-change-carries-one-topic.md)),
границу задаёт пересечение файлов, а не число задач
([133](https://github.com/ArtVsMark/Engineering-Incidents-Playbook/blob/main/rules/ru/133-file-overlap-sets-the-boundary.md)).

**Автор коммита — человек, агент — соавтор.** Трейлеры живут в хвостовом
блоке, а не в любой строке сообщения
([156](https://github.com/ArtVsMark/Engineering-Incidents-Playbook/blob/main/rules/ru/156-trailers-live-in-the-tail-not-in-the-prose.md)).
Подпись сверяется **до слияния**: площадка собирает итоговый коммит сама, а
историю общей ветки не переписать
([123](https://github.com/ArtVsMark/Engineering-Incidents-Playbook/blob/main/rules/ru/123-attribution-is-verified-on-the-final-history.md)).

## 🎯 Открытая работа

Окно не выбирает, чем заняться: источники упорядочены, и **первый непустой и
есть план**
([091](https://github.com/ArtVsMark/Engineering-Incidents-Playbook/blob/main/rules/ru/091-work-sources-are-ordered-first-non-empty-wins.md)).

Порядок источников — [`docs/agent/behaviour.md`](docs/agent/behaviour.md),
контур 1; собранный по нему план — живая задача с маркером `work-plan`, и
работают по нему навыком `work-the-plan`.

**Задача больше чем на один этап заводится с чек-листом.** Иначе отмечать
нечего: площадка умеет только полное закрытие, и `Closes` унесёт несделанные
этапы вместе с задачей. Изменение, делающее часть, называет сделанное строкой
в своём теле:

```
Refs #25
Закрывает пункт: <текст пункта>
```

Пункт называется **текстом**, а не номером строки: номер сдвигается от любой
правки тела задачи. Формулировать его надо коротко и устойчиво — тем же
приёмом, что отпечаток находки ревью.

`Closes` при незакрытых пунктах отвергает гейт разметки. Задача **без**
чек-листа закрывается свободно: там один этап, и список был бы ритуалом
([154](https://github.com/ArtVsMark/Engineering-Incidents-Playbook/blob/main/rules/ru/154-none-must-name-its-reason.md)).

Трекер — единственный источник статусов. В файлы дерева он не дублируется, и
**журнала работ в действующих документах нет**
([024](https://github.com/ArtVsMark/Engineering-Incidents-Playbook/blob/main/rules/ru/024-no-worklog-in-active-docs.md)):
что сделано — видно по закрытым задачам и журналу изменений, а не по разделу
«история» в своде.

## 📮 Недоработка механизма — задачей поставщику

Механизмы конвейера общие у семьи, и чинятся они у поставщика, а не правкой
своей копии: правленая копия отказывает обновлению `--update` целиком. Нашли
недоработку — задача поставщику по шаблону, по роду случая:

- [затор](https://github.com/ArtVsMark/Engineering-Pipeline-Mechanisms/issues/new?template=consumer-jam.yml) — конвейер встал, слить нельзя;
- [пробел](https://github.com/ArtVsMark/Engineering-Pipeline-Mechanisms/issues/new?template=consumer-gap.yml) — случился инцидент, которого конвейер не ловит;
- [расхождение](https://github.com/ArtVsMark/Engineering-Pipeline-Mechanisms/issues/new?template=consumer-mismatch.yml) — механизм есть, но у вас не подходит.

## 📓 Новое правило — в общий каталог

Правило, выстраданное здесь, записывается в
[каталог](https://github.com/ArtVsMark/Engineering-Incidents-Playbook) **тем же
заходом**, что и правка свода: здесь остаётся формулировка и ссылка, инцидент и
границы применимости живут там
([080](https://github.com/ArtVsMark/Engineering-Incidents-Playbook/blob/main/rules/ru/080-every-new-rule-goes-into-the-catalogue.md)).
Канал предложений — очередь предложений каталогу (ключ `proposals` таблицы путей).

Не идёт в каталог то, у чего не нашлось инцидента: это предпочтение, а не
правило.

**Обобщение — по третьему случаю.** Один особый случай потребителя не правит
общий механизм: шов вводится рано, обобщение поздно
([093](https://github.com/ArtVsMark/Engineering-Incidents-Playbook/blob/main/rules/ru/093-seam-early-generalisation-late.md)).

## ✅ Перед толчком

```
bash .claude/preflight.sh
```

Механизмы по тегу из `uses:` прогонов журнала, их же предполётная против его
дерева. Прогоняет то же, что прогонит площадка, и печатает, **чего проверить не
может**: разметку изменения, атрибуцию по истории, внешний взгляд. Свой джоб
журнала `snapshots` она не гоняет: его проверяют откатом в обе стороны на
изменении, которое его трогает. Красное класса `off` толчка не держит.

Красное чинится ДО толчка. Цена обратного названа прямо: цикл площадки и
доверие ревьюера — один проверенный толчок дешевле трёх пробных.
