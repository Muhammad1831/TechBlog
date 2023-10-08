import 'package:techblog/gen/assets.gen.dart';
import 'package:techblog/models/data_model.dart';

Map homePagePosterMap = {
  "posterImage": Assets.images.posterHomePage.path,
  "writer": "ملیکا عزیزی",
  "publicationDate": "یک روز پیش",
  "views": "253",
  "title": "دوازده قدم برنامه نویسی یک دوره ی"
};

List<HashTagModel> tagList = [
  HashTagModel(tagName: 'جاوا'),
  HashTagModel(tagName: 'برنامه نویسی وب'),
  HashTagModel(tagName: 'پادکست رادیو کدیاد'),
  HashTagModel(tagName: 'هوش مصنوعی'),
  HashTagModel(tagName: 'فلاتر'),
  HashTagModel(tagName: 'پایتون'),
  HashTagModel(tagName: 'ماشین لرنینگ'),
  HashTagModel(tagName: 'آموزش لاراول'),
];
List<BlogPageModel> blogList = [
  BlogPageModel(
      id: 1,
      imageURL:
          "https://digiato.com/wp-content/uploads/2022/04/photo_2022-04-29_09-37-59.jpg",
      title: "ایلان ماسک حدود 4 میلیارد دلار از سهام تسلا را فروخت",
      writer: "جواد تاجی",
      imageWriterURL: "https://digiato.com/wp-content/uploads/2021/02/1-30.jpg",
      timePublication: "۱ ساعت پیش",
      content: """
      بر اساس اسناد و پرونده‌های نظارتی منتشر شده، «ایلان ماسک» مدیرعامل تسلا، حدود 4.4 میلیون سهام خود از غول خودروسازی را به ارزش 4 میلیارد دلار در روز سه‌شنبه فروخته است.

طبق گزارش‌های منتشر شده، ماسک در مجموع پنج فرم 4 را به کمیسیون بورس و اوراق بهادار ایالات متحده (SEC) ارائه کرده که تمام 138 تراکنش فردی او را پوشش می‌دهد. بر اساس محاسبات TechCrunch، ارزش سهام فروخته شده، نزدیک به 4 میلیارد دلار است. به گزارش رویترز، این میزان معادل 2.6 درصد از سهام او در تسلا محسوب می‌شود
      """,
      views: "384"),
  BlogPageModel(
      id: 2,
      imageURL:
          "https://digiato.com/wp-content/uploads/2022/04/photo_2022-04-29_09-06-13.jpg",
      title:
          "گزارش درآمد فصل دوم سال مالی 2022 اپل منتشر شد؛ رشد 9 درصدی درآمد",
      writer: "جواد تاجی",
      imageWriterURL: "https://digiato.com/wp-content/uploads/2021/02/1-30.jpg",
      timePublication: "۴ ساعت پیش",
      content: """

هرچند اپل همچنان با محدودیت‌های عرضه دست و پنجه نرم می‌کند، اما در گزارش درآمد سه ماهه دوم سال مالی خود، بهترین فصل منتهی به مارس را در تاریخش گزارش کرد. غول فناوری در این سه ماهه، 97.3 میلیارد دلار درآمد داشته که نسبت به مدت زمان مشابه در سال گذشته، 9 درصد افزایش یافته است. همچنین سود این شرکت 25 میلیارد دلار و سود هر سهم آن 1.52 دلار بوده است.

      """,
      views: "1002"),
  BlogPageModel(
      id: 3,
      imageURL:
          "https://digiato.com/wp-content/uploads/2022/04/1200-178443098-space-exploration-risks_smaller.jpg",
      title: "کاوشگران سیاره سرخ چگونه به تولید برق در مریخ می‌پردازند؟",
      writer: "مرضیه فرجی",
      imageWriterURL:
          "https://digiato.com/wp-content/uploads/2022/02/10897985_639437109516078_4342420382567329691_n-300x300.jpg",
      timePublication: "",
      content: """
انرژی خورشیدی و انرژی هسته‌ای منابع انرژی هستند که تیم‌های کاوشگران در مریخ مورد استفاده قرار می‌دهند. کدام یک بهتر است؟ چطور می‌توان به تولید برق در مریخ پرداخت؟ دانشمندان به این سوالات پاسخ دادند.

محققان برای سفرهای خدمه مریخ به گزینه مختلف تولید انرژی را باهم مقایسه کردند: سلول‌های خورشیدی و انرژی‌ هسته‌ای رآکتورهای شکاف کوچک. یکی از ملاحظات کلیدی در این مطالعه، مقدار وزن یا جرم قابل حمل اجزای مورد نیاز است، زیرا لوازمی که در ماموریت‌های مریخ مورد استفاده قرار می‌گیرند، باید بهینه‌ترین وزن را داشته باشند. نتایج این مطالعه که در « Frontiers in Astronomy and Space Sciences» به چاپ رسید، نشان می‌دهد وابسته به موقعیت جغرافیایی روی سطح سیاره سرخ و شرایط آب و هوایی، روش‌های دست‌یابی به انرژی در مریخ متفاوت خواهد بود.

«آنتونی آبل» محقق دپارتمان مهندسی شیمی دانشگاه «برکلی» و یکی از نویسندگان این مطالعه می‌گوید: «برای تولید برق در مریخ، موقعیت کاوشگر در سطح سیاره عامل تعیین کننده است. اگر به خط استوا نزدیک باشد، استفاده از انرژی خورشیدی توصیه می‌شود و اگر به قطب‌ها نزدیک باشد، بهتر است از انرژی هسته‌ای استفاده شود.»
      """,
      views: "256"),
  BlogPageModel(
      id: 4,
      imageURL:
          "https://digiato.com/wp-content/uploads/2022/04/13WELLREAD-CACIOPPO-superJumbo.jpg",
      title: "چگونه عشق بر عملکرد مغز ما تاثیر می‌گذارد؟",
      writer: "مرضیه فرجی",
      imageWriterURL:
          "https://digiato.com/wp-content/uploads/2022/02/10897985_639437109516078_4342420382567329691_n-300x300.jpg",
      timePublication: "۱۷ ساعت پیش",
      content: """
آیا می‌توانیم بدون عشق زندگی خود را پیش ببریم؟ برای سال‌ها، «استفانی اورتیگ» عصب‌شناس، معتقد بود که پاسخ این سوال مثبت است. با وجود اینکه دکتر اورتیگ در مورد علم ارتباطات انسانی تحقیق می‌کرد، موفق شد اهمیت این ارتباطات را به صورت مستقیم در زندگی خود نیز درک کند.

او در کتاب جدید خود با عنوان « I told myself that being unattached made me a more objective researcher: I could investigate love without being under its spell» می‌نویسد: « به خودم گفتم که عدم وابستگی سبب می‌شود محققی موفق‌تر باشم، می‌توانم بدون آنکه تحت تاثیر قرار بگیرم، در مورد عشق و رابطه تحقیق کنم.»

اما سپس او در سال 2011 و در سن 37 سالگی، «جان کاچیوپو» را در یک کنفرانس علوم اعصاب در «شانگهای» ملاقات کرد. دکتر کاچیوپو، که این مفهوم را رایج کرد که تنهایی طولانی مدت می‌تواند به اندازه سیگار کشیدن برای سلامتی مضر باشد، او را به خود مجذوب کرد.

این دو دانشمند به‌طرز عجیبی در زندگی باهم آشنا شدند و سپس ازدواج کردند. آن‌ها در دانشکده پزشکی «پریتزکر» در شیکاگو با یکدیگر همکار شدند و تیم تحقیقاتی خود را در آزمایشگاه تشکیل دادند.
      """,
      views: "189"),
  BlogPageModel(
      id: 5,
      imageURL: "https://digiato.com/wp-content/uploads/2022/04/cghjm.jpg",
      title: "ساخت اسپیکرهای فوق باریک توسط مهندسان MIT",
      writer: "آرش تهرانی",
      imageWriterURL:
          "https://digiato.com/wp-content/uploads/2022/04/elon-musk-4-90x90.jpg",
      timePublication: "ساعت پیش ۴ ",
      content: """
مهندسان دانشگاه MIT به تازگی اسپیکر فوق باریکی را ساخته‌اند که می‌توان آن را مانند کاغذدیواری روی هر سطحی نصب کرد. به گفته تیم مذکور این اسپیکرها مصرف انرژی پایینی دارند و تولید انبوه آن‌ها آسان است.

اگر بخواهیم عملکرد این اسپیکر را به زبان ساده توضیح دهیم بایست بگوییم محصول مذکور از طریق مرتعش کردن دیافراگم اسپیکر، هوای روی آن را به گردش در می‌آورد تا امواج صوتی تولید کند، امری که در باقی اسپیکرها و سیستم‌های صوتی به وسیله جریان‌های الکتریکی و میدان‌های مغناطیسی انجام می‌شود.

با این وجود دانشمندان در سال‌های اخیر توانستند با ایجاد روش‌های متفاوت، در دستگاه‌های بسیار باریک به نتایج مشابهی دست پیدا کنند. برای مثال اسپیکرهای «فیلم باریک» از مواد پیزوالکتریک استفاده می‌کنند که در پاسخ به تغییر ولتاژ مرتعش می‌شود.

مشکل اما اینجاست که این دسته از اسپیکرهای باریک یا بایست حالت ایستاده و آزاد داشته باشند، یا اینکه با کمی فاصله از سطوح دیگر در جای خود قرار بگیرند زیرا نصب کردن‌شان موجب کاهش قابلیت ارتعاش و تولید صوت در آنها می‌شود.
      """,
      views: "456"),
  BlogPageModel(
      id: 6,
      imageURL:
          "https://digiato.com/wp-content/uploads/2022/04/photo_2022-04-29_09-37-59.jpg",
      title: "ایلان ماسک حدود 4 میلیارد دلار از سهام تسلا را فروخت",
      writer: "جواد تاجی",
      imageWriterURL: "https://digiato.com/wp-content/uploads/2021/02/1-30.jpg",
      timePublication: "۱ ساعت پیش",
      content: """
      بر اساس اسناد و پرونده‌های نظارتی منتشر شده، «ایلان ماسک» مدیرعامل تسلا، حدود 4.4 میلیون سهام خود از غول خودروسازی را به ارزش 4 میلیارد دلار در روز سه‌شنبه فروخته است.

طبق گزارش‌های منتشر شده، ماسک در مجموع پنج فرم 4 را به کمیسیون بورس و اوراق بهادار ایالات متحده (SEC) ارائه کرده که تمام 138 تراکنش فردی او را پوشش می‌دهد. بر اساس محاسبات TechCrunch، ارزش سهام فروخته شده، نزدیک به 4 میلیارد دلار است. به گزارش رویترز، این میزان معادل 2.6 درصد از سهام او در تسلا محسوب می‌شود
      """,
      views: "256"),
  BlogPageModel(
      id: 7,
      imageURL:
          "https://digiato.com/wp-content/uploads/2022/04/photo_2022-04-29_09-06-13.jpg",
      title:
          "گزارش درآمد فصل دوم سال مالی 2022 اپل منتشر شد؛ رشد 9 درصدی درآمد",
      writer: "جواد تاجی",
      imageWriterURL: "https://digiato.com/wp-content/uploads/2021/02/1-30.jpg",
      timePublication: "۴ ساعت پیش",
      content: """

هرچند اپل همچنان با محدودیت‌های عرضه دست و پنجه نرم می‌کند، اما در گزارش درآمد سه ماهه دوم سال مالی خود، بهترین فصل منتهی به مارس را در تاریخش گزارش کرد. غول فناوری در این سه ماهه، 97.3 میلیارد دلار درآمد داشته که نسبت به مدت زمان مشابه در سال گذشته، 9 درصد افزایش یافته است. همچنین سود این شرکت 25 میلیارد دلار و سود هر سهم آن 1.52 دلار بوده است.

      """,
      views: "256"),
  BlogPageModel(
      id: 8,
      imageURL:
          "https://digiato.com/wp-content/uploads/2022/04/1200-178443098-space-exploration-risks_smaller.jpg",
      title: "کاوشگران سیاره سرخ چگونه به تولید برق در مریخ می‌پردازند؟",
      writer: "مرضیه فرجی",
      imageWriterURL:
          "https://digiato.com/wp-content/uploads/2022/02/10897985_639437109516078_4342420382567329691_n-300x300.jpg",
      timePublication: "",
      content: """
انرژی خورشیدی و انرژی هسته‌ای منابع انرژی هستند که تیم‌های کاوشگران در مریخ مورد استفاده قرار می‌دهند. کدام یک بهتر است؟ چطور می‌توان به تولید برق در مریخ پرداخت؟ دانشمندان به این سوالات پاسخ دادند.

محققان برای سفرهای خدمه مریخ به گزینه مختلف تولید انرژی را باهم مقایسه کردند: سلول‌های خورشیدی و انرژی‌ هسته‌ای رآکتورهای شکاف کوچک. یکی از ملاحظات کلیدی در این مطالعه، مقدار وزن یا جرم قابل حمل اجزای مورد نیاز است، زیرا لوازمی که در ماموریت‌های مریخ مورد استفاده قرار می‌گیرند، باید بهینه‌ترین وزن را داشته باشند. نتایج این مطالعه که در « Frontiers in Astronomy and Space Sciences» به چاپ رسید، نشان می‌دهد وابسته به موقعیت جغرافیایی روی سطح سیاره سرخ و شرایط آب و هوایی، روش‌های دست‌یابی به انرژی در مریخ متفاوت خواهد بود.

«آنتونی آبل» محقق دپارتمان مهندسی شیمی دانشگاه «برکلی» و یکی از نویسندگان این مطالعه می‌گوید: «برای تولید برق در مریخ، موقعیت کاوشگر در سطح سیاره عامل تعیین کننده است. اگر به خط استوا نزدیک باشد، استفاده از انرژی خورشیدی توصیه می‌شود و اگر به قطب‌ها نزدیک باشد، بهتر است از انرژی هسته‌ای استفاده شود.»
      """,
      views: "256"),
  BlogPageModel(
      id: 9,
      imageURL:
          "https://digiato.com/wp-content/uploads/2022/04/13WELLREAD-CACIOPPO-superJumbo.jpg",
      title: "چگونه عشق بر عملکرد مغز ما تاثیر می‌گذارد؟",
      writer: "مرضیه فرجی",
      imageWriterURL:
          "https://digiato.com/wp-content/uploads/2022/02/10897985_639437109516078_4342420382567329691_n-300x300.jpg",
      timePublication: "۱۷ ساعت پیش",
      content: """
آیا می‌توانیم بدون عشق زندگی خود را پیش ببریم؟ برای سال‌ها، «استفانی اورتیگ» عصب‌شناس، معتقد بود که پاسخ این سوال مثبت است. با وجود اینکه دکتر اورتیگ در مورد علم ارتباطات انسانی تحقیق می‌کرد، موفق شد اهمیت این ارتباطات را به صورت مستقیم در زندگی خود نیز درک کند.

او در کتاب جدید خود با عنوان « I told myself that being unattached made me a more objective researcher: I could investigate love without being under its spell» می‌نویسد: « به خودم گفتم که عدم وابستگی سبب می‌شود محققی موفق‌تر باشم، می‌توانم بدون آنکه تحت تاثیر قرار بگیرم، در مورد عشق و رابطه تحقیق کنم.»

اما سپس او در سال 2011 و در سن 37 سالگی، «جان کاچیوپو» را در یک کنفرانس علوم اعصاب در «شانگهای» ملاقات کرد. دکتر کاچیوپو، که این مفهوم را رایج کرد که تنهایی طولانی مدت می‌تواند به اندازه سیگار کشیدن برای سلامتی مضر باشد، او را به خود مجذوب کرد.

این دو دانشمند به‌طرز عجیبی در زندگی باهم آشنا شدند و سپس ازدواج کردند. آن‌ها در دانشکده پزشکی «پریتزکر» در شیکاگو با یکدیگر همکار شدند و تیم تحقیقاتی خود را در آزمایشگاه تشکیل دادند.
      """,
      views: "256"),
  BlogPageModel(
      id: 10,
      imageURL: "https://digiato.com/wp-content/uploads/2022/04/cghjm.jpg",
      title: "ساخت اسپیکرهای فوق باریک توسط مهندسان MIT",
      writer: "آرش تهرانی",
      imageWriterURL:
          "https://digiato.com/wp-content/uploads/2022/04/elon-musk-4-90x90.jpg",
      timePublication: "ساعت پیش ۴ ",
      content: """
مهندسان دانشگاه MIT به تازگی اسپیکر فوق باریکی را ساخته‌اند که می‌توان آن را مانند کاغذدیواری روی هر سطحی نصب کرد. به گفته تیم مذکور این اسپیکرها مصرف انرژی پایینی دارند و تولید انبوه آن‌ها آسان است.

اگر بخواهیم عملکرد این اسپیکر را به زبان ساده توضیح دهیم بایست بگوییم محصول مذکور از طریق مرتعش کردن دیافراگم اسپیکر، هوای روی آن را به گردش در می‌آورد تا امواج صوتی تولید کند، امری که در باقی اسپیکرها و سیستم‌های صوتی به وسیله جریان‌های الکتریکی و میدان‌های مغناطیسی انجام می‌شود.

با این وجود دانشمندان در سال‌های اخیر توانستند با ایجاد روش‌های متفاوت، در دستگاه‌های بسیار باریک به نتایج مشابهی دست پیدا کنند. برای مثال اسپیکرهای «فیلم باریک» از مواد پیزوالکتریک استفاده می‌کنند که در پاسخ به تغییر ولتاژ مرتعش می‌شود.

مشکل اما اینجاست که این دسته از اسپیکرهای باریک یا بایست حالت ایستاده و آزاد داشته باشند، یا اینکه با کمی فاصله از سطوح دیگر در جای خود قرار بگیرند زیرا نصب کردن‌شان موجب کاهش قابلیت ارتعاش و تولید صوت در آنها می‌شود.
      """,
      views: "256"),
  BlogPageModel(
      id: 11,
      imageURL:
          "https://digiato.com/wp-content/uploads/2022/04/photo_2022-04-29_09-37-59.jpg",
      title: "ایلان ماسک حدود 4 میلیارد دلار از سهام تسلا را فروخت",
      writer: "جواد تاجی",
      imageWriterURL: "https://digiato.com/wp-content/uploads/2021/02/1-30.jpg",
      timePublication: "۱ ساعت پیش",
      content: """
      بر اساس اسناد و پرونده‌های نظارتی منتشر شده، «ایلان ماسک» مدیرعامل تسلا، حدود 4.4 میلیون سهام خود از غول خودروسازی را به ارزش 4 میلیارد دلار در روز سه‌شنبه فروخته است.

طبق گزارش‌های منتشر شده، ماسک در مجموع پنج فرم 4 را به کمیسیون بورس و اوراق بهادار ایالات متحده (SEC) ارائه کرده که تمام 138 تراکنش فردی او را پوشش می‌دهد. بر اساس محاسبات TechCrunch، ارزش سهام فروخته شده، نزدیک به 4 میلیارد دلار است. به گزارش رویترز، این میزان معادل 2.6 درصد از سهام او در تسلا محسوب می‌شود
      """,
      views: "256"),
  BlogPageModel(
      id: 12,
      imageURL:
          "https://digiato.com/wp-content/uploads/2022/04/photo_2022-04-29_09-06-13.jpg",
      title:
          "گزارش درآمد فصل دوم سال مالی 2022 اپل منتشر شد؛ رشد 9 درصدی درآمد",
      writer: "جواد تاجی",
      imageWriterURL: "https://digiato.com/wp-content/uploads/2021/02/1-30.jpg",
      timePublication: "۴ ساعت پیش",
      content: """

هرچند اپل همچنان با محدودیت‌های عرضه دست و پنجه نرم می‌کند، اما در گزارش درآمد سه ماهه دوم سال مالی خود، بهترین فصل منتهی به مارس را در تاریخش گزارش کرد. غول فناوری در این سه ماهه، 97.3 میلیارد دلار درآمد داشته که نسبت به مدت زمان مشابه در سال گذشته، 9 درصد افزایش یافته است. همچنین سود این شرکت 25 میلیارد دلار و سود هر سهم آن 1.52 دلار بوده است.

      """,
      views: "256"),
  BlogPageModel(
      id: 13,
      imageURL:
          "https://digiato.com/wp-content/uploads/2022/04/1200-178443098-space-exploration-risks_smaller.jpg",
      title: "کاوشگران سیاره سرخ چگونه به تولید برق در مریخ می‌پردازند؟",
      writer: "مرضیه فرجی",
      imageWriterURL:
          "https://digiato.com/wp-content/uploads/2022/02/10897985_639437109516078_4342420382567329691_n-300x300.jpg",
      timePublication: "",
      content: """
انرژی خورشیدی و انرژی هسته‌ای منابع انرژی هستند که تیم‌های کاوشگران در مریخ مورد استفاده قرار می‌دهند. کدام یک بهتر است؟ چطور می‌توان به تولید برق در مریخ پرداخت؟ دانشمندان به این سوالات پاسخ دادند.

محققان برای سفرهای خدمه مریخ به گزینه مختلف تولید انرژی را باهم مقایسه کردند: سلول‌های خورشیدی و انرژی‌ هسته‌ای رآکتورهای شکاف کوچک. یکی از ملاحظات کلیدی در این مطالعه، مقدار وزن یا جرم قابل حمل اجزای مورد نیاز است، زیرا لوازمی که در ماموریت‌های مریخ مورد استفاده قرار می‌گیرند، باید بهینه‌ترین وزن را داشته باشند. نتایج این مطالعه که در « Frontiers in Astronomy and Space Sciences» به چاپ رسید، نشان می‌دهد وابسته به موقعیت جغرافیایی روی سطح سیاره سرخ و شرایط آب و هوایی، روش‌های دست‌یابی به انرژی در مریخ متفاوت خواهد بود.

«آنتونی آبل» محقق دپارتمان مهندسی شیمی دانشگاه «برکلی» و یکی از نویسندگان این مطالعه می‌گوید: «برای تولید برق در مریخ، موقعیت کاوشگر در سطح سیاره عامل تعیین کننده است. اگر به خط استوا نزدیک باشد، استفاده از انرژی خورشیدی توصیه می‌شود و اگر به قطب‌ها نزدیک باشد، بهتر است از انرژی هسته‌ای استفاده شود.»
      """,
      views: "256"),
  BlogPageModel(
      id: 14,
      imageURL:
          "https://digiato.com/wp-content/uploads/2022/04/13WELLREAD-CACIOPPO-superJumbo.jpg",
      title: "چگونه عشق بر عملکرد مغز ما تاثیر می‌گذارد؟",
      writer: "مرضیه فرجی",
      imageWriterURL:
          "https://digiato.com/wp-content/uploads/2022/02/10897985_639437109516078_4342420382567329691_n-300x300.jpg",
      timePublication: "۱۷ ساعت پیش",
      content: """
آیا می‌توانیم بدون عشق زندگی خود را پیش ببریم؟ برای سال‌ها، «استفانی اورتیگ» عصب‌شناس، معتقد بود که پاسخ این سوال مثبت است. با وجود اینکه دکتر اورتیگ در مورد علم ارتباطات انسانی تحقیق می‌کرد، موفق شد اهمیت این ارتباطات را به صورت مستقیم در زندگی خود نیز درک کند.

او در کتاب جدید خود با عنوان « I told myself that being unattached made me a more objective researcher: I could investigate love without being under its spell» می‌نویسد: « به خودم گفتم که عدم وابستگی سبب می‌شود محققی موفق‌تر باشم، می‌توانم بدون آنکه تحت تاثیر قرار بگیرم، در مورد عشق و رابطه تحقیق کنم.»

اما سپس او در سال 2011 و در سن 37 سالگی، «جان کاچیوپو» را در یک کنفرانس علوم اعصاب در «شانگهای» ملاقات کرد. دکتر کاچیوپو، که این مفهوم را رایج کرد که تنهایی طولانی مدت می‌تواند به اندازه سیگار کشیدن برای سلامتی مضر باشد، او را به خود مجذوب کرد.

این دو دانشمند به‌طرز عجیبی در زندگی باهم آشنا شدند و سپس ازدواج کردند. آن‌ها در دانشکده پزشکی «پریتزکر» در شیکاگو با یکدیگر همکار شدند و تیم تحقیقاتی خود را در آزمایشگاه تشکیل دادند.
      """,
      views: "256"),
  BlogPageModel(
      id: 15,
      imageURL: "https://digiato.com/wp-content/uploads/2022/04/cghjm.jpg",
      title: "ساخت اسپیکرهای فوق باریک توسط مهندسان MIT",
      writer: "آرش تهرانی",
      imageWriterURL:
          "https://digiato.com/wp-content/uploads/2022/04/elon-musk-4-90x90.jpg",
      timePublication: "ساعت پیش ۴ ",
      content: """
مهندسان دانشگاه MIT به تازگی اسپیکر فوق باریکی را ساخته‌اند که می‌توان آن را مانند کاغذدیواری روی هر سطحی نصب کرد. به گفته تیم مذکور این اسپیکرها مصرف انرژی پایینی دارند و تولید انبوه آن‌ها آسان است.

اگر بخواهیم عملکرد این اسپیکر را به زبان ساده توضیح دهیم بایست بگوییم محصول مذکور از طریق مرتعش کردن دیافراگم اسپیکر، هوای روی آن را به گردش در می‌آورد تا امواج صوتی تولید کند، امری که در باقی اسپیکرها و سیستم‌های صوتی به وسیله جریان‌های الکتریکی و میدان‌های مغناطیسی انجام می‌شود.

با این وجود دانشمندان در سال‌های اخیر توانستند با ایجاد روش‌های متفاوت، در دستگاه‌های بسیار باریک به نتایج مشابهی دست پیدا کنند. برای مثال اسپیکرهای «فیلم باریک» از مواد پیزوالکتریک استفاده می‌کنند که در پاسخ به تغییر ولتاژ مرتعش می‌شود.

مشکل اما اینجاست که این دسته از اسپیکرهای باریک یا بایست حالت ایستاده و آزاد داشته باشند، یا اینکه با کمی فاصله از سطوح دیگر در جای خود قرار بگیرند زیرا نصب کردن‌شان موجب کاهش قابلیت ارتعاش و تولید صوت در آنها می‌شود.
      """,
      views: "256"),
];