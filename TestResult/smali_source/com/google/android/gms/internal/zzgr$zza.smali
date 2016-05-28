.class public final Lcom/google/android/gms/internal/zzgr$zza;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/internal/zzgr;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "zza"
.end annotation


# instance fields
.field private zzDI:I

.field private zzDJ:I

.field private zzDK:F

.field private zzFB:I

.field private zzFC:Z

.field private zzFD:Z

.field private zzFE:Ljava/lang/String;

.field private zzFF:Ljava/lang/String;

.field private zzFG:Z

.field private zzFH:Z

.field private zzFI:Z

.field private zzFJ:Z

.field private zzFK:Ljava/lang/String;

.field private zzFL:Ljava/lang/String;

.field private zzFM:I

.field private zzFN:I

.field private zzFO:I

.field private zzFP:I

.field private zzFQ:I

.field private zzFR:I

.field private zzFS:D

.field private zzFT:Z

.field private zzFU:Z

.field private zzFV:I

.field private zzFW:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 7

    const/4 v1, 0x1

    const/4 v2, 0x0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-virtual {p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v3

    invoke-direct {p0, p1}, Lcom/google/android/gms/internal/zzgr$zza;->zzA(Landroid/content/Context;)V

    invoke-direct {p0, p1, v3}, Lcom/google/android/gms/internal/zzgr$zza;->zza(Landroid/content/Context;Landroid/content/pm/PackageManager;)V

    invoke-direct {p0, p1}, Lcom/google/android/gms/internal/zzgr$zza;->zzB(Landroid/content/Context;)V

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v4

    const-string v0, "geo:0,0?q=donuts"

    invoke-static {v3, v0}, Lcom/google/android/gms/internal/zzgr$zza;->zza(Landroid/content/pm/PackageManager;Ljava/lang/String;)Landroid/content/pm/ResolveInfo;

    move-result-object v0

    if-eqz v0, :cond_54

    move v0, v1

    :goto_1f
    iput-boolean v0, p0, Lcom/google/android/gms/internal/zzgr$zza;->zzFC:Z

    const-string v0, "http://www.google.com"

    invoke-static {v3, v0}, Lcom/google/android/gms/internal/zzgr$zza;->zza(Landroid/content/pm/PackageManager;Ljava/lang/String;)Landroid/content/pm/ResolveInfo;

    move-result-object v0

    if-eqz v0, :cond_56

    :goto_29
    iput-boolean v1, p0, Lcom/google/android/gms/internal/zzgr$zza;->zzFD:Z

    invoke-virtual {v4}, Ljava/util/Locale;->getCountry()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/internal/zzgr$zza;->zzFF:Ljava/lang/String;

    invoke-static {}, Lcom/google/android/gms/ads/internal/client/zzk;->zzcE()Lcom/google/android/gms/ads/internal/util/client/zza;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/ads/internal/util/client/zza;->zzgH()Z

    move-result v0

    iput-boolean v0, p0, Lcom/google/android/gms/internal/zzgr$zza;->zzFG:Z

    invoke-static {p1}, Lcom/google/android/gms/common/GooglePlayServicesUtil;->zzag(Landroid/content/Context;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/google/android/gms/internal/zzgr$zza;->zzFH:Z

    invoke-virtual {v4}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/internal/zzgr$zza;->zzFK:Ljava/lang/String;

    invoke-static {v3}, Lcom/google/android/gms/internal/zzgr$zza;->zza(Landroid/content/pm/PackageManager;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/internal/zzgr$zza;->zzFL:Ljava/lang/String;

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    if-nez v0, :cond_58

    :cond_53
    :goto_53
    return-void

    :cond_54
    move v0, v2

    goto :goto_1f

    :cond_56
    move v1, v2

    goto :goto_29

    :cond_58
    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    if-eqz v0, :cond_53

    iget v1, v0, Landroid/util/DisplayMetrics;->density:F

    iput v1, p0, Lcom/google/android/gms/internal/zzgr$zza;->zzDK:F

    iget v1, v0, Landroid/util/DisplayMetrics;->widthPixels:I

    iput v1, p0, Lcom/google/android/gms/internal/zzgr$zza;->zzDI:I

    iget v0, v0, Landroid/util/DisplayMetrics;->heightPixels:I

    iput v0, p0, Lcom/google/android/gms/internal/zzgr$zza;->zzDJ:I

    goto :goto_53
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/google/android/gms/internal/zzgr;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-virtual {p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    invoke-direct {p0, p1}, Lcom/google/android/gms/internal/zzgr$zza;->zzA(Landroid/content/Context;)V

    invoke-direct {p0, p1, v0}, Lcom/google/android/gms/internal/zzgr$zza;->zza(Landroid/content/Context;Landroid/content/pm/PackageManager;)V

    invoke-direct {p0, p1}, Lcom/google/android/gms/internal/zzgr$zza;->zzB(Landroid/content/Context;)V

    invoke-direct {p0, p1}, Lcom/google/android/gms/internal/zzgr$zza;->zzC(Landroid/content/Context;)V

    iget-boolean v0, p2, Lcom/google/android/gms/internal/zzgr;->zzFC:Z

    iput-boolean v0, p0, Lcom/google/android/gms/internal/zzgr$zza;->zzFC:Z

    iget-boolean v0, p2, Lcom/google/android/gms/internal/zzgr;->zzFD:Z

    iput-boolean v0, p0, Lcom/google/android/gms/internal/zzgr$zza;->zzFD:Z

    iget-object v0, p2, Lcom/google/android/gms/internal/zzgr;->zzFF:Ljava/lang/String;

    iput-object v0, p0, Lcom/google/android/gms/internal/zzgr$zza;->zzFF:Ljava/lang/String;

    iget-boolean v0, p2, Lcom/google/android/gms/internal/zzgr;->zzFG:Z

    iput-boolean v0, p0, Lcom/google/android/gms/internal/zzgr$zza;->zzFG:Z

    iget-boolean v0, p2, Lcom/google/android/gms/internal/zzgr;->zzFH:Z

    iput-boolean v0, p0, Lcom/google/android/gms/internal/zzgr$zza;->zzFH:Z

    iget-object v0, p2, Lcom/google/android/gms/internal/zzgr;->zzFK:Ljava/lang/String;

    iput-object v0, p0, Lcom/google/android/gms/internal/zzgr$zza;->zzFK:Ljava/lang/String;

    iget-object v0, p2, Lcom/google/android/gms/internal/zzgr;->zzFL:Ljava/lang/String;

    iput-object v0, p0, Lcom/google/android/gms/internal/zzgr$zza;->zzFL:Ljava/lang/String;

    iget v0, p2, Lcom/google/android/gms/internal/zzgr;->zzDK:F

    iput v0, p0, Lcom/google/android/gms/internal/zzgr$zza;->zzDK:F

    iget v0, p2, Lcom/google/android/gms/internal/zzgr;->zzDI:I

    iput v0, p0, Lcom/google/android/gms/internal/zzgr$zza;->zzDI:I

    iget v0, p2, Lcom/google/android/gms/internal/zzgr;->zzDJ:I

    iput v0, p0, Lcom/google/android/gms/internal/zzgr$zza;->zzDJ:I

    return-void
.end method

.method private zzA(Landroid/content/Context;)V
    .registers 4

    const-string v0, "audio"

    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/media/AudioManager;

    invoke-virtual {v0}, Landroid/media/AudioManager;->getMode()I

    move-result v1

    iput v1, p0, Lcom/google/android/gms/internal/zzgr$zza;->zzFB:I

    invoke-virtual {v0}, Landroid/media/AudioManager;->isMusicActive()Z

    move-result v1

    iput-boolean v1, p0, Lcom/google/android/gms/internal/zzgr$zza;->zzFI:Z

    invoke-virtual {v0}, Landroid/media/AudioManager;->isSpeakerphoneOn()Z

    move-result v1

    iput-boolean v1, p0, Lcom/google/android/gms/internal/zzgr$zza;->zzFJ:Z

    const/4 v1, 0x3

    invoke-virtual {v0, v1}, Landroid/media/AudioManager;->getStreamVolume(I)I

    move-result v1

    iput v1, p0, Lcom/google/android/gms/internal/zzgr$zza;->zzFM:I

    invoke-virtual {v0}, Landroid/media/AudioManager;->getRingerMode()I

    move-result v1

    iput v1, p0, Lcom/google/android/gms/internal/zzgr$zza;->zzFQ:I

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Landroid/media/AudioManager;->getStreamVolume(I)I

    move-result v0

    iput v0, p0, Lcom/google/android/gms/internal/zzgr$zza;->zzFR:I

    return-void
.end method

.method private zzB(Landroid/content/Context;)V
    .registers 8

    const/4 v0, 0x0

    const/4 v5, -0x1

    new-instance v1, Landroid/content/IntentFilter;

    const-string v2, "android.intent.action.BATTERY_CHANGED"

    invoke-direct {v1, v2}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    const/4 v2, 0x0

    invoke-virtual {p1, v2, v1}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    move-result-object v1

    if-eqz v1, :cond_33

    const-string v2, "status"

    invoke-virtual {v1, v2, v5}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v2

    const-string v3, "level"

    invoke-virtual {v1, v3, v5}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v3

    const-string v4, "scale"

    invoke-virtual {v1, v4, v5}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v1

    int-to-float v3, v3

    int-to-float v1, v1

    div-float v1, v3, v1

    float-to-double v4, v1

    iput-wide v4, p0, Lcom/google/android/gms/internal/zzgr$zza;->zzFS:D

    const/4 v1, 0x2

    if-eq v2, v1, :cond_2f

    const/4 v1, 0x5

    if-ne v2, v1, :cond_30

    :cond_2f
    const/4 v0, 0x1

    :cond_30
    iput-boolean v0, p0, Lcom/google/android/gms/internal/zzgr$zza;->zzFT:Z

    :goto_32
    return-void

    :cond_33
    const-wide/high16 v2, -0x4010000000000000L

    iput-wide v2, p0, Lcom/google/android/gms/internal/zzgr$zza;->zzFS:D

    iput-boolean v0, p0, Lcom/google/android/gms/internal/zzgr$zza;->zzFT:Z

    goto :goto_32
.end method

.method private zzC(Landroid/content/Context;)V
    .registers 3

    sget-object v0, Landroid/os/Build;->FINGERPRINT:Ljava/lang/String;

    iput-object v0, p0, Lcom/google/android/gms/internal/zzgr$zza;->zzFW:Ljava/lang/String;

    return-void
.end method

.method private static zza(Landroid/content/Context;Landroid/net/ConnectivityManager;Landroid/content/pm/PackageManager;)I
    .registers 7

    const/4 v0, -0x2

    invoke-static {}, Lcom/google/android/gms/ads/internal/zzp;->zzbx()Lcom/google/android/gms/internal/zzhu;

    move-result-object v1

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v2

    const-string v3, "android.permission.ACCESS_NETWORK_STATE"

    invoke-virtual {v1, p2, v2, v3}, Lcom/google/android/gms/internal/zzhu;->zza(Landroid/content/pm/PackageManager;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1b

    invoke-virtual {p1}, Landroid/net/ConnectivityManager;->getActiveNetworkInfo()Landroid/net/NetworkInfo;

    move-result-object v0

    if-eqz v0, :cond_1c

    invoke-virtual {v0}, Landroid/net/NetworkInfo;->getType()I

    move-result v0

    :cond_1b
    :goto_1b
    return v0

    :cond_1c
    const/4 v0, -0x1

    goto :goto_1b
.end method

.method private static zza(Landroid/content/pm/PackageManager;Ljava/lang/String;)Landroid/content/pm/ResolveInfo;
    .registers 5

    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.VIEW"

    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    const/high16 v1, 0x10000

    invoke-virtual {p0, v0, v1}, Landroid/content/pm/PackageManager;->resolveActivity(Landroid/content/Intent;I)Landroid/content/pm/ResolveInfo;

    move-result-object v0

    return-object v0
.end method

.method private static zza(Landroid/content/pm/PackageManager;)Ljava/lang/String;
    .registers 5

    const/4 v0, 0x0

    const-string v1, "market://details?id=com.google.android.gms.ads"

    invoke-static {p0, v1}, Lcom/google/android/gms/internal/zzgr$zza;->zza(Landroid/content/pm/PackageManager;Ljava/lang/String;)Landroid/content/pm/ResolveInfo;

    move-result-object v1

    if-nez v1, :cond_a

    :cond_9
    :goto_9
    return-object v0

    :cond_a
    iget-object v1, v1, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    if-eqz v1, :cond_9

    :try_start_e
    iget-object v2, v1, Landroid/content/pm/ActivityInfo;->packageName:Ljava/lang/String;

    const/4 v3, 0x0

    invoke-virtual {p0, v2, v3}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v2

    if-eqz v2, :cond_9

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    iget v2, v2, Landroid/content/pm/PackageInfo;->versionCode:I

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v1, v1, Landroid/content/pm/ActivityInfo;->packageName:Ljava/lang/String;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    :try_end_31
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_e .. :try_end_31} :catch_33

    move-result-object v0

    goto :goto_9

    :catch_33
    move-exception v1

    goto :goto_9
.end method

.method private zza(Landroid/content/Context;Landroid/content/pm/PackageManager;)V
    .registers 7

    const/4 v3, -0x1

    const-string v0, "phone"

    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/telephony/TelephonyManager;

    const-string v1, "connectivity"

    invoke-virtual {p1, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/net/ConnectivityManager;

    invoke-virtual {v0}, Landroid/telephony/TelephonyManager;->getNetworkOperator()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/google/android/gms/internal/zzgr$zza;->zzFE:Ljava/lang/String;

    invoke-static {p1, v1, p2}, Lcom/google/android/gms/internal/zzgr$zza;->zza(Landroid/content/Context;Landroid/net/ConnectivityManager;Landroid/content/pm/PackageManager;)I

    move-result v2

    iput v2, p0, Lcom/google/android/gms/internal/zzgr$zza;->zzFN:I

    invoke-virtual {v0}, Landroid/telephony/TelephonyManager;->getNetworkType()I

    move-result v2

    iput v2, p0, Lcom/google/android/gms/internal/zzgr$zza;->zzFO:I

    invoke-virtual {v0}, Landroid/telephony/TelephonyManager;->getPhoneType()I

    move-result v0

    iput v0, p0, Lcom/google/android/gms/internal/zzgr$zza;->zzFP:I

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x10

    if-lt v0, v2, :cond_4d

    invoke-virtual {v1}, Landroid/net/ConnectivityManager;->isActiveNetworkMetered()Z

    move-result v0

    iput-boolean v0, p0, Lcom/google/android/gms/internal/zzgr$zza;->zzFU:Z

    invoke-virtual {v1}, Landroid/net/ConnectivityManager;->getActiveNetworkInfo()Landroid/net/NetworkInfo;

    move-result-object v0

    if-eqz v0, :cond_4a

    invoke-virtual {v1}, Landroid/net/ConnectivityManager;->getActiveNetworkInfo()Landroid/net/NetworkInfo;

    move-result-object v0

    invoke-virtual {v0}, Landroid/net/NetworkInfo;->getDetailedState()Landroid/net/NetworkInfo$DetailedState;

    move-result-object v0

    invoke-virtual {v0}, Landroid/net/NetworkInfo$DetailedState;->ordinal()I

    move-result v0

    iput v0, p0, Lcom/google/android/gms/internal/zzgr$zza;->zzFV:I

    :goto_49
    return-void

    :cond_4a
    iput v3, p0, Lcom/google/android/gms/internal/zzgr$zza;->zzFV:I

    goto :goto_49

    :cond_4d
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/google/android/gms/internal/zzgr$zza;->zzFU:Z

    iput v3, p0, Lcom/google/android/gms/internal/zzgr$zza;->zzFV:I

    goto :goto_49
.end method


# virtual methods
.method public zzfN()Lcom/google/android/gms/internal/zzgr;
    .registers 31

    new-instance v3, Lcom/google/android/gms/internal/zzgr;

    move-object/from16 v0, p0

    iget v4, v0, Lcom/google/android/gms/internal/zzgr$zza;->zzFB:I

    move-object/from16 v0, p0

    iget-boolean v5, v0, Lcom/google/android/gms/internal/zzgr$zza;->zzFC:Z

    move-object/from16 v0, p0

    iget-boolean v6, v0, Lcom/google/android/gms/internal/zzgr$zza;->zzFD:Z

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/google/android/gms/internal/zzgr$zza;->zzFE:Ljava/lang/String;

    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/google/android/gms/internal/zzgr$zza;->zzFF:Ljava/lang/String;

    move-object/from16 v0, p0

    iget-boolean v9, v0, Lcom/google/android/gms/internal/zzgr$zza;->zzFG:Z

    move-object/from16 v0, p0

    iget-boolean v10, v0, Lcom/google/android/gms/internal/zzgr$zza;->zzFH:Z

    move-object/from16 v0, p0

    iget-boolean v11, v0, Lcom/google/android/gms/internal/zzgr$zza;->zzFI:Z

    move-object/from16 v0, p0

    iget-boolean v12, v0, Lcom/google/android/gms/internal/zzgr$zza;->zzFJ:Z

    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/google/android/gms/internal/zzgr$zza;->zzFK:Ljava/lang/String;

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/google/android/gms/internal/zzgr$zza;->zzFL:Ljava/lang/String;

    move-object/from16 v0, p0

    iget v15, v0, Lcom/google/android/gms/internal/zzgr$zza;->zzFM:I

    move-object/from16 v0, p0

    iget v0, v0, Lcom/google/android/gms/internal/zzgr$zza;->zzFN:I

    move/from16 v16, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/google/android/gms/internal/zzgr$zza;->zzFO:I

    move/from16 v17, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/google/android/gms/internal/zzgr$zza;->zzFP:I

    move/from16 v18, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/google/android/gms/internal/zzgr$zza;->zzFQ:I

    move/from16 v19, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/google/android/gms/internal/zzgr$zza;->zzFR:I

    move/from16 v20, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/google/android/gms/internal/zzgr$zza;->zzDK:F

    move/from16 v21, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/google/android/gms/internal/zzgr$zza;->zzDI:I

    move/from16 v22, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/google/android/gms/internal/zzgr$zza;->zzDJ:I

    move/from16 v23, v0

    move-object/from16 v0, p0

    iget-wide v0, v0, Lcom/google/android/gms/internal/zzgr$zza;->zzFS:D

    move-wide/from16 v24, v0

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/google/android/gms/internal/zzgr$zza;->zzFT:Z

    move/from16 v26, v0

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/google/android/gms/internal/zzgr$zza;->zzFU:Z

    move/from16 v27, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/google/android/gms/internal/zzgr$zza;->zzFV:I

    move/from16 v28, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/gms/internal/zzgr$zza;->zzFW:Ljava/lang/String;

    move-object/from16 v29, v0

    invoke-direct/range {v3 .. v29}, Lcom/google/android/gms/internal/zzgr;-><init>(IZZLjava/lang/String;Ljava/lang/String;ZZZZLjava/lang/String;Ljava/lang/String;IIIIIIFIIDZZILjava/lang/String;)V

    return-object v3
.end method
