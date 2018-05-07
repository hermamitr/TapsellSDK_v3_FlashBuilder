<div dir="rtl">
<h1>مستندات راه‌اندازی تبلیغات تپسل در FlashBuilder</h1>
نسخه پلاگین: ۳.۰.۱ نسخه SDK اندروید: ۳.۰.۲۷ نسخه SDK
<span style="color: #ffffff;">ـ</span>iOS
<span style="color: #ffffff;">ـ</span>: ۳.۰.۴ نسخه کتابخانه اندروید مورد نیاز
جهت استفاده از SDK تپسل می‌بایست از build tools نسخه 23 و بالاتر استفاده کنید. فهرست مطالب
<ul>
	<li>
		<a href="#init">تنظیمات پروژه Flash Builder</a>
	</li>
	<li>
		<a href="#rewarded">پیاده‌سازی SDK در Flash Builder</a>
	</li>
	<li>
		<a href="https://github.com/tapselladnet/TapsellSDK_v3_FlashBuilder">پروژه نمونه</a>
	</li>
</ul>


<!-- <div id="android-init"></div> -->

<!-- <div id="ios-init"></div> -->

<div id="init">
<h2>تنظیمات پروژه FlashBuilder</h2>
جهت راه اندازی تبلیغات تپسل در پروژه FlashBuilder، ابتدا باید مراحل زیر را در پروژه خود انجام دهید. &nbsp; مستندات این بخش برای پیاده‌سازی تپسل SDK تپسل در نرم‌افزار Adobe Flash
Builder 4.7 (نسخه ۲) نوشته شده‌ است. &nbsp;
<h3>
	<strong>گام ۱: دریافت </strong>
	<strong>SDK</strong>
	<strong> تپسل</strong>
</h3>
ابتدا فایل ane مربوط به SDK تپسل را از آدرس زیر دانلود کنید.
<p style="text-align: center;">
	<a href="https://storage.backtory.com/tapsell-server/sdk/TapsellAdobeAir3.0.1-a3.0.27-i3.0.4.ane">
		<button>دریافت فایل</button>
	</a>
</p>
&nbsp;
<h3>
	<strong>گام ۲: افزودن </strong>
	<strong>SDK</strong>
	<strong> تپسل به پروژه شما</strong>
</h3>
اگر پروژه خود را در FlashBuilder ایجاد نکرده‌اید، یک پروژه Flex Mobile Project ایجاد کنید. روی پروژه خود کلیک راست کرده و
گزینه Properties را انتخاب کنید. در بخش Flex Build Path وارد تب Native Extensions شوید. روی دکمه Add ANE کلیک کرده و فایل
ANE تپسل را در پروژه Import کنید. سپس از قسمت Flex Build Packaging بخش Google Android را باز کرده و از تب Native Extensions،
گزینه SDK تپسل را فعال کنید. سپس روی Apply و OK کلیک کنید.
<h3>
	<strong>گام ۳: آپدیت </strong>
	<strong>Manifest</strong>
</h3>
دسترسی‌های زیر را به فایل
<em>AndroidManifest.xml</em> اضافه کنید.
<pre dir="ltr">&lt;<span style="color: #003366;">uses-permission</span> <span style="color: #800080;">android<span style="color: #00ccff;">:name=</span></span><span style="color: #008000;">"android.permission.ACCESS_NETWORK_STATE"</span> /&gt;
&lt;<span style="color: #003366;">uses-permission</span> <span style="color: #800080;">android</span><span style="color: #00ccff;">:name=</span><span style="color: #008000;">"android.permission.INTERNET"</span> /&gt;
&lt;<span style="color: #003366;">uses-permission</span> <span style="color: #800080;">android</span><span style="color: #00ccff;">:name=</span><span style="color: #008000;">"android.permission.READ_PHONE_STATE"</span> /&gt;
&lt;<span style="color: #003366;">uses-permission</span> <span style="color: #800080;">android</span><span style="color: #00ccff;">:name=</span><span style="color: #008000;">"android.permission.VIBRATE"</span> /&gt;<span style="color: #999999;">&lt;!--optional--&gt;</span>
&lt;<span style="color: #003366;">uses-permission</span> <span style="color: #800080;">android</span><span style="color: #00ccff;">:name=</span><span style="color: #008000;">"android.permission.ACCESS_COARSE_LOCATION"</span>/&gt;<span style="color: #999999;">&lt;!--optional--&gt;</span></pre> همانطور که در کد فوق مشخص شده‌است، دسترسی‌‌های موقعیت (
<code>ACCESS_COARSE_LOCATION</code>) و لرزش دستگاه (
<code>VIBRATE</code>) اختیاری هستند اما درصورتیکه این دسترسی‌ها را نیز در برنامه خود قرار دهید، تبلیغات نشان‌داده‌شده به کاربر از کیفیت بالاتری
برخوردار خواهد بود. در بخش application از فایل منیفست برنامه، activity زیر را اضافه کنید.
<pre dir="ltr">&lt;<span style="color: #000080;">application <span style="color: #800080;">android</span><span style="color: #00ccff;">:enabled=</span><span style="color: #008000;">"true"</span></span>&gt;
    &lt;<span style="color: #000080;">activity</span> <span style="color: #800080;">android</span><span style="color: #00ccff;">:name=</span><span style="color: #008000;">"ir.tapsell.sdk.TapsellAdActivity"</span> 
          <span style="color: #800080;">android</span><span style="color: #00ccff;">:configChanges=</span><span style="color: #008000;">"keyboardHidden|orientation|screenSize"</span> /&gt;
