.class public Lcom/google/android/gms/analytics/internal/zzh;
.super Ljava/lang/Object;


# instance fields
.field private final zzLS:J

.field private final zzLT:Ljava/lang/String;

.field private final zzLU:Z

.field private zzLV:J

.field private final zzLd:Ljava/lang/String;

.field private final zzvs:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(JLjava/lang/String;Ljava/lang/String;ZJLjava/util/Map;)V
    .registers 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "ZJ",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-static {p3}, Lcom/google/android/gms/common/internal/zzx;->zzcs(Ljava/lang/String;)Ljava/lang/String;

    invoke-static {p4}, Lcom/google/android/gms/common/internal/zzx;->zzcs(Ljava/lang/String;)Ljava/lang/String;

    iput-wide p1, p0, Lcom/google/android/gms/analytics/internal/zzh;->zzLS:J

    iput-object p3, p0, Lcom/google/android/gms/analytics/internal/zzh;->zzLd:Ljava/lang/String;

    iput-object p4, p0, Lcom/google/android/gms/analytics/internal/zzh;->zzLT:Ljava/lang/String;

    iput-boolean p5, p0, Lcom/google/android/gms/analytics/internal/zzh;->zzLU:Z

    iput-wide p6, p0, Lcom/google/android/gms/analytics/internal/zzh;->zzLV:J

    if-eqz p8, :cond_1d

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0, p8}, Ljava/util/HashMap;-><init>(Ljava/util/Map;)V

    iput-object v0, p0, Lcom/google/android/gms/analytics/internal/zzh;->zzvs:Ljava/util/Map;

    :goto_1c
    return-void

    :cond_1d
    invoke-static {}, Ljava/util/Collections;->emptyMap()Ljava/util/Map;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/analytics/internal/zzh;->zzvs:Ljava/util/Map;

    goto :goto_1c
.end method


# virtual methods
.method public getClientId()Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/analytics/internal/zzh;->zzLd:Ljava/lang/String;

    return-object v0
.end method

.method public zziw()J
    .registers 3

    iget-wide v0, p0, Lcom/google/android/gms/analytics/internal/zzh;->zzLS:J

    return-wide v0
.end method

.method public zzix()Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/analytics/internal/zzh;->zzLT:Ljava/lang/String;

    return-object v0
.end method

.method public zziy()Z
    .registers 2

    iget-boolean v0, p0, Lcom/google/android/gms/analytics/internal/zzh;->zzLU:Z

    return v0
.end method

.method public zziz()J
    .registers 3

    iget-wide v0, p0, Lcom/google/android/gms/analytics/internal/zzh;->zzLV:J

    return-wide v0
.end method

.method public zzn()Ljava/util/Map;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/analytics/internal/zzh;->zzvs:Ljava/util/Map;

    return-object v0
.end method

.method public zzn(J)V
    .registers 4

    iput-wide p1, p0, Lcom/google/android/gms/analytics/internal/zzh;->zzLV:J

    return-void
.end method
