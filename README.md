<div align="center">

# **English version**

</div>

## General Information

**Author:** Guillermo Bustos-Pérez  
**Title:** Repository of graphical resources related to Paleolithic,
Epipaleolithic and Mesolithic  
**Date:** 2024  
**Current version:** v.1.0

Please cite as:

    Bustos-Pérez, G. Repository of graphical resources related to Paleolithic, Epipaleolithic and Mesolithic. 2023. v.1.0

<div align="justify">

## Introduction

Most archaeological academic degrees and masters include courses
focusing in a period ranging from the Lower Paleolithic to the start of
Neolithic. The Paleolithic, Epipaleolithic and Mesolithic periods
roughly sum up 4 Ma years of the history of humanity (often condensed in
a single course). As a result of this, courses are aimed at providing
general overviews of the different paleolithic periods, with special
focus on existing historical/cultural models, current debates,
geographical distributions of the archaeological record and its
relations with the paleoclimatic context, etc.

It is usually difficult to provide overviews of different Paleolithic
periods, since this commonly implies: plotting the geographical
distributions of archaeological finds and sites (regarding the different
periods, cultures or significant finds), presenting the succession of
Paleolithic cultures and their relationship with climatic oscillations,
showing the relationships of archaeological finds with historic/cultural
models of the past, and a large etc. Having up to date graphic resources
(in the form of maps and graphs) can help provide general overviews of
the different Paleolithic periods.

Online repositories offer a series of advantages for providing graphic
resources related to the Paleolithic:

- They can be easily modified to update information.  
- They can make use of specialized databases, ensuring up to date high
  quality information.  
- They are open source: the base code can be modified to adjust the
  graphic resources to specific needs.  
- They are free: allowing for a wide distribution of graphic resources.

This repository contains a series of resources in the form of maps and
graphs related to the Paleolithic, Epipaleolithic and Mesolithic
periods. This repository was initially developed as a result of teaching
activities at Universidad Autónoma of Madrid. The v.1.0 of this
repository focuses on the courses taught during that period (making
special emphasis in the Iberian Peninsula).

The graphic materials can be found at the
[**Images-english**](Images-english) folder.

## External datasets

Many of the maps have been generated with self-produced databases
gathered over the years. However, many of these databases are incomplete
(with missing sites). As indicated in the updating policies, these
databases will be completed and expanded over time.

