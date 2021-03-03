<?php
header("Content-type: text/html; charset=utf-8");
// Orienta��es para utiliza��o da API de emiss�o / consulta / atualiza��o / exclus�o de notas fiscais do Notazz.
// Linguagem: PHP
// Vers�o: 1.0.0

function send_data($fields)
{
	$fields = array("fields"=>$fields);
	$fields_string = '';
	
	//url-ify the data for the POST
	foreach($fields as $key=>$value)
	{
		$fields_string .= $key.'='.$value.'&';
	}
	
	rtrim($fields_string, '&');
	
	//open connection
	$ch = curl_init();
	
	//set the url, number of POST vars, POST data
	curl_setopt($ch,CURLOPT_URL, 'https://app.notazz.com/api');
	curl_setopt($ch,CURLOPT_POST, count($fields));
	curl_setopt($ch,CURLOPT_POSTFIELDS, $fields_string);
	curl_setopt($ch,CURLOPT_RETURNTRANSFER, TRUE);
	curl_setopt($ch,CURLOPT_SSL_VERIFYPEER, FALSE);
	
	//execute post
	$response = curl_exec($ch);
	
	//close connection
	curl_close($ch);
	
	//Convertendo json para array
	$pos = strpos($response, '{');
	
	return(json_decode(substr($response, $pos), true));
}

/*
M�todos dispon�veis: 
	NFS-e (Nota Fiscal de Servi�o)
	 - create_nfse (cria nota de servi�o)
	 - consult_nfse (consulta nota fiscal de servi�o individual)
	 - consult_all_nfse (consulta v�rias notas de servi�o)
	 - update_nfse (atualiza os dados da nota de servi�o, s� � poss�vel atualizar dados de uma nota com o status = Pendente ou Rejeitada)
	 - delete_nfse (exclui nota fiscal de servi�o n�o autorizada)
	 
	NF-e (Nota Fiscal de Produto - Modelo 55)
	 - create_nfe_55 (cria nota de produto)
	 - consult_nfe_55 (consulta nota de produto individual)
	 - consult_all_nfe_55 (consulta v�rias notas de produto)
	 - update_nfe_55 (atualiza os dados da fiscal de produto, s� � poss�vel atualizar dados de uma nota com o status = Pendente ou Rejeitada) 
	 - delete_nfe_55 (exclui nota fiscal de produto n�o autorizada) 	 

	Status dispon�veis na consulta de uma nota: 
	 - Pendente = Nota fiscal est� cadastrada no sistema mas ainda n�o ocorreu nenhuma itera��o com a mesma
	 - AguardandoAutorizacao = A nota foi enviada para a SEFAZ / Prefeitura mas ainda n�o tivemos o retorno dela
	 - Autorizada = Nota fiscal emitida e autorizada pela SEFAZ / Prefeitura
	 - Rejeitada = Nota fiscal foi rejeitada pela SEFAZ / Prefeitura. Nesse caso a API retorna o motivo da rejei��o
	 - Cancelada = Nota fiscal foi cancelada na SEFAZ / Prefeitura

	Observa��o: a api faz um controle de requisi��es por minuto, sendo que a cada 1 minuto dever� ocorrer no m�ximo 100 requisi��es.
*/

