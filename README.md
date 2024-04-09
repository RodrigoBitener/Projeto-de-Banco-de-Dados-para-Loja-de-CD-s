# Projeto de Banco de Dados para Loja de CD's

O projeto visa criar e gerenciar um banco de dados para uma loja de CD's, permitindo o armazenamento e recuperação de informações sobre CDs, artistas, clientes, pedidos e outras entidades relacionadas ao funcionamento da loja.

Este projeto é baseado no curso de MySQL: "Criando e Manipulando Banco de Dados" da IMPACTA.

**Nota:** Todos os dados sensíveis, incluindo informações de clientes, pedidos e quaisquer outros dados pessoais, são **fictícios** e foram criados apenas para fins de demonstração e prática.

![image](https://github.com/RodrigoBitener/Projeto-de-Banco-de-Dados-para-Loja-de-CD-s/assets/111039192/e58826e7-7471-4012-9c07-ee8a0fe69c33)

## Diagrama do Projeto

Este diagrama tem como objetivo facilitar a visualização dos campos relacionados no projeto de banco de dados para uma loja de CD's.

É possível observar que a tabela de **pedidos** é o principal campo, onde a partir dele se desdobra a relação com outras entidades essenciais, como clientes, títulos (CDs), e outras tabelas relacionadas aos pedidos.

Cada entidade está devidamente conectada, mostrando a integração entre os diferentes aspectos do funcionamento da loja. Por exemplo, os pedidos estão vinculados aos clientes que os fizeram e aos títulos_pedidos dos CDs solicitados em cada pedido.

Esse diagrama proporciona uma visão clara e organizada da estrutura do banco de dados, ajudando no desenvolvimento, manutenção e compreensão do sistema como um todo.

## Entidades Principais:

- **CDs (Títulos)**: Esta entidade armazena informações sobre os CDs disponíveis na loja, incluindo título, preço, quantidade em estoque, gravadora associada e categoria do CD.
- **Artistas**: Registra os artistas associados aos CDs, permitindo a associação de múltiplos artistas a cada CD.
- **Gravadoras**: Armazena detalhes das gravadoras que produzem os CDs, permitindo o rastreamento dos CDs produzidos por cada gravadora.
- **Categorias**: Define as categorias ou gêneros dos CDs, ajudando na organização e classificação dos produtos na loja.
- **Clientes**: Mantém informações sobre os clientes da loja, como nome e endereço.
- **Pedidos**: Registra os pedidos feitos pelos clientes, incluindo os CDs solicitados, data do pedido e informações do cliente.
- **Títulos Pedidos**: Relaciona os CDs solicitados em cada pedido, permitindo o rastreamento dos CDs vendidos em cada transação.

## Funcionalidades Principais:

- **Cadastro de CDs**: Permite adicionar novos CDs ao estoque da loja, fornecendo informações como título, preço, quantidade em estoque, gravadora e categoria.
- **Associação de Artistas**: Permite associar um ou mais artistas a cada CD, permitindo aos clientes pesquisar e filtrar CDs por artistas específicos.
- **Gerenciamento de Clientes**: Possibilita o cadastro e manutenção de informações dos clientes, incluindo histórico de pedidos e detalhes de contato.
- **Processamento de Pedidos**: Permite registrar novos pedidos, associando os CDs solicitados a cada pedido e atualizando automaticamente o estoque.
- **Relatórios de Vendas**: Fornece relatórios detalhados sobre as vendas, incluindo informações como produtos mais vendidos, clientes frequentes e desempenho geral da loja.

## Benefícios:

- Melhora a eficiência operacional, permitindo o processamento mais rápido e preciso de pedidos dos clientes.
- Fornece insights valiosos sobre o desempenho da loja e preferências dos clientes por meio de relatórios detalhados.
- Facilita a personalização da experiência do cliente, permitindo recomendações de produtos com base no histórico de compras e preferências individuais.

## Conclusão:

O projeto de banco de dados para uma loja de CD's oferece uma solução abrangente para gerenciar as operações relacionadas à venda de CDs, desde o cadastro de produtos até o processamento de pedidos e relatórios de vendas. Com uma estrutura bem definida e funcionalidades principais implementadas, o sistema proporciona maior eficiência e controle sobre as atividades da loja, contribuindo para o sucesso do negócio e satisfação dos clientes.
