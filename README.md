[![Code Climate](https://codeclimate.com/github/ifms-na/siai-ifms-na.png)](https://codeclimate.com/github/luizpicolo/siai-ifms-na)
[![Build Status](https://travis-ci.org/ifms-na/siai-ifms-na.svg?branch=master)](https://travis-ci.org/luizpicolo/siai-ifms-na)

![](https://raw.githubusercontent.com/ifms-na/siai-ifms-na/master/app/assets/images/logo_ifms.png?token=ABT0W4aSOnogYpUeUhFZlcp1WgNYR34Gks5Yv3kuwA%3D%3D)


# SIAI - Sistema de Apoio Interno

![Em Desenvolvimento](http://messages.hellobits.com/success.svg?message=Em%20Desenvolvimento)

Este sistema tem como base: Rails 5.0.2 e Ruby 2.3.1.

O SIAI (Sistema de Apoio interno) é um software desenvolvido com o objetivo de auxiliar nos diversos setores do IFMS-NA (Institulo Federal de Mato Grosso do Sul - Campus Nova Andradina).

## Módulos

 - Gerenciamento de usuários
 - Gerenciamento de senhas
 - Gerenciamento de estudantes
 - Gerenciamento de setores
 - Gerenciamento de cursos

## Como usar

**Primeiro passo:** Clone o projeto

    git clone git@github.com:luizpicolo/siai-ifms-na.git

**Segundo passo:** Renomeie os arquivos de configuração

    cp config/database.yml.example config/database.yml &&
    cp config/application.yml.example config/application.yml &&
    cp config/secrets.yml.example config/secrets.yml

**Terceiro passo:** Acesso o projeto e execute o comando

    bundle install && rails db:create && rails db:migrate && rails db:seed && ./bin/yarn install

## Testes

Para executar os testes use

    rspec

## License

SIAI usa a Licença MIT. Para mais detalhes https://github.com/ifms-na/siai-ifms-na
/blob/master/LICENSE.txt
