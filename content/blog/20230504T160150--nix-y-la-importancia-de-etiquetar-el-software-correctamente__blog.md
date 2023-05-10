+++
title      = "Nix y la importancia de etiquetar el software correctamente"
date       = 2023-05-04T16:01:50+02:00
tags       = ["blog"]
identifier = "20230504T160150"
+++

La importancia de etiquetar el software correctamente es uno de los
temas centrales en las conversaciones sobre Nix. Como mencionó
[Jonathan Lorimer](https://jonathanlorimer.dev), el exingeniero de
software líder de [Mercury](https://mercury.com/):

> "la comunidad de programadores somos malísimos al etiquetar el
> software que utilizamos"

Esto puede generar confusiones y errores, ya que no siempre es claro
qué versión de un software se está utilizando.

En este sentido, Nix se enfoca en la precisión al momento de etiquetar
el software. En lugar de simplemente indicar el nombre y la versión
del software, Nix se preocupa por el conjunto completo de dependencias
que conforman el software, incluyendo información sobre cómo se
compiló el software, qué compilador se utilizó, qué _flags_ se
habilitaron durante el proceso de compilación, en qué entorno se
compiló, entre otros detalles.

> "Todo el valor de Nix surge de la comprensión de que el software es
> mucho más que simples etiquetas de nombre y versión. Es todo el
> _closure_ de dependencias que tiene el software."

Al tener esta información disponible y ser capaz de expresarla de
manera clara y precisa, se pueden evitar problemas de compatibilidad y
asegurarse de que todos los desarrolladores estén trabajando con la
misma versión del software.

Además, la etiquetación precisa también permite una mayor capacidad de
**reproducción**. Si se sabe exactamente qué dependencias se usaron para
crear una aplicación, se puede garantizar que se pueda construir la
misma aplicación en el futuro, incluso si las versiones de las
dependencias han cambiado. Esto es especialmente importante para la
**replicación de entornos de desarrollo** o para desplegar aplicaciones en
diferentes servidores.

Podemos ver un ejemplo de cómo Nix define el conjunto completo de
dependencias, lo que Nix llama `derivation`, usando el comando: `nix
derivation show nixpkgs#hello`

```json
{
  "/nix/store/pf9ff9imvbxb3l4gmav93gbhpx0fj1hv-hello-2.12.1.drv": {
    "args": ["-e", "/nix/store/9krlzvny65gdc8s7kpb6lkx8cd02c25b-default-builder.sh"],
    "builder": "/nix/store/kga2r02rmyxl14sg96nxbdhifq3rb8lc-bash-5.1-p16/bin/bash",
    "env": {
      "builder": "/nix/store/kga2r02rmyxl14sg96nxbdhifq3rb8lc-bash-5.1-p16/bin/bash",
      "doCheck": "1",
      "name": "hello-2.12.1",
      "out": "/nix/store/1gxz5nfzfnhyxjdyzi04r86sh61y4i00-hello-2.12.1",
      "outputs": "out",
      "pname": "hello",
      "src": "/nix/store/pa10z4ngm0g83kx9mssrqzz30s84vq7k-hello-2.12.1.tar.gz",
      "stdenv": "/nix/store/0jmdsgfnd6aakxdr0sl5l7zzfs59hdrw-stdenv-linux",
      "system": "x86_64-linux",
      "version": "2.12.1"
    },
    "inputDrvs": {
      "/nix/store/fvdipm2pfykd1gmaaidvvcpn7d9nbglz-stdenv-linux.drv": ["out"],
      "/nix/store/sr6b1h6by3fkdhsbz8phrxvcjxxg6vbr-bash-5.1-p16.drv": ["out"],
      "/nix/store/y0n2fq2c3383h0qavdhci34yzgqxj57z-hello-2.12.1.tar.gz.drv": ["out"]
    },
    "inputSrcs": ["/nix/store/9krlzvny65gdc8s7kpb6lkx8cd02c25b-default-builder.sh"],
    "name": "hello-2.12.1",
    "outputs": {
      "out": {
        "path": "/nix/store/1gxz5nfzfnhyxjdyzi04r86sh61y4i00-hello-2.12.1"
      }
    },
    "system": "x86_64-linux"
  }
}
```

En resumen, etiquetar correctamente el software es fundamental para
evitar confusiones, garantizar la compatibilidad y permitir la
reproducción precisa de aplicaciones. Nix es perfecto para esto, al
enfocarse en la precisión y exhaustividad de la información sobre
dependencias para asegurar que los desarrolladores puedan trabajar de
manera eficiente y efectiva en cualquier proyecto de software.
