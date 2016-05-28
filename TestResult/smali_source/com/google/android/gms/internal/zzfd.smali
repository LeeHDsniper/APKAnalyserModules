.class public final Lcom/google/android/gms/internal/zzfd;
.super Lcom/google/android/gms/dynamic/zzg;


# annotations
.annotation runtime Lcom/google/android/gms/internal/zzgk;
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/gms/internal/zzfd$zza;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/android/gms/dynamic/zzg",
        "<",
        "Lcom/google/android/gms/internal/zzff;",
        ">;"
    }
.end annotation


# static fields
.field private static final zzBC:Lcom/google/android/gms/internal/zzfd;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Lcom/google/android/gms/internal/zzfd;

    invoke-direct {v0}, Lcom/google/android/gms/internal/zzfd;-><init>()V

    sput-object v0, Lcom/google/android/gms/internal/zzfd;->zzBC:Lcom/google/android/gms/internal/zzfd;

    return-void
.end method

.method private constructor <init>()V
    .registers 2

    const-string v0, "com.google.android.gms.ads.AdOverlayCreatorImpl"

    invoke-direct {p0, v0}, Lcom/google/android/gms/dynamic/zzg;-><init>(Ljava/lang/String;)V

    return-void
.end method

.method public static zzb(Landroid/app/Activity;)Lcom/google/android/gms/internal/zzfe;
    .registers 2

    :try_start_0
    invoke-static {p0}, Lcom/google/android/gms/internal/zzfd;->zzc(Landroid/app/Activity;)Z

    move-result v0

    if-eqz v0, :cond_11

    const-string v0, "Using AdOverlay from the client jar."

    invoke-static {v0}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzaC(Ljava/lang/String;)V

    new-instance v0, Lcom/google/android/gms/ads/internal/overlay/zzd;

    invoke-direct {v0, p0}, Lcom/google/android/gms/ads/internal/overlay/zzd;-><init>(Landroid/app/Activity;)V

    :goto_10
    return-object v0

    :cond_11
    sget-object v0, Lcom/google/android/gms/internal/zzfd;->zzBC:Lcom/google/android/gms/internal/zzfd;

    invoke-direct {v0, p0}, Lcom/google/android/gms/internal/zzfd;->zzd(Landroid/app/Activity;)Lcom/google/android/gms/internal/zzfe;
    :try_end_16
    .catch Lcom/google/android/gms/internal/zzfd$zza; {:try_start_0 .. :try_end_16} :catch_18

    move-result-object v0

    goto :goto_10

    :catch_18
    move-exception v0

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzfd$zza;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzaE(Ljava/lang/String;)V

    const/4 v0, 0x0

    goto :goto_10
.end method

.method private static zzc(Landroid/app/Activity;)Z
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/zzfd$zza;
        }
    .end annotation

    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string v1, "com.google.android.gms.ads.internal.overlay.useClientJar"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_14

    new-instance v0, Lcom/google/android/gms/internal/zzfd$zza;

    const-string v1, "Ad overlay requires the useClientJar flag in intent extras."

    invoke-direct {v0, v1}, Lcom/google/android/gms/internal/zzfd$zza;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_14
    const-string v1, "com.google.android.gms.ads.internal.overlay.useClientJar"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method private zzd(Landroid/app/Activity;)Lcom/google/android/gms/internal/zzfe;
    .registers 5

    const/4 v1, 0x0

    :try_start_1
    invoke-static {p1}, Lcom/google/android/gms/dynamic/zze;->zzx(Ljava/lang/Object;)Lcom/google/android/gms/dynamic/zzd;

    move-result-object v2

    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/zzfd;->zzar(Landroid/content/Context;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/zzff;

    invoke-interface {v0, v2}, Lcom/google/android/gms/internal/zzff;->zze(Lcom/google/android/gms/dynamic/zzd;)Landroid/os/IBinder;

    move-result-object v0

    invoke-static {v0}, Lcom/google/android/gms/internal/zzfe$zza;->zzK(Landroid/os/IBinder;)Lcom/google/android/gms/internal/zzfe;
    :try_end_12
    .catch Landroid/os/RemoteException; {:try_start_1 .. :try_end_12} :catch_14
    .catch Lcom/google/android/gms/dynamic/zzg$zza; {:try_start_1 .. :try_end_12} :catch_1c

    move-result-object v0

    :goto_13
    return-object v0

    :catch_14
    move-exception v0

    const-string v2, "Could not create remote AdOverlay."

    invoke-static {v2, v0}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzd(Ljava/lang/String;Ljava/lang/Throwable;)V

    move-object v0, v1

    goto :goto_13

    :catch_1c
    move-exception v0

    const-string v2, "Could not create remote AdOverlay."

    invoke-static {v2, v0}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzd(Ljava/lang/String;Ljava/lang/Throwable;)V

    move-object v0, v1

    goto :goto_13
.end method


# virtual methods
.method protected zzJ(Landroid/os/IBinder;)Lcom/google/android/gms/internal/zzff;
    .registers 3

    invoke-static {p1}, Lcom/google/android/gms/internal/zzff$zza;->zzL(Landroid/os/IBinder;)Lcom/google/android/gms/internal/zzff;

    move-result-object v0

    return-object v0
.end method

.method protected synthetic zzd(Landroid/os/IBinder;)Ljava/lang/Object;
    .registers 3

    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/zzfd;->zzJ(Landroid/os/IBinder;)Lcom/google/android/gms/internal/zzff;

    move-result-object v0

    return-object v0
.end method
