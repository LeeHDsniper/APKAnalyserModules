.class Lcom/google/android/gms/tagmanager/zza$1;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/tagmanager/zza$zza;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/tagmanager/zza;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic zzaOH:Lcom/google/android/gms/tagmanager/zza;


# direct methods
.method constructor <init>(Lcom/google/android/gms/tagmanager/zza;)V
    .registers 2

    iput-object p1, p0, Lcom/google/android/gms/tagmanager/zza$1;->zzaOH:Lcom/google/android/gms/tagmanager/zza;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public zzzw()Lcom/google/android/gms/ads/identifier/AdvertisingIdClient$Info;
    .registers 3

    const/4 v0, 0x0

    :try_start_1
    iget-object v1, p0, Lcom/google/android/gms/tagmanager/zza$1;->zzaOH:Lcom/google/android/gms/tagmanager/zza;

    invoke-static {v1}, Lcom/google/android/gms/tagmanager/zza;->zza(Lcom/google/android/gms/tagmanager/zza;)Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lcom/google/android/gms/ads/identifier/AdvertisingIdClient;->getAdvertisingIdInfo(Landroid/content/Context;)Lcom/google/android/gms/ads/identifier/AdvertisingIdClient$Info;
    :try_end_a
    .catch Ljava/lang/IllegalStateException; {:try_start_1 .. :try_end_a} :catch_c
    .catch Lcom/google/android/gms/common/GooglePlayServicesRepairableException; {:try_start_1 .. :try_end_a} :catch_13
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_a} :catch_1a
    .catch Lcom/google/android/gms/common/GooglePlayServicesNotAvailableException; {:try_start_1 .. :try_end_a} :catch_21
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_a} :catch_28

    move-result-object v0

    :goto_b
    return-object v0

    :catch_c
    move-exception v1

    const-string v1, "IllegalStateException getting Advertising Id Info"

    invoke-static {v1}, Lcom/google/android/gms/tagmanager/zzbg;->zzaE(Ljava/lang/String;)V

    goto :goto_b

    :catch_13
    move-exception v1

    const-string v1, "GooglePlayServicesRepairableException getting Advertising Id Info"

    invoke-static {v1}, Lcom/google/android/gms/tagmanager/zzbg;->zzaE(Ljava/lang/String;)V

    goto :goto_b

    :catch_1a
    move-exception v1

    const-string v1, "IOException getting Ad Id Info"

    invoke-static {v1}, Lcom/google/android/gms/tagmanager/zzbg;->zzaE(Ljava/lang/String;)V

    goto :goto_b

    :catch_21
    move-exception v1

    const-string v1, "GooglePlayServicesNotAvailableException getting Advertising Id Info"

    invoke-static {v1}, Lcom/google/android/gms/tagmanager/zzbg;->zzaE(Ljava/lang/String;)V

    goto :goto_b

    :catch_28
    move-exception v1

    const-string v1, "Unknown exception. Could not get the Advertising Id Info."

    invoke-static {v1}, Lcom/google/android/gms/tagmanager/zzbg;->zzaE(Ljava/lang/String;)V

    goto :goto_b
.end method