//Cria uma nota fisca de servi�o
function create_nfse()
{
	$fields = json_encode(array(
		'API_KEY' => 'SUA CHAVE DE API',//Sua chave de acesso API_KEY. Para obter a chave, acesse o menu Configura��es > Empresas. Cada empresa ter� sua chave de comunica��o com a API
		'METHOD' => 'create_nfse',//M�todo a ser utilizado
		
		'DESTINATION_NAME' => 'Jose Maria da Silva',// Nome completo do cliente
		'DESTINATION_TAXID' => '35281474588',//CPF ou CNPJ, somente n�meros
		'DESTINATION_IE' => '',//Inscri��o Estadual (opcional), somente n�meros
		'DESTINATION_IM' => '',//Inscri��o Municipal (opcional), somente n�meros
		'DESTINATION_TAXTYPE' => 'F',//F = F�sica, J = Jur�dica, E = Estrangeiro
		'DESTINATION_STREET' => 'Rua de teste',//Rua do cliente
		'DESTINATION_NUMBER' => '123',//N�mero
		'DESTINATION_COMPLEMENT' => 'Pr�ximo a escola municipal floriano peixoto',//Complemento
		'DESTINATION_DISTRICT' => 'Centro',//Bairro
		'DESTINATION_CITY' => 'Belo Horizonte',//Cidade, informar corretamente o nome da cidade sem abrevia��es
		'DESTINATION_UF' => 'MG',//Sigla do estado
		'DESTINATION_ZIPCODE' => '35560000',//CEP, somente n�meros
		'DESTINATION_PHONE' => '31999998888',//Telefone do cliente (opcional), somente n�meros
		'DESTINATION_EMAIL'	=> 'test@test.com',//E-mail do cliente (opcional)
		
		'DESTINATION_EMAIL_SEND' => array(
			'1'	=> array(
				'EMAIL' => 'mail1@example.com',
			),
			
			'2'	=> array(
				'EMAIL' => 'mail2@example.com'
			)
		),//e-mail(s) que ser� enviado a nota depois de emitida (opcional).

		
		'DOCUMENT_BASEVALUE' => '100.00',//Valor total da nota fiscal. Utilizar ponto para separar as casas decimais
		'DOCUMENT_DESCRIPTION' => 'Presta��o de Servi�o em consultoria',//Descri��o da nota fiscal (obrigat�rio somente para o m�todo create_nfse e update_nfse)
		'DOCUMENT_COMPETENCE' => date("Y-m-d"), //Compet�ncia (opcional), se n�o informado ou informado inv�lido ser� utilizado a data de hoje. Utilizar o padr�o YYYY-mm-dd
		'DOCUMENT_CNAE' => '8599604', //CNAE, somente n�meros (opcional), se n�o informado ou informado inv�lido ser� utilizado o padr�o das configura��es da empresa. Documenta��o: http://www.cnae.ibge.gov.br
		'SERVICE_LIST_LC116' => '0802', //Item da Lista de Servi�o da Lei Complementar 116 (opcional), somente n�meros. Caso n�o seja informado ser� utilizado o padr�o da empresa. Documenta��o: http://www.fazenda.mg.gov.br/empresas/legislacao_tributaria/ricms/anexoxiii2002.pdf
		'WITHHELD_ISS' => '0', // ISS retido na fonte (opcional). 1 = Retido e 0 = N�o retido. Se n�o informado ou informado inv�lido ser� utilizado o padr�o das configura��es da empresa 
		'CITY_SERVICE_CODE' => '12345', // C�digo de servi�o do munic�pio (opcional), somente n�meros. Se n�o seja informado ser� utilizado o padr�o da empresa
		
		'ALIQUOTAS' => array(
			'COFINS' => '0.00', // Porcentagem (%) - Utilizar ponto para separar as casas decimais
			'CSLL' => '0.00', // Porcentagem (%) - Utilizar ponto para separar as casas decimais
			'INSS' => '0.00', // Porcentagem (%) - Utilizar ponto para separar as casas decimais
			'IR' => '0.00', // Porcentagem (%) - Utilizar ponto para separar as casas decimais
			'PIS' => '0.00', // Porcentagem (%) - Utilizar ponto para separar as casas decimais
			'ISS' => '2.00', // Porcentagem (%) - Utilizar ponto para separar as casas decimais
		), // Opcional - se n�o informado ou informado inv�lido ser� utilizado o padr�o das configura��es da empresa 
		
		'EXTERNAL_ID' => '89678678', // ID externo do documento que ser� enviado		
	));
	
	$retorno = send_data($fields);//Chamada do m�todo de envio, retorna os dados em array
}

