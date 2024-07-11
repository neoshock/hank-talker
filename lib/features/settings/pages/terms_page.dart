import 'package:flutter/material.dart';
import 'package:hank_talker_mobile/widgets/custom_appbar_widget.dart';

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbarWidget(context,
          title: 'Política de Privacidad', showBackButton: true),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Política de Privacidad',
              style: Theme.of(context).textTheme.displayLarge,
            ),
            const SizedBox(height: 10),
            Text(
              'Actualizado el 2024-07-02',
              textAlign: TextAlign.justify,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 10),
            Text(
              'Hand Talker ("nosotros", "nuestro" o "nos") se compromete a proteger su privacidad.',
              textAlign: TextAlign.justify,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 10),
            Text(
              'Esta Política de privacidad explica cómo Hand Talker recopila, usa y divulga su información personal.',
              textAlign: TextAlign.justify,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 10),
            Text(
              'Definiciones y Términos Clave',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            Text(
              'Para ayudar a explicar las cosas de la manera más clara posible en esta Política de privacidad, cada vez que se hace referencia a cualquiera de estos términos, se definen estrictamente como:',
              textAlign: TextAlign.justify,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 10),
            Text(
              'Cookie: pequeña cantidad de datos generados por un sitio web y guardados por su navegador web. Se utiliza para identificar su navegador, proporcionar análisis, recordar información sobre usted, como su preferencia de idioma o información de inicio de sesión.',
              textAlign: TextAlign.justify,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 10),
            Text(
              'Compañía: cuando esta política menciona "Compañía", "nosotros", "nos" o "nuestro", se refiere a Hand Talker, que es responsable de su información en virtud de esta Política de privacidad.',
              textAlign: TextAlign.justify,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 10),
            Text(
              'Plataforma: sitio web de Internet, aplicación web o aplicación digital de cara al público de Hand Talker.',
              textAlign: TextAlign.justify,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 10),
            Text(
              'País: donde se encuentra Hand Talker o los propietarios / fundadores de Hand Talker. En este caso, es Ecuador.',
              textAlign: TextAlign.justify,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 10),
            Text(
              'Cliente: se refiere a la empresa, organización o persona que se registra para utilizar el Servicio Hand Talker para gestionar las relaciones con sus consumidores o usuarios del servicio.',
              textAlign: TextAlign.justify,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 10),
            Text(
              'Dispositivo: cualquier dispositivo conectado a Internet, como un teléfono, tablet, computadora o cualquier otro dispositivo que se pueda usar para visitar Hand Talker y usar los servicios.',
              textAlign: TextAlign.justify,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 10),
            Text(
              'Dirección IP: a cada dispositivo conectado a Internet se le asigna un número conocido como dirección de protocolo de Internet (IP). Estos números generalmente se asignan en bloques geográficos. A menudo, se puede utilizar una dirección IP para identificar la ubicación desde la que un dispositivo se conecta a Internet.',
              textAlign: TextAlign.justify,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 10),
            Text(
              'Personal: se refiere a aquellas personas que son empleadas por Hand Talker o están bajo contrato para realizar un servicio en nombre de una de las partes.',
              textAlign: TextAlign.justify,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 10),
            Text(
              'Datos personales: cualquier información que directa, indirectamente o en conexión con otra información, incluido un número de identificación personal, permita la identificación de una persona física.',
              textAlign: TextAlign.justify,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 10),
            Text(
              'Servicio: se refiere al servicio brindado por Hand Talker como se describe en los términos relativos (si están disponibles) y en esta plataforma.',
              textAlign: TextAlign.justify,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 10),
            Text(
              'Terceros: se refiere a anunciantes, patrocinadores de concursos, socios promocionales y de marketing, y otros que brindan nuestro contenido o cuyos productos o servicios que creemos que pueden interesarle.',
              textAlign: TextAlign.justify,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 10),
            Text(
              'Sitio web: el sitio de Hand Talker, al que se puede acceder a través de esta URL: ___ .',
              textAlign: TextAlign.justify,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 10),
            Text(
              '¿Qué información recopilamos?',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            Text(
              'Recopilamos información suya cuando visita nuestra plataforma, se registra en nuestro sitio, realiza un pedido, se suscribe a nuestro boletín, responde a una encuesta o completa un formulario. La información puede incluir:',
              textAlign: TextAlign.justify,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 10),
            Text(
              'Nombre / nombre de usuario\nCorreos electrónicos\nDirecciones de correo\nContraseña',
              textAlign: TextAlign.justify,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 10),
            Text(
              '¿Cómo usamos la información que recopilamos?',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            Text(
              'La información que recopilamos puede usarse de las siguientes maneras:\nPara personalizar su experiencia (su información nos ayuda a responder mejor a sus necesidades individuales).\nPara mejorar nuestra plataforma (nos esforzamos continuamente por mejorar lo que ofrece nuestra plataforma en función de la información y los comentarios que recibimos de usted).\nPara mejorar el servicio al cliente (su información nos ayuda a responder de manera más efectiva a sus solicitudes de servicio al cliente y necesidades de soporte).\nPara procesar transacciones.\nPara administrar un concurso, promoción, encuesta u otra característica del sitio.\nPara enviar correos electrónicos periódicos.',
              textAlign: TextAlign.justify,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 10),
            Text(
              '¿Cuándo usa Hand Talker la información del cliente de terceros?',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            Text(
              'Recibimos información de terceros cuando se comunica con nosotros. Por ejemplo, cuando nos envía su dirección de correo electrónico para mostrar interés en convertirse en cliente de Hand Talker, recibimos información de un tercero que brinda servicios automáticos de detección de fraude a Hand Talker. Ocasionalmente, también recopilamos información que se pone a disposición del público en los sitios web de redes sociales. Puede controlar la cantidad de información que los sitios web de redes sociales hacen pública visitando estos sitios web y cambiando su configuración de privacidad.',
              textAlign: TextAlign.justify,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 10),
            Text(
              '¿Compartimos la información que recopilamos con terceros?',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            Text(
              'Podemos compartir la información que recopilamos, tanto personal como no personal, con terceros como anunciantes, patrocinadores de concursos, socios promocionales y de marketing, y otros que proporcionan nuestro contenido o cuyos productos o servicios creemos que pueden interesarle. También podemos compartirlo con nuestras compañías afiliadas y socios comerciales actuales y futuros, y si estamos involucrados en una fusión, venta de activos u otra reorganización comercial, también podemos compartir o transferir su información personal y no personal a nuestros sucesores en interés.',
              textAlign: TextAlign.justify,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 10),
            Text(
              'Podemos contratar proveedores de servicios de terceros de confianza para que realicen funciones y nos brinden servicios, como el alojamiento y el mantenimiento de nuestros servidores y la plataforma, almacenamiento y administración de bases de datos, administración de correo electrónico, marketing de almacenamiento, procesamiento de tarjetas de crédito, servicio y cumplimiento de pedidos de productos y servicios que puede comprar a través de la plataforma. Es probable que compartamos su información personal, y posiblemente alguna información no personal, con estos terceros para permitirles realizar estos servicios para nosotros y para usted.',
              textAlign: TextAlign.justify,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 10),
            Text(
              'Podemos compartir partes de los datos de nuestro archivo de registro, incluidas las direcciones IP, con fines analíticos con terceros, como socios de análisis web, desarrolladores de aplicaciones y redes publicitarias. Si se comparte su dirección IP, se puede utilizar para estimar la ubicación general y otros datos tecnológicos, como la velocidad de conexión, si ha visitado la plataforma en una ubicación compartida y el tipo de dispositivo utilizado para visitar la plataforma. Pueden agregar información sobre nuestra publicidad y lo que ve en la plataforma y luego proporcionar auditorías, investigaciones e informes para nosotros y nuestros anunciantes.',
              textAlign: TextAlign.justify,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 10),
            Text(
              'También podemos divulgar información personal y no personal sobre usted al gobierno, a funcionarios encargados de hacer cumplir la ley o a terceros privados, según consideremos, a nuestro exclusivo criterio, necesario o apropiado para responder a reclamos, procesos legales (incluidas citaciones), para proteger nuestros derechos e intereses o los de un tercero, la seguridad del público o de cualquier persona, para prevenir o detener cualquier actividad ilegal, poco ética o legalmente procesable, o para cumplir con las órdenes judiciales, leyes, reglas y regulaciones aplicables.',
              textAlign: TextAlign.justify,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 10),
            Text(
              '¿Dónde y cuándo se recopila la información de los clientes y usuarios finales?',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            Text(
              'Hand Talker recopilará la información personal que nos envíe. También podemos recibir información personal sobre usted de terceros como se describe anteriormente.',
              textAlign: TextAlign.justify,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 10),
            Text(
              '¿Podría transferirse mi información a otros países?',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            Text(
              'Estamos incorporados en Ecuador. La información recopilada a través de nuestro sitio web, a través de interacciones directas con usted o del uso de nuestros servicios de ayuda puede transferirse de vez en cuando a nuestras oficinas o personal, o a terceros, ubicados en todo el mundo, y puede verse y alojarse en cualquier lugar del mundo, incluidos los países que pueden no tener leyes de aplicación general que regulen el uso y la transferencia de dichos datos. En la mayor medida permitida por la ley aplicable, al utilizar cualquiera de los anteriores, usted acepta voluntariamente la transferencia transfronteriza y el alojamiento de dicha información.',
              textAlign: TextAlign.justify,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 10),
            Text(
              '¿La información recopilada a través del Servicio Hand Talker es segura?',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            Text(
              'Tomamos precauciones para proteger la seguridad de su información. Contamos con procedimientos físicos, electrónicos y administrativos para ayudar a salvaguardar, prevenir el acceso no autorizado, mantener la seguridad de los datos y usar correctamente su información. Sin embargo, ni las personas ni los sistemas de seguridad son infalibles, incluidos los sistemas de cifrado. Además, las personas pueden cometer delitos intencionales, cometer errores o no seguir las políticas. Por lo tanto, aunque hacemos todos los esfuerzos razonables para proteger su información personal, no podemos garantizar su seguridad absoluta. Si la ley aplicable impone algún deber irrenunciable de proteger su información personal, usted acepta que la mala conducta intencional será el estándar utilizado para medir nuestro cumplimiento con ese deber.',
              textAlign: TextAlign.justify,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 10),
            Text(
              '¿Puedo actualizar o corregir mi información?',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            Text(
              'Los derechos que tiene para solicitar actualizaciones o correcciones de la información que recopila Hand Talker dependen de su relación con Hand Talker. El personal puede actualizar o corregir su información según se detalla en nuestras políticas de empleo internas de la empresa.\nLos clientes tienen derecho a solicitar la restricción de ciertos usos y divulgaciones de información de identificación personal de la siguiente manera. Puede comunicarse con nosotros para (1) actualizar o corregir su información de identificación personal, (2) cambiar sus preferencias con respecto a las comunicaciones y otra información que recibe de nosotros, o (3) eliminar la información de identificación personal que se mantiene sobre usted en nuestro sistema (sujeto al siguiente párrafo), cancelando su cuenta. Dichas actualizaciones, correcciones, cambios y eliminaciones no tendrán ningún efecto sobre otra información que mantenemos o información que hayamos proporcionado a terceros de acuerdo con esta Política de privacidad antes de dicha actualización, corrección, cambio o eliminación. Para proteger su privacidad y seguridad, podemos tomar medidas razonables (como solicitar una contraseña única) para verificar su identidad antes de otorgarle acceso a su perfil o hacer correcciones. Usted es responsable de mantener en secreto su contraseña única y la información de su cuenta en todo momento.\nDebe tener en cuenta que tecnológicamente no es posible eliminar todos y cada uno de los registros de la información que nos ha proporcionado de nuestro sistema. La necesidad de realizar copias de seguridad de nuestros sistemas para proteger la información de pérdidas involuntarias significa que puede existir una copia de su información en una forma que no se pueda borrar y que será difícil o imposible de localizar para nosotros. Inmediatamente después de recibir su solicitud, toda la información personal almacenada en las bases de datos que usamos activamente y otros medios fácilmente buscables se actualizará, corregirá, cambiará o eliminará, según corresponda, tan pronto como y en la medida en que sea razonable y técnicamente posible.',
              textAlign: TextAlign.justify,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 10),
            Text(
              'Si es un usuario final y desea actualizar, eliminar o recibir cualquier información que tengamos sobre usted, puede hacerlo poniéndose en contacto con la organización de la que es cliente.',
              textAlign: TextAlign.justify,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 10),
            Text(
              'Venta de Negocio',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            Text(
              'Nos reservamos el derecho de transferir información a un tercero en el caso de una venta, fusión u otra transferencia de todos o sustancialmente todos los activos de Hand Talker o cualquiera de sus afiliadas corporativas, o la porción de Hand Talker o cualquiera de sus afiliadas corporativas con las que se relaciona el Servicio, o en el caso de que discontinuemos nuestro negocio o presentemos una petición o hayamos presentado una petición contra nosotros en caso de quiebra, reorganización o procedimiento similar, siempre que el tercero acepte adherirse a los términos de esta Política de privacidad.',
              textAlign: TextAlign.justify,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 10),
            Text(
              'Afiliados',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            Text(
              'Podemos divulgar información (incluida la información personal) sobre usted a nuestros afiliados corporativos. Para los propósitos de esta Política de Privacidad, "Afiliado Corporativo" significa cualquier persona o entidad que directa o indirectamente controla, está controlada por o está bajo control común con Hand Talker, ya sea por propiedad o de otra manera. Cualquier información relacionada con usted que proporcionemos a nuestros afiliados corporativos será tratada por dichos afiliados corporativos de acuerdo con los términos de esta política de privacidad.',
              textAlign: TextAlign.justify,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 10),
            Text(
              '¿Cuánto tiempo conservamos su información?',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            Text(
              'Conservamos su información solo mientras la necesitemos para proporcionarle Hand Talker y cumplir con los propósitos descritos en esta política. Este también es el caso de cualquier persona con la que compartamos su información y que lleve a cabo servicios en nuestro nombre. Cuando ya no necesitemos usar su información y no sea necesario que la conservemos para cumplir con nuestras obligaciones legales o reglamentarias, la eliminaremos de nuestros sistemas o la despersonalizaremos para que no podamos identificarlo.',
              textAlign: TextAlign.justify,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 10),
            Text(
              '¿Cómo protegemos su información?',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            Text(
              'Implementamos una variedad de medidas de seguridad para mantener la seguridad de su información personal cuando realiza un pedido, ingresa, envía o accede a su información personal. Ofrecemos el uso de un servidor seguro. Toda la información confidencial/crediticia suministrada se transmite a través de la tecnología Secure Socket Layer (SSL) y luego se encripta en nuestra base de datos de proveedores de pasarela de pago solo para que sea accesible por aquellos autorizados con derechos especiales de acceso a dichos sistemas, y deben mantener la información confidencial. Después de una transacción, su información privada (tarjetas de crédito, números de seguro social, finanzas, etc.) nunca se archiva. Sin embargo, no podemos garantizar la seguridad absoluta de la información que transmita a Hand Talker ni garantizar que su información en el servicio no sea accedida, divulgada, alterada o destruida por una infracción de cualquiera de nuestras condiciones físicas, salvaguardias técnicas o de gestión.',
              textAlign: TextAlign.justify,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 10),
            Text(
              'Ley que Rige',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            Text(
              'Esta Política de privacidad se rige por las leyes de Ecuador sin tener en cuenta su disposición sobre conflicto de leyes. Usted acepta la jurisdicción exclusiva de los tribunales en relación con cualquier acción o disputa que surja entre las partes en virtud de esta Política de privacidad o en relación con ella, excepto aquellas personas que puedan tener derecho a presentar reclamaciones en virtud del Escudo de privacidad o el marco suizo-estadounidense.',
              textAlign: TextAlign.justify,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 10),
            Text(
              'Tu consentimiento',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            Text(
              'Hemos actualizado nuestra Política de privacidad para brindarle total transparencia sobre lo que se establece cuando visita nuestro sitio y cómo se utiliza. Al utilizar nuestra plataforma, registrar una cuenta o realizar una compra, por la presente acepta nuestra Política de privacidad y acepta sus términos.',
              textAlign: TextAlign.justify,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 10),
            Text(
              'Enlaces a otros Sitios Web',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            Text(
              'Esta Política de privacidad se aplica solo a los Servicios. Los Servicios pueden contener enlaces a otros sitios web que Hand Talker no opera ni controla. No somos responsables por el contenido, la precisión o las opiniones expresadas en dichos sitios web, y dichos sitios web no son investigados, monitoreados o verificados por nuestra precisión o integridad. Recuerde que cuando utiliza un enlace para ir desde los Servicios a otro sitio web, nuestra Política de privacidad deja de estar en vigor. Su navegación e interacción en cualquier otro sitio web, incluidos aquellos que tienen un enlace en nuestra plataforma, están sujetos a las propias reglas y políticas de ese sitio web. Dichos terceros pueden utilizar sus propias cookies u otros métodos para recopilar información sobre usted.',
              textAlign: TextAlign.justify,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 10),
            Text(
              'Cookies',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            Text(
              'Hand Talker utiliza "cookies" para identificar las áreas de nuestro sitio web que ha visitado. Una cookie es una pequeña porción de datos que su navegador web almacena en su computadora o dispositivo móvil. Usamos cookies para mejorar el rendimiento y la funcionalidad de nuestra plataforma, pero no son esenciales para su uso. Sin embargo, sin estas cookies, es posible que ciertas funciones, como los videos, no estén disponibles o se le solicitará que ingrese sus datos de inicio de sesión cada vez que visite la plataforma, ya que no podríamos recordar que había iniciado sesión anteriormente. La mayoría de los navegadores web se pueden configurar para desactivar el uso de cookies. Sin embargo, si desactiva las cookies, es posible que no pueda acceder a la funcionalidad de nuestro sitio web correctamente o en absoluto. Nunca colocamos información de identificación personal en cookies.',
              textAlign: TextAlign.justify,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 10),
            Text(
              'Privacidad de los Niños',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            Text(
              'Recopilamos información de niños menores de 13 años solo para mejorar nuestros servicios y nos comprometemos a seguir las políticas de privacidad para niños de Google Play y App Store. Si usted es padre o tutor y sabe que su hijo nos ha proporcionado datos personales sin su permiso, comuníquese con nosotros. Si nos damos cuenta de que hemos recopilado datos personales de cualquier persona menor de 13 años sin la verificación del consentimiento de los padres, tomamos medidas para eliminar esa información de nuestros servidores.',
              textAlign: TextAlign.justify,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 10),
            Text(
              'Cambios en nuestra Política de Privacidad',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            Text(
              'Podemos cambiar nuestro Servicio y nuestras políticas, y es posible que debamos realizar cambios en esta Política de privacidad para que reflejen con precisión nuestro Servicio y nuestras políticas. A menos que la ley exija lo contrario, le notificaremos (por ejemplo, a través de nuestro Servicio) antes de realizar cambios en esta Política de privacidad y le daremos la oportunidad de revisarlos antes de que entren en vigencia. Luego, si continúa utilizando el Servicio, estará sujeto a la Política de privacidad actualizada. Si no desea aceptar esta o cualquier Política de privacidad actualizada, puede eliminar su cuenta.',
              textAlign: TextAlign.justify,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 10),
            Text(
              'Servicios de terceros',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            Text(
              'Podemos mostrar, incluir o poner a disposición contenido de terceros (incluidos datos, información, aplicaciones y otros servicios de productos) o proporcionar enlaces a sitios web o servicios de terceros ("Servicios de terceros").\nUsted reconoce y acepta que Hand Talker no será responsable de ningún Servicio de terceros, incluida su precisión, integridad, puntualidad, validez, cumplimiento de los derechos de autor, legalidad, decencia, calidad o cualquier otro aspecto de los mismos. Hand Talker no asume ni tendrá ninguna obligación o responsabilidad ante usted o cualquier otra persona o entidad por los Servicios de terceros. Los Servicios de terceros y los enlaces a los mismos se brindan únicamente para su conveniencia y usted accede a ellos y los usa completamente bajo su propio riesgo y sujeto a los términos y condiciones de dichos terceros.',
              textAlign: TextAlign.justify,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 10),
            Text(
              'Información del Desarrollador',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            Text(
              'Desarrollador: Aplicaciones UTEQ Universidad Técnica Estatal de Quevedo URL: https://www.uteq.edu.ec/es\nVigencia de la Política de Privacidad: 3 de Julio del 2024',
              textAlign: TextAlign.justify,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 15),
            Text(
              '© 2024 Hand Talker',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}
