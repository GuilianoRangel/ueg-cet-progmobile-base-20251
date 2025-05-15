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
  * 