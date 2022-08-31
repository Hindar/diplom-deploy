# Дипломный проект

1. Подготовка:
* устанавливаем Terraform
* устанавливаем Ansible
* получаем [oauth-токен](https://cloud.yandex.ru/docs/iam/concepts/authorization/oauth-token)

2. Добавляем локально поддержку ansible-коллекций
```
ansible-galaxy collection install kubernetes.core community.general
```

3. Создаем сервера в Yandex Cloud:
```
cd terraform
terraform init
terraform apply
```

4. Полученные данные добавляем в файл 2-config-instance-inventory.txt

5. Запускаем настройку серверов: 
```
ansible-playbook --become -i 2-config-instance-inventory.txt -e @2-config-instance-vars.yml 2-config-instance-playbook.yml 
```

4. Запускаем настройку кластера k8s
```
ansible-playbook -i 2-config-instance-inventory.txt -e @3-config-k8s-vars 3-config-k8s-playbook.yml 
```

5. Добавляем в репозиторий приложения константы элементов чувствительной информации (см. constants.PNG)

6. Запускам сборку контейнера приложения с помощью тэга с номером версии:

```
git tag v0.0.9
git push --tags

```
