//_nul = execVM "briefing.sqf" en init.sqf;

player createDiarySubject ["RHINO","RHINO"];
player createDiarySubject ["PROTOCOLOS_RADIO","PROTOCOLOS RADIO"];

player createDiaryRecord ["RHINO", ["INVENTARIO PERSONAL RHINO", format ["
<font color='#ff8000'>VESTIMENTA / CAMO:</font><br/>
Uniforme: Combat Uniform OCP <br/>
Chaleco: IOTV OCP <br/>
Casco: ACH OCP<br/>
<br/>
<font color='#ff8000'>INVENTARIO INDIVIDUAL: ÚTILES DE COMBATE</font><br/>
1 x Arma Principal (Calibre segun especialidad)<br/>
8 x Cargadores arma principal<br/>
2 x Granadas de Fragmentación<br/>
3 x Granadas Humo Amarillo<br/>
1 x Mira simple (RCO,MRCO,HOLO,ACOG,ACO,M150,M552,M68,TA31)<br/>
1 x Silenciador arma principal<br/>
2 x Bridas precinto<br/>
<br/>
<font color='#ff8000'>INVENTARIO INDIVIDUAL: ÚTILES MÉDICOS</font><br/>
5 x Vendajes Compresivos<br/>
5 x Vendajes Elasticos<br/>
5 x Vendaje Quickclot<br/>
5 x Vendaje Basico<br/>
2 x Torniquetes<br/>
1 x SAM splint<br/>
2 x Morfinas<br/>
2 x Epidefrinas<br/>
1 x Solucion Saline 250ml<br/>
1 x Tapones de oidos<br/>
<br/>
<font color='#ff8000'>INVENTARIO INDIVIDUAL: ÚTILES DE NAVEGACIÓN</font><br/>
1 x Mapa<br/>
1 x Brujula<br/>
1 x Maglite Xl50<br/>
1 x Herramientas de mapa<br/>
1 x Gafas Vision Nocturna Gen4<br/>
1 x Reloj Altimetro<br/>
1 x Prismaticos basicos<br/>
<br/>
<font color='#ff8000'>INVENTARIO PERSONAL: ÚTILES DE COMUNICACIÓN</font><br/>
1 x Radio AN-PRC152<br/>"
]]];

player createDiaryRecord ["RHINO", ["REGLAS SERVIDOR RHINO", format [
"<br/>
<font color='#ff8000'>Respeta a los demás jugadores</font><br/>
<br/>
<font color='#ff8000'>Juega en equipo</font><br/>
Manten tu radio en los canales de comunicación establecidos y comunicate con el resto de jugadores.<br/>
<br/>
<font color='#ff8000'>Equipate acorde al rol selecionado</font><br/>
No puede ser que tu rol sea: Médico francotirador antitanque."
]]];

player createDiaryRecord ["RHINO", ["RECLUTAMIENTO", format [
"<br/>
En estos momentos el reclutamiento de GRUPO RHINO se encuentra <font color='#ff8000'>abierto</font>.<br/>
<br/>
Si quieres mas información sobre los requisitos, visita nuestra web:<br/>
<font color='#ff8000'>www.gruporhinoarma.es</font><br/>
<br/>
También puedes contactar con nosotros directamente por teamspeak o dejandonos un mensaje de presentación en nuestro foro:<br/>
<font color='#ff8000'>www.gruporhinoarma.es/foro</font>"
]]];

player createDiaryRecord ["PROTOCOLOS_RADIO", ["9 LINE MEDEVAC BRIEF", format [
"<br/>
<font color='#ff8000'>LINEA 1:</font> LOCALIZACION PEM (Punto Evacuacion Medica). Coordenadas<br />
<font color='#ff8000'>LINEA 2:</font> CONTACTO. Persona y Frecuencia de contacto en punto PEM <br />
<font color='#ff8000'>LINEA 3:</font> Nº HERIDOS PRIORIDAD. Inmediatos, Urgentes, Medios, Bajos.<br />
<font color='#ff8000'>LINEA 4:</font> EQUIPAMIENTO ESPECIAL. Personal medico, sangre, desfibrilador.<br />
<font color='#ff8000'>LINEA 5:</font> Nº HERIDOS POR TIPO ACCESO. En camilla (inconscientes), a pie.<br />
<font color='#ff8000'>LINEA 6:</font> SEGURIDAD PEM. Verde-Seguro, Amarillo-Alerta, Rojo-Hostil.<br />
<font color='#ff8000'>LINEA 7:</font> MARCAJE PEM. Humo, luces, paneles, otros.<br />
<font color='#ff8000'>LINEA 8:</font> Nº HERIDOS POR CLAN. Grupo Rhino, Clan aliado, Invitado, Civil, Otro.<br />
<font color='#ff8000'>LINEA 9:</font> NBQ. Peligros por Contaminación, Armas quimicas...<br />"
]]];