The ROCEEH Out Of Africa Database (ROAD) (CC BY-SA 4.0) has played an
important role in the development of several graphic materials
(<http://www.roceeh.org>). The work of the data contributors and ROAD
community is gratefully acknowledged.

The “Collaborative Research Centre 806 Database. Our Way to Europe”
(<https://crc806db.uni-koeln.de/>) provides multiple datasets regariding
archaeological site distribution. Currently, the CRC806-E1 LGM-Sites
Database V-20150313 ([Maier and Zimmermann,
2015](#ref-maier_crc806-e1_2015)) has been instrumental for the
development of graphic materials related to the Last Glacial Maximum.

For the plotting of climate variation curves, the Lisiecki and Raymo
([2005](#ref-lisiecki_pliocene-pleistocene_2005)) dataset has been used
to show the variation of O18 levels throughout the Quaternary. The
Spratt and Lisiecki ([2016](#ref-spratt_late_2016)) database has been
used to generate the sea level variation plot.

## Software and packages employed

All the graphical materials from this repository have been generated
with free software. The datasets are stored in OpenOffice or LibreOffice
(<https://es.libreoffice.org/>) calculator format files.

Workflow and code have been developed in RStudio ([Rs. Team,
2019](#ref-rstudio_team_rstudio_2019)) using the R programming language
([R. C. Team, 2019](#ref-r_core_team_r_2019)). The package `tidyverse`
([Wickham et al., 2019](#ref-wickham_welcome_2019)) has been employed
extensively to process and muggle most of the data sets. The package
`ggmap` ([Kahle and Wickham, 2013](#ref-kahle_ggmap_2013)) has been
employed for the development of most maps.

## Updating policies

As previously mentioned in the introduction, and advantage of online
repositories is that they can be updated periodically to ensure that the
information is up to date. In the field of archaeology this is a key
matter, since new discoveries might result in the reviewing or
development of new chrono-cultural models (or might result in adding
sites to a period), current maps are surely missing archaeological sites
(they will be progressively added), new graphical material might be
needed for different periods, etc.

This repository uses a two-digit version numbering, in the format:
`v.a.b`. With:

- **v** = version.  
- **a** = major changes.  
- **b** = minor changes.

**Major changes** are defined as actions implying the restructuring of
the repository (changes in the folders), adding of new graphical
material, or adding new data sets.

**Minor changes** are defined as actions which include the expansion of
existing data sets, code optimization, fixing of parsing errors
(including spelling), changes in existing graphic material (color, text,
base maps, etc.), changes in the titles of graphic materials, adding of
references, or improvement of the Readme file.

## Funding

The following research has been possible thanks to the Program for the
Requalification of the University System Margarita Salas
(**CA1/RSUE/2021-00743**) financed through the Spanish *“Recovery,
Transformation and Resilience Plan”* and managed from the Ministry of
Universities (Ministerio de Universidades) and the Autonomous University
of Madrid (Universidad Autónoma de Madrid).

## License of use

The following data and code is publish under a NonCommercial 4.0
International (CC BY-NC 4.0) license. Details about the license terms
are provided [**License**](License.md) file.

![](Images-español/License.png)

## Main bibliography employed

Multiple references have been consulted in order to generate the graphic
materials here present. these references can be consulted in the file
[**Bibliography**](Bibliography.md)

</div>

<div align="center">

# Versión en español\*\*

</div>

## Información General

**Autor:** Guillermo Bustos-Pérez  
**Título:** Repository of graphical resources related to Paleolithic,
Epipaleolithic and Mesolithic  
**Fecha:** 2024  
**Versión actual:** v.1.0

<div align="justify">

## Introducción

La mayoría de los grados y másteres de arqueología incluyen cursos que
se centran en un período que va desde el Paleolítico Inferior hasta
momentos previos al inicio del Neolítico. Los períodos Paleolítico,
Epipaleolítico y Mesolítico suman aproximadamente 4 millones de años de
la historia de la humanidad (a menudo condensados en un solo curso).
Debido a eso, las asignaturas que condensan estos periodos están
orientadas a proporcionar una visión general de los diferentes periodos
paleolíticos, con especial atención a los modelos histórico-culturales
existentes, los debates actuales, las distribuciones geográficas del
registro arqueológico y sus relaciones con el contexto paleoclimático,
etc.

Generalmente es difícil proporcionar visiones generales de los
diferentes períodos del Paleolítico, ya que esto comúnmente implica:
trazar la distribución geográfica de los hallazgos y sitios
arqueológicos (con respecto al período o cultura correspondiente),
presentar la sucesión de culturas Paleolíticas y su relación con las
oscilaciones climáticas, mostrar las relaciones de los hallazgos
arqueológicos con modelos históricos/culturales del pasado, y un largo
etcétera. Disponer de recursos gráficos actualizados (en forma de mapas
y gráficos) puede ayudar a proporcionar una visión general de los
diferentes períodos del Paleolítico.

Los repositorios online ofrecen una serie de ventajas a la hora de
proporcionar recursos gráficos relacionados con el Paleolítico:

- Se pueden modificar fácilmente para actualizar la información.  
- Pueden hacer uso de bases de datos especializadas, asegurando
  información actualizada y de alta calidad.  
- Son de código abierto: se puede modificar el código base para ajustar
  los recursos gráficos a necesidades específicas.  
- Son gratuitos: permiten una amplia distribución de recursos gráficos.

Este repositorio contiene una serie de recursos en forma de mapas y
gráficos relacionados con los periodos Paleolítico, Epipaleolítico y
Mesolítico. Este repositorio se ha desarrollado inicialmente como
resultado de la actividad docente en la Universidad Autónoma de Madrid.
La v.1.0 de este repositorio se centra en los cursos impartidos durante
ese periodo (haciendo especial énfasis en la Península Ibérica).

Los materiales gráficos pueden encontrarse en la carpeta
[**Images**](Images-español)

## Bases de datos externas

La base de datos ROCEEH Out Of Africa (ROAD) (CC BY-SA 4.0) ha jugado un
papel esencial en el desarrollo de varios de los materiales gráficos
(<http://www.roceeh.org>). Se reconoce y agradece el trabajo de los
contribuyentes de datos y de la comunidad ROAD.

El repositorio del “Collaborative Research Centre 806 Database. Our Way
to Europe” (<https://crc806db.uni-koeln.de/>) proporciona múltiples
bases de datos sobre la distribución de sitios arqueológicos. Para la
presente versión, la Base de Datos CRC806-E1 LGM-Sites V-20150313
([Maier and Zimmermann, 2015](#ref-maier_crc806-e1_2015)) ha sido
fundamental para el desarrollo de materiales gráficos relacionados con
el Último Máximo Glacial.

En el caso del desarrollo de las curvas de variaciones climáticas se ha
empleado el dataset Lisiecki and Raymo
([2005](#ref-lisiecki_pliocene-pleistocene_2005)) para mostrar la
variación de O18 a lo largo del Cuaternario. La base de datos de Spratt
and Lisiecki ([2016](#ref-spratt_late_2016)) ha sido empleado para
generar la curva de variaciones del nivel del mar.

## Información de acceso y licencia

**Licencia:**  
Los datos y códigos se hacen disponibles bajo una licencia **Non
Commercial 4.0 International (CC BY-NC 4.0)**.  
Para más detalles ver el archivo [**License**](License.md).

## Información sobre los datos empleados para la elaboración del material

Buena parte de los mapas han sido generados con bases de datos de
producción propia reunidas a lo largo de los años. Sin embargo, muchas
de estas bases de datos están incompletas (con ausencia de yacimientos).
Tal y como se indica en la política de actualizacioones, estas bases de
datos se irán completando con el pasod el tiempo.

En el caso de los yacimientos Solutrenses, se ha empleado una versión
modificada de la base de datos CRC806-E1 ([Maier and Zimmermann,
2015](#ref-maier_crc806-e1_2015)). La atribución está presente en todo
material gráfico generado usando esta base de datos.

La base de datos **ROAD** se ha citado siempre que se ha empleado
(<https://www.roceeh.uni-tuebingen.de/roadweb/smarty_road_simple_search.php>).  
Este uso aparece indicado en los materiales gráficos creados en
cumplimiento con los términos y condiciones de servicio:  
(<https://www.roceeh.uni-tuebingen.de/roadweb/smarty_data_use_policy.php?asMsgWin=1>).

## Software empleado

El paquete de R **tidyverse v2.0.0** ([Wickham et al.,
2019](#ref-wickham_welcome_2019)) se ha empleado para el procesado de la
mayoría de los datos, mientras que **ggmap v.4.0.0** ([Kahle and
Wickham, 2013](#ref-kahle_ggmap_2013)) ha sido empleado para el
desarrollo de la mayoría de los mapas.

## Financiación

El presente repositorio ha sido hecho posible gracias al Programa
Recualificacion del sistema universitario español bajo un contrato
postdoctoral Margarita Salas (**CA1/RSUE/2021-00743**), financiado a
través del *Plan Español de Recuperación Transformación y Resiliencia* y
administrado por la Universidad Autónoma de Madrid.

# Bibliografía (*References*)

</div>

<div id="refs" class="references csl-bib-body hanging-indent">

<div id="ref-kahle_ggmap_2013" class="csl-entry">

Kahle, D.J., Wickham, H., 2013. [Ggmap: Spatial visualization with
ggplot2.](https://pdfs.semanticscholar.org/79da/0d9d7d828169db3084024a4acf6c259d0c74.pdf)
The R Journal 5, 144–161.

</div>

<div id="ref-lisiecki_pliocene-pleistocene_2005" class="csl-entry">

Lisiecki, L.E., Raymo, M.E., 2005. A Pliocene-Pleistocene stack of 57
globally distributed benthic δ $^{\textrm{18}}$ O records:
Pliocene-Pleistocene Benthic Stack. Paleoceanography 20, n/a–n/a.
<https://doi.org/10.1029/2004PA001071>

</div>

<div id="ref-maier_crc806-e1_2015" class="csl-entry">

Maier, A., Zimmermann, A., 2015. CRC806-E1 LGM-Sites Database
V-20150313. Collaborative Research Centre.
<https://doi.org/10.5880/SFB806.12>

</div>

<div id="ref-spratt_late_2016" class="csl-entry">

Spratt, R.M., Lisiecki, L.E., 2016. A Late Pleistocene sea level stack.
Climate of the Past 12, 1079–1092.
<https://doi.org/10.5194/cp-12-1079-2016>

</div>

<div id="ref-r_core_team_r_2019" class="csl-entry">

Team, R.C., 2019. [R: A language and environment for statistical
computing](https://www.R-project.org/).

</div>

<div id="ref-rstudio_team_rstudio_2019" class="csl-entry">

Team, Rs., 2019. [RStudio: Integrated Development for
R](http://www.rstudio.com/).

</div>

<div id="ref-wickham_welcome_2019" class="csl-entry">

Wickham, H., Averick, M., Bryan, J., Chang, W., McGowan, L., François,
R., Grolemund, G., Hayes, A., Henry, L., Hester, J., Kuhn, M., Pedersen,
T., Miller, E., Bache, S., Müller, K., Ooms, J., Robinson, D., Seidel,
D., Spinu, V., Takahashi, K., Vaughan, D., Wilke, C., Woo, K., Yutani,
H., 2019. Welcome to the Tidyverse. Journal of Open Source Software 4,
1686. <https://doi.org/10.21105/joss.01686>

</div>

</div>
