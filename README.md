# IoT Data Platform Release

Релизный репозиторий **IoT Data Platform**.

## Ссылки

| Материал | Ссылка |
|---|---|
| Основной проект | [IoTDataPlatform](https://github.com/IoTDataPlatform) |
| Конструктор платформ | [constructor](https://github.com/IoTDataPlatform/constructor) |
| Статья с описанием проекта | [Habr: Современный дата-стек](https://habr.com/ru/articles/1022970/) |
| План релиза | [RELEASE.md](https://github.com/IoTDataPlatform/iot_data_platform_release/blob/main/RELEASE.md) |
| Безопасность | [SECURITY.md](https://github.com/IoTDataPlatform/iot_data_platform_release/blob/main/SECURITY.md) |

## Инструкции

| Для кого | Документ |
|---|---|
| DevOps: создать VPS, S3 bucket и сервисные аккаунты | [docs/01-cloud-vps-s3](https://github.com/IoTDataPlatform/iot_data_platform_release/tree/main/docs/01-cloud-vps-s3) |
| DevOps: подключиться к VPS и запустить deployment | [docs/02-deployment](https://github.com/IoTDataPlatform/iot_data_platform_release/tree/main/docs/02-deployment) |
| DevOps: настроить read-only доступ к Iceberg/S3 | [docs/03-analyst-s3-read-access](https://github.com/IoTDataPlatform/iot_data_platform_release/tree/main/docs/03-analyst-s3-read-access) |
| SRE: проверить состояние стенда | [docs/04-monitoring](https://github.com/IoTDataPlatform/iot_data_platform_release/tree/main/docs/04-monitoring) |
| Аналитик: выполнить SQL-запросы к данным | [docs/05-analyst](https://github.com/IoTDataPlatform/iot_data_platform_release/tree/main/docs/05-analyst) |


## Демо-проекты на базе платформы

| Демо-проект | Назначение | Репозитории |
|---|---|---|
| Автобусы: обработка прибытий | Транспортный сценарий обработки событий | [scenario](https://github.com/IoTDataPlatform/IoT_Data_Platform_transport_scenario), [backend](https://github.com/IoTDataPlatform/transport_demo_project_backend), [frontend](https://github.com/IoTDataPlatform/transport_demo_project_frontend) |
| Датчики влажности | Оконные агрегации и подсчёт “сухих дней” | [pvz_demo_project](https://github.com/IoTDataPlatform/pvz_demo_project) |
| RICH detector | Фильтрация колец | [richgen_demo_project](https://github.com/IoTDataPlatform/richgen_demo_project) |
| Датчики воздуха | Отслеживание уровня углекислого газа и влажности | [avs_demo_project](https://github.com/IoTDataPlatform/avs_demo_project) |
