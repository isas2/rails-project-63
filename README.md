### Hexlet tests and linter status:
[![Hexlet Check](https://github.com/isas2/rails-project-63/actions/workflows/hexlet-check.yml/badge.svg)](https://github.com/isas2/rails-project-63/actions)
[![CI](https://github.com/isas2/rails-project-63/actions/workflows/lint-test.yml/badge.svg)](https://github.com/isas2/rails-project-63/actions)

# HexletCode

Генератор HTML-форм.
Gem автоматизации создания и рендеринга HTML-форм.

## Установка зависимостей

```sh
make install
```

## Запуск тестов

```sh
make test
```

## Запуск проверки синтаксиса

```sh
make lint
make lint-fix
```

## Использование

Генерация полей на основе данных переданного объекта:
```ruby
User = Struct.new(:name, :job, :gender, keyword_init: true)
user = User.new name: 'rob', job: 'hexlet', gender: 'm'

HexletCode.form_for user do |f|
  f.input :name
  f.input :job, as: :text
end
```

Указание дополнительных атрибутов и переопределение значений по умолчанию 
```ruby
HexletCode.form_for user, url: '/users' do |f|
  f.input :name, class: 'user-input'
  f.input :job, as: :text, rows: 50, cols: 50
  f.submit 'Wow'
end
```

## Лицензия

[MIT License](https://opensource.org/licenses/MIT).