//Atualiza uma nota fiscal de servi�o j� criada e n�o transmitida
function update_nfse()
{
	$fields = json_encode(array(
		'API_KEY' => 'SUA CHAVE DE API',//Sua chave de acesso API_KEY. Para obter a chave, acesse o menu Configura��es > Empresas. Cada empresa ter� sua chave de comunica��o com a API
		'METHOD' => 'update_nfse',//M�todo a ser utilizado
		
		'DESTINATION_NAME' => 'Jose Maria da Silva',// Nome completo do cliente
		'DESTINATION_TAXID' => '35281474588',//CPF ou CNPJ, somente n�meros
		'DESTINATION_IE' => '',//Inscri��o Estadual (opcional), somente n�meros
		'DESTINATION_IM' => '',//Inscri��o Municipal (opcional), somente n�meros
		'DESTINATION_TAXTYPE' => 'F',//F = F�sica, J = Jur�dica, E = Estrangeiro
		'DESTINATION_STREET' => 'Rua de teste',//Rua do cliente
		'DESTINATION_NUMBER' => '123',//N�mero
		'DESTINATION_COMPLEMENT' => 'Pr�ximo a escola municipal floriano peixoto',//Complemento
		'DESTINATION_DISTRICT' => 'Centro',//Bairro
		'DESTINATION_CITY' => 'Belo Horizonte',//Cidade, informar corretamente o nome da cidade sem abrevia��es
		'DESTINATION_UF' => 'MG',//Sigla do estado
		'DESTINATION_ZIPCODE' => '35560000',//CEP, somente n�meros
		'DESTINATION_PHONE' => '31999998888',//Telefone do cliente (opcional), somente n�meros
		'DESTINATION_EMAIL'	=> 'test@test.com',//E-mail do cliente (opcional)
		
		'DESTINATION_EMAIL_SEND' => array(
			'1'	=> array(
				'EMAIL' => 'mail1@example.com',
			),
			
			'2'	=> array(
				'EMAIL' => 'mail2@example.com'
			)
		),//e-mail(s) que ser� enviado a nota depois de emitida (opcional).
		
		'DOCUMENT_BASEVALUE' => '100.00',//Valor total da nota fiscal. Utilizar ponto para separar as casas decimais
		'DOCUMENT_DESCRIPTION' => 'Presta��o de Servi�o em consultoria',//Descri��o da nota fiscal (obrigat�rio somente para o m�todo create_nfse e update_nfse)
		'DOCUMENT_COMPETENCE' => date("Y-m-d"), //Compet�ncia (opcional), se n�o informado ou informado inv�lido ser� utilizado a data de hoje. Utilizar o padr�o YYYY-mm-dd		
		'DOCUMENT_CNAE' => '8599604', //CNAE, somente n�meros (opcional), se n�o informado ou informado inv�lido ser� utilizado o padr�o das configura��es da empresa. Documenta��o: http://www.cnae.ibge.gov.br
		'SERVICE_LIST_LC116' => '0802', //Item da Lista de Servi�o da Lei Complementar 116 (opcional), somente n�meros. Caso n�o seja informado ser� utilizado o padr�o da empresa. Documenta��o: http://www.fazenda.mg.gov.br/empresas/legislacao_tributaria/ricms/anexoxiii2002.pdf
		'WITHHELD_ISS' => '0', // ISS retido na fonte (opcional). 1 = Retido e 0 = N�o retido. Se n�o informado ou informado inv�lido ser� utilizado o padr�o das configura��es da empresa 
		'CITY_SERVICE_CODE' => '12345', // C�digo de servi�o do munic�pio (opcional), somente n�meros. Se n�o seja informado ser� utilizado o padr�o da empresa
		
		'ALIQUOTAS' => array(
			'COFINS' => '0.00', // Porcentagem (%) - Utilizar ponto para separar as casas decimais
			'CSLL' => '0.00', // Porcentagem (%) - Utilizar ponto para separar as casas decimais
			'INSS' => '0.00', // Porcentagem (%) - Utilizar ponto para separar as casas decimais
			'IR' => '0.00', // Porcentagem (%) - Utilizar ponto para separar as casas decimais
			'PIS' => '0.00', // Porcentagem (%) - Utilizar ponto para separar as casas decimais
			'ISS' => '2.00', // Porcentagem (%) - Utilizar ponto para separar as casas decimais
		), // Opcional - se n�o informado ou informado inv�lido ser� utilizado o padr�o das configura��es da empresa 
				
		'DOCUMENT_ID' => '4ed0f528ded523d2681e3f9688d63d26',//C�digo retornado pelo sistema ap�s utilizar o m�todo create_nfse ou create_nfe_55. Utilizar esta vari�vel para o m�todo consult_nfe_55, consult_nfse, delete_nfe_55, delete_nfse, update_nfe_55, update_nfse
		'EXTERNAL_ID' => '89678678', // ID externo do documento que ser� atualizado		
	));
	
	$retorno = send_data($fields);//Chamada do m�todo de envio, retorna os dados em array
}

//Consulta uma nota fiscal de servi�o individualmente pelo seu id
function consult_nfse()
{
	$fields = json_encode(array(
		'API_KEY' => 'SUA CHAVE DE API',//Sua chave de acesso API_KEY. Para obter a chave, acesse o menu Configura��es > Empresas. Cada empresa ter� sua chave de comunica��o com a API
		'METHOD' => 'consult_nfse',//M�todo a ser utilizado
		'DOCUMENT_ID' => '4ed0f528ded523d2681e3f9688d63d26',//C�digo retornado pelo sistema ap�s utilizar o m�todo create_nfse ou create_nfe_55. Utilizar esta vari�vel para o m�todo consult_nfe_55, consult_nfse, delete_nfe_55, delete_nfse, update_nfe_55, update_nfse
		'EXTERNAL_ID' => '89678678', // ID externo do documento que ser� consultado		
	));
	
	$retorno = send_data($fields);//Chamada do m�todo de envio, retorna os dados em array
}

