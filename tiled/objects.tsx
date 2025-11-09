<?xml version="1.0" encoding="UTF-8"?>
<tileset version="1.10" tiledversion="1.11.2" name="objects" tilewidth="1152" tileheight="1286" tilecount="77" columns="0">
 <editorsettings>
  <export target="../data/objects.lua" format="lua"/>
 </editorsettings>
 <grid orientation="orthogonal" width="1" height="1"/>
 <tile id="89">
  <properties>
   <property name="height" type="float" value="480"/>
   <property name="offsetX" type="float" value="860"/>
   <property name="offsetY" type="float" value="830"/>
   <property name="replaceTo[0]" type="class" propertytype="replaceTo"/>
   <property name="replaceTo[1]" type="class" propertytype="replaceTo">
    <properties>
     <property name="id" type="int" value="1"/>
     <property name="objectId" type="int" value="1"/>
    </properties>
   </property>
   <property name="replaceTo[2]" type="class" propertytype="replaceTo">
    <properties>
     <property name="id" type="int" value="88"/>
     <property name="objectId" type="int" value="88"/>
     <property name="posX" type="float" value="36"/>
     <property name="posY" type="float" value="-355"/>
    </properties>
   </property>
  </properties>
  <image source="../img/Arche.png" width="1152" height="1024"/>
 </tile>
 <tile id="92">
  <properties>
   <property name="height" type="float" value="1000"/>
   <property name="maxTruncateHeight" type="float" value="230"/>
   <property name="offsetX" type="float" value="510"/>
   <property name="offsetY" type="float" value="1210"/>
   <property name="randomTruncateHeight" type="bool" value="false"/>
   <property name="replaceTo[0]" type="class" propertytype="replaceTo">
    <properties>
     <property name="applyTruncate" type="bool" value="true"/>
     <property name="flipX" propertytype="flip" value="random"/>
     <property name="ids" value="5,6,7"/>
    </properties>
   </property>
   <property name="replaceTo[1]" type="class" propertytype="replaceTo">
    <properties>
     <property name="flipX" propertytype="flip" value="random"/>
     <property name="ids" value="2,3,4"/>
     <property name="offsetByTruncate" type="bool" value="true"/>
     <property name="posY" type="float" value="0"/>
    </properties>
   </property>
   <property name="truncateHeight" type="float" value="0"/>
  </properties>
  <image source="../img/Arbre.png" width="1024" height="1286"/>
 </tile>
 <tile id="10">
  <properties>
   <property name="height" type="float" value="20"/>
   <property name="offsetX" type="float" value="192"/>
   <property name="offsetY" type="float" value="110"/>
  </properties>
  <image source="../img/Buisson_grand-1.png" width="384" height="216"/>
  <objectgroup draworder="index" id="2">
   <object id="2" x="69.5" y="126">
    <polygon points="0,0 118.5,53 169,20 49.5,-34"/>
   </object>
  </objectgroup>
 </tile>
 <tile id="11">
  <properties>
   <property name="height" type="float" value="20"/>
   <property name="offsetX" type="float" value="192"/>
   <property name="offsetY" type="float" value="120"/>
  </properties>
  <image source="../img/Buisson_grand-2.png" width="384" height="216"/>
  <objectgroup draworder="index" id="2">
   <object id="2" x="74" y="122.54">
    <polygon points="0,0 125.862,56.9598 179.5,21.4943 52.5754,-36.5402"/>
   </object>
  </objectgroup>
 </tile>
 <tile id="12">
  <properties>
   <property name="height" type="float" value="20"/>
   <property name="offsetX" type="float" value="128"/>
   <property name="offsetY" type="float" value="90"/>
  </properties>
  <image source="../img/Buisson_moyen-1.png" width="256" height="148"/>
  <objectgroup draworder="index" id="2">
   <object id="1" x="64.7531" y="97.264" rotation="350.178">
    <polygon points="0,0 86.9739,35.6379 124.039,13.4483 36.3309,-22.8621"/>
   </object>
  </objectgroup>
 </tile>
 <tile id="13">
  <properties>
   <property name="height" type="float" value="20"/>
   <property name="offsetX" type="float" value="128"/>
   <property name="offsetY" type="float" value="75"/>
  </properties>
  <image source="../img/Buisson_moyen-2.png" width="256" height="148"/>
  <objectgroup draworder="index" id="2">
   <object id="2" x="49.3572" y="90.9749" rotation="353.421">
    <polygon points="0,0 86.9739,35.6379 124.039,13.4483 36.3309,-22.8621"/>
   </object>
  </objectgroup>
 </tile>
 <tile id="14">
  <properties>
   <property name="height" type="float" value="20"/>
   <property name="offsetX" type="float" value="64"/>
   <property name="offsetY" type="float" value="110"/>
  </properties>
  <image source="../img/Buisson_petit-1.png" width="128" height="148"/>
  <objectgroup draworder="index" id="2">
   <object id="2" x="35.7383" y="121.403" rotation="350.178">
    <polygon points="0,0 40.2254,15.7462 57.368,5.94198 16.803,-10.1014"/>
   </object>
  </objectgroup>
 </tile>
 <tile id="15">
  <properties>
   <property name="height" type="float" value="20"/>
   <property name="offsetX" type="float" value="64"/>
   <property name="offsetY" type="float" value="110"/>
  </properties>
  <image source="../img/Buisson_petit-2.png" width="128" height="148"/>
  <objectgroup draworder="index" id="2">
   <object id="2" x="31.2356" y="119.361" rotation="350.178">
    <polygon points="0,0 47.5593,17.8991 67.8274,6.75439 19.8665,-11.4825"/>
   </object>
  </objectgroup>
 </tile>
 <tile id="16">
  <properties>
   <property name="height" type="float" value="20"/>
   <property name="offsetX" type="float" value="64"/>
   <property name="offsetY" type="float" value="110"/>
  </properties>
  <image source="../img/Buisson_petit-3.png" width="128" height="148"/>
  <objectgroup draworder="index" id="2">
   <object id="2" x="26.3998" y="120.81" rotation="350.178">
    <polygon points="0,0 51.3129,19.3998 73.1806,7.32068 21.4344,-12.4452"/>
   </object>
  </objectgroup>
 </tile>
 <tile id="17">
  <properties>
   <property name="height" type="float" value="20"/>
   <property name="offsetX" type="float" value="64"/>
   <property name="offsetY" type="float" value="95"/>
  </properties>
  <image source="../img/Buisson_petit-4.png" width="128" height="148"/>
  <objectgroup draworder="index" id="2">
   <object id="1" x="20.5561" y="111.656" rotation="354.883">
    <polygon points="0,0 62.4871,22.0487 89.1168,8.32028 26.1021,-14.1445"/>
   </object>
  </objectgroup>
 </tile>
 <tile id="18">
  <properties>
   <property name="height" type="float" value="20"/>
   <property name="offsetX" type="float" value="64"/>
   <property name="offsetY" type="float" value="95"/>
  </properties>
  <image source="../img/Buisson_petit-5.png" width="128" height="148"/>
  <objectgroup draworder="index" id="2">
   <object id="2" x="20.5561" y="111.656" rotation="354.883">
    <polygon points="0,0 62.4871,22.0487 89.1168,8.32028 26.1021,-14.1445"/>
   </object>
  </objectgroup>
 </tile>
 <tile id="19">
  <properties>
   <property name="offsetX" type="float" value="64"/>
   <property name="offsetY" type="float" value="60"/>
  </properties>
  <image source="../img/Champignons-1.png" width="128" height="74"/>
 </tile>
 <tile id="20">
  <properties>
   <property name="offsetX" type="float" value="64"/>
   <property name="offsetY" type="float" value="60"/>
  </properties>
  <image source="../img/Champignons-2.png" width="128" height="74"/>
 </tile>
 <tile id="21">
  <properties>
   <property name="offsetX" type="float" value="64"/>
   <property name="offsetY" type="float" value="60"/>
  </properties>
  <image source="../img/Champignons-3.png" width="128" height="74"/>
 </tile>
 <tile id="22">
  <properties>
   <property name="offsetX" type="float" value="64"/>
   <property name="offsetY" type="float" value="60"/>
  </properties>
  <image source="../img/Champignons-4.png" width="128" height="74"/>
 </tile>
 <tile id="24">
  <properties>
   <property name="offsetX" type="float" value="96"/>
   <property name="offsetY" type="float" value="236"/>
   <property name="prefab" value="cossin"/>
  </properties>
  <image source="../img/cossin.png" width="192" height="256"/>
 </tile>
 <tile id="32">
  <properties>
   <property name="autoheightBulge" type="float" value="125"/>
   <property name="fruit" value="apple"/>
   <property name="golden" type="bool" value="false"/>
   <property name="offsetX" type="float" value="64"/>
   <property name="offsetY" type="float" value="170"/>
   <property name="prefab" value="fruit"/>
  </properties>
  <image source="../img/Fruit-1.png" width="128" height="192"/>
 </tile>
 <tile id="33">
  <properties>
   <property name="autoheightBulge" type="float" value="125"/>
   <property name="fruit" value="banana"/>
   <property name="golden" type="bool" value="false"/>
   <property name="offsetX" type="float" value="64"/>
   <property name="offsetY" type="float" value="170"/>
   <property name="prefab" value="fruit"/>
  </properties>
  <image source="../img/Fruit-2.png" width="128" height="192"/>
 </tile>
 <tile id="34">
  <properties>
   <property name="autoheightBulge" type="float" value="125"/>
   <property name="fruit" value="pineapple"/>
   <property name="golden" type="bool" value="false"/>
   <property name="offsetX" type="float" value="64"/>
   <property name="offsetY" type="float" value="170"/>
   <property name="prefab" value="fruit"/>
  </properties>
  <image source="../img/Fruit-3.png" width="128" height="192"/>
 </tile>
 <tile id="35">
  <properties>
   <property name="autoheightBulge" type="float" value="125"/>
   <property name="fruit" value="pear"/>
   <property name="golden" type="bool" value="false"/>
   <property name="offsetX" type="float" value="64"/>
   <property name="offsetY" type="float" value="170"/>
   <property name="prefab" value="fruit"/>
  </properties>
  <image source="../img/Fruit-4.png" width="128" height="192"/>
 </tile>
 <tile id="36">
  <properties>
   <property name="autoheightBulge" type="float" value="125"/>
   <property name="fruit" value="tomato"/>
   <property name="golden" type="bool" value="false"/>
   <property name="offsetX" type="float" value="64"/>
   <property name="offsetY" type="float" value="170"/>
   <property name="prefab" value="fruit"/>
  </properties>
  <image source="../img/Fruit-5.png" width="128" height="192"/>
 </tile>
 <tile id="37">
  <properties>
   <property name="autoheightBulge" type="float" value="125"/>
   <property name="fruit" value="orange"/>
   <property name="golden" type="bool" value="false"/>
   <property name="offsetX" type="float" value="64"/>
   <property name="offsetY" type="float" value="170"/>
   <property name="prefab" value="fruit"/>
  </properties>
  <image source="../img/Fruit-6.png" width="128" height="192"/>
 </tile>
 <tile id="38">
  <properties>
   <property name="autoheightBulge" type="float" value="125"/>
   <property name="fruit" value="mushroom"/>
   <property name="golden" type="bool" value="false"/>
   <property name="offsetX" type="float" value="64"/>
   <property name="offsetY" type="float" value="170"/>
   <property name="prefab" value="fruit"/>
  </properties>
  <image source="../img/Fruit-7.png" width="128" height="192"/>
 </tile>
 <tile id="39">
  <properties>
   <property name="autoheightBulge" type="float" value="125"/>
   <property name="fruit" value="grape"/>
   <property name="golden" type="bool" value="false"/>
   <property name="offsetX" type="float" value="64"/>
   <property name="offsetY" type="float" value="170"/>
   <property name="prefab" value="fruit"/>
  </properties>
  <image source="../img/Fruit-8.png" width="128" height="192"/>
 </tile>
 <tile id="40">
  <properties>
   <property name="autoheightBulge" type="float" value="125"/>
   <property name="fruit" value="durian"/>
   <property name="golden" type="bool" value="false"/>
   <property name="offsetX" type="float" value="64"/>
   <property name="offsetY" type="float" value="170"/>
   <property name="prefab" value="fruit"/>
  </properties>
  <image source="../img/Fruit-9.png" width="128" height="192"/>
 </tile>
 <tile id="41">
  <properties>
   <property name="autoheightBulge" type="float" value="125"/>
   <property name="fruit" value="peach"/>
   <property name="golden" type="bool" value="false"/>
   <property name="offsetX" type="float" value="64"/>
   <property name="offsetY" type="float" value="170"/>
   <property name="prefab" value="fruit"/>
  </properties>
  <image source="../img/Fruit-10.png" width="128" height="192"/>
 </tile>
 <tile id="42">
  <properties>
   <property name="fruit" value="radish"/>
   <property name="golden" type="bool" value="false"/>
   <property name="offsetX" type="float" value="64"/>
   <property name="offsetY" type="float" value="170"/>
   <property name="prefab" value="fruit"/>
  </properties>
  <image source="../img/Fruit-11.png" width="128" height="192"/>
 </tile>
 <tile id="43">
  <properties>
   <property name="offsetX" type="float" value="64"/>
   <property name="offsetY" type="float" value="45"/>
  </properties>
  <image source="../img/Roche_mini-1.png" width="128" height="74"/>
 </tile>
 <tile id="44">
  <properties>
   <property name="offsetX" type="float" value="64"/>
   <property name="offsetY" type="float" value="30"/>
  </properties>
  <image source="../img/Roche_mini-2.png" width="128" height="74"/>
 </tile>
 <tile id="45">
  <properties>
   <property name="offsetX" type="float" value="64"/>
   <property name="offsetY" type="float" value="30"/>
  </properties>
  <image source="../img/Roche_mini-3.png" width="128" height="74"/>
 </tile>
 <tile id="46">
  <properties>
   <property name="offsetX" type="float" value="64"/>
   <property name="offsetY" type="float" value="25"/>
  </properties>
  <image source="../img/Roche_mini-4.png" width="128" height="74"/>
 </tile>
 <tile id="47">
  <properties>
   <property name="height" type="float" value="80"/>
   <property name="offsetX" type="float" value="64"/>
   <property name="offsetY" type="float" value="100"/>
  </properties>
  <image source="../img/Roche_moyenne-1.png" width="128" height="148"/>
  <objectgroup draworder="index" id="2">
   <object id="1" x="8.5" y="102.5">
    <polygon points="-2,1 60.5,35.5 105,13 45.5,-20"/>
   </object>
  </objectgroup>
 </tile>
 <tile id="48">
  <properties>
   <property name="height" type="float" value="80"/>
   <property name="offsetX" type="float" value="64"/>
   <property name="offsetY" type="float" value="100"/>
  </properties>
  <image source="../img/Roche_moyenne-2.png" width="128" height="148"/>
  <objectgroup draworder="index" id="2">
   <object id="1" x="11" y="108.5">
    <polygon points="-1.5,0 55.5,27.5 106.5,1.5 48,-25"/>
   </object>
  </objectgroup>
 </tile>
 <tile id="49">
  <properties>
   <property name="height" type="float" value="80"/>
   <property name="offsetX" type="float" value="64"/>
   <property name="offsetY" type="float" value="100"/>
  </properties>
  <image source="../img/Roche_moyenne-3.png" width="128" height="148"/>
  <objectgroup draworder="index" id="2">
   <object id="1" x="8" y="100.5">
    <polygon points="-1,4 56,31 110,6 53,-22.5"/>
   </object>
  </objectgroup>
 </tile>
 <tile id="50">
  <properties>
   <property name="height" type="float" value="80"/>
   <property name="offsetX" type="float" value="64"/>
   <property name="offsetY" type="float" value="100"/>
  </properties>
  <image source="../img/Roche_moyenne-4.png" width="128" height="148"/>
  <objectgroup draworder="index" id="2">
   <object id="1" x="14" y="103.5">
    <polygon points="-5,-1 55.5,33.5 97,13.5 37.5,-20.5"/>
   </object>
  </objectgroup>
 </tile>
 <tile id="51">
  <properties>
   <property name="height" type="float" value="80"/>
   <property name="offsetX" type="float" value="64"/>
   <property name="offsetY" type="float" value="100"/>
  </properties>
  <image source="../img/Roche_moyenne-5.png" width="128" height="148"/>
  <objectgroup draworder="index" id="2">
   <object id="1" x="10.5" y="107.5">
    <polygon points="-3,2 54.5,29 106,3.5 47,-22.5"/>
   </object>
  </objectgroup>
 </tile>
 <tile id="52">
  <properties>
   <property name="height" type="float" value="80"/>
   <property name="offsetX" type="float" value="64"/>
   <property name="offsetY" type="float" value="100"/>
  </properties>
  <image source="../img/Roche_moyenne-6.png" width="128" height="148"/>
  <objectgroup draworder="index" id="2">
   <object id="1" x="7.5" y="101">
    <polygon points="-2,2 56,30 114,4 58,-22.5"/>
   </object>
  </objectgroup>
 </tile>
 <tile id="53">
  <properties>
   <property name="height" type="float" value="20"/>
   <property name="offsetX" type="float" value="64"/>
   <property name="offsetY" type="float" value="40"/>
  </properties>
  <image source="../img/Roche_petit-1.png" width="128" height="74"/>
  <objectgroup draworder="index" id="2">
   <object id="1" x="37.5" y="45.5">
    <polygon points="-3,3 29,15.5 54.5,0 24.5,-11.5"/>
   </object>
  </objectgroup>
 </tile>
 <tile id="54">
  <properties>
   <property name="height" type="float" value="20"/>
   <property name="offsetX" type="float" value="64"/>
   <property name="offsetY" type="float" value="30"/>
  </properties>
  <image source="../img/Roche_petit-2.png" width="128" height="74"/>
  <objectgroup draworder="index" id="2">
   <object id="1" x="26" y="45">
    <polygon points="-2,-0.5 44,18 73,-2 26,-17.5"/>
   </object>
  </objectgroup>
 </tile>
 <tile id="55">
  <properties>
   <property name="height" type="float" value="20"/>
   <property name="offsetX" type="float" value="64"/>
   <property name="offsetY" type="float" value="35"/>
  </properties>
  <image source="../img/Roche_petit-3.png" width="128" height="74"/>
  <objectgroup draworder="index" id="2">
   <object id="1" x="37" y="46">
    <polygon points="-3.5,-0.5 26.5,12.5 62,-3.5 29.5,-14.5"/>
   </object>
  </objectgroup>
 </tile>
 <tile id="56">
  <properties>
   <property name="height" type="float" value="20"/>
   <property name="offsetX" type="float" value="64"/>
   <property name="offsetY" type="float" value="40"/>
  </properties>
  <image source="../img/Roche_petit-4.png" width="128" height="74"/>
  <objectgroup draworder="index" id="2">
   <object id="1" x="34.5" y="49">
    <polygon points="-3.5,0 28.5,14 60,-1.5 27,-13.5"/>
   </object>
  </objectgroup>
 </tile>
 <tile id="57">
  <properties>
   <property name="height" type="float" value="20"/>
   <property name="offsetX" type="float" value="64"/>
   <property name="offsetY" type="float" value="40"/>
  </properties>
  <image source="../img/Roche_petit-5.png" width="128" height="74"/>
  <objectgroup draworder="index" id="2">
   <object id="1" x="30.5" y="44.5">
    <polygon points="0,1 32,19.5 63.5,4.5 31,-12"/>
   </object>
  </objectgroup>
 </tile>
 <tile id="62">
  <properties>
   <property name="offsetX" type="float" value="128"/>
   <property name="offsetY" type="float" value="0"/>
  </properties>
  <image source="../img/Tuile_roche_large.png" width="256" height="148"/>
 </tile>
 <tile id="63">
  <properties>
   <property name="offsetX" type="float" value="64"/>
   <property name="offsetY" type="float" value="0"/>
  </properties>
  <image source="../img/Tuile_roche_moyen.png" width="128" height="72"/>
 </tile>
 <tile id="64">
  <properties>
   <property name="offsetX" type="float" value="64"/>
   <property name="offsetY" type="float" value="0"/>
  </properties>
  <image source="../img/Tuile_roche_petit-1.png" width="128" height="74"/>
 </tile>
 <tile id="65">
  <properties>
   <property name="offsetX" type="float" value="64"/>
   <property name="offsetY" type="float" value="0"/>
  </properties>
  <image source="../img/Tuile_roche_petit-2.png" width="128" height="74"/>
 </tile>
 <tile id="66">
  <properties>
   <property name="offsetX" type="float" value="64"/>
   <property name="offsetY" type="float" value="0"/>
  </properties>
  <image source="../img/Tuile_roche_petit-3.png" width="128" height="74"/>
 </tile>
 <tile id="67">
  <properties>
   <property name="offsetX" type="float" value="64"/>
   <property name="offsetY" type="float" value="0"/>
  </properties>
  <image source="../img/Tuile_roche_petit-4.png" width="128" height="74"/>
 </tile>
 <tile id="68">
  <properties>
   <property name="offsetX" type="float" value="64"/>
   <property name="offsetY" type="float" value="0"/>
  </properties>
  <image source="../img/Tuile_roche_petit-5.png" width="128" height="74"/>
 </tile>
 <tile id="69">
  <properties>
   <property name="offsetX" type="float" value="64"/>
   <property name="offsetY" type="float" value="0"/>
  </properties>
  <image source="../img/Tuile_roche_petit-6.png" width="128" height="74"/>
 </tile>
 <tile id="70">
  <properties>
   <property name="offsetX" type="float" value="64"/>
   <property name="offsetY" type="float" value="0"/>
  </properties>
  <image source="../img/Tuile_roche_petit-7.png" width="128" height="74"/>
 </tile>
 <tile id="71">
  <properties>
   <property name="offsetX" type="float" value="128"/>
   <property name="offsetY" type="float" value="0"/>
  </properties>
  <image source="../img/Tuile_roche_ultra.png" width="256" height="148"/>
 </tile>
 <tile id="73">
  <properties>
   <property name="autoshadow" type="bool" value="true"/>
   <property name="dropRange" type="float" value="800"/>
   <property name="height" type="float" value="80"/>
   <property name="offsetX" type="float" value="302.5"/>
   <property name="offsetY" type="float" value="300"/>
   <property name="prefab" value="picnic"/>
  </properties>
  <image source="../img/Picnic.png" width="605" height="459"/>
  <objectgroup draworder="index" id="3">
   <object id="2" x="31" y="260">
    <polygon points="0,8 273,-161.333 535,5 268,174"/>
   </object>
  </objectgroup>
 </tile>
 <tile id="74">
  <properties>
   <property name="height" type="float" value="120"/>
   <property name="offsetX" type="float" value="156.5"/>
   <property name="offsetY" type="float" value="190"/>
  </properties>
  <image source="../img/Roche_gros_mousse-1.png" width="313" height="321"/>
  <objectgroup draworder="index" id="2">
   <object id="1" x="28" y="235">
    <polygon points="1,2 85,-53 261,18 176,79"/>
   </object>
  </objectgroup>
 </tile>
 <tile id="75">
  <properties>
   <property name="height" type="float" value="80"/>
   <property name="offsetX" type="float" value="156.5"/>
   <property name="offsetY" type="float" value="250"/>
  </properties>
  <image source="../img/Roche_gros_mousse-2.png" width="313" height="321"/>
  <objectgroup draworder="index" id="2">
   <object id="1" x="36" y="224">
    <polygon points="-3,2 97,-59 255,15 159,88"/>
   </object>
  </objectgroup>
 </tile>
 <tile id="76">
  <properties>
   <property name="height" type="float" value="80"/>
   <property name="offsetX" type="float" value="156.5"/>
   <property name="offsetY" type="float" value="250"/>
  </properties>
  <image source="../img/Roche_gros_mousse-3.png" width="313" height="321"/>
  <objectgroup draworder="index" id="2">
   <object id="1" x="50" y="241">
    <polygon points="0,0 100,-40 232,27 139,75"/>
   </object>
  </objectgroup>
 </tile>
 <tile id="77">
  <properties>
   <property name="height" type="float" value="80"/>
   <property name="offsetX" type="float" value="156.5"/>
   <property name="offsetY" type="float" value="250"/>
  </properties>
  <image source="../img/Roche_gros_mousse-4.png" width="313" height="321"/>
  <objectgroup draworder="index" id="2">
   <object id="1" x="94" y="257">
    <polygon points="-6,3 71,-40 180,18 106,61"/>
   </object>
  </objectgroup>
 </tile>
 <tile id="78">
  <properties>
   <property name="height" type="float" value="80"/>
   <property name="offsetX" type="float" value="156.5"/>
   <property name="offsetY" type="float" value="250"/>
  </properties>
  <image source="../img/Roche_gros_mousse-5.png" width="313" height="321"/>
  <objectgroup draworder="index" id="2">
   <object id="1" x="70" y="244">
    <polygon points="0,4 81,-33 202,27 115,69"/>
   </object>
  </objectgroup>
 </tile>
 <tile id="79">
  <properties>
   <property name="height" type="float" value="120"/>
   <property name="offsetX" type="float" value="156.5"/>
   <property name="offsetY" type="float" value="250"/>
  </properties>
  <image source="../img/Roche_gros_mousse-6.png" width="313" height="321"/>
  <objectgroup draworder="index" id="2">
   <object id="1" x="25" y="219">
    <polygon points="-5,12 97,-44 266,37 165,97"/>
   </object>
  </objectgroup>
 </tile>
 <tile id="80">
  <properties>
   <property name="height" type="float" value="80"/>
   <property name="offsetX" type="float" value="156.5"/>
   <property name="offsetY" type="float" value="250"/>
  </properties>
  <image source="../img/Roche_gros_mousse-7.png" width="313" height="321"/>
  <objectgroup draworder="index" id="2">
   <object id="1" x="75" y="255">
    <polygon points="0,0 120,61 214,8 97,-51"/>
   </object>
  </objectgroup>
 </tile>
 <tile id="81">
  <properties>
   <property name="height" type="float" value="120"/>
   <property name="offsetX" type="float" value="161"/>
   <property name="offsetY" type="float" value="250"/>
  </properties>
  <image source="../img/Roche_gros-1.png" width="322" height="319"/>
  <objectgroup draworder="index" id="2">
   <object id="1" x="26" y="228">
    <polygon points="0,0 107,-47 266,28 164,84"/>
   </object>
  </objectgroup>
 </tile>
 <tile id="82">
  <properties>
   <property name="height" type="float" value="40"/>
   <property name="offsetX" type="float" value="161"/>
   <property name="offsetY" type="float" value="250"/>
  </properties>
  <image source="../img/Roche_gros-2.png" width="322" height="319"/>
  <objectgroup draworder="index" id="2">
   <object id="1" x="85" y="247">
    <polygon points="0,0 82,-40 192,18 111,61"/>
   </object>
  </objectgroup>
 </tile>
 <tile id="83">
  <properties>
   <property name="height" type="float" value="80"/>
   <property name="offsetX" type="float" value="161"/>
   <property name="offsetY" type="float" value="240"/>
  </properties>
  <image source="../img/Roche_gros-3.png" width="322" height="319"/>
  <objectgroup draworder="index" id="2">
   <object id="1" x="40" y="223">
    <polygon points="1,1 101,-48 256,25 151,82"/>
   </object>
  </objectgroup>
 </tile>
 <tile id="84">
  <properties>
   <property name="height" type="float" value="80"/>
   <property name="offsetX" type="float" value="161"/>
   <property name="offsetY" type="float" value="250"/>
  </properties>
  <image source="../img/Roche_gros-4.png" width="322" height="319"/>
  <objectgroup draworder="index" id="2">
   <object id="1" x="48" y="230">
    <polygon points="0,0 91,-47 230,27 140,78"/>
   </object>
  </objectgroup>
 </tile>
 <tile id="85">
  <properties>
   <property name="height" type="float" value="120"/>
   <property name="offsetX" type="float" value="161"/>
   <property name="offsetY" type="float" value="250"/>
  </properties>
  <image source="../img/Roche_gros-5.png" width="322" height="319"/>
  <objectgroup draworder="index" id="2">
   <object id="1" x="27" y="224">
    <polygon points="-3,9 158,89 266,24 103,-50"/>
   </object>
  </objectgroup>
 </tile>
 <tile id="86">
  <properties>
   <property name="height" type="float" value="40"/>
   <property name="offsetX" type="float" value="161"/>
   <property name="offsetY" type="float" value="250"/>
  </properties>
  <image source="../img/Roche_gros-6.png" width="322" height="319"/>
  <objectgroup draworder="index" id="2">
   <object id="1" x="77" y="250">
    <polygon points="-2,4 78,-40 201,23 118,71"/>
   </object>
  </objectgroup>
 </tile>
 <tile id="87">
  <properties>
   <property name="height" type="float" value="80"/>
   <property name="offsetX" type="float" value="161"/>
   <property name="offsetY" type="float" value="250"/>
  </properties>
  <image source="../img/Roche_gros-7.png" width="322" height="319"/>
  <objectgroup draworder="index" id="2">
   <object id="1" x="76" y="250">
    <polygon points="0,0 89,-45 212,17 120,64"/>
   </object>
  </objectgroup>
 </tile>
 <tile id="88">
  <properties>
   <property name="autoshadow" type="bool" value="true"/>
   <property name="height" type="float" value="240"/>
   <property name="lensed" type="bool" value="true"/>
   <property name="offsetX" type="float" value="400"/>
   <property name="offsetY" type="float" value="360"/>
   <property name="posZ" type="float" value="240"/>
  </properties>
  <image source="../img/Arche_top.png" width="961" height="622"/>
  <objectgroup draworder="index" id="2">
   <object id="1" x="954" y="466">
    <polygon points="-160.667,-35.333 -465,121 -855.333,-103 -619.333,-238.667"/>
   </object>
  </objectgroup>
 </tile>
 <tile id="0">
  <properties>
   <property name="autoheightDelta" type="float" value="220"/>
   <property name="autoshadow" type="bool" value="true"/>
   <property name="height" type="float" value="480"/>
   <property name="lensed" type="bool" value="true"/>
   <property name="offsetX" type="float" value="280"/>
   <property name="offsetY" type="float" value="560"/>
  </properties>
  <image source="../img/Arche_arriere.png" width="1152" height="1024"/>
  <objectgroup draworder="index" id="3">
   <object id="8" x="49" y="580">
    <polygon points="-4,1 174,108 448,-31 251,-143"/>
   </object>
  </objectgroup>
 </tile>
 <tile id="1">
  <properties>
   <property name="autoheightDelta" type="float" value="-90"/>
   <property name="autoshadow" type="bool" value="true"/>
   <property name="height" type="float" value="480"/>
   <property name="lensed" type="bool" value="true"/>
   <property name="offsetX" type="float" value="860"/>
   <property name="offsetY" type="float" value="830"/>
  </properties>
  <image source="../img/Arche_avant.png" width="1152" height="1024"/>
  <objectgroup draworder="index" id="2">
   <object id="2" x="588" y="884">
    <polygon points="-14.3333,6.33333 192,99 519,-76 321.333,-170"/>
   </object>
  </objectgroup>
 </tile>
 <tile id="2">
  <properties>
   <property name="autoheightBulge" type="float" value="930"/>
   <property name="autoshadow" type="bool" value="true"/>
   <property name="autoshadowScale" type="float" value="0.8"/>
   <property name="height" type="float" value="260"/>
   <property name="lensed" type="bool" value="true"/>
   <property name="offsetX" type="float" value="510"/>
   <property name="offsetY" type="float" value="470"/>
   <property name="posZ" type="float" value="740"/>
  </properties>
  <image source="../img/Feuillage1.png" width="1024" height="1286"/>
  <objectgroup draworder="index" id="3">
   <object id="4" x="56.6667" y="218" width="881.251" height="542.883">
    <ellipse/>
   </object>
  </objectgroup>
 </tile>
 <tile id="3">
  <properties>
   <property name="autoheightBulge" type="float" value="930"/>
   <property name="autoshadow" type="bool" value="true"/>
   <property name="autoshadowScale" type="float" value="0.8"/>
   <property name="height" type="float" value="260"/>
   <property name="lensed" type="bool" value="true"/>
   <property name="offsetX" type="float" value="510"/>
   <property name="offsetY" type="float" value="470"/>
   <property name="posZ" type="float" value="740"/>
  </properties>
  <image source="../img/Feuillage2.png" width="1024" height="1286"/>
  <objectgroup draworder="index" id="2">
   <object id="3" x="78.6667" y="270.333" width="881.251" height="542.883">
    <ellipse/>
   </object>
  </objectgroup>
 </tile>
 <tile id="4">
  <properties>
   <property name="autoheightBulge" type="float" value="930"/>
   <property name="autoshadow" type="bool" value="true"/>
   <property name="autoshadowScale" type="float" value="0.8"/>
   <property name="height" type="float" value="260"/>
   <property name="lensed" type="bool" value="true"/>
   <property name="offsetX" type="float" value="510"/>
   <property name="offsetY" type="float" value="470"/>
   <property name="posZ" type="float" value="740"/>
  </properties>
  <image source="../img/Feuillage3.png" width="1024" height="1286"/>
  <objectgroup draworder="index" id="2">
   <object id="1" x="66.6667" y="266.333" width="881.251" height="542.883">
    <ellipse/>
   </object>
  </objectgroup>
 </tile>
 <tile id="5">
  <properties>
   <property name="height" type="float" value="770"/>
   <property name="offsetX" type="float" value="510"/>
   <property name="offsetY" type="float" value="1210"/>
  </properties>
  <image source="../img/Tronc1.png" width="1024" height="1286"/>
  <objectgroup draworder="index" id="4">
   <object id="6" x="394" y="1215">
    <polygon points="0,0 70,29 161,25 222,2 170,-45 48,-44"/>
   </object>
  </objectgroup>
 </tile>
 <tile id="6">
  <properties>
   <property name="height" type="float" value="770"/>
   <property name="offsetX" type="float" value="510"/>
   <property name="offsetY" type="float" value="1210"/>
  </properties>
  <image source="../img/Tronc2.png" width="1024" height="1286"/>
  <objectgroup draworder="index" id="2">
   <object id="2" x="442" y="1207">
    <polygon points="0,0 65.2703,29 150.122,25 207,2 158.514,-45 44.7568,-44"/>
   </object>
  </objectgroup>
 </tile>
 <tile id="7">
  <properties>
   <property name="height" type="float" value="770"/>
   <property name="offsetX" type="float" value="510"/>
   <property name="offsetY" type="float" value="1210"/>
  </properties>
  <image source="../img/Tronc3.png" width="1024" height="1286"/>
  <objectgroup draworder="index" id="2">
   <object id="2" x="357.765" y="1214.86">
    <polygon points="14.2353,-1 85.6288,32.1351 196.946,27.7027 256.235,1.21622 207.956,-49.8649 58.7169,-48.7568"/>
   </object>
  </objectgroup>
 </tile>
 <tile id="91">
  <properties>
   <property name="offsetX" type="float" value="160"/>
   <property name="offsetY" type="float" value="428"/>
   <property name="prefab" value="blonde"/>
  </properties>
  <image source="../img/Blonde.png" width="320" height="448"/>
 </tile>
</tileset>
