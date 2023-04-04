# Simulação braço mecãnico Dobot Magician

## estrutura de pastas

```shell
  $ tree
```

## Descrição da solução

Minha solução contem um backend em flask e um arquivo godot sendo utilizado como front e simulador do braço. Atualmente a solução é capaz de: simular o movimento do dobot em 3 variáveis x,y e r (a dimensão z é abstraída pelo aumento do da garra do dobot ), armazenar e recuperar informação sobre movimentos passados e movimentar o Dobot através do programa.

## Como rodar o projeto

Na root do projeto na cmd rode o camando "python app.py", isso inicializará o servidor. Após isso abra o godot e rode o arquivo na pasta \Godot simulation.

## Manual do usuário

![img](https://github.com/angrysine/Auto_estudo_godot/blob/main/images/x%2Cy%2Cz%2Cr.png)
Esses quatro sliders controlam os valores de x,y,z e r que serão usados para mover o dobot (eles são meio bugados vocêm tem clickar no começo da barra para mexer)

![img](https://github.com/angrysine/Auto_estudo_godot/blob/main/images/moveto_update.png)
O botão move to faz o dobot ou a simulação no canto inferior esquerdo da tela se movimentar. O botão update positions atualiza a lista de pontos que o dobot passou armazenada no dropdow button.

![img](https://github.com/angrysine/Auto_estudo_godot/blob/main/images/simulation.png)
Aqui temos uma simulação do dobot que faz os comandos do usuário. Se o botão conectado ao dobto for ligado e o usuário estiver realmente ligado ao dobot, o robo se mexe