&lt;<span style="color: #000080;">/application</span>&gt;</pre> &nbsp;
<h3>
	<strong>گام ۴: تنظیمات </strong>
	<strong>ProGuard</strong>
</h3>
در صورتی که در اپلیکیشن خود از ProGuard استفاده می‌کنید، تنظیمات زیر را در فایل proguard-rules وارد نمایید.
<pre dir="ltr" style=" margin: 0; line-height: 125%;"><span style="color: #333333;">-</span>keepattributes Signature
<span style="color: #333333;">-</span>keepattributes <span style="color: #333333;">*</span>Annotation<span style="color: #333333;">*</span>
<span style="color: #333333;">-</span>keepattributes EnclosingMethod
<span style="color: #333333;">-</span>keep <span style="color: #007020;">class</span> sun.misc.Unsafe { <span style="color: #333333;">*</span>; }
<span style="color: #333333;">-</span>keep <span style="color: #007020;">class</span> com.google.gson.stream<span style="color: #333333;">.**</span> { <span style="color: #333333;">*</span>; }
<span style="color: #333333;">-</span>keep <span style="color: #007020;">class</span> com.google.gson<span style="color: #333333;">.**</span> { <span style="color: #333333;">*</span>; }
<span style="color: #333333;">-</span>keepclassmembers enum <span style="color: #333333;">*</span> { <span style="color: #333333;">*</span>; }
<span style="color: #333333;">-</span>keep <span style="color: #007020;">class</span> <span style="color: #333333;">**</span>.R$<span style="color: #333333;">*</span> { <span style="color: #333333;">*</span>; }
<span style="color: #333333;">-</span>keep interface ir.tapsell.sdk.NoProguard
<span style="color: #333333;">-</span>keep <span style="color: #007020;">class</span> <span style="color: #333333;">*</span> implements ir.tapsell.sdk.NoProguard { <span style="color: #333333;">*</span>; }
<span style="color: #333333;">-</span>keep interface <span style="color: #333333;">*</span> extends ir.tapsell.sdk.NoProguard { <span style="color: #333333;">*</span>; }
<span style="color: #333333;">-</span>keepnames <span style="color: #007020;">class</span> <span style="color: #333333;">*</span> extends android.app.Activity
</div>

<div id="rewarded">
<h2>پیاده‌سازی SDK تپسل در پروژه Flash Builder</h2>
<h3>
	<strong>گام ۱: دریافت کلید تپسل</strong>
</h3>
ابتدا وارد پنل مدیریت تپسل شده و با تعریف یک اپلیکیشن جدید با عنوان پکیج اپلیکیشن اندرویدی خود، یک کلید تپسل دریافت کنید.
&nbsp;
<h3>
	<strong>گام ۲: شروع کار با SDK تپسل</strong>
