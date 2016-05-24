.class Lcom/google/android/gms/internal/zzdr$3;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/internal/zzdr;->zzf(Ljava/lang/String;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic zzxA:Lcom/google/android/gms/internal/zzdr;

.field final synthetic zzxv:Ljava/lang/String;

.field final synthetic zzxw:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/zzdr;Ljava/lang/String;Ljava/lang/String;)V
    .registers 4

    iput-object p1, p0, Lcom/google/android/gms/internal/zzdr$3;->zzxA:Lcom/google/android/gms/internal/zzdr;

    iput-object p2, p0, Lcom/google/android/gms/internal/zzdr$3;->zzxv:Ljava/lang/String;

    iput-object p3, p0, Lcom/google/android/gms/internal/zzdr$3;->zzxw:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 4

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    const-string v1, "event"

    const-string v2, "precacheCanceled"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "src"

    iget-object v2, p0, Lcom/google/android/gms/internal/zzdr$3;->zzxv:Ljava/lang/String;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v1, p0, Lcom/google/android/gms/internal/zzdr$3;->zzxw:Ljava/lang/String;

    if-eqz v1, :cond_1e

    const-string v1, "cachedSrc"

    iget-object v2, p0, Lcom/google/android/gms/internal/zzdr$3;->zzxw:Ljava/lang/String;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_1e
    iget-object v1, p0, Lcom/google/android/gms/internal/zzdr$3;->zzxA:Lcom/google/android/gms/internal/zzdr;

    iget-object v1, v1, Lcom/google/android/gms/internal/zzdr;->zzoL:Lcom/google/android/gms/internal/zzip;

    const-string v2, "onPrecacheEvent"

    invoke-interface {v1, v2, v0}, Lcom/google/android/gms/internal/zzip;->zzc(Ljava/lang/String;Ljava/util/Map;)V

    return-void
.end method