//Consulta v�rias notas fiscais de servi�o de acordo com os filtros configurados
function consult_all_nfse()
{
	$fields = json_encode(array(
		'API_KEY' => 'SUA CHAVE DE API',//Sua chave de acesso API_KEY. Para obter a chave, acesse o menu Configura��es > Empresas. Cada empresa ter� sua chave de comunica��o com a API
		'METHOD' => 'consult_all_nfse',//M�todo a ser utilizado
		'FILTER' => array(
			'INITIAL_DATE' => '2017-01-01', // Data Inicial. Campo obrigat�rio, enviar no formato yyyy-mm-dd
			'FINAL_DATE' => '2017-01-01', // Data Final. Campo obrigat�rio, enviar no formato yyyy-mm-dd
			'STATUS' => 'Autorizada', // Status da nota fiscal. Campo opcional
			'NUMBER' => '25', // N�mero da nota fiscal j� autorizada ou cancelada. Campo opcional
		)
	));
	
	$retorno = send_data($fields);//Chamada do m�todo de envio, retorna os dados em array
}

//Cancela uma nota fiscal de servi�o que j� foi autorizada
function cancel_nfse()
{
	$fields = json_encode(array(
		'API_KEY' => 'SUA CHAVE DE API',//Sua chave de acesso API_KEY. Para obter a chave, acesse o menu Configura��es > Empresas. Cada empresa ter� sua chave de comunica��o com a API
		'METHOD' => 'cancel_nfse',//M�todo a ser utilizado
		'DOCUMENT_ID' => '4ed0f528ded523d2681e3f9688d63d26',//C�digo retornado pelo sistema ap�s utilizar o m�todo create_nfse ou create_nfe_55. Utilizar esta vari�vel para o m�todo consult_nfe_55, consult_nfse, delete_nfe_55, delete_nfse, update_nfe_55, update_nfse
		'EXTERNAL_ID' => '89678678', // ID externo do documento que ser� cancelado		
	));
	
	$retorno = send_data($fields);//Chamada do m�todo de envio, retorna os dados em array
}

//Exclui uma nota fiscal de servi�o que ainda n�o foi autorizada
function delete_nfse()
{
	$fields = json_encode(array(
		'API_KEY' => 'SUA CHAVE DE API',//Sua chave de acesso API_KEY. Para obter a chave, acesse o menu Configura��es > Empresas. Cada empresa ter� sua chave de comunica��o com a API
		'METHOD' => 'delete_nfse',//M�todo a ser utilizado
		'DOCUMENT_ID' => '4ed0f528ded523d2681e3f9688d63d26',//C�digo retornado pelo sistema ap�s utilizar o m�todo create_nfse ou create_nfe_55. Utilizar esta vari�vel para o m�todo consult_nfe_55, consult_nfse, delete_nfe_55, delete_nfse, update_nfe_55, update_nfse
		'EXTERNAL_ID' => '89678678', // ID externo do documento que ser� removido		
	));
	
	$retorno = send_data($fields);//Chamada do m�todo de envio, retorna os dados em array
}

//Consulta se uma cidade est� atendida pela nossa API
function cidades_atendidas()
{
	$fields = json_encode(array(
		'API_KEY' => 'SUA CHAVE DE API',//Sua chave de acesso API_KEY. Para obter a chave, acesse o menu Configura��es > Empresas. Cada empresa ter� sua chave de comunica��o com a API
		'METHOD' => 'cidades_atendidas',//M�todo a ser utilizado
		'FILTER' => array(
			'STATE' => 'MG', // Sigla do estado
			'CITY' => 'Belo Horizonte', // Sigla da cidade
		)
	));
	
	$retorno = send_data($fields);//Chamada do m�todo de envio, retorna os dados em array
}

