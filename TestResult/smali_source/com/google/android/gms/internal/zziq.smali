.class public Lcom/google/android/gms/internal/zziq;
.super Landroid/webkit/WebViewClient;


# annotations
.annotation runtime Lcom/google/android/gms/internal/zzgk;
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/gms/internal/zziq$zzc;,
        Lcom/google/android/gms/internal/zziq$zzd;,
        Lcom/google/android/gms/internal/zziq$zzb;,
        Lcom/google/android/gms/internal/zziq$zza;
    }
.end annotation


# static fields
.field private static final zzIU:[Ljava/lang/String;

.field private static final zzIV:[Ljava/lang/String;


# instance fields
.field private zzCv:Lcom/google/android/gms/internal/zziq$zza;

.field private final zzIW:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Lcom/google/android/gms/internal/zzdg;",
            ">;>;"
        }
    .end annotation
.end field

.field private zzIX:Lcom/google/android/gms/ads/internal/overlay/zzg;

.field private zzIY:Lcom/google/android/gms/internal/zziq$zzb;

.field private zzIZ:Z

.field private zzJa:Z

.field private zzJb:Lcom/google/android/gms/ads/internal/overlay/zzn;

.field private final zzJc:Lcom/google/android/gms/internal/zzfa;

.field private zzJd:Z

.field private zzJe:Z

.field private zzJf:Z

.field private zzJg:Z

.field private zzJh:I

.field protected final zzoL:Lcom/google/android/gms/internal/zzip;

.field private final zzpc:Ljava/lang/Object;

.field private zzqL:Z

.field private zzsn:Lcom/google/android/gms/ads/internal/client/zza;

.field private zzwH:Lcom/google/android/gms/internal/zzdd;

.field private zzxh:Lcom/google/android/gms/internal/zzdk;

.field private zzxj:Lcom/google/android/gms/ads/internal/zze;

.field private zzxk:Lcom/google/android/gms/internal/zzew;

.field private zzxm:Lcom/google/android/gms/internal/zzdi;

.field private zzzy:Lcom/google/android/gms/internal/zzfc;


# direct methods
.method static constructor <clinit>()V
    .registers 8

    const/4 v7, 0x4

    const/4 v6, 0x3

    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    const/16 v0, 0xf

    new-array v0, v0, [Ljava/lang/String;

    const-string v1, "UNKNOWN"

    aput-object v1, v0, v3

    const-string v1, "HOST_LOOKUP"

    aput-object v1, v0, v4

    const-string v1, "UNSUPPORTED_AUTH_SCHEME"

    aput-object v1, v0, v5

    const-string v1, "AUTHENTICATION"

    aput-object v1, v0, v6

    const-string v1, "PROXY_AUTHENTICATION"

    aput-object v1, v0, v7

    const/4 v1, 0x5

    const-string v2, "CONNECT"

    aput-object v2, v0, v1

    const/4 v1, 0x6

    const-string v2, "IO"

    aput-object v2, v0, v1

    const/4 v1, 0x7

    const-string v2, "TIMEOUT"

    aput-object v2, v0, v1

    const/16 v1, 0x8

    const-string v2, "REDIRECT_LOOP"

    aput-object v2, v0, v1

    const/16 v1, 0x9

    const-string v2, "UNSUPPORTED_SCHEME"

    aput-object v2, v0, v1

    const/16 v1, 0xa

    const-string v2, "FAILED_SSL_HANDSHAKE"

    aput-object v2, v0, v1

    const/16 v1, 0xb

    const-string v2, "BAD_URL"

    aput-object v2, v0, v1

    const/16 v1, 0xc

    const-string v2, "FILE"

    aput-object v2, v0, v1

    const/16 v1, 0xd

    const-string v2, "FILE_NOT_FOUND"

    aput-object v2, v0, v1

    const/16 v1, 0xe

    const-string v2, "TOO_MANY_REQUESTS"

    aput-object v2, v0, v1

    sput-object v0, Lcom/google/android/gms/internal/zziq;->zzIU:[Ljava/lang/String;

    const/4 v0, 0x6

    new-array v0, v0, [Ljava/lang/String;

    const-string v1, "NOT_YET_VALID"

    aput-object v1, v0, v3

    const-string v1, "EXPIRED"

    aput-object v1, v0, v4

    const-string v1, "ID_MISMATCH"

    aput-object v1, v0, v5

    const-string v1, "UNTRUSTED"

    aput-object v1, v0, v6

    const-string v1, "DATE_INVALID"

    aput-object v1, v0, v7

    const/4 v1, 0x5

    const-string v2, "INVALID"

    aput-object v2, v0, v1

    sput-object v0, Lcom/google/android/gms/internal/zziq;->zzIV:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Lcom/google/android/gms/internal/zzip;Z)V
    .registers 7

    new-instance v0, Lcom/google/android/gms/internal/zzfa;

    invoke-interface {p1}, Lcom/google/android/gms/internal/zzip;->zzgO()Landroid/content/Context;

    move-result-object v1

    new-instance v2, Lcom/google/android/gms/internal/zzbq;

    invoke-interface {p1}, Lcom/google/android/gms/internal/zzip;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-direct {v2, v3}, Lcom/google/android/gms/internal/zzbq;-><init>(Landroid/content/Context;)V

    invoke-direct {v0, p1, v1, v2}, Lcom/google/android/gms/internal/zzfa;-><init>(Lcom/google/android/gms/internal/zzip;Landroid/content/Context;Lcom/google/android/gms/internal/zzbq;)V

    const/4 v1, 0x0

    invoke-direct {p0, p1, p2, v0, v1}, Lcom/google/android/gms/internal/zziq;-><init>(Lcom/google/android/gms/internal/zzip;ZLcom/google/android/gms/internal/zzfa;Lcom/google/android/gms/internal/zzew;)V

    return-void
.end method

.method constructor <init>(Lcom/google/android/gms/internal/zzip;ZLcom/google/android/gms/internal/zzfa;Lcom/google/android/gms/internal/zzew;)V
    .registers 6

    invoke-direct {p0}, Landroid/webkit/WebViewClient;-><init>()V

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/internal/zziq;->zzIW:Ljava/util/HashMap;

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/internal/zziq;->zzpc:Ljava/lang/Object;

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/google/android/gms/internal/zziq;->zzIZ:Z

    iput-object p1, p0, Lcom/google/android/gms/internal/zziq;->zzoL:Lcom/google/android/gms/internal/zzip;

    iput-boolean p2, p0, Lcom/google/android/gms/internal/zziq;->zzqL:Z

    iput-object p3, p0, Lcom/google/android/gms/internal/zziq;->zzJc:Lcom/google/android/gms/internal/zzfa;

    iput-object p4, p0, Lcom/google/android/gms/internal/zziq;->zzxk:Lcom/google/android/gms/internal/zzew;

    return-void
.end method

.method static synthetic zza(Lcom/google/android/gms/internal/zziq;Lcom/google/android/gms/internal/zziq$zzb;)Lcom/google/android/gms/internal/zziq$zzb;
    .registers 2

    iput-object p1, p0, Lcom/google/android/gms/internal/zziq;->zzIY:Lcom/google/android/gms/internal/zziq$zzb;

    return-object p1
.end method

.method private zza(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 11

    sget-object v0, Lcom/google/android/gms/internal/zzby;->zzva:Lcom/google/android/gms/internal/zzbu;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzbu;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-nez v0, :cond_f

    :goto_e
    return-void

    :cond_f
    new-instance v4, Landroid/os/Bundle;

    invoke-direct {v4}, Landroid/os/Bundle;-><init>()V

    const-string v0, "err"

    invoke-virtual {v4, v0, p2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string v0, "code"

    invoke-virtual {v4, v0, p3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string v0, "host"

    invoke-direct {p0, p4}, Lcom/google/android/gms/internal/zziq;->zzaI(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v4, v0, v1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {}, Lcom/google/android/gms/ads/internal/zzp;->zzbx()Lcom/google/android/gms/internal/zzhu;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/internal/zziq;->zzoL:Lcom/google/android/gms/internal/zzip;

    invoke-interface {v1}, Lcom/google/android/gms/internal/zzip;->zzgV()Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;

    move-result-object v1

    iget-object v2, v1, Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;->zzIz:Ljava/lang/String;

    const-string v3, "gmob-apps"

    const/4 v5, 0x1

    move-object v1, p1

    invoke-virtual/range {v0 .. v5}, Lcom/google/android/gms/internal/zzhu;->zza(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;Z)V

    goto :goto_e
.end method

.method static synthetic zza(Lcom/google/android/gms/internal/zziq;)V
    .registers 1

    invoke-direct {p0}, Lcom/google/android/gms/internal/zziq;->zzhe()V

    return-void
.end method

.method private zzaI(Ljava/lang/String;)Ljava/lang/String;
    .registers 4

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_9

    const-string v0, ""

    :goto_8
    return-object v0

    :cond_9
    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    invoke-virtual {v0}, Landroid/net/Uri;->getHost()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_18

    invoke-virtual {v0}, Landroid/net/Uri;->getHost()Ljava/lang/String;

    move-result-object v0

    goto :goto_8

    :cond_18
    const-string v0, ""

    goto :goto_8
.end method

.method static synthetic zzb(Lcom/google/android/gms/internal/zziq;)V
    .registers 1

    invoke-direct {p0}, Lcom/google/android/gms/internal/zziq;->zzhf()V

    return-void
.end method

.method static synthetic zzc(Lcom/google/android/gms/internal/zziq;)V
    .registers 1

    invoke-direct {p0}, Lcom/google/android/gms/internal/zziq;->zzhg()V

    return-void
.end method

.method static synthetic zzd(Lcom/google/android/gms/internal/zziq;)Lcom/google/android/gms/internal/zziq$zzb;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/internal/zziq;->zzIY:Lcom/google/android/gms/internal/zziq$zzb;

    return-object v0
.end method

.method private static zzg(Landroid/net/Uri;)Z
    .registers 3

    invoke-virtual {p0}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v0

    const-string v1, "http"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_14

    const-string v1, "https"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_16

    :cond_14
    const/4 v0, 0x1

    :goto_15
    return v0

    :cond_16
    const/4 v0, 0x0

    goto :goto_15
.end method

.method private zzhe()V
    .registers 3

    iget-object v1, p0, Lcom/google/android/gms/internal/zziq;->zzpc:Ljava/lang/Object;

    monitor-enter v1

    const/4 v0, 0x1

    :try_start_4
    iput-boolean v0, p0, Lcom/google/android/gms/internal/zziq;->zzJa:Z

    monitor-exit v1
    :try_end_7
    .catchall {:try_start_4 .. :try_end_7} :catchall_11

    iget v0, p0, Lcom/google/android/gms/internal/zziq;->zzJh:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/google/android/gms/internal/zziq;->zzJh:I

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zziq;->zzhh()V

    return-void

    :catchall_11
    move-exception v0

    :try_start_12
    monitor-exit v1
    :try_end_13
    .catchall {:try_start_12 .. :try_end_13} :catchall_11

    throw v0
.end method

.method private zzhf()V
    .registers 2

    iget v0, p0, Lcom/google/android/gms/internal/zziq;->zzJh:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lcom/google/android/gms/internal/zziq;->zzJh:I

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zziq;->zzhh()V

    return-void
.end method

.method private zzhg()V
    .registers 2

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/google/android/gms/internal/zziq;->zzJg:Z

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zziq;->zzhh()V

    return-void
.end method


# virtual methods
.method public final onLoadResource(Landroid/webkit/WebView;Ljava/lang/String;)V
    .registers 6
    .param p1, "webView"    # Landroid/webkit/WebView;
    .param p2, "url"    # Ljava/lang/String;

    .prologue
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Loading resource: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/google/android/gms/ads/internal/util/client/zzb;->v(Ljava/lang/String;)V

    invoke-static {p2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    const-string v1, "gmsg"

    invoke-virtual {v0}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_35

    const-string v1, "mobileads.google.com"

    invoke-virtual {v0}, Landroid/net/Uri;->getHost()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_35

    invoke-virtual {p0, v0}, Lcom/google/android/gms/internal/zziq;->zzh(Landroid/net/Uri;)V

    :cond_35
    return-void
.end method

.method public final onPageFinished(Landroid/webkit/WebView;Ljava/lang/String;)V
    .registers 5
    .param p1, "webView"    # Landroid/webkit/WebView;
    .param p2, "url"    # Ljava/lang/String;

    .prologue
    iget-object v1, p0, Lcom/google/android/gms/internal/zziq;->zzpc:Ljava/lang/Object;

    monitor-enter v1

    :try_start_3
    iget-boolean v0, p0, Lcom/google/android/gms/internal/zziq;->zzJe:Z

    if-eqz v0, :cond_1b

    const-string v0, "about:blank"

    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1b

    const-string v0, "Blank page loaded, 1..."

    invoke-static {v0}, Lcom/google/android/gms/ads/internal/util/client/zzb;->v(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/google/android/gms/internal/zziq;->zzoL:Lcom/google/android/gms/internal/zzip;

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzip;->zzgX()V

    monitor-exit v1

    :goto_1a
    return-void

    :cond_1b
    monitor-exit v1
    :try_end_1c
    .catchall {:try_start_3 .. :try_end_1c} :catchall_23

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/google/android/gms/internal/zziq;->zzJf:Z

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zziq;->zzhh()V

    goto :goto_1a

    :catchall_23
    move-exception v0

    :try_start_24
    monitor-exit v1
    :try_end_25
    .catchall {:try_start_24 .. :try_end_25} :catchall_23

    throw v0
.end method

.method public final onReceivedError(Landroid/webkit/WebView;ILjava/lang/String;Ljava/lang/String;)V
    .registers 8
    .param p1, "view"    # Landroid/webkit/WebView;
    .param p2, "errorCode"    # I
    .param p3, "description"    # Ljava/lang/String;
    .param p4, "failingUrl"    # Ljava/lang/String;

    .prologue
    if-gez p2, :cond_20

    neg-int v0, p2

    add-int/lit8 v0, v0, -0x1

    sget-object v1, Lcom/google/android/gms/internal/zziq;->zzIU:[Ljava/lang/String;

    array-length v1, v1

    if-ge v0, v1, :cond_20

    sget-object v0, Lcom/google/android/gms/internal/zziq;->zzIU:[Ljava/lang/String;

    neg-int v1, p2

    add-int/lit8 v1, v1, -0x1

    aget-object v0, v0, v1

    :goto_11
    iget-object v1, p0, Lcom/google/android/gms/internal/zziq;->zzoL:Lcom/google/android/gms/internal/zzip;

    invoke-interface {v1}, Lcom/google/android/gms/internal/zzip;->getContext()Landroid/content/Context;

    move-result-object v1

    const-string v2, "http_err"

    invoke-direct {p0, v1, v2, v0, p4}, Lcom/google/android/gms/internal/zziq;->zza(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-super {p0, p1, p2, p3, p4}, Landroid/webkit/WebViewClient;->onReceivedError(Landroid/webkit/WebView;ILjava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_20
    invoke-static {p2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_11
.end method

.method public final onReceivedSslError(Landroid/webkit/WebView;Landroid/webkit/SslErrorHandler;Landroid/net/http/SslError;)V
    .registers 8
    .param p1, "view"    # Landroid/webkit/WebView;
    .param p2, "handler"    # Landroid/webkit/SslErrorHandler;
    .param p3, "error"    # Landroid/net/http/SslError;

    .prologue
    if-eqz p3, :cond_24

    invoke-virtual {p3}, Landroid/net/http/SslError;->getPrimaryError()I

    move-result v0

    if-ltz v0, :cond_28

    sget-object v1, Lcom/google/android/gms/internal/zziq;->zzIV:[Ljava/lang/String;

    array-length v1, v1

    if-ge v0, v1, :cond_28

    sget-object v1, Lcom/google/android/gms/internal/zziq;->zzIV:[Ljava/lang/String;

    aget-object v0, v1, v0

    :goto_11
    iget-object v1, p0, Lcom/google/android/gms/internal/zziq;->zzoL:Lcom/google/android/gms/internal/zzip;

    invoke-interface {v1}, Lcom/google/android/gms/internal/zzip;->getContext()Landroid/content/Context;

    move-result-object v1

    const-string v2, "ssl_err"

    invoke-static {}, Lcom/google/android/gms/ads/internal/zzp;->zzbz()Lcom/google/android/gms/internal/zzhv;

    move-result-object v3

    invoke-virtual {v3, p3}, Lcom/google/android/gms/internal/zzhv;->zza(Landroid/net/http/SslError;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v1, v2, v0, v3}, Lcom/google/android/gms/internal/zziq;->zza(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    :cond_24
    invoke-super {p0, p1, p2, p3}, Landroid/webkit/WebViewClient;->onReceivedSslError(Landroid/webkit/WebView;Landroid/webkit/SslErrorHandler;Landroid/net/http/SslError;)V

    return-void

    :cond_28
    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_11
.end method

.method public final reset()V
    .registers 4

    iget-object v1, p0, Lcom/google/android/gms/internal/zziq;->zzpc:Ljava/lang/Object;

    monitor-enter v1

    :try_start_3
    iget-object v0, p0, Lcom/google/android/gms/internal/zziq;->zzIW:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->clear()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/android/gms/internal/zziq;->zzsn:Lcom/google/android/gms/ads/internal/client/zza;

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/android/gms/internal/zziq;->zzIX:Lcom/google/android/gms/ads/internal/overlay/zzg;

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/android/gms/internal/zziq;->zzCv:Lcom/google/android/gms/internal/zziq$zza;

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/android/gms/internal/zziq;->zzwH:Lcom/google/android/gms/internal/zzdd;

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/google/android/gms/internal/zziq;->zzIZ:Z

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/google/android/gms/internal/zziq;->zzqL:Z

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/google/android/gms/internal/zziq;->zzJa:Z

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/android/gms/internal/zziq;->zzxm:Lcom/google/android/gms/internal/zzdi;

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/android/gms/internal/zziq;->zzJb:Lcom/google/android/gms/ads/internal/overlay/zzn;

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/android/gms/internal/zziq;->zzIY:Lcom/google/android/gms/internal/zziq$zzb;

    iget-object v0, p0, Lcom/google/android/gms/internal/zziq;->zzxk:Lcom/google/android/gms/internal/zzew;

    if-eqz v0, :cond_33

    iget-object v0, p0, Lcom/google/android/gms/internal/zziq;->zzxk:Lcom/google/android/gms/internal/zzew;

    const/4 v2, 0x1

    invoke-virtual {v0, v2}, Lcom/google/android/gms/internal/zzew;->zzn(Z)V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/android/gms/internal/zziq;->zzxk:Lcom/google/android/gms/internal/zzew;

    :cond_33
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/google/android/gms/internal/zziq;->zzJd:Z

    monitor-exit v1

    return-void

    :catchall_38
    move-exception v0

    monitor-exit v1
    :try_end_3a
    .catchall {:try_start_3 .. :try_end_3a} :catchall_38

    throw v0
.end method

.method public shouldOverrideKeyEvent(Landroid/webkit/WebView;Landroid/view/KeyEvent;)Z
    .registers 4
    .param p1, "view"    # Landroid/webkit/WebView;
    .param p2, "event"    # Landroid/view/KeyEvent;

    .prologue
    invoke-virtual {p2}, Landroid/view/KeyEvent;->getKeyCode()I

    move-result v0

    sparse-switch v0, :sswitch_data_c

    const/4 v0, 0x0

    :goto_8
    return v0

    :sswitch_9
    const/4 v0, 0x1

    goto :goto_8

    nop

    :sswitch_data_c
    .sparse-switch
        0x4f -> :sswitch_9
        0x55 -> :sswitch_9
        0x56 -> :sswitch_9
        0x57 -> :sswitch_9
        0x58 -> :sswitch_9
        0x59 -> :sswitch_9
        0x5a -> :sswitch_9
        0x5b -> :sswitch_9
        0x7e -> :sswitch_9
        0x7f -> :sswitch_9
        0x80 -> :sswitch_9
        0x81 -> :sswitch_9
        0x82 -> :sswitch_9
        0xde -> :sswitch_9
    .end sparse-switch
.end method

.method public final shouldOverrideUrlLoading(Landroid/webkit/WebView;Ljava/lang/String;)Z
    .registers 12
    .param p1, "webView"    # Landroid/webkit/WebView;
    .param p2, "url"    # Ljava/lang/String;

    .prologue
    const/4 v8, 0x1

    const/4 v3, 0x0

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "AdWebView shouldOverrideUrlLoading: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/google/android/gms/ads/internal/util/client/zzb;->v(Ljava/lang/String;)V

    invoke-static {p2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    const-string v1, "gmsg"

    invoke-virtual {v0}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_39

    const-string v1, "mobileads.google.com"

    invoke-virtual {v0}, Landroid/net/Uri;->getHost()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_39

    invoke-virtual {p0, v0}, Lcom/google/android/gms/internal/zziq;->zzh(Landroid/net/Uri;)V

    :goto_37
    move v0, v8

    :goto_38
    return v0

    :cond_39
    iget-boolean v1, p0, Lcom/google/android/gms/internal/zziq;->zzIZ:Z

    if-eqz v1, :cond_69

    iget-object v1, p0, Lcom/google/android/gms/internal/zziq;->zzoL:Lcom/google/android/gms/internal/zzip;

    if-ne p1, v1, :cond_69

    invoke-static {v0}, Lcom/google/android/gms/internal/zziq;->zzg(Landroid/net/Uri;)Z

    move-result v1

    if-eqz v1, :cond_69

    iget-boolean v0, p0, Lcom/google/android/gms/internal/zziq;->zzJd:Z

    if-nez v0, :cond_64

    iput-boolean v8, p0, Lcom/google/android/gms/internal/zziq;->zzJd:Z

    iget-object v0, p0, Lcom/google/android/gms/internal/zziq;->zzsn:Lcom/google/android/gms/ads/internal/client/zza;

    if-eqz v0, :cond_64

    sget-object v0, Lcom/google/android/gms/internal/zzby;->zzuO:Lcom/google/android/gms/internal/zzbu;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzbu;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_64

    iget-object v0, p0, Lcom/google/android/gms/internal/zziq;->zzsn:Lcom/google/android/gms/ads/internal/client/zza;

    invoke-interface {v0}, Lcom/google/android/gms/ads/internal/client/zza;->onAdClicked()V

    :cond_64
    invoke-super {p0, p1, p2}, Landroid/webkit/WebViewClient;->shouldOverrideUrlLoading(Landroid/webkit/WebView;Ljava/lang/String;)Z

    move-result v0

    goto :goto_38

    :cond_69
    iget-object v1, p0, Lcom/google/android/gms/internal/zziq;->zzoL:Lcom/google/android/gms/internal/zzip;

    invoke-interface {v1}, Lcom/google/android/gms/internal/zzip;->willNotDraw()Z

    move-result v1

    if-nez v1, :cond_c9

    :try_start_71
    iget-object v1, p0, Lcom/google/android/gms/internal/zziq;->zzoL:Lcom/google/android/gms/internal/zzip;

    invoke-interface {v1}, Lcom/google/android/gms/internal/zzip;->zzgU()Lcom/google/android/gms/internal/zzan;

    move-result-object v1

    if-eqz v1, :cond_89

    invoke-virtual {v1, v0}, Lcom/google/android/gms/internal/zzan;->zzb(Landroid/net/Uri;)Z

    move-result v2

    if-eqz v2, :cond_89

    iget-object v2, p0, Lcom/google/android/gms/internal/zziq;->zzoL:Lcom/google/android/gms/internal/zzip;

    invoke-interface {v2}, Lcom/google/android/gms/internal/zzip;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v1, v0, v2}, Lcom/google/android/gms/internal/zzan;->zza(Landroid/net/Uri;Landroid/content/Context;)Landroid/net/Uri;
    :try_end_88
    .catch Lcom/google/android/gms/internal/zzao; {:try_start_71 .. :try_end_88} :catch_a9

    move-result-object v0

    :cond_89
    move-object v2, v0

    :goto_8a
    iget-object v0, p0, Lcom/google/android/gms/internal/zziq;->zzxj:Lcom/google/android/gms/ads/internal/zze;

    if-eqz v0, :cond_96

    iget-object v0, p0, Lcom/google/android/gms/internal/zziq;->zzxj:Lcom/google/android/gms/ads/internal/zze;

    invoke-virtual {v0}, Lcom/google/android/gms/ads/internal/zze;->zzbe()Z

    move-result v0

    if-eqz v0, :cond_c2

    :cond_96
    new-instance v0, Lcom/google/android/gms/ads/internal/overlay/AdLauncherIntentInfoParcel;

    const-string v1, "android.intent.action.VIEW"

    invoke-virtual {v2}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v2

    move-object v4, v3

    move-object v5, v3

    move-object v6, v3

    move-object v7, v3

    invoke-direct/range {v0 .. v7}, Lcom/google/android/gms/ads/internal/overlay/AdLauncherIntentInfoParcel;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Lcom/google/android/gms/internal/zziq;->zza(Lcom/google/android/gms/ads/internal/overlay/AdLauncherIntentInfoParcel;)V

    goto :goto_37

    :catch_a9
    move-exception v1

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unable to append parameter to URL: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzaE(Ljava/lang/String;)V

    move-object v2, v0

    goto :goto_8a

    :cond_c2
    iget-object v0, p0, Lcom/google/android/gms/internal/zziq;->zzxj:Lcom/google/android/gms/ads/internal/zze;

    invoke-virtual {v0, p2}, Lcom/google/android/gms/ads/internal/zze;->zzp(Ljava/lang/String;)V

    goto/16 :goto_37

    :cond_c9
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "AdWebView unable to handle URL: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzaE(Ljava/lang/String;)V

    goto/16 :goto_37
.end method

.method public zzF(Z)V
    .registers 2

    iput-boolean p1, p0, Lcom/google/android/gms/internal/zziq;->zzIZ:Z

    return-void
.end method

.method public zza(IIZ)V
    .registers 5

    iget-object v0, p0, Lcom/google/android/gms/internal/zziq;->zzJc:Lcom/google/android/gms/internal/zzfa;

    invoke-virtual {v0, p1, p2}, Lcom/google/android/gms/internal/zzfa;->zze(II)V

    iget-object v0, p0, Lcom/google/android/gms/internal/zziq;->zzxk:Lcom/google/android/gms/internal/zzew;

    if-eqz v0, :cond_e

    iget-object v0, p0, Lcom/google/android/gms/internal/zziq;->zzxk:Lcom/google/android/gms/internal/zzew;

    invoke-virtual {v0, p1, p2, p3}, Lcom/google/android/gms/internal/zzew;->zza(IIZ)V

    :cond_e
    return-void
.end method

.method public final zza(Lcom/google/android/gms/ads/internal/overlay/AdLauncherIntentInfoParcel;)V
    .registers 8

    const/4 v3, 0x0

    iget-object v0, p0, Lcom/google/android/gms/internal/zziq;->zzoL:Lcom/google/android/gms/internal/zzip;

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzip;->zzgW()Z

    move-result v1

    new-instance v0, Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;

    if-eqz v1, :cond_28

    iget-object v2, p0, Lcom/google/android/gms/internal/zziq;->zzoL:Lcom/google/android/gms/internal/zzip;

    invoke-interface {v2}, Lcom/google/android/gms/internal/zzip;->zzaN()Lcom/google/android/gms/ads/internal/client/AdSizeParcel;

    move-result-object v2

    iget-boolean v2, v2, Lcom/google/android/gms/ads/internal/client/AdSizeParcel;->zzsH:Z

    if-nez v2, :cond_28

    move-object v2, v3

    :goto_16
    if-eqz v1, :cond_2b

    :goto_18
    iget-object v4, p0, Lcom/google/android/gms/internal/zziq;->zzJb:Lcom/google/android/gms/ads/internal/overlay/zzn;

    iget-object v1, p0, Lcom/google/android/gms/internal/zziq;->zzoL:Lcom/google/android/gms/internal/zzip;

    invoke-interface {v1}, Lcom/google/android/gms/internal/zzip;->zzgV()Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;

    move-result-object v5

    move-object v1, p1

    invoke-direct/range {v0 .. v5}, Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;-><init>(Lcom/google/android/gms/ads/internal/overlay/AdLauncherIntentInfoParcel;Lcom/google/android/gms/ads/internal/client/zza;Lcom/google/android/gms/ads/internal/overlay/zzg;Lcom/google/android/gms/ads/internal/overlay/zzn;Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;)V

    invoke-virtual {p0, v0}, Lcom/google/android/gms/internal/zziq;->zza(Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;)V

    return-void

    :cond_28
    iget-object v2, p0, Lcom/google/android/gms/internal/zziq;->zzsn:Lcom/google/android/gms/ads/internal/client/zza;

    goto :goto_16

    :cond_2b
    iget-object v3, p0, Lcom/google/android/gms/internal/zziq;->zzIX:Lcom/google/android/gms/ads/internal/overlay/zzg;

    goto :goto_18
.end method

.method public zza(Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;)V
    .registers 6

    const/4 v1, 0x0

    iget-object v0, p0, Lcom/google/android/gms/internal/zziq;->zzxk:Lcom/google/android/gms/internal/zzew;

    if-eqz v0, :cond_1c

    iget-object v0, p0, Lcom/google/android/gms/internal/zziq;->zzxk:Lcom/google/android/gms/internal/zzew;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzew;->zzdY()Z

    move-result v0

    :goto_b
    invoke-static {}, Lcom/google/android/gms/ads/internal/zzp;->zzbv()Lcom/google/android/gms/ads/internal/overlay/zze;

    move-result-object v2

    iget-object v3, p0, Lcom/google/android/gms/internal/zziq;->zzoL:Lcom/google/android/gms/internal/zzip;

    invoke-interface {v3}, Lcom/google/android/gms/internal/zzip;->getContext()Landroid/content/Context;

    move-result-object v3

    if-nez v0, :cond_18

    const/4 v1, 0x1

    :cond_18
    invoke-virtual {v2, v3, p1, v1}, Lcom/google/android/gms/ads/internal/overlay/zze;->zza(Landroid/content/Context;Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;Z)V

    return-void

    :cond_1c
    move v0, v1

    goto :goto_b
.end method

.method public zza(Lcom/google/android/gms/internal/zziq$zza;)V
    .registers 2

    iput-object p1, p0, Lcom/google/android/gms/internal/zziq;->zzCv:Lcom/google/android/gms/internal/zziq$zza;

    return-void
.end method

.method public zza(Lcom/google/android/gms/internal/zziq$zzb;)V
    .registers 2

    iput-object p1, p0, Lcom/google/android/gms/internal/zziq;->zzIY:Lcom/google/android/gms/internal/zziq$zzb;

    return-void
.end method

.method public final zza(Ljava/lang/String;Lcom/google/android/gms/internal/zzdg;)V
    .registers 6

    iget-object v1, p0, Lcom/google/android/gms/internal/zziq;->zzpc:Ljava/lang/Object;

    monitor-enter v1

    :try_start_3
    iget-object v0, p0, Lcom/google/android/gms/internal/zziq;->zzIW:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    if-nez v0, :cond_17

    new-instance v0, Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-direct {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;-><init>()V

    iget-object v2, p0, Lcom/google/android/gms/internal/zziq;->zzIW:Ljava/util/HashMap;

    invoke-virtual {v2, p1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_17
    invoke-interface {v0, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    monitor-exit v1

    return-void

    :catchall_1c
    move-exception v0

    monitor-exit v1
    :try_end_1e
    .catchall {:try_start_3 .. :try_end_1e} :catchall_1c

    throw v0
.end method

.method public final zza(ZI)V
    .registers 11

    iget-object v0, p0, Lcom/google/android/gms/internal/zziq;->zzoL:Lcom/google/android/gms/internal/zzip;

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzip;->zzgW()Z

    move-result v1

    new-instance v0, Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;

    if-eqz v1, :cond_2a

    iget-object v1, p0, Lcom/google/android/gms/internal/zziq;->zzoL:Lcom/google/android/gms/internal/zzip;

    invoke-interface {v1}, Lcom/google/android/gms/internal/zzip;->zzaN()Lcom/google/android/gms/ads/internal/client/AdSizeParcel;

    move-result-object v1

    iget-boolean v1, v1, Lcom/google/android/gms/ads/internal/client/AdSizeParcel;->zzsH:Z

    if-nez v1, :cond_2a

    const/4 v1, 0x0

    :goto_15
    iget-object v2, p0, Lcom/google/android/gms/internal/zziq;->zzIX:Lcom/google/android/gms/ads/internal/overlay/zzg;

    iget-object v3, p0, Lcom/google/android/gms/internal/zziq;->zzJb:Lcom/google/android/gms/ads/internal/overlay/zzn;

    iget-object v4, p0, Lcom/google/android/gms/internal/zziq;->zzoL:Lcom/google/android/gms/internal/zzip;

    iget-object v5, p0, Lcom/google/android/gms/internal/zziq;->zzoL:Lcom/google/android/gms/internal/zzip;

    invoke-interface {v5}, Lcom/google/android/gms/internal/zzip;->zzgV()Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;

    move-result-object v7

    move v5, p1

    move v6, p2

    invoke-direct/range {v0 .. v7}, Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;-><init>(Lcom/google/android/gms/ads/internal/client/zza;Lcom/google/android/gms/ads/internal/overlay/zzg;Lcom/google/android/gms/ads/internal/overlay/zzn;Lcom/google/android/gms/internal/zzip;ZILcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;)V

    invoke-virtual {p0, v0}, Lcom/google/android/gms/internal/zziq;->zza(Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;)V

    return-void

    :cond_2a
    iget-object v1, p0, Lcom/google/android/gms/internal/zziq;->zzsn:Lcom/google/android/gms/ads/internal/client/zza;

    goto :goto_15
.end method

.method public final zza(ZILjava/lang/String;)V
    .registers 15

    const/4 v2, 0x0

    iget-object v0, p0, Lcom/google/android/gms/internal/zziq;->zzoL:Lcom/google/android/gms/internal/zzip;

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzip;->zzgW()Z

    move-result v3

    new-instance v0, Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;

    if-eqz v3, :cond_30

    iget-object v1, p0, Lcom/google/android/gms/internal/zziq;->zzoL:Lcom/google/android/gms/internal/zzip;

    invoke-interface {v1}, Lcom/google/android/gms/internal/zzip;->zzaN()Lcom/google/android/gms/ads/internal/client/AdSizeParcel;

    move-result-object v1

    iget-boolean v1, v1, Lcom/google/android/gms/ads/internal/client/AdSizeParcel;->zzsH:Z

    if-nez v1, :cond_30

    move-object v1, v2

    :goto_16
    if-eqz v3, :cond_33

    :goto_18
    iget-object v3, p0, Lcom/google/android/gms/internal/zziq;->zzwH:Lcom/google/android/gms/internal/zzdd;

    iget-object v4, p0, Lcom/google/android/gms/internal/zziq;->zzJb:Lcom/google/android/gms/ads/internal/overlay/zzn;

    iget-object v5, p0, Lcom/google/android/gms/internal/zziq;->zzoL:Lcom/google/android/gms/internal/zzip;

    iget-object v6, p0, Lcom/google/android/gms/internal/zziq;->zzoL:Lcom/google/android/gms/internal/zzip;

    invoke-interface {v6}, Lcom/google/android/gms/internal/zzip;->zzgV()Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;

    move-result-object v9

    iget-object v10, p0, Lcom/google/android/gms/internal/zziq;->zzxm:Lcom/google/android/gms/internal/zzdi;

    move v6, p1

    move v7, p2

    move-object v8, p3

    invoke-direct/range {v0 .. v10}, Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;-><init>(Lcom/google/android/gms/ads/internal/client/zza;Lcom/google/android/gms/ads/internal/overlay/zzg;Lcom/google/android/gms/internal/zzdd;Lcom/google/android/gms/ads/internal/overlay/zzn;Lcom/google/android/gms/internal/zzip;ZILjava/lang/String;Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;Lcom/google/android/gms/internal/zzdi;)V

    invoke-virtual {p0, v0}, Lcom/google/android/gms/internal/zziq;->zza(Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;)V

    return-void

    :cond_30
    iget-object v1, p0, Lcom/google/android/gms/internal/zziq;->zzsn:Lcom/google/android/gms/ads/internal/client/zza;

    goto :goto_16

    :cond_33
    new-instance v2, Lcom/google/android/gms/internal/zziq$zzc;

    iget-object v3, p0, Lcom/google/android/gms/internal/zziq;->zzoL:Lcom/google/android/gms/internal/zzip;

    iget-object v4, p0, Lcom/google/android/gms/internal/zziq;->zzIX:Lcom/google/android/gms/ads/internal/overlay/zzg;

    invoke-direct {v2, v3, v4}, Lcom/google/android/gms/internal/zziq$zzc;-><init>(Lcom/google/android/gms/internal/zzip;Lcom/google/android/gms/ads/internal/overlay/zzg;)V

    goto :goto_18
.end method

.method public final zza(ZILjava/lang/String;Ljava/lang/String;)V
    .registers 17

    iget-object v0, p0, Lcom/google/android/gms/internal/zziq;->zzoL:Lcom/google/android/gms/internal/zzip;

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzip;->zzgW()Z

    move-result v2

    new-instance v0, Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;

    if-eqz v2, :cond_32

    iget-object v1, p0, Lcom/google/android/gms/internal/zziq;->zzoL:Lcom/google/android/gms/internal/zzip;

    invoke-interface {v1}, Lcom/google/android/gms/internal/zzip;->zzaN()Lcom/google/android/gms/ads/internal/client/AdSizeParcel;

    move-result-object v1

    iget-boolean v1, v1, Lcom/google/android/gms/ads/internal/client/AdSizeParcel;->zzsH:Z

    if-nez v1, :cond_32

    const/4 v1, 0x0

    :goto_15
    if-eqz v2, :cond_35

    const/4 v2, 0x0

    :goto_18
    iget-object v3, p0, Lcom/google/android/gms/internal/zziq;->zzwH:Lcom/google/android/gms/internal/zzdd;

    iget-object v4, p0, Lcom/google/android/gms/internal/zziq;->zzJb:Lcom/google/android/gms/ads/internal/overlay/zzn;

    iget-object v5, p0, Lcom/google/android/gms/internal/zziq;->zzoL:Lcom/google/android/gms/internal/zzip;

    iget-object v6, p0, Lcom/google/android/gms/internal/zziq;->zzoL:Lcom/google/android/gms/internal/zzip;

    invoke-interface {v6}, Lcom/google/android/gms/internal/zzip;->zzgV()Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;

    move-result-object v10

    iget-object v11, p0, Lcom/google/android/gms/internal/zziq;->zzxm:Lcom/google/android/gms/internal/zzdi;

    move v6, p1

    move v7, p2

    move-object v8, p3

    move-object/from16 v9, p4

    invoke-direct/range {v0 .. v11}, Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;-><init>(Lcom/google/android/gms/ads/internal/client/zza;Lcom/google/android/gms/ads/internal/overlay/zzg;Lcom/google/android/gms/internal/zzdd;Lcom/google/android/gms/ads/internal/overlay/zzn;Lcom/google/android/gms/internal/zzip;ZILjava/lang/String;Ljava/lang/String;Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;Lcom/google/android/gms/internal/zzdi;)V

    invoke-virtual {p0, v0}, Lcom/google/android/gms/internal/zziq;->zza(Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;)V

    return-void

    :cond_32
    iget-object v1, p0, Lcom/google/android/gms/internal/zziq;->zzsn:Lcom/google/android/gms/ads/internal/client/zza;

    goto :goto_15

    :cond_35
    new-instance v2, Lcom/google/android/gms/internal/zziq$zzc;

    iget-object v3, p0, Lcom/google/android/gms/internal/zziq;->zzoL:Lcom/google/android/gms/internal/zzip;

    iget-object v4, p0, Lcom/google/android/gms/internal/zziq;->zzIX:Lcom/google/android/gms/ads/internal/overlay/zzg;

    invoke-direct {v2, v3, v4}, Lcom/google/android/gms/internal/zziq$zzc;-><init>(Lcom/google/android/gms/internal/zzip;Lcom/google/android/gms/ads/internal/overlay/zzg;)V

    goto :goto_18
.end method

.method public zzb(Lcom/google/android/gms/ads/internal/client/zza;Lcom/google/android/gms/ads/internal/overlay/zzg;Lcom/google/android/gms/internal/zzdd;Lcom/google/android/gms/ads/internal/overlay/zzn;ZLcom/google/android/gms/internal/zzdi;Lcom/google/android/gms/internal/zzdk;Lcom/google/android/gms/ads/internal/zze;Lcom/google/android/gms/internal/zzfc;)V
    .registers 14

    const/4 v3, 0x0

    if-nez p8, :cond_8

    new-instance p8, Lcom/google/android/gms/ads/internal/zze;

    invoke-direct {p8, v3}, Lcom/google/android/gms/ads/internal/zze;-><init>(Z)V

    :cond_8
    new-instance v0, Lcom/google/android/gms/internal/zzew;

    iget-object v1, p0, Lcom/google/android/gms/internal/zziq;->zzoL:Lcom/google/android/gms/internal/zzip;

    invoke-direct {v0, v1, p9}, Lcom/google/android/gms/internal/zzew;-><init>(Lcom/google/android/gms/internal/zzip;Lcom/google/android/gms/internal/zzfc;)V

    iput-object v0, p0, Lcom/google/android/gms/internal/zziq;->zzxk:Lcom/google/android/gms/internal/zzew;

    const-string v0, "/appEvent"

    new-instance v1, Lcom/google/android/gms/internal/zzdc;

    invoke-direct {v1, p3}, Lcom/google/android/gms/internal/zzdc;-><init>(Lcom/google/android/gms/internal/zzdd;)V

    invoke-virtual {p0, v0, v1}, Lcom/google/android/gms/internal/zziq;->zza(Ljava/lang/String;Lcom/google/android/gms/internal/zzdg;)V

    const-string v0, "/backButton"

    sget-object v1, Lcom/google/android/gms/internal/zzdf;->zzwR:Lcom/google/android/gms/internal/zzdg;

    invoke-virtual {p0, v0, v1}, Lcom/google/android/gms/internal/zziq;->zza(Ljava/lang/String;Lcom/google/android/gms/internal/zzdg;)V

    const-string v0, "/canOpenURLs"

    sget-object v1, Lcom/google/android/gms/internal/zzdf;->zzwJ:Lcom/google/android/gms/internal/zzdg;

    invoke-virtual {p0, v0, v1}, Lcom/google/android/gms/internal/zziq;->zza(Ljava/lang/String;Lcom/google/android/gms/internal/zzdg;)V

    const-string v0, "/canOpenIntents"

    sget-object v1, Lcom/google/android/gms/internal/zzdf;->zzwK:Lcom/google/android/gms/internal/zzdg;

    invoke-virtual {p0, v0, v1}, Lcom/google/android/gms/internal/zziq;->zza(Ljava/lang/String;Lcom/google/android/gms/internal/zzdg;)V

    const-string v0, "/click"

    sget-object v1, Lcom/google/android/gms/internal/zzdf;->zzwL:Lcom/google/android/gms/internal/zzdg;

    invoke-virtual {p0, v0, v1}, Lcom/google/android/gms/internal/zziq;->zza(Ljava/lang/String;Lcom/google/android/gms/internal/zzdg;)V

    const-string v0, "/close"

    sget-object v1, Lcom/google/android/gms/internal/zzdf;->zzwM:Lcom/google/android/gms/internal/zzdg;

    invoke-virtual {p0, v0, v1}, Lcom/google/android/gms/internal/zziq;->zza(Ljava/lang/String;Lcom/google/android/gms/internal/zzdg;)V

    const-string v0, "/customClose"

    sget-object v1, Lcom/google/android/gms/internal/zzdf;->zzwN:Lcom/google/android/gms/internal/zzdg;

    invoke-virtual {p0, v0, v1}, Lcom/google/android/gms/internal/zziq;->zza(Ljava/lang/String;Lcom/google/android/gms/internal/zzdg;)V

    const-string v0, "/delayPageLoaded"

    new-instance v1, Lcom/google/android/gms/internal/zziq$zzd;

    const/4 v2, 0x0

    invoke-direct {v1, p0, v2}, Lcom/google/android/gms/internal/zziq$zzd;-><init>(Lcom/google/android/gms/internal/zziq;Lcom/google/android/gms/internal/zziq$1;)V

    invoke-virtual {p0, v0, v1}, Lcom/google/android/gms/internal/zziq;->zza(Ljava/lang/String;Lcom/google/android/gms/internal/zzdg;)V

    const-string v0, "/httpTrack"

    sget-object v1, Lcom/google/android/gms/internal/zzdf;->zzwO:Lcom/google/android/gms/internal/zzdg;

    invoke-virtual {p0, v0, v1}, Lcom/google/android/gms/internal/zziq;->zza(Ljava/lang/String;Lcom/google/android/gms/internal/zzdg;)V

    const-string v0, "/log"

    sget-object v1, Lcom/google/android/gms/internal/zzdf;->zzwP:Lcom/google/android/gms/internal/zzdg;

    invoke-virtual {p0, v0, v1}, Lcom/google/android/gms/internal/zziq;->zza(Ljava/lang/String;Lcom/google/android/gms/internal/zzdg;)V

    const-string v0, "/mraid"

    new-instance v1, Lcom/google/android/gms/internal/zzdm;

    iget-object v2, p0, Lcom/google/android/gms/internal/zziq;->zzxk:Lcom/google/android/gms/internal/zzew;

    invoke-direct {v1, p8, v2}, Lcom/google/android/gms/internal/zzdm;-><init>(Lcom/google/android/gms/ads/internal/zze;Lcom/google/android/gms/internal/zzew;)V

    invoke-virtual {p0, v0, v1}, Lcom/google/android/gms/internal/zziq;->zza(Ljava/lang/String;Lcom/google/android/gms/internal/zzdg;)V

    const-string v0, "/mraidLoaded"

    iget-object v1, p0, Lcom/google/android/gms/internal/zziq;->zzJc:Lcom/google/android/gms/internal/zzfa;

    invoke-virtual {p0, v0, v1}, Lcom/google/android/gms/internal/zziq;->zza(Ljava/lang/String;Lcom/google/android/gms/internal/zzdg;)V

    const-string v0, "/open"

    new-instance v1, Lcom/google/android/gms/internal/zzdn;

    iget-object v2, p0, Lcom/google/android/gms/internal/zziq;->zzxk:Lcom/google/android/gms/internal/zzew;

    invoke-direct {v1, p6, p8, v2}, Lcom/google/android/gms/internal/zzdn;-><init>(Lcom/google/android/gms/internal/zzdi;Lcom/google/android/gms/ads/internal/zze;Lcom/google/android/gms/internal/zzew;)V

    invoke-virtual {p0, v0, v1}, Lcom/google/android/gms/internal/zziq;->zza(Ljava/lang/String;Lcom/google/android/gms/internal/zzdg;)V

    const-string v0, "/precache"

    sget-object v1, Lcom/google/android/gms/internal/zzdf;->zzwT:Lcom/google/android/gms/internal/zzdg;

    invoke-virtual {p0, v0, v1}, Lcom/google/android/gms/internal/zziq;->zza(Ljava/lang/String;Lcom/google/android/gms/internal/zzdg;)V

    const-string v0, "/touch"

    sget-object v1, Lcom/google/android/gms/internal/zzdf;->zzwQ:Lcom/google/android/gms/internal/zzdg;

    invoke-virtual {p0, v0, v1}, Lcom/google/android/gms/internal/zziq;->zza(Ljava/lang/String;Lcom/google/android/gms/internal/zzdg;)V

    const-string v0, "/video"

    sget-object v1, Lcom/google/android/gms/internal/zzdf;->zzwS:Lcom/google/android/gms/internal/zzdg;

    invoke-virtual {p0, v0, v1}, Lcom/google/android/gms/internal/zziq;->zza(Ljava/lang/String;Lcom/google/android/gms/internal/zzdg;)V

    if-eqz p7, :cond_9e

    const-string v0, "/setInterstitialProperties"

    new-instance v1, Lcom/google/android/gms/internal/zzdj;

    invoke-direct {v1, p7}, Lcom/google/android/gms/internal/zzdj;-><init>(Lcom/google/android/gms/internal/zzdk;)V

    invoke-virtual {p0, v0, v1}, Lcom/google/android/gms/internal/zziq;->zza(Ljava/lang/String;Lcom/google/android/gms/internal/zzdg;)V

    :cond_9e
    iput-object p1, p0, Lcom/google/android/gms/internal/zziq;->zzsn:Lcom/google/android/gms/ads/internal/client/zza;

    iput-object p2, p0, Lcom/google/android/gms/internal/zziq;->zzIX:Lcom/google/android/gms/ads/internal/overlay/zzg;

    iput-object p3, p0, Lcom/google/android/gms/internal/zziq;->zzwH:Lcom/google/android/gms/internal/zzdd;

    iput-object p6, p0, Lcom/google/android/gms/internal/zziq;->zzxm:Lcom/google/android/gms/internal/zzdi;

    iput-object p4, p0, Lcom/google/android/gms/internal/zziq;->zzJb:Lcom/google/android/gms/ads/internal/overlay/zzn;

    iput-object p8, p0, Lcom/google/android/gms/internal/zziq;->zzxj:Lcom/google/android/gms/ads/internal/zze;

    iput-object p9, p0, Lcom/google/android/gms/internal/zziq;->zzzy:Lcom/google/android/gms/internal/zzfc;

    iput-object p7, p0, Lcom/google/android/gms/internal/zziq;->zzxh:Lcom/google/android/gms/internal/zzdk;

    invoke-virtual {p0, p5}, Lcom/google/android/gms/internal/zziq;->zzF(Z)V

    iput-boolean v3, p0, Lcom/google/android/gms/internal/zziq;->zzJd:Z

    return-void
.end method

.method public final zzb(Ljava/lang/String;Lcom/google/android/gms/internal/zzdg;)V
    .registers 5

    iget-object v1, p0, Lcom/google/android/gms/internal/zziq;->zzpc:Ljava/lang/Object;

    monitor-enter v1

    :try_start_3
    iget-object v0, p0, Lcom/google/android/gms/internal/zziq;->zzIW:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    if-nez v0, :cond_f

    monitor-exit v1

    :goto_e
    return-void

    :cond_f
    invoke-interface {v0, p2}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    monitor-exit v1

    goto :goto_e

    :catchall_14
    move-exception v0

    monitor-exit v1
    :try_end_16
    .catchall {:try_start_3 .. :try_end_16} :catchall_14

    throw v0
.end method

.method public zzbY()Z
    .registers 3

    iget-object v1, p0, Lcom/google/android/gms/internal/zziq;->zzpc:Ljava/lang/Object;

    monitor-enter v1

    :try_start_3
    iget-boolean v0, p0, Lcom/google/android/gms/internal/zziq;->zzqL:Z

    monitor-exit v1

    return v0

    :catchall_7
    move-exception v0

    monitor-exit v1
    :try_end_9
    .catchall {:try_start_3 .. :try_end_9} :catchall_7

    throw v0
.end method

.method public zzd(II)V
    .registers 4

    iget-object v0, p0, Lcom/google/android/gms/internal/zziq;->zzxk:Lcom/google/android/gms/internal/zzew;

    if-eqz v0, :cond_9

    iget-object v0, p0, Lcom/google/android/gms/internal/zziq;->zzxk:Lcom/google/android/gms/internal/zzew;

    invoke-virtual {v0, p1, p2}, Lcom/google/android/gms/internal/zzew;->zzd(II)V

    :cond_9
    return-void
.end method

.method public final zzeA()V
    .registers 3

    iget-object v1, p0, Lcom/google/android/gms/internal/zziq;->zzpc:Ljava/lang/Object;

    monitor-enter v1

    const/4 v0, 0x0

    :try_start_4
    iput-boolean v0, p0, Lcom/google/android/gms/internal/zziq;->zzIZ:Z

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/google/android/gms/internal/zziq;->zzqL:Z

    new-instance v0, Lcom/google/android/gms/internal/zziq$1;

    invoke-direct {v0, p0}, Lcom/google/android/gms/internal/zziq$1;-><init>(Lcom/google/android/gms/internal/zziq;)V

    invoke-static {v0}, Lcom/google/android/gms/internal/zzhu;->runOnUiThread(Ljava/lang/Runnable;)V

    monitor-exit v1

    return-void

    :catchall_13
    move-exception v0

    monitor-exit v1
    :try_end_15
    .catchall {:try_start_4 .. :try_end_15} :catchall_13

    throw v0
.end method

.method public zzh(Landroid/net/Uri;)V
    .registers 8

    invoke-virtual {p1}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v1

    iget-object v0, p0, Lcom/google/android/gms/internal/zziq;->zzIW:Ljava/util/HashMap;

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    if-eqz v0, :cond_84

    invoke-static {}, Lcom/google/android/gms/ads/internal/zzp;->zzbx()Lcom/google/android/gms/internal/zzhu;

    move-result-object v2

    invoke-virtual {v2, p1}, Lcom/google/android/gms/internal/zzhu;->zze(Landroid/net/Uri;)Ljava/util/Map;

    move-result-object v2

    const/4 v3, 0x2

    invoke-static {v3}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzM(I)Z

    move-result v3

    if-eqz v3, :cond_6e

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Received GMSG: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/google/android/gms/ads/internal/util/client/zzb;->v(Ljava/lang/String;)V

    invoke-interface {v2}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_3b
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_6e

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "  "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ": "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-interface {v2, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/google/android/gms/ads/internal/util/client/zzb;->v(Ljava/lang/String;)V

    goto :goto_3b

    :cond_6e
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_72
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_9a

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/zzdg;

    iget-object v3, p0, Lcom/google/android/gms/internal/zziq;->zzoL:Lcom/google/android/gms/internal/zzip;

    invoke-interface {v0, v3, v2}, Lcom/google/android/gms/internal/zzdg;->zza(Lcom/google/android/gms/internal/zzip;Ljava/util/Map;)V

    goto :goto_72

    :cond_84
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "No GMSG handler found for GMSG: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/google/android/gms/ads/internal/util/client/zzb;->v(Ljava/lang/String;)V

    :cond_9a
    return-void
.end method

.method public zzhb()Lcom/google/android/gms/ads/internal/zze;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/internal/zziq;->zzxj:Lcom/google/android/gms/ads/internal/zze;

    return-object v0
.end method

.method public zzhc()Z
    .registers 3

    iget-object v1, p0, Lcom/google/android/gms/internal/zziq;->zzpc:Ljava/lang/Object;

    monitor-enter v1

    :try_start_3
    iget-boolean v0, p0, Lcom/google/android/gms/internal/zziq;->zzJa:Z

    monitor-exit v1

    return v0

    :catchall_7
    move-exception v0

    monitor-exit v1
    :try_end_9
    .catchall {:try_start_3 .. :try_end_9} :catchall_7

    throw v0
.end method

.method public zzhd()V
    .registers 4

    iget-object v1, p0, Lcom/google/android/gms/internal/zziq;->zzpc:Ljava/lang/Object;

    monitor-enter v1

    :try_start_3
    const-string v0, "Loading blank page in WebView, 2..."

    invoke-static {v0}, Lcom/google/android/gms/ads/internal/util/client/zzb;->v(Ljava/lang/String;)V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/google/android/gms/internal/zziq;->zzJe:Z

    iget-object v0, p0, Lcom/google/android/gms/internal/zziq;->zzoL:Lcom/google/android/gms/internal/zzip;

    const-string v2, "about:blank"

    invoke-interface {v0, v2}, Lcom/google/android/gms/internal/zzip;->zzaF(Ljava/lang/String;)V

    monitor-exit v1

    return-void

    :catchall_14
    move-exception v0

    monitor-exit v1
    :try_end_16
    .catchall {:try_start_3 .. :try_end_16} :catchall_14

    throw v0
.end method

.method public final zzhh()V
    .registers 4

    iget-object v0, p0, Lcom/google/android/gms/internal/zziq;->zzCv:Lcom/google/android/gms/internal/zziq$zza;

    if-eqz v0, :cond_1f

    iget-boolean v0, p0, Lcom/google/android/gms/internal/zziq;->zzJf:Z

    if-eqz v0, :cond_c

    iget v0, p0, Lcom/google/android/gms/internal/zziq;->zzJh:I

    if-lez v0, :cond_10

    :cond_c
    iget-boolean v0, p0, Lcom/google/android/gms/internal/zziq;->zzJg:Z

    if-eqz v0, :cond_1f

    :cond_10
    iget-object v1, p0, Lcom/google/android/gms/internal/zziq;->zzCv:Lcom/google/android/gms/internal/zziq$zza;

    iget-object v2, p0, Lcom/google/android/gms/internal/zziq;->zzoL:Lcom/google/android/gms/internal/zzip;

    iget-boolean v0, p0, Lcom/google/android/gms/internal/zziq;->zzJg:Z

    if-nez v0, :cond_20

    const/4 v0, 0x1

    :goto_19
    invoke-interface {v1, v2, v0}, Lcom/google/android/gms/internal/zziq$zza;->zza(Lcom/google/android/gms/internal/zzip;Z)V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/android/gms/internal/zziq;->zzCv:Lcom/google/android/gms/internal/zziq$zza;

    :cond_1f
    return-void

    :cond_20
    const/4 v0, 0x0

    goto :goto_19
.end method
