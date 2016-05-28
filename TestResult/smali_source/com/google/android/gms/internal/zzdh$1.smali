.class Lcom/google/android/gms/internal/zzdh$1;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/internal/zzdh;->zza(Lcom/google/android/gms/internal/zzip;Ljava/util/Map;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic zzwU:Lcom/google/android/gms/internal/zzip;

.field final synthetic zzwV:Lcom/google/android/gms/internal/zzdh;

.field final synthetic zzwl:Ljava/util/Map;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/zzdh;Ljava/util/Map;Lcom/google/android/gms/internal/zzip;)V
    .registers 4

    iput-object p1, p0, Lcom/google/android/gms/internal/zzdh$1;->zzwV:Lcom/google/android/gms/internal/zzdh;

    iput-object p2, p0, Lcom/google/android/gms/internal/zzdh$1;->zzwl:Ljava/util/Map;

    iput-object p3, p0, Lcom/google/android/gms/internal/zzdh$1;->zzwU:Lcom/google/android/gms/internal/zzip;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 4

    const-string v0, "Received Http request."

    invoke-static {v0}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzaC(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/google/android/gms/internal/zzdh$1;->zzwl:Ljava/util/Map;

    const-string v1, "http_request"

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    iget-object v1, p0, Lcom/google/android/gms/internal/zzdh$1;->zzwV:Lcom/google/android/gms/internal/zzdh;

    invoke-virtual {v1, v0}, Lcom/google/android/gms/internal/zzdh;->zzV(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    if-nez v0, :cond_1d

    const-string v0, "Response should not be null."

    invoke-static {v0}, Lcom/google/android/gms/ads/internal/util/client/zzb;->e(Ljava/lang/String;)V

    :goto_1c
    return-void

    :cond_1d
    sget-object v1, Lcom/google/android/gms/internal/zzhu;->zzHK:Landroid/os/Handler;

    new-instance v2, Lcom/google/android/gms/internal/zzdh$1$1;

    invoke-direct {v2, p0, v0}, Lcom/google/android/gms/internal/zzdh$1$1;-><init>(Lcom/google/android/gms/internal/zzdh$1;Lorg/json/JSONObject;)V

    invoke-virtual {v1, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    goto :goto_1c
.end method
