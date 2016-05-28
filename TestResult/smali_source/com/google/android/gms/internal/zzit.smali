.class public Lcom/google/android/gms/internal/zzit;
.super Ljava/lang/Object;


# annotations
.annotation runtime Lcom/google/android/gms/internal/zzgk;
.end annotation


# instance fields
.field private final zzCq:Lcom/google/android/gms/internal/zziq;

.field private final zzoL:Lcom/google/android/gms/internal/zzip;


# direct methods
.method public constructor <init>(Lcom/google/android/gms/internal/zzip;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/android/gms/internal/zzit;->zzoL:Lcom/google/android/gms/internal/zzip;

    invoke-interface {p1}, Lcom/google/android/gms/internal/zzip;->zzgS()Lcom/google/android/gms/internal/zziq;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/internal/zzit;->zzCq:Lcom/google/android/gms/internal/zziq;

    return-void
.end method
