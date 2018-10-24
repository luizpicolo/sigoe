# SIAI - Sistema de Apoio Interno

![Sistema de Apoio interno](https://raw.githubusercontent.com/luizpicolo/siai/master/app/assets/images/logo_ifms.png?token=ABT0W4aSOnogYpUeUhFZlcp1WgNYR34Gks5Yv3kuwA%3D%3D)

O SIAI (Sistema de Apoio interno) é um software desenvolvido com o objetivo de auxiliar nos diversos setores do IFMS-NA (Institulo Federal de Mato Grosso do Sul - Campus Nova Andradina).

Este sistema tem como base: Rails 5.1.5 e Ruby 2.5.1.

[![Test Coverage](https://api.codeclimate.com/v1/badges/a99a88d28ad37a79dbf6/test_coverage)](https://codeclimate.com/github/luizpicolo/siai/test_coverage)
[![Build Status](https://travis-ci.org/luizpicolo/siai.svg?branch=master)](https://travis-ci.org/luizpicolo/siai-ifms-na)

## Módulos de Gerenciamento

    - Usuários
    - Senhas
    - Estudantes
    - Setores
    - Cursos
    - Ocorrências

## Como usar

Clone o projeto

    git clone git@github.com:luizpicolo/siai.git

Renomeie os arquivos de configuração

    cp config/database.yml.example config/database.yml &&
    cp config/application.yml.example config/application.yml &&
    cp config/secrets.yml.example config/secrets.yml

Acesso o projeto e execute o comando

    bundle install && rails db:create && rails db:migrate && rails db:seed && ./bin/yarn install

## Iniciando WebService

Para inciar o desenvolvimento local rode: `rails server`

## Rodando Testes

Para executar os testes use: `rspec`

## License

SIAI usa a Licença MIT. Para mais detalhes leia a [Licença de uso](./LICENSE.txt)