//Cria uma nota fiscal de produto
function create_nfe_55()
{
	$fields = json_encode(array(
		'API_KEY' => 'SUA CHAVE DE API',//Sua chave de acesso API_KEY. Para obter a chave, acesse o menu Configura��es > Empresas. Cada empresa ter� sua chave de comunica��o com a API
		'METHOD' => 'create_nfe_55',//M�todo a ser utilizado
		
		'DESTINATION_NAME' => 'Jose Maria da Silva',// Nome completo do cliente
		'DESTINATION_TAXID' => '35281474588',//CPF ou CNPJ, somente n�meros
		'DESTINATION_IE' => '',//Inscri��o Estadual (opcional), somente n�meros
		'DESTINATION_IM' => '',//Inscri��o Municipal (opcional), somente n�meros
		'DESTINATION_TAXTYPE' => 'F',//F = F�sica, J = Jur�dica, E = Estrangeiro
		'DESTINATION_STREET' => 'Rua de teste',//Rua do cliente
		'DESTINATION_NUMBER' => '123',//N�mero
		'DESTINATION_COMPLEMENT' => 'Pr�ximo a escola municipal floriano peixoto',//Complemento
		'DESTINATION_DISTRICT' => 'Centro',//Bairro
		'DESTINATION_CITY' => 'Belo Horizonte',//Cidade, informar corretamente o nome da cidade sem abrevia��es
		'DESTINATION_UF' => 'MG',//Sigla do estado
		'DESTINATION_ZIPCODE' => '35560000',//CEP, somente n�meros
		'DESTINATION_PHONE' => '31999998888',//Telefone do cliente (opcional), somente n�meros
		'DESTINATION_EMAIL'	=> 'test@test.com',//E-mail do cliente (opcional)
		
		'DESTINATION_EMAIL_SEND' => array(
			'1'	=> array(
				'EMAIL' => 'mail1@example.com',
			),
			
			'2'	=> array(
				'EMAIL' => 'mail2@example.com'
			)
		),//e-mail(s) que ser� enviado a nota depois de emitida (opcional).
		
		'DOCUMENT_BASEVALUE' => '100.00',//Valor total da nota fiscal. Utilizar ponto para separar as casas decimais
		'DOCUMENT_DESCRIPTION' => 'Presta��o de Servi�o em consultoria',//Descri��o da nota fiscal (obrigat�rio somente para o m�todo create_nfse e update_nfse)
		'DOCUMENT_CNAE' => '8599604', //CNAE, somente n�meros (opcional), se n�o informado ou informado inv�lido ser� utilizado o padr�o das configura��es da empresa 
		
		//Produto(s). Enviar par�metro somente quando utilizar o m�todo create_nfe_55 ou update_nfe_55
		'DOCUMENT_PRODUCT' => array(
			'1' => array(
				'DOCUMENT_PRODUCT_COD' => '190520367911', // C�d do produto
				'DOCUMENT_PRODUCT_NAME' => 'Camisa Polo', // Nome do produto
				'DOCUMENT_PRODUCT_QTD' => '2', //Quantidade de itens,
				'DOCUMENT_PRODUCT_UNITARY_VALUE' => '5.00',//Valor unit�rio do produto, utilizar ponto para separar as casas decimais
				'DOCUMENT_PRODUCT_NCM' => '62069000',//C�digo NCM do produto, somente n�meros. (Opcional), se n�o informado ser� utilizado o padr�o das configura��es da empresa
				'DOCUMENT_PRODUCT_CFOP' => '5101',//C�digo CFOP a ser utilizado, somente n�meros. (Opcional), se n�o informado ser� utilizado o padr�o das configura��es da empresa
			),
			'2' => array(
				'DOCUMENT_PRODUCT_COD' => '0020970', // C�d do produto
				'DOCUMENT_PRODUCT_NAME' => 'Oculos Feminino', // Nome do produto
				'DOCUMENT_PRODUCT_QTD' => '1', //Quantidade de itens,
				'DOCUMENT_PRODUCT_UNITARY_VALUE' => '90.00',//Valor unit�rio do produto, utilizar ponto para separar as casas decimais
				'DOCUMENT_PRODUCT_NCM' => '62069000',//C�digo NCM do produto, somente n�meros. (Opcional), se n�o informado ser� utilizado o padr�o das configura��es da empresa
				'DOCUMENT_PRODUCT_CFOP' => '5101',//C�digo CFOP a ser utilizado, somente n�meros. (Opcional), se n�o informado ser� utilizado o padr�o das configura��es da empresa
			),
		),
	
		//Frete (opcional). Enviar par�metro somente quando utilizar o m�todo create_nfe_55 ou update_nfe_55. Caso n�o seja informado ser� utilizado o padr�o 9 = Sem Frete
		'DOCUMENT_FRETE' => array(
			'DOCUMENT_FRETE_MOD' => '0', // 0 = Por conta do emitente, 1 = Por conta do destinat�rio / remetente, 2 = Por conta de terceiros, 9 = Sem frete
			'DOCUMENT_FRETE_VALUE' => '100.00',//Valor total do frete. Utilizar ponto para separar as casas decimais
	
			//Transportadora (opcional). Enviar par�metro somente quando utilizar o m�todo create_nfe_55 ou update_nfe_55 e quando a vari�vel DOCUMENT_MOD_FRETE for diferente de 9.
			'DOCUMENT_FRETE_TRANSPORTADORA' => array(
				'DOCUMENT_FRETE_TRANSPORTADORA_NAME' => 'Empresa Brasileira de Correios e Tel�grafos', // Nome ou Raz�o Social da transportadora
				'DOCUMENT_FRETE_TRANSPORTADORA_TAXID' => '34028316002742', //CPF ou CNPJ, somente n�meros
				'DOCUMENT_FRETE_TRANSPORTADORA_IE' => '12345678', //Inscri��o Estadual, somente n�meros
				'DOCUMENT_FRETE_TRANSPORTADORA_STREET' => 'Rua de teste',//Rua da transportadora
				'DOCUMENT_FRETE_TRANSPORTADORA_NUMBER' => '123',//N�mero
				'DOCUMENT_FRETE_TRANSPORTADORA_DISTRICT' => 'Centro',//Bairro
				'DOCUMENT_FRETE_TRANSPORTADORA_CITY' => 'Belo Horizonte',//Cidade, informar corretamente o nome da cidade sem abrevia��es
				'DOCUMENT_FRETE_TRANSPORTADORA_UF' => 'MG',//Sigla do estado
			),
			
			//Ve�culo (opcional). Enviar par�metro somente quando utilizar o m�todo create_nfe_55 ou update_nfe_55.
			'DOCUMENT_FRETE_VEICULO' => array(
				'DOCUMENT_FRETE_VEICULO_PLACA' => 'ZZZ1100', // Placa do ve�culo
				'DOCUMENT_FRETE_VEICULO_UF' => 'MG', //Sigla do estado
			)		
		),

		'EXTERNAL_ID' => '89678678', // ID externo do documento que ser� enviado		
	));
	
	$retorno = send_data($fields);//Chamada do m�todo de envio, retorna os dados em array
}

