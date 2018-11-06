# NACardSDK

## Swift


## Instalação


### **1. Cocoapods:**


No arquivo **Podfile** do projeto que será **instalado a SDK** , insira a linha abaixo:

Ficando semelhante ao exemplo abaixo:

Após a inserção, abra o terminal do MacOS apertando “ **command + space** ” no teclado
e digitando **Terminal** ou indo no **Launchpad -> Outros -> Terminal.**

Com o terminal aberto, vá até o diretório que se encontra o arquivo **Podfile** do projeto
será instalado o SDK, utilizando o comando **CD.**

```
pod 'NACardSDK', git : 'https://mdias_at_edeploy@bitbucket.org/naturacode/motor-
cards-v3-ios-package.git', branch : 'master'
```
### cd Documents/Projects/MyProjectSample/


Já no diretório que contém o arquivo **Podfile,** execute o comando de instalação:

Ao executar o comando de instalação, o terminal irá imprimir algumas informações
semelhante ao exemplo abaixo:

**2. Importando e utilizando a SDK**

Após realizar a instalação do **Pod** no passo anterior, agora vamos importar e utilizar a
SDK dentro do projeto.

No **Finder ou XCode** , vá até o diretório do projeto e abra o arquivo **“.xcworkspace”**
do seu projeto.

```
**pod install**
```
```
SampleSDK.xcworkspace
```


Com o projeto aberto, vá ao **ViewController / View** que será implementado a Listagem
de Cards, selecione o arquivo **.Xib** ou **.Storyboard** , e insira uma **UITableView** na
**UIView.**


Após inserir a UITableView, selecione-o e no painel direito de Atributos “ **Inspector** ”,
selecione o a aba “ **Indentity Inspector** ”, após selecionar, altere a classe da
**UITableView** para **NATableViewController** e o modulo para **NACardSDK**.

Agora realize a ligação o Objeto **UITableView** ao arquivo **.Swift** da **ViewController**
selecionando a opção de “ **Show the Assistant editor** ”. Após selecionar e ligar a
UITableView, informe o nome de variável que ela responderá e clique em **Connect**.


Após informar o nome e clicar em **Connect** , o código da sua ViewController ficará
s e m e l h a n t e a o e x e m p l o a b a i x o c o n t e n d o a l i n h a d e c ó d i o g o d a
**NATableViewController**

### @IBOutlet weak var tableView: NATableViewController!

Agora na sua ViewController.swift, importe a NACardSDK , como na foto acima
colocando linha de código abaixo:

E finalmente, a implementação final, vamos infomar o parâmetros necessários para que
a listagem de cards ocorra sem problemas.

Será necessário que informe para a SDK o DataSource e Delegate que será utilizado
pela UITableView , para isso, faça como no exemplo abaixo:

Agora será necessário que dê um “start” na SDK , no caso será momento em que a
SDK vai realizara chamada da API do motor de cards, receber os dados e renderizar o
retorno na tela do aplicativo, para isso será necessário chamar a função ShowCards
ta UITableView , passando o UserID do usuário Natura que é requisitado pela API para
saber quais cards enviar para aquele usuário:

```
#### Import NACardSDK
```
```
tableView.DataSource = self
tableView.Delegate = self
```
```javascript
tableView.showCards(byUserId: “1003”, handlerSuccess:{ (message) in
	print(“Manusear o retorno de Success da API aqui.”)
}, handlerFailure: { (messageError) in
	print(“Manusear o retorno de Error da API aqui.”)
})
```

E por fim, extender as classes **Delegate (NATableViewControllerDelegate)** e
**DataSource (NATableViewControllerDataSource)** para sua **ViewController**

E por fim o código da sua **ViewController** deverá estar semelhante ao código
completo abaixo:

```
NATableViewControllerDelegate
```
```
extension ViewController: NATableViewControllerDelegate {
// Implementar as classes caso necessário, caso não necessite, deixe em branco
}
```
```
NATableViewControllerDataSource
```
```javascript
extension ViewController: NATableViewControllerDataSource {
	func viewController() -> UIViewController {
	return self
	}
}
```

Pronto, agora compile e rode seu projeto e seu app irá listar os cards enviados da API
de Motor de Cards.


### Links:

**Código Exemplo.**

**Instalação CocoaPods.**


