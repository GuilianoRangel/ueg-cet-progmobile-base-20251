# modelo_app_flutter_20251

Aplicação de exemplo de Arquitetura

## Como a aplicação foi construida.
* Comando para Adicionar dependências padrões:
  * routefly - flutter pub add routefly
  * provider - flutter pub add provider
  * signals  - flutter pub add signals 

## Configuração do routefly no path
* rodar o comando para adicionar no path global:
  ```
  flutter pub global activate routefly
  ```
* Adicionar o path global no PATH do Windos.
  * Para CMD.exe: 
  ``` 
  set PATH=%PATH%;%USERPROFILE%\AppData\Local\Pub\Cache\bin
  ```
  * Para power Shell
  ```
  $env:PATH += ";$env:USERPROFILE\AppData\Local\Pub\Cache\bin"
  ```

## Criação de Rotas
* Criação Pasta Base da aplicação dentro de Lib (FOLDER: app)
* Cada rota deve ter uma pasta para ela por exemplo (about) 
  * lib/app/about 
  * o nome do arquivo deve ter _page no final.
  * o nome da classe deve ter Page ao final.
* Configuração base para utilização do routefly:
  * no arquivo main.dart deve ser incluido o trecho abaixo:
  ```dart
  import 'main.route.dart'; // <- GENERATED
  part 'main.g.dart'; // <- GENERATED
  ```
  * Incluir no arquivo main.dart no componente principal o decorator:
    * @Main()
  * Criação de um Widget para home do App. 
    * Separa o Widget inicial do arquivo main, criando um page para ele.
      * Criar o arquivo home_page dentro da pasta app e mover o componente principal do main para esse arquivo
        * O componente do home_page não pode ter parâmetro no construtor
  * Configuração de rota no componente principal do main.dart com o código abaixo.
  ```dart
  ThemeData createTheme(BuildContext context, Brightness brightness) {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.blue,
        brightness: brightness,
      ),
      brightness: brightness,
      useMaterial3: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
        title: 'Nome da aplicação',
        debugShowCheckedModeBanner: false,
        theme: createTheme(context, Brightness.light),
        darkTheme: createTheme(context, Brightness.dark),
        themeMode: ThemeMode.system,
        routerConfig: Routefly.routerConfig(
          routes: routes,
          initialPath: routePaths.home,
        ));
  }
  ```
  * Na pasta raiz do projeto executar o comando
  ```
  routefly
  ```

## criação de pacote para reaproveitar funções
```
flutter create -t package confirm_dialog
```

* Para utiilizar fazer a referencia no pubspec.yaml

## Mapear Swagger do backend.
* Adicionar dependência do openapi_generator
```shell
flutter pub add openapi_generator_annotations
flutter pub add dev:openapi_generator

flutter pub global activate openapi_generator_cli
flutter pub add dev:build_runner
```
* Configuração do arquivo para mapeamento.
* Nome do arquivo config_openapi_generator.yaml
```yaml
generatorName: dart-dio
inputSpec: http://127.0.0.1:8080/v3/api-docs
outputDir: ./collegeapi
additionalProperties:
  pubName: collegeapi
  pubVersion: 0.1.0
  pubDescription: Pacote da API College
  apiSuffix: ""
```

* Cria a pasta do package que irá armazenar os arquivos do mapeamento do swagger
  * deve ter o mesmo nome da propriedade outputDir 
```shell
mkdir collegeapi
```

## Gerção da lib de conexão HTTP
* Adicionar a dependencia do dio no pubspec.yaml biblioteca de conexão
* Mandar fazer a geração do Package de conexão
```shell
openapi-generator generate -c config_openapi_generator.yaml
```
* para fazer o build e geração de .g.dart dos modelos
```shell
cd collegeapi
flutter pub get
flutter pub run build_runner build
```
* incluir a dependência no pubspec.yaml
  ```yaml 
  collegeapi:
   path: collegeapi
```
## Backend de exempo:
* https://github.com/GuilianoRangel/prog-webii-20242-backend-arqexemplo.git

## O projeto está utilizando ConfigSate com recurso de autosalvamento quando suas propriedades são alteradas 

