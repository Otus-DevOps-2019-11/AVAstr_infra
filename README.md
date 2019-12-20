# AVAstr_infra
AVAstr Infra repository

.....

Домашняя работа: "Знакомство с облачной инфраструктурой"

  - Самостоятельное задание
  Описание: Исследовать способ подключения к someinternalhost в одну команду из
  вашего рабочего устройства, проверить работоспособность найденного решения и
  внести его в README.md в вашем репозитории

  - Дополнительное задание:Предложить вариант решения для подключения из консоли
  при помощи команды вида ssh someinternalhost из локальной консоли рабочего устройства,
  чтобы подключение выполнялось по алиасу someinternalhost и внести его в README.md в
  вашем репозитории

	Решение:
	Необходимо пробросить сквозное подключение на локальной машинке, через bastion хост. Создаем файл конфигурации ~/.ssh/config и вносим в него соответствующие изменения:

	Host *
	 ForwardAgent yes
	Host bastion
	 HostName 34.77.154.52
	 User appuser
	 IdentityFile ~/.ssh/appuser

	Host someinternalhost
	 HostName 10.132.0.3
	 ProxyJump bastion
	 User appuser
	 IdentityFile ~/.ssh/appuser

	После мы получаем возможность подключаться к ВМ someinternalhost через команду "ssh someinternalhost" напрямую с локальной машины.