player createDiaryRecord ["PROTOCOLOS_RADIO", ["9 LINE CAS BRIEF", format [
"<br/>
<font color='#ff8000'>LINEA 1:</font> IP/BP. Punto Referencia Inicio (+500m), Punto de Combate<br />
<font color='#ff8000'>LINEA 2:</font> GRADOS.Desde IP hacia objetivo. OFFSET Der/Izq<br />
<font color='#ff8000'>LINEA 3:</font> DISTANCIA. Desde IP hacia objetivo (m)<br />
<font color='#ff8000'>LINEA 4:</font> ELEVACION. Altura del objetivo (m)<br />
<font color='#ff8000'>LINEA 5:</font> DESCRIPCION. Descripcion del objetivo/s<br />
<font color='#ff8000'>LINEA 6:</font> LOCALIZACION. Coordenadas del objetivo<br />
<font color='#ff8000'>LINEA 7:</font> MARCAJE. Marcaje de objetivo (laser, humo..)<br />
<font color='#ff8000'>LINEA 8:</font> ALIADOS. Posiciones aliadas y forma marcaje (humo, panel..)<br />
<font color='#ff8000'>LINEA 9:</font> SALIDA. Lugar por el que se abandona el lugar operaciones<br />
<font color='#ff8000'>OBSERVACIONES:</font> TOT (Time on Target) - TTT (Time to Target)<br />"
]]];

player createDiaryRecord ["PROTOCOLOS_RADIO", ["6 LINE HELI CAS BRIEF", format [
"<br/>
<font color='#ff8000'>LINEA 1:</font> POSICION CONTROLADOR. Coordenadas controlador/marcaje<br />
<font color='#ff8000'>LINEA 2:</font> GRADOS OBJETIVO.Grados existentes entre Controlador y Objetivo<br />
<font color='#ff8000'>LINEA 3:</font> DISTANCIA OBJETIVO. Distancia desde Controlador hasta objetivo<br />
<font color='#ff8000'>LINEA 4:</font> DESCRIPCION OBJETIVO. Descripcion del objetivo/s<br />
<font color='#ff8000'>LINEA 5:</font> MARCAJE OBJETIVO. Marcaje de objetivo (laser, humo..)<br />
<font color='#ff8000'>LINEA 6:</font> OBSERVACIONES. Aproximacion, amigos viento...<br />"
]]];

player createDiaryRecord ["PROTOCOLOS_RADIO", ["HELICOPTER LANDING ZONE BRIEF", format [
"<br/>
<font color='#ff8000'>LINEA 1:</font> LOCALIZACION. Coordenadas LZ<br />
<font color='#ff8000'>LINEA 2:</font> MARCAJE.Tipo marcaje (lejos/cerca, Humo/Chemlight/Strobe/...)<br />
<font color='#ff8000'>LINEA 3:</font> VIENTO. Direccion del viento y fuerza (si se conoce)<br />
<font color='#ff8000'>LINEA 4:</font> ZONA LZ. Descripcion. Seguridad. Plano o inclinado. Altura<br />
<font color='#ff8000'>LINEA 5:</font> PELIGROS. Lineas electricas, arboles, pendiente...<br />
<font color='#ff8000'>LINEA 6:</font> SITUACION ENEMIGOS. Orientacion, distancia. <br />
<font color='#ff8000'>LINEA 7:</font> SITUACION AMIGOS. Orientacion, Distancia, Marcaje<br />
<font color='#ff8000'>LINEA 8:</font> STANDART LZ. Tipo (UH60, CH53, UH1Y, NH9). Largo x Ancho<br />
<font color='#ff8000'>LINEA 9:</font> LZ SEÑALIZACION. Nato Y (10m), Nato T (10m), paneles, chemlights<br />"
]]];

player createDiaryRecord ["PROTOCOLOS_RADIO", ["CANALES DE RADIO",format [
"<br />
<font color='#ff8000'>FRECUENCIAS DE MANDO<br/></font>
 Mando...........................30Mhz<br/>
 Mando Aereo..................45Mhz<br/>
 Mando Vehiculos.............55Mhz<br/>
<br />
<font color='#ff8000'>FRECUENCIAS DE GRUPOS OPERATIVOS<br /></font>
 Alpha.............................40Mhz<br/>
 Bravo............................50Mhz<br/>
 Charlie...........................60Mhz<br/>
 Delta..............................70Mhz<br/>
 Sierra.............................80Mhz<br/>
<br />
<font color='#ff8000'>FRECUENCIAS DE GRUPOS DE APOYO<br /></font>
 Mike......(Apoyo Medico)..............35Mhz<br/>
 Echo......(Apoyo Ingenieros).........65Mhz<br/>
 Foxtrot..(Apoyo Morteros)...........75Mhz<br/>
 Romeo..(Apoyo Reconocimiento)..85Mhz<br/>
<br />"
]]];
