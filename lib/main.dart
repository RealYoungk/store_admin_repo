import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';
import 'package:htmltopdfwidgets/htmltopdfwidgets.dart' as pw;
import 'package:printing/printing.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Fluent UI Example',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Printer? printer;

  @override
  Widget build(BuildContext context) {
    return AdaptiveScaffold(
      appBar: AppBar(
        title: const Text('Fluent UI Example'),
      ),
      body: (context) {
        return Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('설정된 프린터: \n$printer'),
              Wrap(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      final player = AudioPlayer();
                      player.play(AssetSource('/sounds/noti_sound.mp3'));
                    },
                    child: const Text('오디오 재생'),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      final font = await fontFromAssetBundle(
                        'fonts/NanumGothic-Regular.ttf',
                      );
                      final emoji = await rootBundle
                          .load('fonts/NotoEmoji-VariableFont_wght.ttf');

                      final doc = pw.Document();

                      doc.addPage(
                        pw.Page(
                          pageFormat: pw.PdfPageFormat.roll57,
                          build: (pw.Context context) {
                            return pw.Center(
                              child: pw.Column(
                                children: [
                                  pw.Text(
                                    /// 이모지
                                    '''
                              😀😁😂🤣😃😄😅😆😇😈😉😊😋😌😍😎😏😐😑😒😓😔😕😖😗😘😙😚😛😜😝😞😟😠😡😢😣😤😥😦😧😨😩😪😫😬😭😮😯😰😱😲😳😴😵😶😷😸😹😺😻😼😽😾😿🙀🙁🙂🙃🙄🙅🙆🙇🙈🙉🙊🙋🙌🙍🙎🙏
                              ''',
                                    style: pw.TextStyle(
                                      font: pw.Font.ttf(emoji),
                                      fontSize: 20,
                                      fontFallback: [pw.Font.ttf(emoji), font],
                                    ),
                                  ),
                                  pw.Text(
                                    '''
                                    // 특수문자 빽쿼터 에러남
                              ! " # \$ % & ' ( ) * + , - . / : ; < = > ? @ [ \\ ] ^ _ { | } ~ ₩
                              ''',
                                    style: pw.TextStyle(
                                      font: font,
                                      fontSize: 20,
                                      fontFallback: [font],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      );

                      Printing.layoutPdf(
                        onLayout: (format) {
                          return doc.save();
                        },
                      );
                    },
                    child: const Text('프린터 위젯 출력'),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      final font = await fontFromAssetBundle(
                          'fonts/NanumGothic-Regular.ttf');
                      final emoji = await rootBundle
                          .load('fonts/NotoEmoji-VariableFont_wght.ttf');

                      final doc = pw.Document();

                      doc.addPage(
                        pw.Page(
                          pageFormat: pw.PdfPageFormat.roll57,
                          build: (pw.Context context) {
                            return pw.Center(
                              child: pw.Column(
                                children: [
                                  pw.Text(
                                    '''ABCDEFGHIJKLMNOPQRSTUVWXYZ
                                  1234567890
                                  가나다라마바사
                                  가각간갇갈갉갊갋갌갍갎갏감갑값갓갔강갖갗갘같갚갛개객갞갟갠갡갢갣갤갥갦갧갨갩갪갫갬갭갮갯갰갱갲갳갴갵갶갷갸갹갺갻갼갽갾갿
                                  나낙낚낛난낝낞낟날낡낢낣낤낥낦낧남납낪낫났낭낮낯낰낱낲낳내낵낶낷낸낹낺낻낼낽낾낿
                              다닥닦닧단닩닪닫달닭닮닯닰닱닲닳담답닶닷닸당닺닻닼닽닾닿
                              라락띾띿란랁랂랃랄랅랆랇랈랉랊랋람랍랎랏
                              마막맊맋만맍많맏말맑맒맓맔맕맖맗맘맙맚
                              바박반받발밝밞밟밠밡밢밣밤밥밦밧밨방밪밫밬밭밮밯
                              사삭삮삯산삱삲삳살삵삶삷
                              ''',
                                    style: pw.TextStyle(
                                      font: font,
                                      fontSize: 20,
                                      fontFallback: [font],
                                    ),
                                  ),
                                  pw.Text(
                                    '''
                              😀😁😂🤣😃😄😅😆😇😈😉😊😋😌😍😎😏😐😑😒😓😔😕😖😗😘😙😚😛😜😝😞😟😠😡😢😣😤😥😦😧😨😩😪😫😬😭😮😯😰😱😲😳😴😵😶😷😸😹😺😻😼😽😾😿🙀🙁🙂🙃🙄🙅🙆🙇🙈🙉🙊🙋🙌🙍🙎🙏
                              ''',
                                    style: pw.TextStyle(
                                      font: pw.Font.ttf(emoji),
                                      fontSize: 20,
                                      fontFallback: [pw.Font.ttf(emoji), font],
                                    ),
                                  ),
                                  pw.Text(
                                    '''
                                    // 특수문자 빽쿼터 에러남
                              ! " # \$ % & ' ( ) * + , - . / : ; < = > ? @ [ \\ ] ^ _ { | } ~ ₩
                              ''',
                                    style: pw.TextStyle(
                                      font: font,
                                      fontSize: 20,
                                      fontFallback: [font],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      );

                      final printers = await Printing.listPrinters();
                      final currentPrinter = printer ?? printers.firstOrNull;

                      debugPrint(currentPrinter.toString());

                      if (currentPrinter == null) return;

                      final result = await Printing.directPrintPdf(
                        printer: currentPrinter,
                        onLayout: (format) {
                          return doc.save();
                        },
                      );

                      debugPrint(result.toString());
                    },
                    child: const Text('프린터 위젯 다이렉트 출력'),
                  ),
                  ElevatedButton(
                    child: const Text('HTML 출력'),
                    onPressed: () async {
                      final font = await fontFromAssetBundle(
                          'fonts/NanumGothic-Regular.ttf');
                      final emoji = await rootBundle
                          .load('fonts/NotoEmoji-VariableFont_wght.ttf');
                      const body = '''
    <h1>Heading Example</h1>
    <p>This is a paragraph.</p>
    <img src="https://picsum.photos/200/300" alt="Example Image" />
    <blockquote>This is a quote.</blockquote>
    <ul>
      <li>First item</li>
      <li>Second item</li>
      <li>Third item</li>
    </ul>
    ''';
                      final widgets = await pw.HTMLToPdf().convert(
                        body,
                        fontFallback: [font, pw.Font.ttf(emoji)],
                      );

                      final doc = pw.Document();

                      doc.addPage(
                        pw.Page(
                            build: (context) => pw.Column(children: widgets)),
                      );

                      final printers = await Printing.listPrinters();
                      final currentPrinter = printer ?? printers.firstOrNull;

                      Printing.layoutPdf(
                        format: pw.PdfPageFormat.roll57,
                        onLayout: (format) {
                          return doc.save();
                        },
                      );

                      debugPrint(currentPrinter.toString());
                    },
                  ),
                ],
              ),
            ],
          ),
        );
      },
      onSelectedIndexChange: (index) async {
        switch (index) {
          case 0:
            final player = AudioPlayer();
            player.play(AssetSource('/sounds/noti_sound.mp3'));
            break;
          case 1:
            final font =
                await fontFromAssetBundle('fonts/NanumGothic-Regular.ttf');
            final emoji =
                await rootBundle.load('fonts/NotoEmoji-VariableFont_wght.ttf');
            // final emoji = await fontFromAssetBundle(
            //     'fonts/NotoColorEmoji-Regular.ttf');
            // final emoji = await PdfGoogleFonts.notoColorEmoji();
            final doc = pw.Document();

            doc.addPage(
              pw.Page(
                pageFormat: pw.PdfPageFormat.roll57,
                build: (pw.Context context) {
                  return pw.Center(
                    child: pw.Column(
                      children: [
                        pw.Text(
                          '''ABCDEFGHIJKLMNOPQRSTUVWXYZ
                                  1234567890
                                  가나다라마바사
                                  가각간갇갈갉갊갋갌갍갎갏감갑값갓갔강갖갗갘같갚갛개객갞갟갠갡갢갣갤갥갦갧갨갩갪갫갬갭갮갯갰갱갲갳갴갵갶갷갸갹갺갻갼갽갾갿
                                  나낙낚낛난낝낞낟날낡낢낣낤낥낦낧남납낪낫났낭낮낯낰낱낲낳내낵낶낷낸낹낺낻낼낽낾낿
                              다닥닦닧단닩닪닫달닭닮닯닰닱닲닳담답닶닷닸당닺닻닼닽닾닿
                              라락띾띿란랁랂랃랄랅랆랇랈랉랊랋람랍랎랏
                              마막맊맋만맍많맏말맑맒맓맔맕맖맗맘맙맚
                              바박반받발밝밞밟밠밡밢밣밤밥밦밧밨방밪밫밬밭밮밯
                              사삭삮삯산삱삲삳살삵삶삷
                              ''',
                          style: pw.TextStyle(
                            font: font,
                            fontSize: 20,
                            fontFallback: [font],
                          ),
                        ),
                        pw.Text(
                          '''
                              😀😁😂🤣😃😄😅😆😇😈😉😊😋😌😍😎😏😐😑😒😓😔😕😖😗😘😙😚😛😜😝😞😟😠😡😢😣😤😥😦😧😨😩😪😫😬😭😮😯😰😱😲😳😴😵😶😷😸😹😺😻😼😽😾😿🙀🙁🙂🙃🙄🙅🙆🙇🙈🙉🙊🙋🙌🙍🙎🙏
                              ''',
                          style: pw.TextStyle(
                            font: pw.Font.ttf(emoji),
                            fontSize: 20,
                            fontFallback: [pw.Font.ttf(emoji), font],
                          ),
                        ),
                        pw.Text(
                          '''
                                    // 특수문자 빽쿼터 에러남
                              ! " # \$ % & ' ( ) * + , - . / : ; < = > ? @ [ \\ ] ^ _ { | } ~ ₩
                              ''',
                          style: pw.TextStyle(
                            font: font,
                            fontSize: 20,
                            fontFallback: [font],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            );
            if (!context.mounted) return;
            final List<Printer> printers = await Printing.listPrinters();

            final result = await Printing.directPrintPdf(
              printer:
                  printers.firstOrNull ?? printer ?? const Printer(url: ''),
              onLayout: (format) {
                return doc.save();
              },
            );

            debugPrint(result.toString());
            break;
          case 2:
            printer = await Printing.pickPrinter(context: context);
            setState(() {});

            debugPrint(printer?.toMap().toString());

            if (printer == null) return;

          case 3:
            final List<Printer> printers = await Printing.listPrinters();
            debugPrint(printers.toString());
          default:
            debugPrint('Selected index: $index');
            break;
        }
      },
      destinations: const [
        NavigationDestination(
          key: PageStorageKey<String>('Sound'),
          icon: Icon(Icons.surround_sound),
          label: '효과음 재생',
          enabled: true,
          selectedIcon: Icon(Icons.surround_sound),
          tooltip: '효과음 재생',
        ),
        NavigationDestination(
          icon: Icon(Icons.print),
          label: '인쇄',
          enabled: true,
          selectedIcon: Icon(Icons.print),
          tooltip: '인쇄',
        ),
        NavigationDestination(
          icon: Icon(Icons.print_outlined),
          label: '프린터기 선택',
          enabled: true,
          selectedIcon: Icon(Icons.print_outlined),
          tooltip: '프린터기 선택',
        ),
        NavigationDestination(
          icon: Icon(Icons.local_print_shop_outlined),
          label: '연결된 프린터기',
          enabled: true,
          selectedIcon: Icon(Icons.local_print_shop),
          tooltip: '연결된 프린터기',
        ),
        NavigationDestination(
          key: PageStorageKey<String>('Add'),
          icon: Icon(Icons.add),
          label: 'Add',
          enabled: true,
          selectedIcon: Icon(Icons.add),
          tooltip: 'Add',
        ),
        NavigationDestination(
          key: PageStorageKey<String>('Write'),
          icon: Icon(Icons.edit),
          label: 'Write',
          enabled: true,
          selectedIcon: Icon(Icons.edit),
          tooltip: 'Write',
        ),
        NavigationDestination(
          key: PageStorageKey<String>('Delete'),
          icon: Icon(Icons.delete),
          label: 'Delete',
          enabled: true,
          selectedIcon: Icon(Icons.delete),
          tooltip: 'Delete',
        ),
      ],
    );
  }
}
