.class public Lcom/google/android/gms/internal/zzdj;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/internal/zzdg;


# annotations
.annotation runtime Lcom/google/android/gms/internal/zzgk;
.end annotation


# instance fields
.field private final zzxh:Lcom/google/android/gms/internal/zzdk;


# direct methods
.method public constructor <init>(Lcom/google/android/gms/internal/zzdk;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/android/gms/internal/zzdj;->zzxh:Lcom/google/android/gms/internal/zzdk;

    return-void
.end method


# virtual methods
.method public zza(Lcom/google/android/gms/internal/zzip;Ljava/util/Map;)V
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/internal/zzip;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    const-string v0, "1"

    const-string v1, "transparentBackground"

    invoke-interface {p2, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    iget-object v1, p0, Lcom/google/android/gms/internal/zzdj;->zzxh:Lcom/google/android/gms/internal/zzdk;

    invoke-interface {v1, v0}, Lcom/google/android/gms/internal/zzdk;->zzd(Z)V

    return-void
.end method