</h3>
ابتدا در برنام خود، کلاس‌های مربوط به SDK تپسل را import کنید.
<pre dir="ltr" style=" margin: 0; line-height: 125%;"><span style="color: #008800;">import</span> <span style="color: #3366ff;">ir.tapsell.sdk.air.Tapsell</span><span style="color: #333333;">;
</span><span style="color: #008000;">import</span> <span style="color: #3366ff;">ir.tapsell.sdk.air.TapsellAdRequestListener</span>;
<span style="color: #008000;">import </span><span style="color: #3366ff;">ir.tapsell.sdk.air.TapsellAdShowFinishedListener</span>;</pre> سپس یک شی از کلاس
<code>Tapsell</code> بسازید. این شی راه ارتباط کد
<code>ActionScript</code> با SDK تپسل است.
<pre dir="ltr" style=" margin: 0; line-height: 125%;"><span style="color: #0000ff;">private</span> <span style="color: #3366ff;">var </span>tapsell:Tapsell = Tapsell.getInstance();</pre> در اولین اجرا، تابع زیر را فراخوانی کنید.
<pre dir="ltr" style=" margin: 0; line-height: 125%;">tapsell<span style="color: #333333;">.</span><span style="color: #0000cc;">initialize</span><span style="color: #333333;">(</span>appKey:String<span style="color: #333333;">);</span></pre> ورودی
<code>appKey</code> کلید تپسلی است که در گام قبل از پنل تپسل دریافت کردید. &nbsp;
<h3>
	<strong>گام ۳: دریافت تبلیغ</strong>
