# Security

## Подход

Данные — основной актив платформы, поэтому в релизе используем принцип **least privilege** и элементы **zero-trust**.

Для оценки угроз используем модель **STRIDE**: подмена, изменение данных, раскрытие информации, отказ в обслуживании и повышение привилегий.

---

## Угрозы и меры защиты

| Угроза | STRIDE | Риск | Мера защиты | Статус |
|---|---|---|---|---|
| Kafbat UI доступен из интернета | Information Disclosure / Elevation of Privilege | Можно просматривать Kafka topics, metadata и данные | Kafbat UI доступен только через SSH tunnel | В релизе |
| Kafka Connect REST API доступен извне | Tampering / Elevation of Privilege | Можно создать или изменить connector | REST API доступен только внутри Docker network / VPS | В релизе |
| Лишние Docker ports опубликованы наружу | Information Disclosure | Внутренние сервисы становятся публичными | В production compose публикуются только необходимые порты | В релизе |
| S3 credentials попали в Git | Information Disclosure | Компрометация bucket и Iceberg warehouse | В Git хранится только `.env.example`, реальные значения только в `.env` | В релизе |
| `.env` случайно закоммичен | Information Disclosure | Утечка ключей и паролей | `.env` добавлен в `.gitignore` | В релизе |
| Сервис имеет избыточный доступ к S3 | Tampering / Elevation of Privilege | Можно изменить или удалить лишние данные | Использовать отдельные ключи с минимальными правами на нужный bucket/prefix | Рекомендовано |
| Аналитики имеют write-доступ к данным | Tampering | Можно повредить Iceberg metadata или data files | Для аналитиков создавать отдельные read-only SQL accounts | Рекомендовано |
| Секреты видны в логах или на скриншотах | Information Disclosure | Ключи могут попасть в документацию или CI logs | Перед публикацией проверять logs/screenshots, секреты скрывать | В релизе |
| Используются простые/default пароли | Spoofing / Elevation of Privilege | Несанкционированный доступ | Пароли задаются через `.env`, не использовать `admin/admin`, `123`, `password` | В релизе |

---

## Проверки перед публикацией релиза

| Проверка | Команда / действие | Ожидаемый результат |
|---|---|---|
| Проверить опубликованные порты | `docker compose ps` | Наружу не опубликованы административные сервисы |
| Проверить listening ports на VPS | `ss -tulpn` | Нет лишних сервисов на публичном интерфейсе |
| Проверить Kafbat UI снаружи | `curl http://VPS_PUBLIC_IP:8080` | `connection refused` или `timeout` |
| Проверить доступ к Kafbat через tunnel | `ssh -L 8080:localhost:8080 user@VPS_PUBLIC_IP` | UI доступен локально на `http://localhost:8080` |
| Проверить секреты в Git | `git grep -n "S3_SECRET_KEY\|AWS_SECRET_ACCESS_KEY\|password\|secret\|access_key"` | Нет реальных секретов |
| Проверить `.gitignore` | `cat .gitignore` | `.env`, `*.pem`, `*.key`, `*.crt` исключены |
| Проверить скриншоты | ручная проверка | На скриншотах нет ключей, паролей и токенов |

---

## Рекомендации для сервисов поверх платформы

Эти пункты относятся к будущим приложениям, API и dashboard-сервисам, которые будут использовать данные платформы.

| Риск | Что делать |
|---|---|
| Внешнее API отдаёт сырые данные без авторизации | Добавлять AuthN/AuthZ и отдавать только разрешённые данные |
| API возвращает слишком много данных | Использовать pagination, limits, фильтры по времени и tenant/project |
| Нет лимитов на запросы | Добавлять rate limiting, timeouts, caching |
| В логах оказываются секреты | Не логировать access keys, tokens, passwords, authorization headers |
| Сервис использует административные credentials | Создавать отдельный service account с минимальными правами |
| Приложение имеет write-доступ без необходимости | Для read-only сценариев выдавать только read-доступ |
| Приложение имеет доступ ко всему warehouse | Ограничивать доступ конкретным dataset, table или bucket/prefix |
