.class Lcom/google/android/gms/internal/zzdr$1;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/internal/zzdr;->zza(Ljava/lang/String;Ljava/lang/String;IIZ)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic zzxA:Lcom/google/android/gms/internal/zzdr;

.field final synthetic zzxv:Ljava/lang/String;

.field final synthetic zzxw:Ljava/lang/String;

.field final synthetic zzxx:I

.field final synthetic zzxy:I

.field final synthetic zzxz:Z


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/zzdr;Ljava/lang/String;Ljava/lang/String;IIZ)V
    .registers 7

    iput-object p1, p0, Lcom/google/android/gms/internal/zzdr$1;->zzxA:Lcom/google/android/gms/internal/zzdr;

    iput-object p2, p0, Lcom/google/android/gms/internal/zzdr$1;->zzxv:Ljava/lang/String;

    iput-object p3, p0, Lcom/google/android/gms/internal/zzdr$1;->zzxw:Ljava/lang/String;

    iput p4, p0, Lcom/google/android/gms/internal/zzdr$1;->zzxx:I

    iput p5, p0, Lcom/google/android/gms/internal/zzdr$1;->zzxy:I

    iput-boolean p6, p0, Lcom/google/android/gms/internal/zzdr$1;->zzxz:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 4

    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    const-string v0, "event"

    const-string v2, "precacheProgress"

    invoke-interface {v1, v0, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v0, "src"

    iget-object v2, p0, Lcom/google/android/gms/internal/zzdr$1;->zzxv:Ljava/lang/String;

    invoke-interface {v1, v0, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v0, "cachedSrc"

    iget-object v2, p0, Lcom/google/android/gms/internal/zzdr$1;->zzxw:Ljava/lang/String;

    invoke-interface {v1, v0, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v0, "bytesLoaded"

    iget v2, p0, Lcom/google/android/gms/internal/zzdr$1;->zzxx:I

    invoke-static {v2}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v0, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v0, "totalBytes"

    iget v2, p0, Lcom/google/android/gms/internal/zzdr$1;->zzxy:I

    invoke-static {v2}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v0, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v2, "cacheReady"

    iget-boolean v0, p0, Lcom/google/android/gms/internal/zzdr$1;->zzxz:Z

    if-eqz v0, :cond_45

    const-string v0, "1"

    :goto_38
    invoke-interface {v1, v2, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Lcom/google/android/gms/internal/zzdr$1;->zzxA:Lcom/google/android/gms/internal/zzdr;

    iget-object v0, v0, Lcom/google/android/gms/internal/zzdr;->zzoL:Lcom/google/android/gms/internal/zzip;

    const-string v2, "onPrecacheEvent"

    invoke-interface {v0, v2, v1}, Lcom/google/android/gms/internal/zzip;->zzc(Ljava/lang/String;Ljava/util/Map;)V

    return-void

    :cond_45
    const-string v0, "0"

    goto :goto_38
.end method