//Atualiza uma nota fiscal de produto j� criada e n�o transmitida
function update_nfe_55()
{
	$fields = json_encode(array(
		'API_KEY' => 'SUA CHAVE DE API',//Sua chave de acesso API_KEY. Para obter a chave, acesse o menu Configura��es > Empresas. Cada empresa ter� sua chave de comunica��o com a API
		'METHOD' => 'update_nfe_55',//M�todo a ser utilizado
		
		'DESTINATION_NAME' => 'Jose Maria da Silva',// Nome completo do cliente
		'DESTINATION_TAXID' => '35281474588',//CPF ou CNPJ, somente n�meros
		'DESTINATION_IE' => '',//Inscri��o Estadual (opcional), somente n�meros
		'DESTINATION_IM' => '',//Inscri��o Municipal (opcional), somente n�meros
		'DESTINATION_TAXTYPE' => 'F',//F = F�sica, J = Jur�dica, E = Estrangeiro
		'DESTINATION_STREET' => 'Rua de teste',//Rua do cliente
		'DESTINATION_NUMBER' => '123',//N�mero
		'DESTINATION_COMPLEMENT' => 'Pr�ximo a escola municipal floriano peixoto',//Complemento
		'DESTINATION_DISTRICT' => 'Centro',//Bairro
		'DESTINATION_CITY' => 'Belo Horizonte',//Cidade, informar corretamente o nome da cidade sem abrevia��es
		'DESTINATION_UF' => 'MG',//Sigla do estado
		'DESTINATION_ZIPCODE' => '35560000',//CEP, somente n�meros
		'DESTINATION_PHONE' => '31999998888',//Telefone do cliente (opcional), somente n�meros
		'DESTINATION_EMAIL'	=> 'test@test.com',//E-mail do cliente (opcional)
		
		'DESTINATION_EMAIL_SEND' => array(
			'1'	=> array(
				'EMAIL' => 'mail1@example.com',
			),
			
			'2'	=> array(
				'EMAIL' => 'mail2@example.com'
			)
		),//e-mail(s) que ser� enviado a nota depois de emitida (opcional).
		
		'DOCUMENT_BASEVALUE' => '100.00',//Valor total da nota fiscal. Utilizar ponto para separar as casas decimais
		'DOCUMENT_DESCRIPTION' => 'Presta��o de Servi�o em consultoria',//Descri��o da nota fiscal (obrigat�rio somente para o m�todo create_nfse e update_nfse)
		'DOCUMENT_CNAE' => '8599604', //CNAE, somente n�meros (opcional), se n�o informado ou informado inv�lido ser� utilizado o padr�o das configura��es da empresa 
		
		//Produto(s). Enviar par�metro somente quando utilizar o m�todo create_nfe_55 ou update_nfe_55
		'DOCUMENT_PRODUCT' => array(
			'1' => array(
				'DOCUMENT_PRODUCT_COD' => '190520367911', // C�d do produto
				'DOCUMENT_PRODUCT_NAME' => 'Camisa Polo', // Nome do produto
				'DOCUMENT_PRODUCT_QTD' => '2', //Quantidade de itens,
				'DOCUMENT_PRODUCT_UNITARY_VALUE' => '5.00',//Valor unit�rio do produto, utilizar ponto para separar as casas decimais
				'DOCUMENT_PRODUCT_NCM' => '62069000',//C�digo NCM do produto, somente n�meros. (Opcional), se n�o informado ser� utilizado o padr�o das configura��es da empresa
				'DOCUMENT_PRODUCT_CFOP' => '5101',//C�digo CFOP a ser utilizado, somente n�meros. (Opcional), se n�o informado ser� utilizado o padr�o das configura��es da empresa
			),
			'2' => array(
				'DOCUMENT_PRODUCT_COD' => '0020970', // C�d do produto
				'DOCUMENT_PRODUCT_NAME' => 'Oculos Feminino', // Nome do produto
				'DOCUMENT_PRODUCT_QTD' => '1', //Quantidade de itens,
				'DOCUMENT_PRODUCT_UNITARY_VALUE' => '90.00',//Valor unit�rio do produto, utilizar ponto para separar as casas decimais
				'DOCUMENT_PRODUCT_NCM' => '62069000',//C�digo NCM do produto, somente n�meros. (Opcional), se n�o informado ser� utilizado o padr�o das configura��es da empresa
				'DOCUMENT_PRODUCT_CFOP' => '5101',//C�digo CFOP a ser utilizado, somente n�meros. (Opcional), se n�o informado ser� utilizado o padr�o das configura��es da empresa
			),
		),
	
		//Frete (opcional). Enviar par�metro somente quando utilizar o m�todo create_nfe_55 ou update_nfe_55. Caso n�o seja informado ser� utilizado o padr�o 9 = Sem Frete
		'DOCUMENT_FRETE' => array(
			'DOCUMENT_FRETE_MOD' => '0', // 0 = Por conta do emitente, 1 = Por conta do destinat�rio / remetente, 2 = Por conta de terceiros, 9 = Sem frete
			'DOCUMENT_FRETE_VALUE' => '100.00',//Valor total do frete. Utilizar ponto para separar as casas decimais
	
			//Transportadora (opcional). Enviar par�metro somente quando utilizar o m�todo create_nfe_55 ou update_nfe_55 e quando a vari�vel DOCUMENT_MOD_FRETE for diferente de 9.
			'DOCUMENT_FRETE_TRANSPORTADORA' => array(
				'DOCUMENT_FRETE_TRANSPORTADORA_NAME' => 'Empresa Brasileira de Correios e Tel�grafos', // Nome ou Raz�o Social da transportadora
				'DOCUMENT_FRETE_TRANSPORTADORA_TAXID' => '34028316002742', //CPF ou CNPJ, somente n�meros
				'DOCUMENT_FRETE_TRANSPORTADORA_IE' => '12345678', //Inscri��o Estadual, somente n�meros
				'DOCUMENT_FRETE_TRANSPORTADORA_STREET' => 'Rua de teste',//Rua da transportadora
				'DOCUMENT_FRETE_TRANSPORTADORA_NUMBER' => '123',//N�mero
				'DOCUMENT_FRETE_TRANSPORTADORA_DISTRICT' => 'Centro',//Bairro
				'DOCUMENT_FRETE_TRANSPORTADORA_CITY' => 'Belo Horizonte',//Cidade, informar corretamente o nome da cidade sem abrevia��es
				'DOCUMENT_FRETE_TRANSPORTADORA_UF' => 'MG',//Sigla do estado
			),
			
			//Ve�culo (opcional). Enviar par�metro somente quando utilizar o m�todo create_nfe_55 ou update_nfe_55.
			'DOCUMENT_FRETE_VEICULO' => array(
				'DOCUMENT_FRETE_VEICULO_PLACA' => 'ZZZ1100', // Placa do ve�culo
				'DOCUMENT_FRETE_VEICULO_UF' => 'MG', //Sigla do estado
			)		
		),
		
		'DOCUMENT_ID' => '4ed0f528ded523d2681e3f9688d63d26',//C�digo retornado pelo sistema ap�s utilizar o m�todo create_nfse ou create_nfe_55. Utilizar esta vari�vel para o m�todo consult_nfe_55, consult_nfse, delete_nfe_55, delete_nfse, update_nfe_55, update_nfse
		'EXTERNAL_ID' => '89678678', // ID externo do documento que ser� atualizado		
	));
	
	$retorno = send_data($fields);//Chamada do m�todo de envio, retorna os dados em array
}

