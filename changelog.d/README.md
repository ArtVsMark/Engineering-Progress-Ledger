# Фрагменты журнала изменений

> **Читатель:** тот, кто вносит изменение в журнал.

Каждое изменение несёт фрагмент — файл `changelog.d/<что-изменилось>.<род>.md`;
`CHANGELOG.md` из них собирает выпуск
([030](https://github.com/ArtVsMark/Engineering-Incidents-Playbook/blob/main/rules/ru/030-changelog-from-fragments.md)).
Форма — договор поставщика механизмов: роды, предел тела, строка причины у
`internal` — его
[`changelog.d/README.md`](https://github.com/ArtVsMark/Engineering-Pipeline-Mechanisms/blob/v1.13.0/changelog.d/README.md);
здесь она не пересказывается. Разбирает фрагменты шаг `journal`; пока его класс
`off` (причина — в `.pipeline.yml`), его красное слияния не держит.

Что двигает номер выпуска — [`docs/dev/release.md`](../docs/dev/release.md).
