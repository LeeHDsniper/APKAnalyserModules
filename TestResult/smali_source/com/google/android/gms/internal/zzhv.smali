.class public Lcom/google/android/gms/internal/zzhv;
.super Ljava/lang/Object;


# annotations
.annotation runtime Lcom/google/android/gms/internal/zzgk;
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/gms/internal/zzhv$1;,
        Lcom/google/android/gms/internal/zzhv$zzg;,
        Lcom/google/android/gms/internal/zzhv$zze;,
        Lcom/google/android/gms/internal/zzhv$zzd;,
        Lcom/google/android/gms/internal/zzhv$zzf;,
        Lcom/google/android/gms/internal/zzhv$zzc;,
        Lcom/google/android/gms/internal/zzhv$zzb;,
        Lcom/google/android/gms/internal/zzhv$zza;
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/google/android/gms/internal/zzhv$1;)V
    .registers 2

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzhv;-><init>()V

    return-void
.end method

.method public static zzL(I)Lcom/google/android/gms/internal/zzhv;
    .registers 2

    const/16 v0, 0x13

    if-lt p0, v0, :cond_a

    new-instance v0, Lcom/google/android/gms/internal/zzhv$zzg;

    invoke-direct {v0}, Lcom/google/android/gms/internal/zzhv$zzg;-><init>()V

    :goto_9
    return-object v0

    :cond_a
    const/16 v0, 0x12

    if-lt p0, v0, :cond_14

    new-instance v0, Lcom/google/android/gms/internal/zzhv$zze;

    invoke-direct {v0}, Lcom/google/android/gms/internal/zzhv$zze;-><init>()V

    goto :goto_9

    :cond_14
    const/16 v0, 0x11

    if-lt p0, v0, :cond_1e

    new-instance v0, Lcom/google/android/gms/internal/zzhv$zzd;

    invoke-direct {v0}, Lcom/google/android/gms/internal/zzhv$zzd;-><init>()V

    goto :goto_9

    :cond_1e
    const/16 v0, 0x10

    if-lt p0, v0, :cond_28

    new-instance v0, Lcom/google/android/gms/internal/zzhv$zzf;

    invoke-direct {v0}, Lcom/google/android/gms/internal/zzhv$zzf;-><init>()V

    goto :goto_9

    :cond_28
    const/16 v0, 0xe

    if-lt p0, v0, :cond_32

    new-instance v0, Lcom/google/android/gms/internal/zzhv$zzc;

    invoke-direct {v0}, Lcom/google/android/gms/internal/zzhv$zzc;-><init>()V

    goto :goto_9

    :cond_32
    const/16 v0, 0xb

    if-lt p0, v0, :cond_3c

    new-instance v0, Lcom/google/android/gms/internal/zzhv$zzb;

    invoke-direct {v0}, Lcom/google/android/gms/internal/zzhv$zzb;-><init>()V

    goto :goto_9

    :cond_3c
    const/16 v0, 0x9

    if-lt p0, v0, :cond_46

    new-instance v0, Lcom/google/android/gms/internal/zzhv$zza;

    invoke-direct {v0}, Lcom/google/android/gms/internal/zzhv$zza;-><init>()V

    goto :goto_9

    :cond_46
    new-instance v0, Lcom/google/android/gms/internal/zzhv;

    invoke-direct {v0}, Lcom/google/android/gms/internal/zzhv;-><init>()V

    goto :goto_9
.end method


# virtual methods
.method public getDefaultUserAgent(Landroid/content/Context;)Ljava/lang/String;
    .registers 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const-string v0, ""

    return-object v0
.end method

.method public isAttachedToWindow(Landroid/view/View;)Z
    .registers 4
    .param p1, "view"    # Landroid/view/View;

    .prologue
    invoke-virtual {p1}, Landroid/view/View;->getWindowToken()Landroid/os/IBinder;

    move-result-object v0

    if-nez v0, :cond_e

    invoke-virtual {p1}, Landroid/view/View;->getWindowVisibility()I

    move-result v0

    const/16 v1, 0x8

    if-eq v0, v1, :cond_10

    :cond_e
    const/4 v0, 0x1

    :goto_f
    return v0

    :cond_10
    const/4 v0, 0x0

    goto :goto_f
.end method

.method public zza(Landroid/net/http/SslError;)Ljava/lang/String;
    .registers 3

    const-string v0, ""

    return-object v0
.end method

.method public zza(Landroid/view/View;Landroid/graphics/drawable/Drawable;)V
    .registers 3

    invoke-virtual {p1, p2}, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    return-void
.end method