//Consulta uma nota fiscal de produto individualmente pelo seu id
function consult_nfe_55()
{
	$fields = json_encode(array(
		'API_KEY' => 'SUA CHAVE DE API',//Sua chave de acesso API_KEY. Para obter a chave, acesse o menu Configura��es > Empresas. Cada empresa ter� sua chave de comunica��o com a API
		'METHOD' => 'consult_nfe_55',//M�todo a ser utilizado
		'DOCUMENT_ID' => '4ed0f528ded523d2681e3f9688d63d26',//C�digo retornado pelo sistema ap�s utilizar o m�todo create_nfse ou create_nfe_55. Utilizar esta vari�vel para o m�todo consult_nfe_55, consult_nfse, delete_nfe_55, delete_nfse, update_nfe_55, update_nfse
		'EXTERNAL_ID' => '89678678', // ID externo do documento que ser� consultado		
	));
	
	$retorno = send_data($fields);//Chamada do m�todo de envio, retorna os dados em array
}

//Consulta v�rias notas fiscais de produto de acordo com os filtros configurados
function consult_all_nfe_55()
{
	$fields = json_encode(array(
		'API_KEY' => 'SUA CHAVE DE API',//Sua chave de acesso API_KEY. Para obter a chave, acesse o menu Configura��es > Empresas. Cada empresa ter� sua chave de comunica��o com a API
		'METHOD' => 'consult_all_nfe_55',//M�todo a ser utilizado
		'FILTER' => array(
			'INITIAL_DATE' => '2017-01-01', // Data Inicial. Campo obrigat�rio, enviar no formato yyyy-mm-dd
			'FINAL_DATE' => '2017-01-01', // Data Final. Campo obrigat�rio, enviar no formato yyyy-mm-dd
			'STATUS' => 'Autorizada', // Status da nota fiscal. Campo opcional
			'NUMBER' => '25', // N�mero da nota fiscal j� autorizada ou cancelada. Campo opcional
			'DOC' => '25', // CPF / CNPJ do cliente. Campo opcional
		)
	));
	
	$retorno = send_data($fields);//Chamada do m�todo de envio, retorna os dados em array
}

