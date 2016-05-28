.class Lcom/google/android/gms/internal/zzhv$zzc;
.super Lcom/google/android/gms/internal/zzhv$zzb;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/internal/zzhv;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "zzc"
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzhv$zzb;-><init>()V

    return-void
.end method


# virtual methods
.method public zza(Landroid/net/http/SslError;)Ljava/lang/String;
    .registers 3

    invoke-virtual {p1}, Landroid/net/http/SslError;->getUrl()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public zzf(Lcom/google/android/gms/internal/zzip;)Landroid/webkit/WebChromeClient;
    .registers 3

    new-instance v0, Lcom/google/android/gms/internal/zziw;

    invoke-direct {v0, p1}, Lcom/google/android/gms/internal/zziw;-><init>(Lcom/google/android/gms/internal/zzip;)V

    return-object v0
.end method