</h3>
نمایش یک تبلیغ ویدئویی در اپلیکیشن به دو صورت ممکن است صورت پذیرد. یک روش، نمایش تبلیغ بصورت stream می‌باشد. در این حالت،
همزمان که کاربر درحال مشاهده بخشی از تبلیغ است، ادامه آن از اینترنت لود می‌گردد. ممکن است به دلیل کندی سرعت اینترنت، در این
حالت کاربر با مکث‌های متعددی در هنگام دریافت و مشاهده تبلیغ مواجه شود. برای اینکه کاربر در هنگام نمایش تبلیغ منتظر نماند
و تجربه کاربر در استفاده از اپلیکیشن بهبود یابد،روش دیگری نیز در SDK تپسل تعبیه شده است که در آن ابتدا فایل ویدئوی تبلیغاتی
بطور کامل بارگذاری شده و سپس تبلیغ نمایش داده می‌شود. همچنین در تپسل، تبلیغ می تواند در ناحیه‌های مختلفی از برنامه شما (مانند
فروشگاه، انتهای هر مرحله، ابتدای مرحله جهت دریافت امتیاز دوبرابر، دریافت بنزین/لایف و ...) پخش شود. در تپسل به این ناحیه‌ها
zone گفته می شود. ناحیه‌های هر اپلیکیشن در پنل تپسل تعریف می شوند. &nbsp; با اجرای تابع زیر، می‌توانید یک درخواست تبلیغ به
تپسل ارسال کرده و یک تبلیغ دریافت نمایید:
<pre dir="ltr" style=" margin: 0; line-height: 125%;">tapsell<span style="color: #333333;">.</span><span style="color: #0000cc;">requestAd</span><span style="color: #333333;">(zoneId:String</span><span style="color: #333333;">,</span> isCached:Boolean<span style="color: #333333;">);</span>
</pre> هر درخواست شامل یک ورودی
<code>zoneId</code> یا شناسه تبلیغ‌گاه است است که از داشبورد تپسل برای اپلیکیشن قابل ایجاد و دریاف است. اطلاعات بیشتر درباره zone را می‌توانید
از تیم فنی تپسل دریافت کنید. ورودی
<code>isCached</code> نشان دهنده این است که فایل ویدئوی تبلیغ باید قبل از اعلام نیتجه تبلیغ دانلود (
<span style="font-family: Consolas, 'Liberation Mono', Courier, monospace;">
	<span style="font-size: 15.2px; background-color: #f7f7f7;">Cache</span>
</span>) شود یا بصورت آنلاین (
<code>Stream</code>) پخش شود. کش کردن ویدئو تنها در ناحیه‌هایی که
کاربر با احتمال زیادی پس از باز کردن اپلیکیشن تبلیغ آن را مشاهده می‌کند، از تبلیغ Cached استفاده کنید. جهت توضیحات بیشتر
درباره روش انتخاب متد دریافت مناسب،
<a href="https://answers.tapsell.ir/?ht_kb=cached-vs-streamed">اینجا</a> را مطالعه کنید. &nbsp; جهت دریافت نتیجه تبلیغ باید یک کلاس که رابط
<code>TapsellAdRequestListener </code>را پیاده سازی نموده استفاده نمایید.
<pre dir="ltr" style=" margin: 0; line-height: 125%;">public class TapsellAdRequestListenerImpl implements TapsellAdRequestListener{
    <span style="color: #0000ff;">public </span><span style="color: #008000;">function </span><span style="color: #000000;">onError </span>(zoneId:String,error:String)<span style="color: #000080;">:<span style="color: #0000ff;">void</span></span>
    <span style="color: #333333;">{</span>
    <span style="color: #333333;">}</span>
    <span style="color: #0000ff;">public <span style="color: #008000;">function</span></span> <span style="color: #000000;">onAdAvailable </span><span style="color: #333333;">(zoneId:String,adId:String</span><span style="color: #333333;">):<span style="color: #0000ff;">void</span></span>
    <span style="color: #333333;">{</span>
    <span style="color: #333333;">}</span>
    <span style="color: #0000ff;">public </span><span style="color: #008000;">function</span> <span style="color: #000000;">onNoAdAvailable </span><span style="color: #333333;">(zoneId:String):<span style="color: #0000ff;">void</span></span>
    <span style="color: #333333;">{</span>
    <span style="color: #333333;">}</span>
    <span style="color: #0000ff;">public </span><span style="color: #333399;"><span style="color: #008000;">function</span> </span><span style="color: #000000;">onNoNetwork </span><span style="color: #333333;">(zoneId:String):<span style="color: #0000ff;">void</span></span>
    <span style="color: #333333;">{</span>
    <span style="color: #333333;">}</span>
    <span style="color: #0000ff;">public </span><span style="color: #008000;">function </span><span style="color: #000000;">onExpiring </span><span style="color: #333333;">(zoneId:String,adId:String</span><span style="color: #333333;">):<span style="color: #0000ff;">void</span></span>
    <span style="color: #333333;">{</span>
    <span style="color: #333333;">}</span>
<span style="color: #333333;">});</span>
</pre> سپس باید یک شی از این کلاس ساخته و آن را به عنوان ورودی تابع
<code>setAdRequestListener</code> به آبجکت
<code>tapsell</code> بدهید.
<pre dir="ltr" style=" margin: 0; line-height: 125%;"><span style="color: #0000ff;">private</span> <span style="color: #3366ff;">var</span> tapsellAdRequestListener:TapsellAdRequestListenerImpl = new TapsellAdRequestListenerImpl ();
tapsell<span style="color: #333333;">.</span><span style="color: #0000cc;">setAdRequestListener</span><span style="color: #333333;">(tapsellAdRequestListener</span><span style="color: #333333;">);</span>
</pre> &nbsp; توضیحات توابع رابط دریافت جواب در جدول ۲ آمده است. &nbsp;
<table style="text-align: center; border-collapse: collapse;" width="100%" cellpadding="6">
	<caption>جدول ۲ توابع interface دریافت نتیجه درخواست تبلیغ</caption>
	<tbody>
		<tr style="border-bottom: 1px solid #ddd;">
			<th width="40%">تابع</th>
			<th width="60%">توضیحات (زمان اجرا)</th>
		</tr>
		<tr style="background-color: #fefefe;">
			<td dir="ltr" width="40%">onError</td>
			<td width="60%">هنگامی که هر نوع خطایی در پروسه‌ی دریافت تبلیغ بوجود بیاید</td>
		</tr>
		<tr style="background-color: #f2f2f2;">
			<td dir="ltr" width="40%">onAdAvailable</td>
			<td width="60%">زمانی که تبلیغ دریافت شده و آماده‌ی نمایش باشد.</td>
		</tr>
		<tr style="background-color: #fefefe;">
			<td dir="ltr" width="40%">onNoAdAvailable</td>
			<td width="60%">در صورتی که تبلیغی برای نمایش وجود نداشته باشد.</td>
		</tr>
		<tr style="background-color: #f2f2f2;">
			<td dir="ltr" width="40%">onNoNetwork</td>
			<td width="60%">زمانی که دسترسی به شبکه موجود نباشد.</td>
		</tr>
		<tr style="background-color: #fefefe;">
			<td dir="ltr" width="40%">onExpiring</td>
			<td width="60%">زمانی که تبلیغ منقضی شود. هر تبلیغ مدت زمان مشخصی معتبر است و در صورتی که تا قبل از آن نمایش داده نشود منقضی شده و دیگر
				قابل نمایش نخواهد بود.</td>
		</tr>
	</tbody>
</table>
&nbsp;
<h3>گام ۴: نمایش تبلیغ</h3>
هر تبلیغ یک شیء از نوع
<code>TapsellAd</code> است که جهت نمایش آن‌، می‌توانید از تابع زیر استفاده نمایید (این تابع حداکثر یک بار برای هر شناسه تبلیغ قابل اجراست) :
<pre dir="ltr" style=" margin: 0; line-height: 125%;"><span style="color: #333333;">tapsell.</span><span style="color: #0000cc;">showAd</span><span style="color: #333333;">(adId:String,</span><span style="color: #333333;">backDisabled:Boolean, immersiveMode:Boolean, rotationMode:Number, showDialog:Boolean );</span></pre> ورودی
<code>adId</code> شناسه تبلیغ مورد نظر برای پخش است که در تابع
<span style="font-family: Consolas, 'Liberation Mono', Courier, monospace;">
	<span style="font-size: 15.2px; background-color: #f7f7f7;">onAdAvailable</span>
