# SIGOE - Sistema para o Gerenciamento de Ocorrências Escolares

![Sistema de Apoio interno](https://raw.githubusercontent.com/luizpicolo/sigoe/master/app/assets/images/logo_ifms.png?token=ABT0W4aSOnogYpUeUhFZlcp1WgNYR34Gks5Yv3kuwA%3D%3D)

O SIGOE (Sistema para o Gerenciamento de Ocorrências Escolares) é um software desenvolvido com o objetivo de auxiliar no gerenciamento das ocorrências escolares no IFMS (Institulo Federal de Mato Grosso do Sul).

Este sistema tem como base: Rails 7.0 e Ruby 3.3.0.

[![Test Coverage](https://api.codeclimate.com/v1/badges/a99a88d28ad37a79dbf6/test_coverage)](https://codeclimate.com/github/luizpicolo/sigoe/test_coverage)
![Build Status](https://img.shields.io/circleci/project/github/luizpicolo/sigoe.svg)

## Como usar

Clone o projeto

    git clone git@github.com:luizpicolo/sigoe.git

Renomeie os arquivos de configuração

    cp config/database.yml.example config/database.yml &&
    cp config/application.yml.example config/application.yml &&
    cp config/secrets.yml.example config/secrets.yml

Acesso o projeto e execute o comando

    bundle install && rails db:create && rails db:migrate && rails db:seed && yarn install

## Iniciando WebService

Para inciar o desenvolvimento local rode: `rails server`

## Rodando Testes

Para executar os testes use: `rspec`

## License

SIGOE usa a Licença MIT. Para mais detalhes leia a [Licença de uso](./LICENSE.txt)