.method public zza(Landroid/view/ViewTreeObserver;Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V
    .registers 3

    invoke-virtual {p1, p2}, Landroid/view/ViewTreeObserver;->removeGlobalOnLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    return-void
.end method

.method public zza(Landroid/app/DownloadManager$Request;)Z
    .registers 3

    const/4 v0, 0x0

    return v0
.end method

.method public zza(Landroid/content/Context;Landroid/webkit/WebSettings;)Z
    .registers 4

    const/4 v0, 0x0

    return v0
.end method

.method public zza(Landroid/view/Window;)Z
    .registers 3

    const/4 v0, 0x0

    return v0
.end method

.method public zza(Landroid/webkit/WebView;)Z
    .registers 3

    const/4 v0, 0x0

    return v0
.end method

.method public zzb(Lcom/google/android/gms/internal/zzip;Z)Lcom/google/android/gms/internal/zziq;
    .registers 4

    new-instance v0, Lcom/google/android/gms/internal/zziq;

    invoke-direct {v0, p1, p2}, Lcom/google/android/gms/internal/zziq;-><init>(Lcom/google/android/gms/internal/zzip;Z)V

    return-object v0
.end method

.method public zzb(Landroid/app/Activity;Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V
    .registers 5

    invoke-virtual {p1}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v0

    if-eqz v0, :cond_21

    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v1

    if-eqz v1, :cond_21

    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v1

    if-eqz v1, :cond_21

    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v0

    invoke-virtual {p0, v0, p2}, Lcom/google/android/gms/internal/zzhv;->zza(Landroid/view/ViewTreeObserver;Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    :cond_21
    return-void
.end method

.method public zzb(Landroid/webkit/WebView;)Z
    .registers 3

    const/4 v0, 0x0

    return v0
.end method

.method public zzf(Lcom/google/android/gms/internal/zzip;)Landroid/webkit/WebChromeClient;
    .registers 3

    const/4 v0, 0x0

    return-object v0
.end method

.method public zzf(Landroid/net/Uri;)Ljava/util/Set;
    .registers 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/net/Uri;",
            ")",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    const/4 v5, -0x1

    invoke-virtual {p1}, Landroid/net/Uri;->isOpaque()Z

    move-result v0

    if-eqz v0, :cond_c

    invoke-static {}, Ljava/util/Collections;->emptySet()Ljava/util/Set;

    move-result-object v0

    :goto_b
    return-object v0

    :cond_c
    invoke-virtual {p1}, Landroid/net/Uri;->getEncodedQuery()Ljava/lang/String;

    move-result-object v3

    if-nez v3, :cond_17

    invoke-static {}, Ljava/util/Collections;->emptySet()Ljava/util/Set;

    move-result-object v0

    goto :goto_b

    :cond_17
    new-instance v4, Ljava/util/LinkedHashSet;

    invoke-direct {v4}, Ljava/util/LinkedHashSet;-><init>()V

    const/4 v0, 0x0

    :cond_1d
    const/16 v1, 0x26

    invoke-virtual {v3, v1, v0}, Ljava/lang/String;->indexOf(II)I

    move-result v1

    if-ne v1, v5, :cond_29

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v1

    :cond_29
    const/16 v2, 0x3d

    invoke-virtual {v3, v2, v0}, Ljava/lang/String;->indexOf(II)I

    move-result v2

    if-gt v2, v1, :cond_33

    if-ne v2, v5, :cond_34

    :cond_33
    move v2, v1

    :cond_34
    invoke-virtual {v3, v0, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/net/Uri;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-interface {v4, v0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    add-int/lit8 v0, v1, 0x1

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v1

    if-lt v0, v1, :cond_1d

    invoke-static {v4}, Ljava/util/Collections;->unmodifiableSet(Ljava/util/Set;)Ljava/util/Set;

    move-result-object v0

    goto :goto_b
.end method

.method public zzgv()I
    .registers 2

    const/4 v0, 0x0

    return v0
.end method

.method public zzgw()I
    .registers 2

    const/4 v0, 0x1

    return v0
.end method

.method public zzgx()I
    .registers 2

    const/4 v0, 0x5

    return v0
.end method

.method public zzgy()Landroid/view/ViewGroup$LayoutParams;
    .registers 3

    const/4 v1, -0x2

    new-instance v0, Landroid/view/ViewGroup$LayoutParams;

    invoke-direct {v0, v1, v1}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    return-object v0
.end method

.method public zzk(Landroid/view/View;)Z
    .registers 3

    const/4 v0, 0x0

    return v0
.end method

.method public zzl(Landroid/view/View;)Z
    .registers 3

    const/4 v0, 0x0

    return v0
.end method