</span> باز گردانده شده. توضیحات سایر ورودی ها در جدول ۳ در ادامه آورده شده است. &nbsp;
<table style="text-align: center; border-collapse: collapse;" width="100%" cellpadding="6">
	<caption>جدول ۳ توابع کلاس TapsellShowOptions</caption>
	<tbody>
		<tr style="border-bottom: 1px solid #ddd;">
			<th width="40%">تابع</th>
			<th width="60%">توضیحات</th>
		</tr>
		<tr style="background-color: #fefefe;">
			<td dir="ltr" width="40%">backDisabled</td>
			<td width="60%">
				<div align="right">در هنگام پخش تبلیغ دکمه‌ی بازگشت گوشی فعال باشد یا خیر</div>
			</td>
		</tr>
		<tr style="background-color: #f2f2f2;">
			<td dir="ltr" width="40%">immersiveMode</td>
			<td width="60%">
				<div align="right">فعال‌سازی حالت Immersive در هنگام پخش تبلیغ</div>
			</td>
		</tr>
		<tr style="background-color: #fefefe;">
			<td dir="ltr" width="40%">rotationMode</td>
			<td width="60%">
				<div align="right">تعیین وضعیت گوشی در هنگام پخش تبلیغ به یکی از حالات:</div>
				<div align="left">ORIENTATION_LOCKED_PORTRAIT ORIENTATION_LOCKED_LANDSCAPE ORIENTATION_UNLOCKED ORIENTATION_LOCKED_REVERSED_PORTRAIT ORIENTATION_LOCKED_REVERSED_LANDSCAPE
				</div>
			</td>
		</tr>
		<tr style="background-color: #f2f2f2;">
			<td dir="ltr" width="40%">showDialog</td>
			<td width="60%">
				<div align="right">نمایش دیالوگ اخطار در هنگام بازگشت از تبلیغات جایزه‌دار</div>
			</td>
		</tr>
	</tbody>
</table>
&nbsp;
<h3>
	<strong>گام ۵: دریافت نتیجه نمایش تبلیغ</strong>
</h3>
جهت دریافت نتیجه نمایش تبلیغات، باید یک کلاس که رابط
<code>TapsellAdShowFinishedListener</code> را پیاده‌سازی نماید ایجاد نمایید و آن را به SDK تپسل به عنوان ورودی تابع
<code>Tapsell.setRewardListener</code> بدهید. کد این بخش در ادامه آمده است.
<pre dir="ltr" style=" margin: 0; line-height: 125%;"><span style="color: #0000ff;">private</span> <span style="color: #800080;">class </span>TapsellAdShowFinishedListenerImpl <span style="color: #0000ff;">implements</span> TapsellAdShowFinishedListener{
    ...
    <span style="color: #0000ff;">public</span> <span style="color: #3366ff;">function</span> onAdShowFinished(zoneId:String,adId:String,completed:Boolean,rewarded:Boolean):<span style="color: #0000ff;">void</span>{
    }
}
.
.
.
<span style="color: #3366ff;">var</span> adShowFinishedListener:TapsellAdShowFinishedListenerImpl = new TapsellAdShowFinishedListenerImpl();
tapsell<span style="color: #333333;">.</span><span style="color: #0000cc;">setAdShowFinishedListener</span><span style="color: #333333;">(adShowFinishedListener</span><span style="color: #333333;">);</span>
</pre> در صورتیکه مقدار
<code>completed</code> و
<code>rewarded</code> برابر با
<code>true</code> باشد ، می‌توانید جایزه درون برنامه کاربر (سکه/اعتبار/بنزین/...) را به کاربر بدهید. &nbsp;
<h3>نمونه پیاده‌سازی</h3>
یک نمونه پیاده‌سازی SDK تپسل در Flash Builder در repository زیر آمده است.
<p style="text-align: center;">
	<a href="https://github.com/tapselladnet/TapsellSDK_v3_FlashBuilder">
		<button>مشاهده پروژه نمونه</button>
	</a>
</p>
</div>

<!-- <div id="native-banner"></div> -->

<!-- <div id="native-video"></div> -->

<!-- <div id="standard-banner"></div> -->

<!-- <div id="advanced-options"></div> -->


</div>