//Cancela uma nota fiscal de produto que ainda n�o foi autorizada
function cancel_nfe_55()
{
	$fields = json_encode(array(
		'API_KEY' => 'SUA CHAVE DE API',//Sua chave de acesso API_KEY. Para obter a chave, acesse o menu Configura��es > Empresas. Cada empresa ter� sua chave de comunica��o com a API
		'METHOD' => 'cancel_nfe_55',//M�todo a ser utilizado
		'REASON' => 'O valor da nota fiscal foi informado incorretamente',//M�tivo do cancelamento
		'DOCUMENT_ID' => '4ed0f528ded523d2681e3f9688d63d26',//C�digo retornado pelo sistema ap�s utilizar o m�todo create_nfse ou create_nfe_55. Utilizar esta vari�vel para o m�todo consult_nfe_55, consult_nfse, delete_nfe_55, delete_nfse, update_nfe_55, update_nfse
		'EXTERNAL_ID' => '89678678', // ID externo do documento que ser� cancelado		
	));
	
	$retorno = send_data($fields);//Chamada do m�todo de envio, retorna os dados em array
}

//Exclui uma nota fiscal de produto que ainda n�o foi autorizada
function delete_nfe_55()
{
	$fields = json_encode(array(
		'API_KEY' => 'SUA CHAVE DE API',//Sua chave de acesso API_KEY. Para obter a chave, acesse o menu Configura��es > Empresas. Cada empresa ter� sua chave de comunica��o com a API
		'METHOD' => 'delete_nfe_55',//M�todo a ser utilizado
		'DOCUMENT_ID' => '4ed0f528ded523d2681e3f9688d63d26',//C�digo retornado pelo sistema ap�s utilizar o m�todo create_nfse ou create_nfe_55. Utilizar esta vari�vel para o m�todo consult_nfe_55, consult_nfse, delete_nfe_55, delete_nfse, update_nfe_55, update_nfse
		'EXTERNAL_ID' => '89678678', // ID externo do documento que ser� removido		
	));
	
	$retorno = send_data($fields);//Chamada do m�todo de envio, retorna os dados em array
}

//Atualiza a quantidade de itens no estoque
function update_stock()
{
	$fields = json_encode(array(
		'API_KEY' => 'SUA CHAVE DE API',//Sua chave de acesso API_KEY. Para obter a chave, acesse o menu Configura��es > Empresas. Cada empresa ter� sua chave de comunica��o com a API
		'METHOD' => 'update_stock',//M�todo a ser utilizado
		'PRODUCT_COD' => '8655210717228',// C�digo do produto
		'PRODUCT_QTD' => '10',//Quantidade de itens que ser�o atualizados. Utilizar o sinal de negativo quando for para deduzir itens do estoque.
	));
	
	$retorno = send_data($fields);//Chamada do m�todo de envio, retorna os dados em array
}
?>