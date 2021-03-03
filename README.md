# API OCTAPAY

Com essa API você poderá:

- Ver suas vendas na OctaPay;
- Filtrar pedidos:
- - por produto
- - por data da transação
- - por data finalizada
- - por status
- - por número de pedido ou transação
- - por forma de pagamento

Dados retornados
````
{
    "produto": {
        "codigo": "12832",
        "nome": "Curso Teste",
        "preco": "0.00"
    },
    "plano": {
        "codigo": "12832",
        "nome": "Curso Teste",
        "preco": "0.00",
        "qtd_itens": 1
    },
    "venda": {
        "transacao": "1234",
        "dataPedido": "2015-01-31 10:30:38",
        "dataFinalizada": null,
        "formaPagamento": "Cartão de crédito",
        "statusTransacao": "Aguardando pagamento",
        "parcelas": 1,
        "url_checkout": "",
        "link_boleto": "",
        "linha_digitavel": "",
        "data_vencimento_boleto": "",
        "valor_produto": "2490.00",
        "valor_bruto": "2242.49",
        "valor_frete": "0.00",
        "valor_desconto": 0.00,
        "valor_liquido": 0.00,
        "campanha": null,
        "src": "",
        "utm_source": "",
        "utm_medium": "",
        "utm_content": "",
        "utm_campaign": ""
    },
    "afiliado": 
    {
        "nome": "Carlos Roberto Silva",
        "telefone": "",
        "email": ""
    },
    "comprador": {
        "nome": "Cliente Demonstração",
        "email": "cliente@octa.com.br",
        "cnpj_cpf": "012.345.678.90",
        "telefone": "3131660838",
        "cep": "33000000",
        "rua": "Rua Demonstração",
        "numero": "110",
        "complemento": "1",
        "bairro": "Centro",
        "cidade": "Governador Valadares",
        "estado": "MG",
        "pais": "BR"
    },
    "produtor": {
        "cnpj_cpf": "01.234.567/0001-89",
        "nome": "Produtor Demonstração",
        "telefone": "",
        "email": ""
    }, 
   "total_registros": "1",
   "paginas": 1
}
````
