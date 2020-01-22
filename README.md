# AVAstr_infra

## (Training Repository OTUS)
---
**<details><summary>03_Homework (Git)</summary>**
**В рамках HW было изучено:**

  * Работа с **`Git`**:
   * Начальные настройки Git
   * Первые Commit и Push
   * Работа с логами Git
   * Откат на определенный commit
   * Решение конфликтов
   * Работа с .gitignore файлом
   * Работа с ветками (branch), с объединением (merge), с перемещением (rebase)
   * Сделал Pull и Push в удаленный репозиторий
   * Сделал Pull Request для проверки HW
</details>

**<details><summary>04_Homework (ChatOps)</summary>**
Описание ДЗ
</details>

**<details><summary>05_Homework (Google Cloud Platform)</summary>**
Описание ДЗ
</details>

**<details><summary>06_Homework (Deploy Test Application)</summary>**
Описание ДЗ
</details>

**<details><summary>07_Homework (Packer)</summary>**
**В рамках HW было изучено:**

  * Работа с **`Packer`**:
   * Создал 2 образа VM (`reddit-base` и `reddit-full`)
   * При развертывании VM из образа `reddit-full`, имеем сразу запущенное приложение, доступное по `<внешний IP>:9292`
</details>

**<details><summary>08_Homework (Terraform-1)</summary>**
**В рамках HW было изучено:**

  * Работа с **`Terraform-1`**:
   * Создал 2 VM
   * Создал балансировщика нагрузки
   * Проверил, что доступность приложения не теряется, при отключении одного из хостов, работающих за балансировщиком.
</details>

**<details><summary>09_Homework (Terraform-2)</summary>**
**В рамках HW было изучено:**

  * Работа с **`Terraform-2`**:
   * Взял под управление, уже созданное без помощи Terraform'a, правило брандмауэра
   * Наблюдал за зависимостью создания и удаления ресурсов
   * Разбил основную конфигурацию на модули
   * Создал два окружения stage и prod
   * Перенес terraform.tfstate файл в облачное хранилище (google_bucket) и протестировал его работу
   * При одновременном развертывании среды stage и prod происходят блокировки файла состояния
</details>

**<details><summary>10_Homework (Ansible-1)</summary>**
**В рамках HW было изучено:**

  * Работа с **`Ansible-1`**:
   * Установил ansible
   * Получил возможность управлять ВМ через ansible
   * Создал inventory файлы (json, yml)
   * После выполнения команды **`ansible app -m command -a 'rm -rf~/reddit'`** и **`ansible-playbook clone.yml`** происходит модификация, т.к. происходит восстановление удаленной директории

</details>
